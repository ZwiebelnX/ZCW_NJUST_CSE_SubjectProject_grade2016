package com.NJUST.ZCW.Dao;
import org.hibernate.Transaction;
import org.hibernate.Session;
import org.hibernate.query.*;
import java.util.List;
import com.NJUST.ZCW.Entities.*;
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
                System.out.println("账户不存在");
                return false;
            }
            else {
                System.out.println("账户存在");
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
            System.out.println("正在尝试注册");
            System.out.println(tmp.getUserName()+"??"+id);
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
        System.out.println("ID为:"+tmp.getUserId()+"NICKNAME="+tmp.getUserName());
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
            System.out.println("正在尝试插入");
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

        //System.out.println(t+";"+u);

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

        //System.out.println(t+";"+u);

        session.update(ae);
        //System.out.println(t+";"+u);

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
}
