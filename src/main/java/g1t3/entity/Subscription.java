package g1t3.entity;

import g1t3.entity.composite.*;
import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.util.*;


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

    public String getEmail() {
        return email;
    }

    public String getAbbrVslM() {
        return abbrVslM;
    }

    public String getInVoyN() {
        return inVoyN;
    }



}
