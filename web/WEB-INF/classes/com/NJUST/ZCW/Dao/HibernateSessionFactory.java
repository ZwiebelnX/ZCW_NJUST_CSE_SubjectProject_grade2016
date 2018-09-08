package com.NJUST.ZCW.Dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.cfg.Configuration;

/*
由于SessionFactory的创建开销巨大
此类主要是为了保证整个项目的SessionFactory是单例的
 */
public class HibernateSessionFactory {
    private static final Configuration cfg= new Configuration();
    private static org.hibernate.SessionFactory sessionFactory;
    private static final ThreadLocal threadLocal = new ThreadLocal();

    public static Session currentSession() throws HibernateException{
        Session session = (Session)threadLocal.get(); //获取当前线程下的Session 保证当前线程的Session是专用的
        if(session == null){
            if(sessionFactory == null){
                try{
                    cfg.configure("hibernate.cfg.xml");
                    sessionFactory = cfg.buildSessionFactory();
                } catch(HibernateException e){
                    System.out.println("Error Creating HibernateSessionFactory");
                    e.printStackTrace();
                }
            }
            session = sessionFactory.openSession();
            threadLocal.set(session); //保存获取到的Session到线程-Session键值对表中
        }
        return session;
    }

    public static void closeSession() throws HibernateException{
        Session session = (Session)threadLocal.get();
        threadLocal.set(null);
        if(session != null){
            session.close();
        }
    }

    public static void closeFactory(){
        if(sessionFactory != null){
            sessionFactory.close();
        }
        threadLocal.clean();
    }

    public static void buildFactory(){
        if(sessionFactory == null){
            cfg.configure("hibernate.cfg.xml");
            sessionFactory = cfg.buildSessionFactory();
        }
    }
}
