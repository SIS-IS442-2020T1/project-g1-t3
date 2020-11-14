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



    public List<Subscription> getSubscriptionListForVessel (Vessel newVessel){
        return subscriptionService.findByVessel(newVessel.getAbbrVslM(), newVessel.getInVoyN());
    }

    public void emailAllSubscribers (List<Subscription> subList, String oldBthgDt, String newBthgDt, String
    oldUnbthgDt, String newUnbthgDt){
        for (Subscription subscription : subList) {
            subscription.sendEmail(oldBthgDt, newBthgDt, oldUnbthgDt, newUnbthgDt);
        }
    }

    public void toEmailIfBerthOrDepartTimeChange(Vessel newVessel, Vessel existingVessel){
//        Vessel existingVessel = getExistingVessel(newVessel);

//        if (existingVessel != null) {
        System.out.println("retrieved existing vessel");
        String oldBthgDt = existingVessel.getBthgDt();
        String oldUnbthgDt = existingVessel.getUnbthgDt();
        String newBthgDt = newVessel.getBthgDt();
        String newUnbthgDt = newVessel.getUnbthgDt();

        if(hasBerthOrDepartTimeChanged(oldBthgDt,newBthgDt,oldUnbthgDt,newUnbthgDt)){
            emailAllSubscribers(getSubscriptionListForVessel(newVessel),oldBthgDt,newBthgDt,oldUnbthgDt,newUnbthgDt);
        }

//            if(hasBerthTimeChanged(oldBthgDt, newBthgDt)){
//                System.out.println("BerthOrDepartTimeChanged");
//                newVessel.changeCountPlusOne();
//                emailAllSubscribers(getSubscriptionListForVessel(newVessel), oldBthgDt, newBthgDt, oldUnbthgDt, newUnbthgDt);
//            }else if(hasDepartTimeChanged(oldUnbthgDt, newUnbthgDt)) {
//                emailAllSubscribers(getSubscriptionListForVessel(newVessel), oldBthgDt, newBthgDt, oldUnbthgDt, newUnbthgDt);
//            }
//        }
//        else{ // if it is a new vessel, set the first berthing time
//            System.out.println("new vessel to be inserted");
//            newVessel.setFirstBthgDt(newVessel.getBthgDt());
//        }
    }

}
