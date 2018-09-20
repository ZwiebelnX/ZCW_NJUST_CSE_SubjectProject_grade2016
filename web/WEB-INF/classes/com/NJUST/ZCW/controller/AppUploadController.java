package com.NJUST.ZCW.controller;

import com.NJUST.ZCW.Dao.ApplicationDB;
import com.NJUST.ZCW.Entities.AccountEntity;
import com.NJUST.ZCW.Entities.ApplicationEntity;
import net.dongliu.apk.parser.ApkFile;
import net.dongliu.apk.parser.bean.ApkMeta;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;

@Controller
public class AppUploadController {
    @Resource
    ApplicationDB appdb;

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
                String path = request.getServletContext().getRealPath("/apps/");
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
                ApkFile apkFile=new ApkFile(filepath.getAbsolutePath());
                ApkMeta apkMeta=apkFile.getApkMeta();
                List<String> list=apkMeta.getUsesPermissions();
                String s="";
                String version=apkMeta.getVersionName();
                for(String i:list)
                    s=s+i+'\n';
                System.out.println("应用上传路径:"+filepath.getAbsolutePath());
                String minSdkVersion=apkMeta.getMinSdkVersion();
                //System.out.println("ICO路径"+ico);
                appdb.UpdateAppurl(app.getId(), request.getContextPath()+"/apps/"+filename, s,version,minSdkVersion);
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
        //app.setRequireVersion(request.getParameter("requireVersion"));
        app.setLanguage(request.getParameter("language"));
        AccountEntity publisher = (AccountEntity)session.getAttribute("user");
        app.setPublisherName(publisher.getNormalName());
        app.setVisitCnt(0);
        AccountEntity ae=(AccountEntity)session.getAttribute("user");
        app.setPublisherId(ae.getUserId());
        app.setChecked("F");
        appdb.InsertApp(app);
        session.setAttribute("app",app);
        appdb.UpdateAppIcourl(app.getId(),request.getContextPath() + "/imgs/appDafultLogo.jpg");
        return "upload/AppUploadForm";
    }
    //重新上传app资料
    @RequestMapping(value="appreupload.upload")
    public String reuploadapp(HttpServletRequest request, HttpSession session){
        ApplicationEntity now=(ApplicationEntity)session.getAttribute("app");
        int id=now.getId();
        ApplicationEntity app=appdb.getApp(id);
        System.out.println(request.getParameter("introduction"));
        app.setRequireVersion(request.getParameter("requireVersion"));app.setType(request.getParameter("type"));app.setName(request.getParameter("appname"));
        app.setLanguage(request.getParameter("language"));app.setIntroduction(request.getParameter("introduction"));
        app.setCompatibility(request.getParameter("compability"));
        appdb.Updateapp(app);
        session.setAttribute("app",appdb.getApp(id));
        return "manager/Appedit";
    }

    //跳转至
    @RequestMapping(value="uploadico.upload")
    public String jumptouploadico(){
        return "upload/IcoUpload";
    }
    //上传图片
    @RequestMapping(value = "douploadico.upload")
    public String doUploadIco(HttpServletRequest request,
                           @RequestParam("file") MultipartFile file, HttpSession session) {
        // System.out.println(request.getParameter("appname")+"????");
        ApplicationEntity app=(ApplicationEntity)session.getAttribute("app");
        try {
            System.out.println("XX");
            if(!file.isEmpty()) {
                //上传文件路径
                String path = request.getServletContext().getRealPath("/icos/");
                //上传文件名
                String filename = file.getOriginalFilename();
                String suffix = filename.substring(filename.lastIndexOf(".") + 1);
                filename=String.valueOf(app.getId());
                filename=filename+"."+suffix;

                if(!(suffix.equals("png")||suffix.equals("jpg")))
                    return "upload/failed";
                File filepath = new File(path, filename);
                //判断路径是否存在，如果不存在就创建一个
                if (!filepath.getParentFile().exists()) {
                    filepath.getParentFile().mkdirs();
                }
                if(filepath.exists())filepath.delete();
                //将上传文件保存到一个目标文件当中
                file.transferTo(new File(path + File.separator + filename));
                //String f=request.getContextPath()+"/WEB-INF/icos/"+filename;
                appdb.UpdateAppIcourl(app.getId(),request.getContextPath()+"/icos/"+filename);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "upload/failed";
        }
        return "upload/success";
    }

    @RequestMapping(value = "reuploadapp.upload")
    public String jumptoreuploadapp(){
        return "upload/AppUploadForm";
    }

}
