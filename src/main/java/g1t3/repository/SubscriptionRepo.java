package g1t3.repository;
import g1t3.entity.Subscription;
import g1t3.entity.composite.*;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.*;
import org.springframework.stereotype.Repository;

import javax.validation.constraints.NotNull;

@Repository
public interface SubscriptionRepo extends JpaRepository<Subscription,SubscriptionPrimary >{

    List<Subscription> findByEmail(String email);
    List<Subscription> findByAbbrVslMAndInVoyN(String abbrVslM, String inVoyN);


}




