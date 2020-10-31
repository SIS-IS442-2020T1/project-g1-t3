package g1t3.webserviceBackend;

import g1t3.entity.*;
import g1t3.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.*;

@Component
public class EmailSubscribers {
    @Autowired
    private VesselService serviceVessel;

    @Autowired
    private SubscriptionService serviceSubscript;

    public Vessel getExistingVessel(Vessel newVessel){
        return serviceVessel.findByAbbrVslMAndInVoyN(newVessel.getAbbrVslM(),newVessel.getInVoyN());
    }

    public boolean hasBerthOrDepartTimeChanged(String oldBthgDt,String newBthgDt,String oldUnbthgDt,String newUnbthgDt){
        return !oldBthgDt.equals(newBthgDt) || !oldUnbthgDt.equals(newUnbthgDt);
    }

    public List<Subscription> getSubscriptionListForVessel(Vessel newVessel) {
        return serviceSubscript.findByVessel(newVessel.getAbbrVslM(),newVessel.getInVoyN());
    }

    public void emailAllSubscribers(List<Subscription> subList,String oldBthgDt,String newBthgDt,String oldUnbthgDt,String newUnbthgDt){
        for(Subscription subscription : subList){
            subscription.sendEmail(oldBthgDt,newBthgDt,oldUnbthgDt,newUnbthgDt);
        }
    }

    public void toEmailIfBerthOrDepartTimeChange(Vessel newVessel){
        Vessel existingVessel = getExistingVessel(newVessel);

        if(existingVessel != null){
            //System.out.println("not null"); //for debugging
            String oldBthgDt = existingVessel.getBthgDt();
            String oldUnbthgDt = existingVessel.getUnbthgDt();
            String newBthgDt = newVessel.getBthgDt();
            String newUnbthgDt = newVessel.getUnbthgDt();

            if(hasBerthOrDepartTimeChanged(oldBthgDt,newBthgDt,oldUnbthgDt,newUnbthgDt)){
                //System.out.println("BerthOrDepartTimeChanged"); //for debugging
                List<Subscription> subscriptionList = getSubscriptionListForVessel(newVessel);
                //System.out.println(subscriptionList); //for debugging
                emailAllSubscribers(subscriptionList, oldBthgDt,newBthgDt,oldUnbthgDt,newUnbthgDt);
            }
        }

    }
}
