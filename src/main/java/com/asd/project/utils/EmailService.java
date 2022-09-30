package com.asd.project.utils;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class EmailService {

    final String username = "asd.project.tester.email@gmail.com";
    final String password = "dbwhnmwkokloiego";

    public boolean sendEmail(int orderId, String info) {

        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "465");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.socketFactory.port", "465");
        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

        Session session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse("Lun.Ou@student.uts.edu.au")
            );
            message.setSubject("Order No: " + orderId);
            message.setText(info);

            Transport.send(message);

            System.out.println("Done");
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }
}

