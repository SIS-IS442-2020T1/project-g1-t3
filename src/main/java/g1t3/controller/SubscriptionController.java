package g1t3.controller;

import g1t3.entity.*;
import g1t3.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class SubscriptionController{

    @Autowired
    private SubscriptionService service;

    @PostMapping("/addSubscription")
    public Subscription addSubscription(@RequestBody Subscription s) {
        return service.saveSubscription(s);
    }

    @PostMapping("/addSubscriptions")
    public List<Subscription> addSubscriptions(@RequestBody List<Subscription> Subscriptions) {
        return service.saveSubscriptions(Subscriptions);
    }

    @GetMapping("/allSubscriptions")
    public List<Subscription> findAllSubscriptions() {
        return service.getSubscriptions();
    }

    @GetMapping("/SubscriptionByUser/{email}")
    public List<Subscription> findSubscriptionByUserEmail(@PathVariable String email) {
        return service.findByUser(email);
    }

    @GetMapping("/SubscriptionByVessel/{vesselId}")
    public List<Subscription> findSubscriptionByVesselId(@PathVariable String vesselId) {
        return service.findByVessel(vesselId);
    }

//
////    @PutMapping("/update")
////    public Subscription updateSubscription(@RequestBody Subscription Subscription) {
////        return service.updateSubscription(Subscription);
////    }
//
    @DeleteMapping("/delete/{subId}")
    public void deleteSubscription(@PathVariable String subId){
        service.deleteSubscription(subId);
    }
}

