package com.NJUST.ZCW.controller;

import com.NJUST.ZCW.Dao.AccountDB;
import com.NJUST.ZCW.Entities.AccountEntity;
import com.NJUST.ZCW.domain.LoginInfo;
import com.NJUST.ZCW.service.login.LoginCheck;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
    ApplicationContext cfg = new ClassPathXmlApplicationContext("applicationContext.xml");
    LoginCheck login =cfg.getBean("Login", LoginCheck.class);
    AccountDB db = new AccountDB();

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
    public String Login(@ModelAttribute LoginInfo loginInfo, Model model){
        AccountEntity accountEntity = new AccountEntity();
        accountEntity.setUserName(loginInfo.getUsername());
        accountEntity.setPwd(loginInfo.getPassword());
        if(db.CheckAccountExist(accountEntity)){
            model.addAttribute("username", loginInfo.getUsername());
            return "index";
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
    //TODO 改为依赖注入形式执行外部调用
}
