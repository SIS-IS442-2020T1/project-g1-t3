package g1t3.entity;

import g1t3.entity.composite.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@IdClass(SubscriptionPrimary.class)
@Table(name = "SUBSCRIPTION_TBL")
public class Subscription {
    @NotNull
    @Email
    @Id
    private String email;

    @NotNull
    @Id
    private String abbrVslM;

    @NotNull
    @Id
    private String inVoyN;

}
