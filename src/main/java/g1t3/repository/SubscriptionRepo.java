package g1t3.repository;
import g1t3.entity.Subscription;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.*;
import org.springframework.stereotype.Repository;

@Repository
public interface SubscriptionRepo extends JpaRepository<Subscription, String>{

    List<Subscription> findByEmail(String email);
    List<Subscription> findByVesselId(String vesselId);
}




