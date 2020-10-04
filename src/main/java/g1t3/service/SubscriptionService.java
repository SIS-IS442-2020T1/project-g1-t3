package g1t3.service;

import g1t3.entity.*;
import g1t3.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    public List<Subscription> findByVessel(String vesselId){
        return repository.findByVesselId(vesselId);
    }

    public void deleteSubscription(String Id) {
        repository.deleteById(Id);
//        return "product removed !! " + id;
    }
//
//    public Subscription updateSubscription(Subscription subscription) {
//        Subscription existingProduct = repository.findById(Subscription.getId()).orElse(null);
//        existingProduct.setName(product.getName());
//        existingProduct.setQuantity(product.getQuantity());
//        existingProduct.setPrice(product.getPrice());
//        return repository.save(existingProduct);
//    }


}