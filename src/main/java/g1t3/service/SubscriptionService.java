package g1t3.service;

import g1t3.entity.*;
import g1t3.entity.composite.*;
import g1t3.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

@Service
public class SubscriptionService{
    @Autowired
    private SubscriptionRepo repository;

    public Subscription saveSubscription(Subscription subscription) {
        return repository.save(subscription);
    }

    public List<Subscription> saveSubscriptions(List<Subscription> subscriptions) {
        return repository.saveAll(subscriptions);
    }

    public List<Subscription> getSubscriptions() {
        return repository.findAll();
    }


    public List<Subscription> findByUser(String email){
        return repository.findByEmail(email);
    }

//    public List<Subscription> findByVessel(String vesselId){
//        return repository.findByVesselId(vesselId);
//    }
    public List<Subscription> findByVessel(String abbrVslM, String inVoyN){
        return repository.findByAbbrVslMAndInVoyN(abbrVslM, inVoyN);
    }

//    public void deleteSubscription(String Id) {
//        repository.deleteById(Id);
////        return "product removed !! " + id;
//    }
    public void deleteSubscription(SubscriptionPrimary subIds) {
        repository.deleteById(subIds);
    }




}