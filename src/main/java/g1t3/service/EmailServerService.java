package g1t3.service;

import g1t3.entity.*;
import g1t3.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class EmailServerService  {
    @Autowired
    private EmailServerRepo repository;

    public EmailServer saveEmailServer(EmailServer emailServer) {return repository.save(emailServer);}

    public EmailServer getEmailServerById(Integer id){return repository.findById(id).orElse(null);}

    public String replaceEmailServer(EmailServer emailServer){
        repository.deleteById(emailServer.getId());
        repository.save(emailServer);
        return "Email Server Data replaced.";
    }
}