package com.NJUST.ZCW.Listener;

import com.NJUST.ZCW.Dao.HibernateSessionFactory;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Enumeration;

/*
本类是服务器启动和关闭时的监听器
启动时执行SessionFactory的创建
关闭时卸载JDBC驱动 清理ThreadLocal以及关闭SessionFactory防止tomcat8因无法关闭线程池而报内存泄露错误
 */
public class ServerListener implements ServletContextListener {
    //服务器启动监听器
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        HibernateSessionFactory.buildFactory(); //启动SessionFactory
    }

    //服务器关闭监听器
    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        //TODO 卸载数据库驱动
        HibernateSessionFactory.closeFactory();//关闭SessionFactory

        Enumeration<Driver> drivers = DriverManager.getDrivers();
        while (drivers.hasMoreElements()) {
            Driver driver = drivers.nextElement();
            try {
                DriverManager.deregisterDriver(driver);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
