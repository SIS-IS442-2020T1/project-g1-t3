package g1t3.webserviceBackend;

import g1t3.entity.*;
import g1t3.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.*;

@Component
public class DetectTimeChangeAndEmail {
    @Autowired
    private VesselService serviceVessel;

    @Autowired
    private SubscriptionService serviceSubscript;

    public Vessel getExistingVessel(Vessel newVessel) {
        return serviceVessel.findByAbbrVslMAndInVoyN(newVessel.getAbbrVslM(), newVessel.getInVoyN());
    }

    public boolean hasDepartTimeChanged(String oldUnbthgDt, String newUnbthgDt) {
        return !oldUnbthgDt.equals(newUnbthgDt);
    }

    public boolean hasBerthTimeChanged(String oldBthgDt, String newBthgDt) {
        return !oldBthgDt.equals(newBthgDt);
    }

    public List<Subscription> getSubscriptionListForVessel (Vessel newVessel){
        return serviceSubscript.findByVessel(newVessel.getAbbrVslM(), newVessel.getInVoyN());
    }

    public void emailAllSubscribers (List<Subscription> subList, String oldBthgDt, String newBthgDt, String
    oldUnbthgDt, String newUnbthgDt){
        for (Subscription subscription : subList) {
            subscription.sendEmail(oldBthgDt, newBthgDt, oldUnbthgDt, newUnbthgDt);
        }
    }

    public void toEmailIfBerthOrDepartTimeChange(Vessel newVessel){
        Vessel existingVessel = getExistingVessel(newVessel);

        if (existingVessel != null) {
            //System.out.println("not null");
            String oldBthgDt = existingVessel.getBthgDt();
            String oldUnbthgDt = existingVessel.getUnbthgDt();
            String newBthgDt = newVessel.getBthgDt();
            String newUnbthgDt = newVessel.getUnbthgDt();

            if(hasBerthTimeChanged(oldBthgDt, newBthgDt)){
                System.out.println("BerthOrDepartTimeChanged");
                newVessel.changeCountPlusOne();
                emailAllSubscribers(getSubscriptionListForVessel(newVessel), oldBthgDt, newBthgDt, oldUnbthgDt, newUnbthgDt);
            }else if(hasDepartTimeChanged(oldUnbthgDt, newUnbthgDt)) {
                emailAllSubscribers(getSubscriptionListForVessel(newVessel), oldBthgDt, newBthgDt, oldUnbthgDt, newUnbthgDt);
            }
        }

    }



}
