package com.NJUST.ZCW.controller;

import com.NJUST.ZCW.Dao.AccountDB;
import com.NJUST.ZCW.Dao.ApplicationDB;
import com.NJUST.ZCW.Entities.AccountEntity;
import com.NJUST.ZCW.Entities.ApplicationEntity;
import com.NJUST.ZCW.domain.PersonalInformationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;

@Controller
public class ManagerController {

    @Resource
    private AccountDB db;
    @Resource
    private ApplicationDB appdb;
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

    @RequestMapping(value = "askforK.manager")
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

    @RequestMapping(value = "authority_ac/{idd}.manager")
    public String acAuthoritychange(Model model, @PathVariable String idd){
        int id=Integer.parseInt(idd);
        System.out.println("perper"+id);
        db.ChangeAuthority(id);
        model.addAttribute("Querylist",db.getAllAuthorityQuery());
        return "manager/AuthorityManage";
    }
    @RequestMapping(value = "authority_wa/{idd}.manager")//执行拒绝
    public String waAuthoritychange(Model model, @PathVariable String idd){
        int id=Integer.parseInt(idd);
        System.out.println("delete"+id);
        db.deleteAuthority(id);
        model.addAttribute("Querylist",db.getAllAuthorityQuery());
        return "manager/AuthorityManage";

    }
    @RequestMapping(value = "Accountlist.manager")
    public String getAccountInformation(Model model){
        model.addAttribute("Accountlist",db.getAllAccounts());
        return "manager/AppManageList";
    }

    @RequestMapping(value = "accountinformation/{id}.manager")//执行拒绝
    public String getaccountdetail(Model model, @PathVariable int id){
        AccountEntity ae=db.getAccount(id);
        String s;
        if(ae.getIsManager().equals("N"))
            s="普通用户";
        else if(ae.getIsManager().equals("K"))
            s="开发商用户";
        else s="管理员";
        model.addAttribute("account",ae);
        model.addAttribute("authority",s);
        return "manager/AppManageDetail";

    }

    @RequestMapping(value = "accountdelete/{id}.manager")//用户删除
    public String deleteaccount(Model model, @PathVariable int id){
        db.deleteAccount(id);
        model.addAttribute("Accountlist",db.getAllAccounts());
        return "manager/AppManageList";
    }

    @RequestMapping(value = "askforN/{id}.manager")//更改成为普通用户
    public String doN(Model model, @PathVariable int id){
        db.doChangeAuthority(id,"N");
        model.addAttribute("Accountlist",db.getAllAccounts());
        return "manager/AppManageList";
    }

    @RequestMapping(value = "askforK/{id}.manager")//更改成为普通用户
    public String doK(Model model, @PathVariable int id){
        db.doChangeAuthority(id,"K");
        model.addAttribute("Accountlist",db.getAllAccounts());
        return "manager/AppManageList";
    }

    @RequestMapping(value = "askforC/{id}.manager")//更改成为普通用户
    public String doC(Model model, @PathVariable int id){
        db.doChangeAuthority(id,"C");
        model.addAttribute("Accountlist",db.getAllAccounts());
        return "manager/AppManageList";
    }

    //应用审核
    @RequestMapping(value="AppCheck.manager")
    public String getAllCheckApps(Model model){
        model.addAttribute("list",appdb.getAllCheckApps("F"));
        return "manager/checkedapplist";
    }

    @RequestMapping(value = "appac/{id}.manager")//审核通过
    public String appAccepted(Model model, @PathVariable int id){
        appdb.ChangeChecked(id,"Y");
        model.addAttribute("list",appdb.getAllCheckApps("F"));
        return "manager/checkedapplist";
    }

    @RequestMapping(value = "appwa/{id}.manager")//审核不通过
    public String appRefused(Model model, @PathVariable int id){
        appdb.ChangeChecked(id,"N");
        model.addAttribute("list",appdb.getAllCheckApps("F"));
        return "manager/checkedapplist";
    }
    @RequestMapping(value = "appinformation/{id}.manager")//详细信息
    public String getDetailedInformation(Model model, @PathVariable int id){
        appdb.VisCntIncrease(id);
        ApplicationEntity app=appdb.getApp(id);
        if(app.getChecked().equals("Y"))model.addAttribute("zt","通过审核");
        else if(app.getChecked().equals("F"))model.addAttribute("zt","等待审核");
        else    model.addAttribute("zt","未通过审核");
        model.addAttribute("app",app);
        model.addAttribute("publishername",db.getAccount(app.getPublisherId()).getUserName());
        return "search/AppDetail";
    }

    //获取某一位开发者的全部应用信息
    @RequestMapping(value = "getappbypublisher/{id}.manager")
    public String getAppbyPublisher(Model model,@PathVariable int id){
        model.addAttribute("applist",appdb.getAppbyPublisherid(id));
        return "search/AppList";
    }

    //应用管理
    @RequestMapping(value="AppManage.manager")
    public String getAllCheckApps(Model model,HttpSession session){
        AccountEntity ae=(AccountEntity) session.getAttribute("user");
        if(ae.getIsManager().equals("C"))
            model.addAttribute("applist",appdb.getAllApps());
        else if(ae.getIsManager().equals("K"))
            model.addAttribute("applist",appdb.getAppbyPublisherid(ae.getUserId()));
        return "manager/manageapplist";
    }

    //重新编辑一个app的页面
    @RequestMapping(value = "appedit/{id}.manager")
    public String jumptpappedit(Model model,@PathVariable int id,HttpSession session){
        session.setAttribute("app",appdb.getApp(id));
        return "manager/Appedit";
    }

    //删除app appdelete
    @RequestMapping(value = "appdelete/{id}.manager")
    public String dodeleteapp(Model model, @PathVariable int id, HttpSession session, HttpServletRequest request){
        ApplicationEntity app=appdb.getApp(id);
        File filepath=new File( request.getServletContext().getRealPath("")+app.getDownloadUrl());

        File imgpath=new File(request.getServletContext().getRealPath("")+app.getImg());
        //System.out.println(filepath);
        if(filepath.exists()&&filepath.isFile())
            filepath.delete();
        if(imgpath.exists()&&imgpath.isFile())
            imgpath.delete();
        appdb.deleteapp(app);
        AccountEntity ae=(AccountEntity) session.getAttribute("user");
        if(ae.getIsManager().equals("C"))
            model.addAttribute("applist",appdb.getAllApps());
        else if(ae.getIsManager().equals("K"))
            model.addAttribute("applist",appdb.getAppbyPublisherid(ae.getUserId()));
        return "manager/manageapplist";
    }
}
