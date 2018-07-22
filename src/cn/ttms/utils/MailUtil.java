package cn.ttms.utils;

import java.security.GeneralSecurityException;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.mail.util.MailSSLSocketFactory;

public class MailUtil {
	public static void sendEmail(String email,String activecode)throws MessagingException, GeneralSecurityException {
        Properties props = new Properties();
        // 开启debug调试
//        props.setProperty("mail.debug", "true");
        // 发送服务器需要身份验证
        props.setProperty("mail.smtp.auth", "true");
        // 设置邮件服务器主机名
        props.setProperty("mail.host", "smtp.qq.com");
        // 发送邮件协议名称
        props.setProperty("mail.transport.protocol", "smtp");
        MailSSLSocketFactory sf = new MailSSLSocketFactory();
        sf.setTrustAllHosts(true);
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.ssl.socketFactory", sf);
        Session session = Session.getInstance(props);
        Message msg = new MimeMessage(session);
        msg.setSubject("光线国际影院票务管理系统注册激活码");
        StringBuilder builder = new StringBuilder();
        builder.append("光线国际影院票务管理系统注册激活码：\n");
        builder.append(activecode);
        msg.setText(builder.toString());
//        msg.setFrom(new InternetAddress("**发送人的邮箱地址**"));
        msg.setFrom(new InternetAddress("1475194711@qq.com"));
        Transport transport = session.getTransport();
//        transport.connect("smtp.qq.com", "**发送人的邮箱地址**", "**你的邮箱密码或者授权码**");
        transport.connect("smtp.qq.com", "1475194711@qq.com", "gideolpzledngehi");
        transport.sendMessage(msg, new Address[] { new InternetAddress(email) });
        transport.close();
	}
}
