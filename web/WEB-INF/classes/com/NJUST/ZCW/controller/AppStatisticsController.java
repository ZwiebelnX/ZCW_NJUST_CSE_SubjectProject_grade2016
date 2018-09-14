package com.NJUST.ZCW.controller;

import com.NJUST.ZCW.Dao.ApplicationDB;
import com.NJUST.ZCW.Entities.ApplicationEntity;
import com.NJUST.ZCW.service.statistics.JfreeUtil;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.servlet.ServletUtilities;
import org.jfree.data.general.DefaultPieDataset;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@Controller
public class AppStatisticsController {

    ApplicationDB appdb=new ApplicationDB();
    @RequestMapping(value = "app.statistics")
    public String jumptostatisticspage(){
        System.out.println("FFFF~~~");
        return "statistics/AppStatisticForm";
    }

    @RequestMapping(value = "getapp.statistics")
    public String getColumnpie(HttpServletRequest request, HttpServletResponse response, Model model)
            throws Exception {
        DefaultPieDataset dataset = new DefaultPieDataset();
        //DefaultPieDataset dataset = getDataSetpie(cityBiz.findAll());

        List<ApplicationEntity> applist=appdb.getAllApps();
        List<ApplicationEntity> ans=new ArrayList<>();
        String require_tp=request.getParameter("tp");
        String require_name=request.getParameter("keyword");
        String require_publisher=request.getParameter("publisher");
        for(ApplicationEntity app:applist){
            if(require_name==null||require_publisher==null||require_tp==null||app.getName()==null||app.getPublisherName()==null||app.getType()==null)
                continue;
            if(!app.getChecked().equals("Y"))
                continue;
            if(!require_tp.equals("全部")){
                if(!app.getType().equals(require_tp))
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
            dataset.setValue(app.getName(),app.getVisitCnt());
        }


        JFreeChart chart = ChartFactory.createPieChart3D("应用热度统计", // 主标题的名称
                dataset, // 图标显示的数据集合
                true, // 是否显示子标题
                true, // 是否生成提示的标签
                true); // 是否生成URL链接

        JfreeUtil.setJfreePie(chart);

        // 6. 将图形转换为图片，传到前台
        String fileName = ServletUtilities.saveChartAsJPEG(chart, 700, 400, null, request.getSession());
        String chartURL = request.getContextPath() + "/chart?filename=" + fileName;
        model.addAttribute("chartURLPie", chartURL);
        return "statistics/AppStatistic";
    }
}
