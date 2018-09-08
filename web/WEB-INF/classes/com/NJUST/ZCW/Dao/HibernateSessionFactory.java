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
        Session session = (Session)threadLocal.get();
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
            threadLocal.set(session);
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
}
