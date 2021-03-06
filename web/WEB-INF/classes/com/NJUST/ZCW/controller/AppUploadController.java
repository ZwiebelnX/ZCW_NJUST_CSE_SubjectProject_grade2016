package com.NJUST.ZCW.controller;

import com.NJUST.ZCW.Dao.ApplicationDB;
import com.NJUST.ZCW.Entities.AccountEntity;
import com.NJUST.ZCW.Entities.ApplicationEntity;
import net.dongliu.apk.parser.ApkFile;
import net.dongliu.apk.parser.bean.ApkMeta;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
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
        ApplicationEntity app=(ApplicationEntity)session.getAttribute("app");
        int id=app.getId();
        app.setType(request.getParameter("type"));
        app.setIntroduction(request.getParameter("introduction"));
        app.setName(request.getParameter("appname"));
        app.setCompatibility(request.getParameter("compability"));
        app.setChecked("F");
        app.setLanguage(request.getParameter("language"));
        app.setChecked("F");
        appdb.Updateapp(app);
        boolean flag=true;
        //uploadAppInfo(request, session); //上传app基本信息
        if(!apkFile.isEmpty()){
            flag = uploadAppApk(request, apkFile, session); //上传app图标
        }
        if(flag){
            response.setContentType("text/html;charset=gb2312");
            response.getWriter().print("<script language=\"javascript\">alert('Apk信息更新成功！请等待管理员审核。');" +
                    "window.location.href='" + path + "/toMainPage.login'</script>");
        }
        else{
            response.setContentType("text/html;charset=gb2312");
            response.getWriter().print("<script language=\"javascript\">alert('Apk信息上传失败！请检查网络连接或稍后再试');" +
                    "window.location.href='" + path + "/toMainPage.login'</script>");
        }
        return null;
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
                System.out.println(filepath+"????");
                //将上传文件保存到一个目标文件当中
                file.transferTo(new File(path + File.separator + filename));
                ApplicationEntity app=(ApplicationEntity)session.getAttribute("app");
                ApkFile apkFile=new ApkFile(filepath.getAbsolutePath());
                ApkMeta apkMeta=apkFile.getApkMeta();

                String iconame=apkMeta.getName()+".png";
                path=request.getServletContext().getRealPath("/icos/");
                File icofile=new File(path+File.separator+iconame);
                if (!icofile.getParentFile().exists()) {
                    icofile.getParentFile().mkdirs();
                }
                if(icofile.exists())filepath.delete();
                System.out.println(icofile.toString());
                FileOutputStream fileWriter = new FileOutputStream(icofile);
                if(apkFile.getIconFile().getData() == null){
                    appdb.UpdateAppIcourl(app.getId(),request.getContextPath() + "/imgs/appDafultLogo.jpg");
                    return false;
                }
                fileWriter.write(apkFile.getIconFile().getData());
                fileWriter.close();
                List<String> list=apkMeta.getUsesPermissions();
                String s="";
                String version=apkMeta.getVersionName();
                for(String i:list)
                    s=s+i+'\n';
                String minSdkVersion=apkMeta.getMinSdkVersion();
                appdb.UpdateAppurl(app.getId(), request.getContextPath()+"/apps/"+filename, s,version,minSdkVersion);
                appdb.UpdateAppIcourl(app.getId(),request.getContextPath() + "/icos/" + iconame);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @RequestMapping(value = "appInfoInsert.upload")
    public String doAppUpload_Insert(MultipartHttpServletRequest request, HttpSession session,
                              HttpServletResponse response)throws Exception {
        String path = request.getContextPath();
        MultipartFile apkFile = request.getFile("apkFile");
        ApplicationEntity app=(ApplicationEntity)session.getAttribute("app");
        boolean flag=uploadAppInfo(request, session); //上传app基本信息
        if(!apkFile.isEmpty()||flag==false){
            flag = uploadAppApk(request, apkFile, session); //上传app图标
        }
        if(flag){
            response.setContentType("text/html;charset=gb2312");
            response.getWriter().print("<script language=\"javascript\">alert('Apk信息更新成功！请等待管理员审核。');" +
                    "window.location.href='" + path + "/toMainPage.login'</script>");
        }
        else{
            response.setContentType("text/html;charset=gb2312");
            response.getWriter().print("<script language=\"javascript\">alert('Apk信息上传失败！请检查网络连接或稍后再试');" +
                    "window.location.href='" + path + "/toMainPage.login'</script>");
        }
        return null;
    }
}
