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
        // ����debug����
//        props.setProperty("mail.debug", "true");
        // ���ͷ�������Ҫ�����֤
        props.setProperty("mail.smtp.auth", "true");
        // �����ʼ�������������
        props.setProperty("mail.host", "smtp.qq.com");
        // �����ʼ�Э������
        props.setProperty("mail.transport.protocol", "smtp");
        MailSSLSocketFactory sf = new MailSSLSocketFactory();
        sf.setTrustAllHosts(true);
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.ssl.socketFactory", sf);
        Session session = Session.getInstance(props);
        Message msg = new MimeMessage(session);
        msg.setSubject("���߹���ӰԺƱ�����ϵͳע�ἤ����");
        StringBuilder builder = new StringBuilder();
        builder.append("���߹���ӰԺƱ�����ϵͳע�ἤ���룺\n");
        builder.append(activecode);
        msg.setText(builder.toString());
//        msg.setFrom(new InternetAddress("**�����˵������ַ**"));
        msg.setFrom(new InternetAddress("1475194711@qq.com"));
        Transport transport = session.getTransport();
//        transport.connect("smtp.qq.com", "**�����˵������ַ**", "**����������������Ȩ��**");
        transport.connect("smtp.qq.com", "1475194711@qq.com", "gideolpzledngehi");
        transport.sendMessage(msg, new Address[] { new InternetAddress(email) });
        transport.close();
	}
}
