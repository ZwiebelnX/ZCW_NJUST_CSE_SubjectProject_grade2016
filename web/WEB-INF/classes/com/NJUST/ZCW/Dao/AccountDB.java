package com.NJUST.ZCW.Dao;
import com.NJUST.ZCW.Entities.AccountEntity;
import com.NJUST.ZCW.Entities.AuthorityrequireEntity;
import com.NJUST.ZCW.Entities.ChgpwdEntity;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("AccountDB")
public class AccountDB {
    /*
    登录检查
     */

    public boolean CheckAccountExist(AccountEntity tmp){
        Session session = HibernateSessionFactory.currentSession();
        try{

            /*这里指明你要获得哪个类型，Hibernate会根据类名查询映射配置文件到数据库查询哪张表，根据指定
             * id查询实体，通过反射机制创建实体对象
             */
            Query query = session.createQuery("from AccountEntity where userName = ?1 and pwd =?2");
            //2、填写上一步中占位符的内容
            query.setParameter(1, tmp.getUserName());
            query.setParameter(2, tmp.getPwd());
            //List存储查询结果
            List<AccountEntity> list = query.list();
            if(list.isEmpty()){
                return false;
            }
            else {
                return true;
            }
        }catch(Exception e){
            throw(e);
        }finally{
            HibernateSessionFactory.closeSession(); //关闭数据库会话

        }
    }

