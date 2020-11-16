package g1t3.webserviceBackend;

import g1t3.entity.*;
import g1t3.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.*;

@Component
public class DetectTimeChangeAndEmail {
    @Autowired
    private VesselService vesselService;

    @Autowired
    private  EmailServerService emailServerService;

    @Autowired
    private SubscriptionService subscriptionService;

    public Vessel getExistingVessel(Vessel newVessel) {
        return vesselService.findByAbbrVslMAndInVoyN(newVessel.getAbbrVslM(), newVessel.getInVoyN());
    }

    public boolean hasTimeChanged(String oldTime, String newTime) {
        return !oldTime.equals(newTime);
    }

    public boolean hasBerthOrDepartTimeChanged(String oldBthgDt, String newBthgDt, String oldUnbthgDt, String newUnbthgDt) {
        return hasTimeChanged(oldBthgDt,newBthgDt) || hasTimeChanged(oldUnbthgDt, newUnbthgDt);
    }

    public EmailServer getEmailServerInfo(int key){
        EmailServer es;
        try{
            es = emailServerService.getEmailServerById(key);
        }catch(Exception e){
            es = new EmailServer(1, "smtp.psa","psa@email.com" );
        }

        return es;
    }

    public List<Subscription> getSubscriptionListForVessel (Vessel newVessel){
        return subscriptionService.findByVessel(newVessel.getAbbrVslM(), newVessel.getInVoyN());
    }

    public void emailAllSubscribers (List<Subscription> subList, String oldBthgDt, String newBthgDt, String
    oldUnbthgDt, String newUnbthgDt){
        for (Subscription subscription : subList) {
            subscription.sendEmail(oldBthgDt, newBthgDt, oldUnbthgDt, newUnbthgDt);
        }
    }
    public void emailAllSubscribersWithServer (String server, String senderEmail,List<Subscription> subList, String oldBthgDt, String newBthgDt, String
            oldUnbthgDt, String newUnbthgDt){
        for (Subscription subscription : subList) {
            subscription.sendEmailWithServer(server, senderEmail,oldBthgDt, newBthgDt, oldUnbthgDt, newUnbthgDt);
        }
    }

    public void toEmailIfBerthOrDepartTimeChange(Vessel newVessel, Vessel existingVessel){
        System.out.println("retrieved existing vessel");
        String oldBthgDt = existingVessel.getBthgDt();
        String oldUnbthgDt = existingVessel.getUnbthgDt();
        String newBthgDt = newVessel.getBthgDt();
        String newUnbthgDt = newVessel.getUnbthgDt();

        if(hasBerthOrDepartTimeChanged(oldBthgDt,newBthgDt,oldUnbthgDt,newUnbthgDt)){
            emailAllSubscribers(getSubscriptionListForVessel(newVessel),oldBthgDt,newBthgDt,oldUnbthgDt,newUnbthgDt);
        }

    }
    public void toEmailWithServerIfBerthOrDepartTimeChange(EmailServer ES, Vessel newVessel, Vessel existingVessel) {

        System.out.println("retrieved existing vessel");
        String oldBthgDt = existingVessel.getBthgDt();
        String oldUnbthgDt = existingVessel.getUnbthgDt();
        String newBthgDt = newVessel.getBthgDt();
        String newUnbthgDt = newVessel.getUnbthgDt();

        String senderEmail = ES.getSender();
        String server = ES.getServer();
        if (hasBerthOrDepartTimeChanged(oldBthgDt, newBthgDt, oldUnbthgDt, newUnbthgDt)) {
            emailAllSubscribersWithServer(server, senderEmail,getSubscriptionListForVessel(newVessel), oldBthgDt, newBthgDt, oldUnbthgDt, newUnbthgDt);
        }
    }

}
