package com.NJUST.ZCW.controller;

import com.NJUST.ZCW.Dao.ApplicationDB;
import com.NJUST.ZCW.Entities.ApplicationEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class AppSearchController {

    ApplicationDB appdb=new ApplicationDB();

    @RequestMapping(value = "app.search")
    public String jumptoAppSearch(){
        return "search/AppSearch";
    }
    //查找APP 通用方法
    @RequestMapping(value = "getapp.search")
    public String getApplist(HttpServletRequest request,Model model)
    {
        //System.out.println("关键字"+request.getParameter("keyword"));
        List<ApplicationEntity> applist=appdb.getAllApps();
        List<ApplicationEntity> ans=new ArrayList<>();
        String require_tp=request.getParameter("tp");
        String require_name=request.getParameter("keyword");
        String require_publisher=request.getParameter("publisher");
        for(ApplicationEntity app:applist){
            //System.out.println("Checking"+app.getName());
            //System.out.println("tp="+require_tp+"name="+require_name+"publisher="+require_publisher);
            //if(require_name.equals(""))System.out.println("FFF");
            //if(require_name==null)System.out.println("WWW");
            if(require_name==null||require_publisher==null||require_tp==null||app.getName()==null||app.getPublisherName()==null||app.getType()==null)
                continue;
            if(!app.getChecked().equals("Y"))
                continue;
            //System.out.println("Passed1");
            if(!require_tp.equals("全部")){
                if(!app.getType().equals(require_tp))
                    continue;
            }
            //System.out.println("Passed2");
            if(!require_name.equals("")){
                if(app.getName().indexOf(require_name)==-1)
                    continue;
            }
           // System.out.println("Passed3");
           // System.out.println("Name null");
            if(!require_publisher.equals("")){
                if(!require_publisher.equals(app.getPublisherName()))
                    continue;
            }
           // System.out.println("ADDED!");
            ans.add(app);
        }
        model.addAttribute("applist",ans);
        return "search/AppList";
    }

    //关键字查找APP
    @RequestMapping(value = "getappbytp/{tp}.search")
    public String getApplistbytp(Model model, @PathVariable String tp){
        List<ApplicationEntity> applist=appdb.getAllApps();
        List<ApplicationEntity> ans=new ArrayList<>();
        for(ApplicationEntity app:applist){
            if(!app.getType().equals(tp))
                continue;
            ans.add(app);
        }
        model.addAttribute("applist",ans);
        return "search/AppList";
    }
}
