package com.NJUST.ZCW.controller;

import com.NJUST.ZCW.Dao.AccountDB;
import com.NJUST.ZCW.domain.PersonalInformationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.NJUST.ZCW.Entities.AccountEntity;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ManagerController {

    AccountDB db = new AccountDB();

    @RequestMapping(value = "accountmanage.manager")
    public String jumptopersonalinformation(Model model){
        model.addAttribute("personal",new PersonalInformationInfo());
        return "manager/AccountManage";
    }
    @RequestMapping(value = "accountauthority.manager")
    public String jumptoAuthorityQuery(Model model){
        return "manager/AccountAuthority";}

        @RequestMapping(value = "personal.manager")
    public String doUpdatepersonalinformation(@ModelAttribute PersonalInformationInfo personalInformationInfo, Model model, HttpSession session){
        System.out.println("@#!@#!");
            AccountEntity tmp=new AccountEntity();
            if(personalInformationInfo.getAddress()==null)
                tmp.setAddress("");
            else
                tmp.setAddress(personalInformationInfo.getAddress());
            if(personalInformationInfo.getAge()==0)
                tmp.setAge(1);
            else
                tmp.setAge(personalInformationInfo.getAge());
            if(personalInformationInfo.getGender()==null)
                tmp.setGender("M");
            else
                tmp.setGender(personalInformationInfo.getGender());
            if(personalInformationInfo.getEmail()==null)
                tmp.setMail("");
            else
                tmp.setMail(personalInformationInfo.getEmail());
            if(personalInformationInfo.getNickname()==null)
                tmp.setNormalName("null");
            else
                tmp.setNormalName(personalInformationInfo.getNickname());
            if(personalInformationInfo.getPhoneNumber()==null)
                tmp.setTel("");
            else
                tmp.setTel(personalInformationInfo.getPhoneNumber());
            tmp.setIdentityCard(personalInformationInfo.getIDnumber());
            tmp.setIdName(personalInformationInfo.getIDname());
            tmp.setQq(personalInformationInfo.getQQ());
            tmp.setTel(personalInformationInfo.getPhoneNumber());
            AccountEntity ac=(AccountEntity)session.getAttribute("user");
            tmp.setPwd(ac.getPwd());
            tmp.setUserName(ac.getUserName());
            tmp.setUserId(ac.getUserId());
            tmp.setAuthority(ac.getAuthority());
            tmp.setIsManager(ac.getIsManager());
            db.UpdatePersonalInformation(tmp);
            AccountEntity accountEntity=db.getUser(tmp);
            session.setAttribute("nickname", accountEntity.getNormalName());
            model.addAttribute("account",accountEntity.getNormalName());
            //System.out.println(accountEntity.getUserName()+accountEntity.getNormalName());
            session.setAttribute("user",accountEntity);
            session.setAttribute("userid",accountEntity.getUserId());
            return "manager/jumptpAccuntManage";
    }

    @RequestMapping(value = "askforK,manager")
    public String doAskforK(HttpSession session){
        AccountEntity ae=(AccountEntity) session.getAttribute("user");
        int f=ae.getUserId();
        if(db.InsertforAuthorityQuery(f,"K",ae.getUserName()))
            return "manager/AskforSuccess";
        else
            return "manager/AskforFailed";
    }
    @RequestMapping(value = "askforC.manager")
    public String doAskforC(HttpSession session){
        AccountEntity ae=(AccountEntity) session.getAttribute("user");
        int f=ae.getUserId();
        if(db.InsertforAuthorityQuery(f,"C",ae.getUserName()))
        return "manager/AskforSuccess";
        else
            return "manager/AskforFailed";
    }

    @RequestMapping(value = "AuthorityManagee.manager")
    public String doGetAuthorityQuery(Model model){
        model.addAttribute("Querylist",db.getAllAuthorityQuery());
        return "manager/AuthorityManage";
    }

    @RequestMapping(value = "AccountManagee.manager")
    public String doGetUserInformation(){
        return "manager/jumptpAccuntManage";
    }

    @RequestMapping(value = "authority_ac/{idd}")
    public String acAuthoritychange(Model model, @PathVariable String idd){
        int id=Integer.parseInt(idd);
        System.out.println("perper"+id);
        db.ChangeAuthority(id);
        return "manager/jumptoAuthorityQuery";
    }
    @RequestMapping(value = "authority_wa/{idd}")//执行拒绝
    public String waAuthoritychange(Model model, @PathVariable String idd){
        int id=Integer.parseInt(idd);
        System.out.println("delete"+id);
        db.deleteAuthority(id);
        return "manager/jumptoAuthorityQuery";

    }

}
