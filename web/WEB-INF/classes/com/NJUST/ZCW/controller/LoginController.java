package com.NJUST.ZCW.controller;

import com.NJUST.ZCW.Dao.AccountDB;
import com.NJUST.ZCW.Entities.AccountEntity;
import com.NJUST.ZCW.domain.LoginInfo;
import com.NJUST.ZCW.service.login.MailSystem;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Random;

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
    @RequestMapping(value="forgetPassword.login")
    public String jumptoForgetPwdPage(){
        return "login/forgetPWD";
    }

    public String getRandomnumber(){
        Random random = new Random();
        String fourRandom = random.nextInt(10000) + "";
        int randLength = fourRandom.length();
        if(randLength<4){
            for(int i=1; i<=4-randLength; i++)
                fourRandom = "0" + fourRandom  ;
        }
        return fourRandom;
    }
    //执行邮件认证
    @RequestMapping(value = "postEmail.login")
    public String postthemail(ServletRequest request,Model model,HttpSession session){
        String msg="";
        String yzm=getRandomnumber();
        System.out.println(yzm);
        String str="您好，您的验证码为"+yzm+"为了您的账号信息安全，请勿将此验证码交给他人";
        List<AccountEntity> list=db.getAllAccounts();
        String to="";
        int id=0;
        for(AccountEntity ae:list){
            if(ae.getUserName().equals(request.getParameter("account"))){
                to=ae.getMail();
                id=ae.getUserId();
                session.setAttribute("userid",ae.getUserId());
                session.setAttribute("user",ae);
            }
        }
        System.out.println("userid="+id);
        MailSystem sender=new MailSystem();
        try {
            if(to.equals("")) {
                System.out.println("无当前账号");
                throw new Exception("no such account");
            }
            sender.sendMail(to,str);
            db.InsertpwdchgInformation(id,yzm,"1");
        }catch (Exception e){
            e.printStackTrace();
            msg="无此邮箱或邮件发送失败！";
            return  "login/Failed";
        }
        msg="邮件已经发送，请检查";

        model.addAttribute("msg",msg);
        return "login/forgetPWD";
    }
    @RequestMapping(value = "checkemailyzm.login")
    public String checkyzm(ServletRequest request,HttpSession session,Model model){
        String idd=session.getAttribute("userid").toString();
        System.out.println(idd+";;;;");
        if(idd!=null) {
            int id = Integer.parseInt(idd);
            String yzm = "";
            yzm = db.getYzm(id);
            System.out.println("id="+id);
            String inputyzm = request.getParameter("yzm");
            if (inputyzm.equals(yzm)) {
                db.CHGPWD(request.getParameter("pwd"), id);
            }return "mainpage";
        }else{
            model.addAttribute("msg","请先获取验证码");
            return "login/forgetPWD";
        }

    }
}
