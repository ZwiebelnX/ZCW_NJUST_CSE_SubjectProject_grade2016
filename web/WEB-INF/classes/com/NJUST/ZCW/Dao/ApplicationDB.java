package com.NJUST.ZCW.Dao;

import com.NJUST.ZCW.Entities.*;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("ApplicationDB")
public class ApplicationDB {
    /*获取目前最大的应用序号
     */
    public int getMaxAppid(){
        Transaction tran = null;
        int id=0;
        try{
            Session session = HibernateSessionFactory.currentSession();
            tran = session.beginTransaction();
            Query query = session.createQuery("from ApplicationEntity");
            List<ApplicationEntity> list = query.list();
            for(ApplicationEntity a:list){
                if(a.getId()>id)
                    id=a.getId();
            }
            id++;

        }catch(Exception e){
            e.printStackTrace();
            tran.rollback();
        }finally {
            HibernateSessionFactory.closeSession();
            return id;
        }
    }
    public List<ApplicationEntity>getAllApps(){
        Session session = HibernateSessionFactory.currentSession();
        try{

            Query query = session.createQuery("from ApplicationEntity ");

            List<ApplicationEntity> list = query.list();
            return list;
        }catch(Exception e){
            throw(e);
        }finally{
            HibernateSessionFactory.closeSession(); //关闭数据库会话
        }
    }
    public void InsertApp(ApplicationEntity applicationEntity){
        Transaction tran = null;
        try{
            Session session = HibernateSessionFactory.currentSession();
            tran = session.beginTransaction();

            session.save(applicationEntity);
            tran.commit();
        }catch(Exception e){
            tran.rollback(); //事务回滚
            throw(e);
        }finally{
            HibernateSessionFactory.closeSession();
        }
    }
    public List<ApplicationEntity>getAllCheckApps(String tp) {
        List<ApplicationEntity> list=null;
        Session session = HibernateSessionFactory.currentSession();
        try{

            /*这里指明你要获得哪个类型，Hibernate会根据类名查询映射配置文件到数据库查询哪张表，根据指定
             * id查询实体，通过反射机制创建实体对象
             */
            Query query = session.createQuery("from ApplicationEntity where checked = ?1");
            //2、填写上一步中占位符的内容
            query.setParameter(1,tp);
            //List存储查询结果
            list = query.list();
            return  list;
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            HibernateSessionFactory.closeSession(); //关闭数据库会话
            return list;
        }
    }
    public void ChangeChecked(int id,String t){
        Transaction tran = null;
        Session session = HibernateSessionFactory.currentSession();
        tran = session.beginTransaction();
        ApplicationEntity ar=session.get(ApplicationEntity.class,id);
        ar.setChecked(t);
        session.update(ar);
        tran.commit();
        HibernateSessionFactory.closeSession();
    }
    public ApplicationEntity getApp(int id){
        ApplicationEntity ar=new ApplicationEntity();
        try {
            Transaction tran = null;
            Session session = HibernateSessionFactory.currentSession();
            tran = session.beginTransaction();
            ar=session.get(ApplicationEntity.class,id);
            tran.commit();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            HibernateSessionFactory.closeSession();
            return ar;
        }
    }
    public List<ApplicationEntity>getAppbyPublisherid(int tp) {
        List<ApplicationEntity> list=null;
        Session session = HibernateSessionFactory.currentSession();
        try{

            /*这里指明你要获得哪个类型，Hibernate会根据类名查询映射配置文件到数据库查询哪张表，根据指定
             * id查询实体，通过反射机制创建实体对象
             */
            Query query = session.createQuery("from ApplicationEntity where publisherId = ?1");
            //2、填写上一步中占位符的内容
            query.setParameter(1,tp);
            //List存储查询结果
            list = query.list();
            return  list;
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            HibernateSessionFactory.closeSession(); //关闭数据库会话
            return list;
        }
    }
    public void Updateapp(ApplicationEntity app){
        try{
            System.out.println("尝试更新APP"+app.getId());
            Transaction tran = null;
            Session session = HibernateSessionFactory.currentSession();
            tran = session.beginTransaction();
            ApplicationEntity f=session.get(ApplicationEntity.class,app.getId());
            f.setCompatibility(app.getCompatibility());
            f.setIntroduction(app.getIntroduction());
            f.setRequireVersion(app.getRequireVersion());
            f.setType(app.getType());
            f.setLanguage(app.getLanguage());
            f.setName(app.getName());
            session.save(f);
            tran.commit();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            HibernateSessionFactory.closeSession(); //关闭数据库会话
        }
    }
    public void deleteapp(ApplicationEntity app){
        try{
            Transaction tran = null;
            Session session = HibernateSessionFactory.currentSession();
            tran = session.beginTransaction();
            session.delete(app);
            tran.commit();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            HibernateSessionFactory.closeSession(); //关闭数据库会话
        }
    }
    public void UpdateAppurl(int id,String url,String authority,String version,String minsdkversion){
        try{
            Transaction tran = null;
            Session session = HibernateSessionFactory.currentSession();
            tran = session.beginTransaction();
            ApplicationEntity app=session.get(ApplicationEntity.class,id);
            app.setDownloadUrl(url);
            app.setAuriorityNeed(authority);
            app.setVersion(version);
            app.setRequireVersion(minsdkversion);
            session.save(app);
            tran.commit();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            HibernateSessionFactory.closeSession(); //关闭数据库会话
        }
    }

    public void UpdateAppIcourl(int id,String url){
        try{
            Transaction tran = null;
            Session session = HibernateSessionFactory.currentSession();
            tran = session.beginTransaction();
            ApplicationEntity app=session.get(ApplicationEntity.class,id);
            app.setImg(url);
            session.save(app);
            tran.commit();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            HibernateSessionFactory.closeSession(); //关闭数据库会话
        }
    }

    public void VisCntIncrease(int id){
        try{
            Transaction tran = null;
            Session session = HibernateSessionFactory.currentSession();
            tran = session.beginTransaction();
            ApplicationEntity app=session.get(ApplicationEntity.class,id);
            app.setVisitCnt(app.getVisitCnt()+1);
            session.save(app);
            tran.commit();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            HibernateSessionFactory.closeSession(); //关闭数据库会话
        }
    }
}
