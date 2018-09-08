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
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
    ApplicationContext cfg = new ClassPathXmlApplicationContext("applicationContext.xml");
    LoginCheck login =cfg.getBean("Login", LoginCheck.class);
    AccountDB db = new AccountDB();

    @RequestMapping(value = "loginPage.login")
    public String LoginPage(Model model){
        model.addAttribute("login",new LoginInfo());
        return "login/LoginPage";
    }

    @RequestMapping(value = "login.login")
    public String Login(@ModelAttribute LoginInfo loginInfo, Model model){
        AccountEntity accountEntity = new AccountEntity();
        accountEntity.setUserName(loginInfo.getUsername());
        accountEntity.setPwd(loginInfo.getPassword());
        if(db.CheckAccountExist(accountEntity)){
            model.addAttribute("username", loginInfo.getUsername());
            model.addAttribute("password", loginInfo.getPassword());
            return "login/LoginSuccess";
        }
        else{
            return "login/LoginFailed";
        }
    }

    @RequestMapping(value = "SignUpPage.login")
    public String SignUpPage(Model model){
        model.addAttribute("AccountEntity", new AccountEntity());
        return "login/SignUpPage";
    }

    @RequestMapping(value = "SignUp")
    public String SignUp(@ModelAttribute AccountEntity accountEntity){
        db.InsertAccount(accountEntity);
        return "login/SignUpsucceed";
    }
}
