package g1t3.webserviceBackend;

import g1t3.entity.*;
import g1t3.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.*;
import java.util.*;
import java.io.*;
import java.util.concurrent.TimeUnit;
import java.text.SimpleDateFormat;


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

//    public EmailServer getEmailServerInfo(int key){
//        EmailServer es;
//        try{
//            es = emailServerService.getEmailServerById(key);
//        }catch(Exception e){
//            es = new EmailServer(1, "smtp.psa","psa@email.com" );
//        }
//
//        return es;
//    }


    public List<Subscription> getSubscriptionListForVessel (Vessel newVessel){
        return subscriptionService.findByVessel(newVessel.getAbbrVslM(), newVessel.getInVoyN());
    }

    public void emailAllSubscribers(String vesselName, List<Subscription> subList, String oldBthgDt, String newBthgDt, String
    oldUnbthgDt, String newUnbthgDt){
        for (Subscription subscription : subList) {
            String sendTo =  subscription.getEmail();
            String subject = vesselName+": Berthing/Departure time change";
            String msg = "The berthing time has updated from "+oldBthgDt+" to "+newBthgDt
                    +"\nThe departure time has updated from "+oldUnbthgDt+" to "+newUnbthgDt;
            try{
                emailServerService.sendMail(sendTo,subject,msg);
            }catch(Exception e){
                System.out.println("Failed to send email");
            }
        }
    }
//    public void emailAllSubscribersWithServer (String server, String senderEmail,List<Subscription> subList, String oldBthgDt, String newBthgDt, String
//            oldUnbthgDt, String newUnbthgDt){
//        for (Subscription subscription : subList) {
//            subscription.sendEmailWithServer(server, senderEmail,oldBthgDt, newBthgDt, oldUnbthgDt, newUnbthgDt);
//        }
//    }

    public void toEmailIfBerthOrDepartTimeChange(Vessel newVessel, Vessel existingVessel){
        System.out.println("retrieved existing vessel");
        String vesselName = newVessel.getAbbrVslM() + " " + newVessel.getInVoyN();
        String oldBthgDt = existingVessel.getBthgDt();
        String oldUnbthgDt = existingVessel.getUnbthgDt();
        String newBthgDt = newVessel.getBthgDt();
        String newUnbthgDt = newVessel.getUnbthgDt();

        if(hasBerthOrDepartTimeChanged(oldBthgDt,newBthgDt,oldUnbthgDt,newUnbthgDt)){
            emailAllSubscribers(vesselName, getSubscriptionListForVessel(newVessel),oldBthgDt,newBthgDt,oldUnbthgDt,newUnbthgDt);
        }

    }

    public void operationsUponBerthTimeChange(Vessel newVessel,Vessel existingVessel, List<Vessel> vesselList ) throws ParseException {
//        Vessel existingVessel = getExistingVessel(newVessel);
        if (existingVessel != null) { //if it is an existing vessel
            String firstBerthTimeString = existingVessel.getFirstBthgDt();
            String oldBerthTimeString = existingVessel.getBthgDt();
            String newBerthTimeString = newVessel.getBthgDt();
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");//2020-11-16T13:00:00

            if (hasTimeChanged(oldBerthTimeString, newBerthTimeString)) {//if berthing time change
                Date firstBerthTime = format.parse(firstBerthTimeString);
                Date newBerthTime = format.parse(newBerthTimeString);
                existingVessel.changeCountPlusOne(); //
                newVessel.setChangeCount(existingVessel.getChangeCount());
                long diff = Math.abs(firstBerthTime.getTime() - newBerthTime.getTime()); //time diff in miliseconds
                long diffInMinutes = TimeUnit.MILLISECONDS.toMinutes(diff); //time diff in minutes
                if (diffInMinutes >= 60) {
                    newVessel.setDisplayColor("red");
                } else if (diffInMinutes < 60 && diffInMinutes > 0) {
                    newVessel.setDisplayColor("yellow");
                } else if (diffInMinutes == 0) { // when new berthing time change back to the first pulled berthing time
                    newVessel.setDisplayColor("white");
                }

            }
            newVessel.setFirstBthgDt(existingVessel.getFirstBthgDt());
            vesselList.add(newVessel);

        } else {//if it is a new vessel
            newVessel.setFirstBthgDt(newVessel.getBthgDt());
            newVessel.setDisplayColor("white");
            newVessel.setChangeCount(0);
            vesselList.add(newVessel);
        }

    }
}
