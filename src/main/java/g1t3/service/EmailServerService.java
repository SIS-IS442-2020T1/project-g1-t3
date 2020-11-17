package g1t3.service;

import g1t3.entity.*;
import g1t3.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailServerService  {
    private JavaMailSender javaMailSender;

    @Autowired
    private EmailServerRepo repository;

    public EmailServerService (JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    }

    public EmailServer saveEmailServer(EmailServer emailServer) {return repository.save(emailServer);}

    public EmailServer getEmailServerById(Integer id){return repository.findById(id).orElse(null);}

    public String replaceEmailServer(EmailServer emailServer){
        repository.deleteById(emailServer.getId());
        repository.save(emailServer);
        return "Email Server Data replaced.";
    }

    public void sendMail(String toEmail, String subject, String message) {

        var mailMessage = new SimpleMailMessage();

        mailMessage.setTo(toEmail);
        mailMessage.setSubject(subject);
        mailMessage.setText(message);

        mailMessage.setFrom(getEmailServerById(1).getSender());

        javaMailSender.send(mailMessage);
    }
}


