package g1t3.entity;

import g1t3.entity.composite.*;
import lombok.*;

//import javax.mail.Message;
//import javax.mail.MessagingException;
//import javax.mail.Session;
//import javax.mail.Transport;
//import javax.mail.internet.InternetAddress;
//import javax.mail.internet.MimeMessage;
import javax.persistence.*;
import javax.validation.constraints.*;
import java.util.*;



@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@IdClass(SubscriptionPrimary.class)
@Table(name = "SUBSCRIPTION_TBL")
public class Subscription {
    @NotNull
    @Email
    @Id
    private String email;

    @NotNull
    @Id
    private String abbrVslM;

    @NotNull
    @Id
    private String inVoyN;

    public String getEmail() {
        return email;
    }

    public String getAbbrVslM() {
        return abbrVslM;
    }

    public String getInVoyN() {
        return inVoyN;
    }

    public void sendEmail(String oldBthgDt,String newBthgDt,String oldUnbthgDt,String newUnbthgDt) {

//
//        Properties props = new Properties();
//        props.put("mail.smtp.host", "smtp.psa.edu.sg");
//
//        Session session = Session.getInstance(props);
//
//        try {
//
//            Message message = new MimeMessage(session);
//            message.setFrom(new InternetAddress("psa@gmail.com"));
//
//            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
//            String vesselID = abbrVslM + " " + inVoyN;
//            message.setSubject("Alert: Change in Berthing/Departure Time for " + vesselID);
//
//            String text = "Updated berthing time: " + newBthgDt + "/n" + "Updated departure time: " + newUnbthgDt;
//            message.setText(text);
//
//            Transport.send(message);
//
//
//        } catch (MessagingException e) {
//            e.printStackTrace();
//        }

        // for debugging
        String vesselID = abbrVslM + " " + inVoyN;
        System.out.println("Subject: Alert: Change in Berthing/Departure Time for " + vesselID);
        System.out.println("Sending to " + email);
        System.out.println("content:");
        System.out.println("Updated berthing time: " + newBthgDt);
        System.out.println("Updated departure time: " + newUnbthgDt);


    }

    public void sendEmailWithServer(String server, String sender,String oldBthgDt,String newBthgDt,String oldUnbthgDt,String newUnbthgDt) {

//
//        Properties props = new Properties();
//        props.put("mail.smtp.host", server);
//
//        Session session = Session.getInstance(props);
//
//        try {
//
//            Message message = new MimeMessage(session);
//            message.setFrom(new InternetAddress(sender));
//
//            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
//            String vesselID = abbrVslM + " " + inVoyN;
//            message.setSubject("Alert: Change in Berthing/Departure Time for " + vesselID);
//
//            String text = "Updated berthing time: " + newBthgDt + "/n" + "Updated departure time: " + newUnbthgDt;
//            message.setText(text);
//
//            Transport.send(message);
//
//
//        } catch (MessagingException e) {
//            e.printStackTrace();
//        }

        // for debugging
        String vesselID = abbrVslM + " " + inVoyN;
        System.out.println("Subject: Alert: Change in Berthing/Departure Time for " + vesselID);
        System.out.println("Sending to " + email);
        System.out.println("content:");
        System.out.println("Updated berthing time: " + newBthgDt);
        System.out.println("Updated departure time: " + newUnbthgDt);


    }
}
