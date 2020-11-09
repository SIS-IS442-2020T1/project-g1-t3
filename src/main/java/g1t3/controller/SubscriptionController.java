package g1t3.controller;

import g1t3.entity.*;
import g1t3.entity.composite.*;
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

    @GetMapping ("/SubscriptionByVessel/{abbrVslM}/{inVoyN}")
    public List<Subscription> findSubscriptionByVesselId(@PathVariable String abbrVslM,@PathVariable String inVoyN) {
        return service.findByVessel(abbrVslM, inVoyN);
    }


    @DeleteMapping("/deleteSubscription")
    public void deleteSubscription(@RequestBody SubscriptionPrimary subIds ){
        service.deleteSubscription(subIds);
    }


}

