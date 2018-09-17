package com.NJUST.ZCW.service.login;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;


public class MailSystem {
    public  void sendMail(String receiver,String information) throws Exception {
        Properties prop = new Properties();
        prop.setProperty("mail.host", "smtp.qq.com");
        prop.setProperty("mail.transport.protocol", "smtp");
        prop.setProperty("mail.smtp.auth", "true");
        //1、创建session
        Session session = Session.getInstance(prop);
        session.setDebug(true);
        //2、通过session得到transport对象
        Transport ts = session.getTransport();
        //3、使用邮箱的用户名和密码连上邮件服务器，发送邮件时，发件人需要提交邮箱的用户名和密码给smtp服务器，用户名和密码都通过验证之后才能够正常发送邮件给收件人。
        ts.connect("smtp.qq.com", "1044774028@qq.com", "bgwtlddjnxgnbdbb");
        //4、创建邮件
        Message message = createSimpleMail(session,receiver,information);
        //5、发送邮件
        ts.sendMessage(message, message.getAllRecipients());
        ts.close();
    }
    public  MimeMessage createSimpleMail(Session session,String receiver,String information)
            throws Exception {
        //创建邮件对象
        MimeMessage message = new MimeMessage(session);
        //指明邮件的发件人
        message.setFrom(new InternetAddress("1044774028@qq.com"));
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
        //邮件的标题
        message.setSubject("安卓应用系统-找回密码");
        //邮件的文本内容
        message.setContent(information, "text/html;charset=UTF-8");
        //返回创建好的邮件对象
        return message;
    }
}
