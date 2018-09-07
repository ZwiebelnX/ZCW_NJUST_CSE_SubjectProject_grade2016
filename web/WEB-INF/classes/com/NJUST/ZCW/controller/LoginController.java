package com.NJUST.ZCW.controller;

import com.NJUST.ZCW.domain.LoginInfo;
import com.NJUST.ZCW.domain.SignupInfo;
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

    @RequestMapping(value = "loginPage")
    public String LoginPage(Model model){
        model.addAttribute("login",new LoginInfo());
        return "LoginPage";
    }

    @RequestMapping(value = "login")
    public String Login(@ModelAttribute LoginInfo loginInfo, Model model){
        model.addAttribute("username", loginInfo.getUsername());
        model.addAttribute("password", loginInfo.getPassword());
        return "LoginSuccess";
    }

    @RequestMapping(value = "SignUpPage")
    public String SignUpPage(Model model){
        model.addAttribute("SignUpInfo", new SignupInfo());
        return "SignUpPage";
    }

    @RequestMapping(value = "SignUp")
    public String SignUp(){
        return "SignUpSuccess";
    }
}
