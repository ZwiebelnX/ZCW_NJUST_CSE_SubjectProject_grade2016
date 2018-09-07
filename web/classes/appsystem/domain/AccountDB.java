package appsystem.domain;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.Session;
import org.hibernate.query.*;
import java.util.List;

public class AccountDB {
    private static SessionFactory sf = new Configuration()//
            .configure("hibernate.cfg.xml")//
            .buildSessionFactory();
    public boolean CheckAccountExist(AccountEntity tmp){
        Session session = null;
        Transaction tran = null;
        try{
            session = sf.openSession(); // 创建一个Session
            tran = session.beginTransaction(); //开启事务

            /*这里指明你要获得哪个类型，Hibernate会根据类名查询映射配置文件到数据库查询哪张表，根据指定
             * id查询实体，通过反射机制创建实体对象
             */
            Query query = session.createQuery("from AccountEntity where userName = ?1 and pwd =?2");
            //2、填写上一步中占位符的内容
            query.setParameter(1, tmp.getUserName());
            query.setParameter(2, tmp.getPwd());

            List<AccountEntity> list = query.list();
            if(list.isEmpty()){
                System.out.println("账户不存在");
                return false;}
            else {
                System.out.println("账户存在");
                return true;}
        }catch(Exception e){
            tran.rollback(); //事务回滚
            throw(e);
        }finally{
            session.close(); //关闭session
        }
    }
    public boolean InsertAccount(AccountEntity tmp){
        Session session = null;
        Transaction tran = null;
        try{
            session = sf.openSession();
            tran = session.beginTransaction();


            Query query = session.createQuery("from AccountEntity");
            List<AccountEntity> list = query.list();
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
            session.close(); //关闭session
        }
    }
}
