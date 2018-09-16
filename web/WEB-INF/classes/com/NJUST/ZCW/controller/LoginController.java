package com.NJUST.ZCW.controller;

import com.NJUST.ZCW.Dao.AccountDB;
import com.NJUST.ZCW.domain.LoginInfo;
import com.NJUST.ZCW.service.login.LoginCheck;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import com.NJUST.ZCW.Entities.AccountEntity;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Resource
    private AccountDB db;

    /*
    展示登录页面
    提供LoginInfo类来对用户输入的登录信息进行传值
     */
    @RequestMapping(value = "loginPage.login")
    public String LoginPage(Model model){
        model.addAttribute("login",new LoginInfo());
        return "login/loginPage";
    }

    /*
    接受用户输入的登录信息
    写入AccountEntity供数据库查询
    并对登录是否成功进行判断
     */
    @RequestMapping(value = "login.login")
    public String Login(@ModelAttribute LoginInfo loginInfo, Model model, HttpSession session){
        AccountEntity accountEntity = new AccountEntity();
        accountEntity.setUserName(loginInfo.getUsername());
        accountEntity.setPwd(loginInfo.getPassword());
        System.out.println(accountEntity.getUserName()+accountEntity.getPwd());
        if(db.CheckAccountExist(accountEntity)){
            accountEntity=db.getUser(accountEntity);
            session.setAttribute("nickname", accountEntity.getNormalName());
            model.addAttribute("account",accountEntity.getNormalName());
            //System.out.println(accountEntity.getUserName()+accountEntity.getNormalName());
            session.setAttribute("user",accountEntity);
            session.setAttribute("userid",accountEntity.getUserId());
            return "login/loginSuccess";
        }
        else{
            return "login/loginFailed";
        }
    }

    /*
    展示用户注册界面
    传入AccountEntity以接受用户输入
     */
    @RequestMapping(value = "signUpPage.login")
    public String SignUpPage(Model model){
        model.addAttribute("AccountEntity", new AccountEntity());
        return "login/signUpPage";
    }

    /*
    接受用户输入的AccountEntity
    数据库直接写入
     */
    @RequestMapping(value = "signUp.login")
    public String SignUp(@ModelAttribute AccountEntity accountEntity){
        db.InsertAccount(accountEntity);
        return "login/signUpsucceed";
    }

    //TODO 主页取消URL跳转 改为控制器跳转
    @RequestMapping(value="mainPage.login")
    public String jumptoMainPage(Model model){
        return "mainpage";
    }

    @RequestMapping(value="logout.login")
    public String doLogOut(Model model){
        return "login/logout";
    }
    @RequestMapping(value="toMainPage.login")
    public String toMainPage(Model model){
        //System.out.println("????");
        return "mainpage";
    }
    //TODO 改为依赖注入形式执行外部调用
}