    /*
    添加账户
     */
    public boolean InsertAccount(AccountEntity tmp){
        Transaction tran = null;
        try{
            Session session = HibernateSessionFactory.currentSession();
            tran = session.beginTransaction();
            Query query = session.createQuery("from AccountEntity");
            List<AccountEntity> list = query.list();
            //TODO 设置主键为自动增长
            int id=0;
            for(AccountEntity a:list){
                if(a.getUserName().equals(tmp.getUserName()))
                    return false;
                if(a.getUserId()>id)
                    id=a.getUserId();
            }
            id++;
            tmp.setIsManager("N");
            tmp.setAuthority("01011000");//对应上传 查询 管理 统计 分析 用户管理 权限管理和请求审核
            tmp.setUserId(id);//01011000 普通用户_N 11111000开发商用户_K 11111111管理员_C
            tmp.setAuthority("0");
            session.save(tmp);
            tran.commit();
            return true;
        }catch(Exception e){
            tran.rollback(); //事务回滚
            throw(e);
        }finally{
            HibernateSessionFactory.closeSession();
        }
    }
    public AccountEntity getUser(AccountEntity tmp){
        Session session = HibernateSessionFactory.currentSession();
        try{

            /*这里指明你要获得哪个类型，Hibernate会根据类名查询映射配置文件到数据库查询哪张表，根据指定
             * id查询实体，通过反射机制创建实体对象
             */
            Query query = session.createQuery("from AccountEntity where userName = ?1");
            //2、填写上一步中占位符的内容
            query.setParameter(1, tmp.getUserName());
            //List存储查询结果
            List<AccountEntity> list = query.list();
            return list.get(0);
        }catch(Exception e){
            throw(e);
        }finally{
            HibernateSessionFactory.closeSession(); //关闭数据库会话
        }
    }
    public  void UpdatePersonalInformation(AccountEntity tmp){
        Transaction tran = null;
        Session session = HibernateSessionFactory.currentSession();
        tran = session.beginTransaction();
        session.update(tmp);
        tran.commit();
        HibernateSessionFactory.closeSession();
    }
    public  boolean InsertforAuthorityQuery(int asker,String tp,String name){
        Transaction tran = null;
        try{
            Session session = HibernateSessionFactory.currentSession();
            tran = session.beginTransaction();
            Query query = session.createQuery("from AuthorityrequireEntity");
            List<AuthorityrequireEntity> list = query.list();
            //TODO 设置主键为自动增长
            int id=0;
            for(AuthorityrequireEntity a:list){
                if(a.getId()>id)
                    id=a.getId();
                if(a.getAskerId()==asker)
                    return false;
            }
            id++;
            AuthorityrequireEntity tmp=new AuthorityrequireEntity();
            tmp.setAskerId(asker);
            tmp.setWantAuthority(tp);
            tmp.setId(id);
            tmp.setAskerName(name);
            session.save(tmp);
            tran.commit();
            return true;
        }catch(Exception e){
            tran.rollback(); //事务回滚
            throw(e);
        }finally{
            HibernateSessionFactory.closeSession();
        }
    }
    public  List<AuthorityrequireEntity>getAllAuthorityQuery(){
        Session session = HibernateSessionFactory.currentSession();
        try{

            Query query = session.createQuery("from AuthorityrequireEntity ");

            List<AuthorityrequireEntity> list = query.list();
            for (AuthorityrequireEntity fun:
                 list) {
                if(fun.getWantAuthority().equals("K"))
                    fun.setAuthorityrealname("开发商");
                else fun.setAuthorityrealname("管理员");
            }
            return list;
        }catch(Exception e){
            throw(e);
        }finally{
            HibernateSessionFactory.closeSession(); //关闭数据库会话
        }
    }
    public void doChangeAuthority(int id,String str){
        Transaction tran = null;
        Session session = HibernateSessionFactory.currentSession();
        tran = session.beginTransaction();
        AccountEntity ar=session.get(AccountEntity.class,id);
        ar.setIsManager(str);


        session.update(ar);
        tran.commit();
        HibernateSessionFactory.closeSession();
    }
    public void ChangeAuthority(int id){
        Transaction tran = null;
        Session session = HibernateSessionFactory.currentSession();
        tran = session.beginTransaction();
        AuthorityrequireEntity ar=session.get(AuthorityrequireEntity.class,id);
        String t=ar.getWantAuthority();
        int u=ar.getAskerId();
        //doChangeAuthority(u,t);
        session.delete(ar);
        AccountEntity ae=session.get(AccountEntity.class,u);
        ae.setIsManager(t);


        session.update(ae);

        //session.update(ae);
        tran.commit();
        HibernateSessionFactory.closeSession();
    }
    public void deleteAuthority(int id){
        Transaction tran = null;
        Session session = HibernateSessionFactory.currentSession();
        tran = session.beginTransaction();
        AuthorityrequireEntity ar=session.get(AuthorityrequireEntity.class,id);
        session.delete(ar);
        tran.commit();
        HibernateSessionFactory.closeSession();
    }
    public List<AccountEntity>getAllAccounts(){
        Session session = HibernateSessionFactory.currentSession();
        try{

            Query query = session.createQuery("from AccountEntity ");

            List<AccountEntity> list = query.list();
            return list;
        }catch(Exception e){
            throw(e);
        }finally{
            HibernateSessionFactory.closeSession(); //关闭数据库会话
        }
    }
    public AccountEntity getAccount(int id){
        Session session = HibernateSessionFactory.currentSession();
        try{
            AccountEntity ae=session.get(AccountEntity.class,id);
            return ae;
        }catch(Exception e){
            throw(e);
        }finally{
            HibernateSessionFactory.closeSession(); //关闭数据库会话
        }
    }
    public void deleteAccount(int id){
        Transaction tran = null;
        Session session = HibernateSessionFactory.currentSession();
        tran = session.beginTransaction();
        AccountEntity ar=session.get(AccountEntity.class,id);
        session.delete(ar);
        tran.commit();
        HibernateSessionFactory.closeSession();
    }
    public void InsertpwdchgInformation(int id,String yzm,String pwd){
        Transaction tran = null;
        Session session = HibernateSessionFactory.currentSession();
        tran = session.beginTransaction();
        ChgpwdEntity chgpwdEntity=session.get(ChgpwdEntity.class,id);
        if(chgpwdEntity==null) {
            chgpwdEntity=new ChgpwdEntity();
            chgpwdEntity.setPwd(pwd);
            chgpwdEntity.setUserid(id);
            chgpwdEntity.setYzm(yzm);
            session.save(chgpwdEntity);
        }else{
            chgpwdEntity.setYzm(yzm);
            session.update(chgpwdEntity);
        }
        tran.commit();
        HibernateSessionFactory.closeSession();
    }
    public String getYzm(int id) {
        String ans = "";
        try {
            Transaction tran = null;
            Session session = HibernateSessionFactory.currentSession();
            tran = session.beginTransaction();
            ChgpwdEntity chgpwdEntity = session.get(ChgpwdEntity.class, id);
            ans = chgpwdEntity.getYzm();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            HibernateSessionFactory.closeSession();
            return ans;
        }
    }
    public  void CHGPWD(String pwd,int id){
        Transaction tran = null;
        Session session = HibernateSessionFactory.currentSession();
        tran = session.beginTransaction();
        AccountEntity accountEntity=session.get(AccountEntity.class,id);
        accountEntity.setPwd(pwd);
        session.save(accountEntity);
        ChgpwdEntity chgpwdEntity=session.get(ChgpwdEntity.class,id);
        session.delete(chgpwdEntity);
        tran.commit();
        HibernateSessionFactory.closeSession();
    }
    public void Directchgpwd(String pwd,int id){
        Transaction tran = null;
        Session session = HibernateSessionFactory.currentSession();
        tran = session.beginTransaction();
        AccountEntity accountEntity=session.get(AccountEntity.class,id);
        accountEntity.setPwd(pwd);
        session.save(accountEntity);
        tran.commit();
        HibernateSessionFactory.closeSession();
    }
}
