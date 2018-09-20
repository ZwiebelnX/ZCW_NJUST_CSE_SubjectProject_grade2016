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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Random;

import static java.lang.System.out;

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
    //TODO Ajax响应
    @RequestMapping(value = "login.login")
    public String Login(@ModelAttribute LoginInfo loginInfo,HttpSession session, HttpServletRequest request,
                        HttpServletResponse response) throws Exception{

        AccountEntity accountEntity = new AccountEntity();
        accountEntity.setUserName(loginInfo.getUsername());
        accountEntity.setPwd(loginInfo.getPassword());
        out.println(accountEntity.getUserName()+accountEntity.getPwd());
        if(db.CheckAccountExist(accountEntity)){
            accountEntity=db.getUser(accountEntity);
            session.setAttribute("user",accountEntity);
            session.setAttribute("userType", accountEntity.getIsManager());
            return "mainpage";
        }
        else{
            String path = request.getContextPath();
            response.setContentType("text/html;charset=gb2312");
            response.getWriter().print("<script language=\"javascript\">alert('登录失败，请检查您的账号和密码！');" +
                    "window.location.href='" + path + "/loginPage.login'</script>");
            return null;
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
    public String SignUp(@ModelAttribute AccountEntity accountEntity, HttpServletRequest request,
                         HttpServletResponse response) throws Exception{
        String path = request.getContextPath();
        response.setContentType("text/html;charset=gb2312");

        if(db.InsertAccount(accountEntity)){
            response.getWriter().print("<script language=\"javascript\">alert('注册成功！请登录。');" +
                    "window.location.href='" + path + "/loginPage.login'</script>");
            return null;
        }
        else{
            response.getWriter().print("<script language=\"javascript\">alert('注册失败 您的用户名可能重复，请重新注册！');" +
                    "window.location.href='" + path + "/loginPage.login'</script>");
            return null;
        }
    }


    //跳转至欢迎主页
    @RequestMapping(value = "index.login")
    public String toIndex(){
        return "index";
    }

    //跳转至个人主页
    @RequestMapping(value="toMainPage.login")
    public String toMainPage(){
        return "mainpage";
    }

    //注销动作
    @RequestMapping(value="logout.login")
    public String doLogOut(HttpSession session, HttpServletResponse response, HttpServletRequest request)throws Exception{
        //清除用户标识
        session.removeAttribute("user");

        //输出注销信息
        String path = request.getContextPath();
        response.setContentType("text/html;charset=gb2312");
        response.getWriter().print("<script language=\"javascript\">alert('注销成功！');" +
                "window.location.href='" + path + "/index.login'</script>");
        return null;
    }


    @RequestMapping(value="forgetPassword.login")
    public String jumptoForgetPwdPage(){
        return "login/forgetPWD";
    }

    //执行邮件认证
    @RequestMapping(value = "postEmail.login")
    public String postVerifyEmail(HttpServletRequest request,Model model,HttpSession session, HttpServletResponse response){
        //获取web应用路径 设置输出字符集
        String path = request.getContextPath();
        response.setContentType("text/html;charset=gb2312");

        //发送邮件
        String msg;
        String yzm= getRandomNumber();
        //out.println(yzm);
        String str="您好，您的验证码为"+yzm+"为了您的账号信息安全，请勿将此验证码交给他人";
        List<AccountEntity> list=db.getAllAccounts();
        String to="";
        int id=0;
        for(AccountEntity ae:list){
            if(ae.getUserName().equals(request.getParameter("account"))){
                to=ae.getMail();
                id=ae.getUserId();
                session.setAttribute("forgetPasswordUserId",ae.getUserId());
                session.setAttribute("forgetPasswordUser",ae);
            }
        }
        //out.println("userid="+id);
        MailSystem sender=new MailSystem();
        try {
            if(to.equals("")) {
                //out.println("无当前账号");
                response.getWriter().print("<script language=\"javascript\">alert('无当前账号！');" +
                        "window.location.href='" + path + "/forgetPassword.login'</script>");
                return null;
            }
            sender.sendMail(to,str);
            db.InsertpwdchgInformation(id,yzm,"1");
        }catch (Exception e){
            e.printStackTrace();
            msg="无此用户名或邮件发送失败！";
            try{
                response.getWriter().print("<script language=\"javascript\">alert('" + msg + "');" +
                        "window.location.href='" + path + "/forgetPassword.login'</script>");
                return null;
            } catch (Exception e2){
                e2.printStackTrace();
            }
        }
        msg="邮件已经发送，请查收";

        model.addAttribute("msg",msg);
        return "login/forgetPWD";
    }

    @RequestMapping(value = "checkemailyzm.login")
    public String checkYzm(ServletRequest request,HttpSession session,Model model){
        if(session.getAttribute("forgetPasswordUserId") != null) {
            String idd=session.getAttribute("forgetPasswordUserId").toString();
            int id = Integer.parseInt(idd);
            String yzm = db.getYzm(id);
            //out.println("id="+id);
            String inputyzm = request.getParameter("yzm");
            if (inputyzm.equals(yzm)) {
                db.CHGPWD(request.getParameter("pwd"), id);
                return "index";
            }
            else{
                model.addAttribute("msg", "验证码错误");
                return "login/forgetPWD";
            }
        }else{
            model.addAttribute("msg","请先获取验证码");
            return "login/forgetPWD";
        }

    }

    private String getRandomNumber() {
        Random random = new Random();
        String fourRandom = random.nextInt(10000) + "";
        int randLength = fourRandom.length();
        if (randLength < 4) {
            for (int i = 1; i <= 4 - randLength; i++)
                fourRandom = "0" + fourRandom;
        }
        return fourRandom;
    }
}
