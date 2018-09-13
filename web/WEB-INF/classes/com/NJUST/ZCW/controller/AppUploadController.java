package com.NJUST.ZCW.controller;

import com.NJUST.ZCW.Dao.ApplicationDB;
import com.NJUST.ZCW.Entities.AccountEntity;
import com.NJUST.ZCW.Entities.ApplicationEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;

@Controller
public class AppUploadController {
    ApplicationDB appdb = new ApplicationDB();

    @RequestMapping(value = "AppUpload.upload")
    public String jumptoUpload(Model model) {
        return "upload/AppUploadForminfo";
    }

    @RequestMapping(value = "doupload.upload")
    public String doUpload(HttpServletRequest request,
                           @RequestParam("file") MultipartFile file, HttpSession session) {
       // System.out.println(request.getParameter("appname")+"????");
        try {

            System.out.println("XX");
            if(!file.isEmpty()) {
                //上传文件路径
                String path = request.getServletContext().getRealPath("/WEB-INF/apps/");
                //上传文件名
                String filename = file.getOriginalFilename();
                File filepath = new File(path, filename);
                //判断路径是否存在，如果不存在就创建一个
                if (!filepath.getParentFile().exists()) {
                    filepath.getParentFile().mkdirs();
                }
                if(filepath.exists())filepath.delete();
                //将上传文件保存到一个目标文件当中
                file.transferTo(new File(path + File.separator + filename));
                ApplicationEntity app=(ApplicationEntity)session.getAttribute("app");
                appdb.UpdateAppurl(app.getId(), filepath.getAbsolutePath(), "");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "upload/failed";
        }
        return "upload/success";
    }

    @RequestMapping(value = "douploadinfo.upload")
    public  String doUploadInfo(HttpServletRequest request,HttpSession session){
        int id = appdb.getMaxAppid();
        ApplicationEntity app=new ApplicationEntity();
        app.setId(id);
        app.setIntroduction(request.getParameter("introduction"));
        app.setName(request.getParameter("appname"));
        app.setType(request.getParameter("type"));
        app.setCompatibility(request.getParameter("compability"));
        app.setVersion(request.getParameter("version"));
        app.setRequireVersion(request.getParameter("requireVersion"));
        app.setLanguage(request.getParameter("language"));
        AccountEntity ae=(AccountEntity)session.getAttribute("user");
        app.setPublisherId(ae.getUserId());
        app.setChecked("F");
        appdb.InsertApp(app);
        session.setAttribute("app",app);
        return "upload/AppUploadForm";
    }
    //重新上传app资料
    //TODO 此页会报400 BAD REQUEST
    @RequestMapping(value="appreuplod.upload")
    public String reuploadapp(HttpServletRequest request,@RequestParam("appname") String appname,
                              @RequestParam("type") String type, @RequestParam("introduction") String introduction,
                              @RequestParam("compability") String compability,
                              @RequestParam("version") String version, @RequestParam("requireVersion") String requireVersion,
                              @RequestParam("language") String language, HttpSession session){
        ApplicationEntity now=(ApplicationEntity)session.getAttribute("app");
        int id=now.getId();
        ApplicationEntity app=appdb.getApp(id);
        app.setRequireVersion(requireVersion);app.setType(type);app.setName(appname);
        app.setLanguage(language);app.setIntroduction(introduction);
        app.setVersion(version);app.setCompatibility(compability);
        appdb.Updateapp(app);
        session.setAttribute("app",appdb.getApp(id));
        return "manager/Appedit";
    }
}
