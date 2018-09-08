package com.NJUST.ZCW.Dao;
import com.NJUST.ZCW.Entities.AccountEntity;
import org.hibernate.Transaction;
import org.hibernate.Session;
import org.hibernate.query.*;
import java.util.List;

public class AccountDB {
    /*
    登录检查
     */
    public boolean CheckAccountExist(AccountEntity tmp){
        Session session = null;
        Transaction tran = null;
        try{
            session = HibernateSessionFactory.currentSession();
            tran = session.beginTransaction(); //开启事务

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
            tmp.setUserId(id);
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
}
