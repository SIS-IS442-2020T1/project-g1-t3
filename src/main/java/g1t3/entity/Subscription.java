package g1t3.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "SUBSCRIPTION_TBL")
public class Subscription {
    @Id
    @NotNull
    private String Id;

    @NotNull
    @Email
    private String email;

    @NotNull
    private String vesselId;


//    public Subscription(SubscriptionId subid){
//        this.subscriptionId = subid;
//    }
}
