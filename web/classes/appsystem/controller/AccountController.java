package appsystem.controller;

import appsystem.domain.AccountDB;
import appsystem.domain.AccountEntity;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;

import javax.management.modelmbean.RequiredModelMBean;
import javax.servlet.http.HttpSession;
import java.util.List;

import static org.springframework.orm.hibernate3.SessionFactoryUtils.getSession;


@Controller
public class AccountController
{


    private static final Log logger = LogFactory.getLog(AccountController.class);
    private static AccountDB db=new AccountDB();
    @RequestMapping(value = "login_input")
    public String inputaccount(Model model){
        model.addAttribute("account", new AccountEntity());
        return "LoginPage";
    }

    @RequestMapping(value = "doLogin")
    public String  todoLogin(@ModelAttribute AccountEntity account,Model model,HttpSession httpSession){
        model.addAttribute("account",account);
        model.addAttribute("username",account.getUserName());
        if(db.CheckAccountExist(account)) {
            httpSession.setAttribute("username",account.getUserName());
            return "LoginSuccess";
        }
        else
            return "LoginFailed";
    }

    @RequestMapping(value="signup_input")
    public String linktosignuppage(Model model){
        model.addAttribute("SignUpInfo",new AccountEntity());
        return "SignUpPage";
    }

    @RequestMapping(value="logout")
    public String dologout(Model model){
        return "Logout";
    }

    @RequestMapping(value="doSignup")
    public String doSignupfunction(@ModelAttribute AccountEntity account){
        if(db.InsertAccount(account)){
            return "Signupsucceed";
        }else
            return "Signupfailed";
    }
}
