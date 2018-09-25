package com.NJUST.ZCW.controller;

import com.NJUST.ZCW.Dao.ApplicationDB;
import com.NJUST.ZCW.Entities.ApplicationEntity;
import com.NJUST.ZCW.service.statistics.StaticInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;




@Controller
public class AppStatisticsController {
    @Resource
    private ApplicationDB appdb;

    @RequestMapping(value = "app.statistics")
    public String jumptostatisticspage(){
        return "statistics/AppStatisticForm";
    }

    @RequestMapping(value = "getapp.statistics")
    public String getColumnpie(HttpServletRequest request, HttpServletResponse response, Model model)
            throws Exception {
        List<ApplicationEntity> applist=appdb.getAllApps();
        List<StaticInfo> ans=new ArrayList<>();
        //String require_tp=request.getParameter("tp");
        String[]require_tp=request.getParameterValues("tp");
        String require_method=request.getParameter("method");
        String require_name=request.getParameter("keyword");
        String require_publisher=request.getParameter("publisher");
        Map<String,Integer>m=new HashMap<String, Integer>();
        m.clear();
        System.out.println(require_tp+":;;;");
        if(require_tp!=null)
            for(int i=0;i<require_tp.length;i++) {
                m.put(require_tp[i], i + 1);
                //System.out.println(require_tp[i]+";;"+(i+1));
            }
        else{
            m.put("游戏",1);m.put("视频",2);m.put("聊天",3);
            m.put("浏览器",4);m.put("网购金融",5);m.put("生活",6);
            m.put("新闻",7);m.put("摄影",8);m.put("美食",9);m.put("音乐",10);
            //System.out.println("WHY????");
            //System.out.println(m);
            StaticInfo tmp=new StaticInfo();tmp.setValue(0);
            tmp.setName("游戏");ans.add(tmp);tmp=new StaticInfo();tmp.setValue(0);
            tmp.setName("视频");ans.add(tmp);tmp=new StaticInfo();tmp.setValue(0);
            tmp.setName("聊天");ans.add(tmp);tmp=new StaticInfo();tmp.setValue(0);
            tmp.setName("浏览器");ans.add(tmp);tmp=new StaticInfo();tmp.setValue(0);
            tmp.setName("网购金融");ans.add(tmp);tmp=new StaticInfo();tmp.setValue(0);
            tmp.setName("生活");ans.add(tmp);tmp=new StaticInfo();tmp.setValue(0);
            tmp.setName("新闻");ans.add(tmp);tmp=new StaticInfo();tmp.setValue(0);
            tmp.setName("摄影");ans.add(tmp);tmp=new StaticInfo();tmp.setValue(0);
            tmp.setName("美食");ans.add(tmp);tmp=new StaticInfo();tmp.setValue(0);
            tmp.setName("音乐");ans.add(tmp);
            //System.out.println(ans);
        }
        if(require_method.equals("数量统计")&&require_tp!=null){
            for(int i=0;i<require_tp.length;i++){
                StaticInfo tmp=new StaticInfo();
                tmp.setName(require_tp[i]);
                tmp.setValue(0);
                ans.add(tmp);
            }
        }
        for(ApplicationEntity app:applist){
            if(require_name==null||require_publisher==null||app.getName()==null||app.getPublisherName()==null||app.getType()==null)
                continue;
            if(!app.getChecked().equals("Y"))
                continue;
            if(require_tp!=null){
                //System.out.println("检查map"+m.get(app.getType()));
                if(m.get(app.getType())==null)
                    continue;
            }
            if(!require_name.equals("")){
                if(app.getName().indexOf(require_name)==-1)
                    continue;
            }
            if(!require_publisher.equals("")){
                if(!require_publisher.equals(app.getPublisherName()))
                    continue;
            }
            if(!require_method.equals("数量统计")) {
               // System.out.println("HEREA~");
                StaticInfo tmp = new StaticInfo();
                tmp.setName(app.getName());
                tmp.setValue(app.getVisitCnt());
                ans.add(tmp);
            }else{
                int id=m.get(app.getType());
                //System.out.println(app.getType()+":"+id);
                id--;
                StaticInfo tmp=ans.get(id);
                tmp.setValue(tmp.getValue()+1);
                //System.out.println(tmp.getName()+";;"+tmp.getValue());
                ans.set(id,tmp);
            }
            //dataset.setValue(app.getName(),app.getVisitCnt());
        }
        model.addAttribute("Method",require_method);
        model.addAttribute("Staticdata",ans);
        return "statistics/AppStatisticForm";
    }


}
