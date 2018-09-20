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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

    @RequestMapping(value = "appInfoUpgrade.upload")
    public String doAppUpload(MultipartHttpServletRequest request, HttpSession session,
                              HttpServletResponse response)throws Exception {
        String path = request.getContextPath();
        MultipartFile apkFile = request.getFile("apkFile");
        MultipartFile iconFile = request.getFile("iconFile");
        uploadAppInfo(request, session);
        if(!iconFile.isEmpty()){
            uploadAppIcon(request, iconFile, session);
        }
        if(!apkFile.isEmpty()){
            uploadAppApk(request, apkFile, session);
        }
        response.setContentType("text/html;charset=gb2312");
        response.getWriter().print("<script language=\"javascript\">alert('Apk信息上传成功！请等待管理员审核。');" +
                "window.location.href='" + path + "/toMainPage.login'</script>");
        return null;
    }

    private boolean uploadAppIcon(HttpServletRequest request, MultipartFile file, HttpSession session) {
        ApplicationEntity app=(ApplicationEntity)session.getAttribute("app");
        try {
            if(!file.isEmpty()) {
                //上传文件路径
                String path = request.getServletContext().getRealPath("/icos/");
                //上传文件名
                String filename = file.getOriginalFilename();
                String suffix = filename.substring(filename.lastIndexOf(".") + 1);
                filename=String.valueOf(app.getId());
                filename=filename+"."+suffix;

                if(!(suffix.equals("png")||suffix.equals("jpg")))
                    return false;
                File filepath = new File(path, filename);
                //判断路径是否存在，如果不存在就创建一个
                if (!filepath.getParentFile().exists()) {
                    filepath.getParentFile().mkdirs();
                }
                if(filepath.exists())filepath.delete();
                //将上传文件保存到一个目标文件当中
                file.transferTo(new File(path + File.separator + filename));
                appdb.UpdateAppIcourl(app.getId(),request.getContextPath()+"/icos/"+filename);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    private boolean uploadAppInfo(HttpServletRequest request,HttpSession session){
        int id = appdb.getMaxAppid();
        ApplicationEntity app=new ApplicationEntity();
        app.setId(id);
        app.setIntroduction(request.getParameter("introduction"));
        app.setName(request.getParameter("appname"));
        app.setType(request.getParameter("type"));
        app.setCompatibility(request.getParameter("compability"));
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
        return true;
    }

    private boolean uploadAppApk(HttpServletRequest request, MultipartFile file, HttpSession session) {
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
                appdb.UpdateAppurl(app.getId(), request.getContextPath()+"/apps/"+filename, s,version,minSdkVersion);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}
