//package g1t3.controller;
//import javax.mail.Message;
//import javax.mail.MessagingException;
//import javax.mail.Session;
//import javax.mail.Transport;
//import javax.mail.internet.InternetAddress;
//import javax.mail.internet.MimeMessage;
//import java.util.Properties;
//
//
//public class Emailer {
//
//    public static void sendEmail(String recipient) {
//
//
//        Properties props = new Properties();
//        props.put("mail.smtp.host", "smtp.smu.edu.sg");
//
//        Session session = Session.getInstance(props);
//
//        try {
//
//            Message message = new MimeMessage(session);
//            message.setFrom(new InternetAddress("is442@gmail.com"));
//
//
//            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
//            message.setSubject("Time Change");
//
//            message.setText("");
//
//            Transport.send(message);
//
//
//        } catch (MessagingException e) {
//            e.printStackTrace();
//        }
//    }
//}