package g1t3.entity.composite;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import org.hibernate.validator.constraints.Length;

//import javax.persistence.Embeddable;
//import javax.persistence.EmbeddedId;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Objects;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SubscriptionPrimary implements Serializable {
    @NotNull
    @Email
    private String email;

    @NotNull
    private String abbrVslM;

    @NotNull
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof SubscriptionPrimary)) return false;
        SubscriptionPrimary that = (SubscriptionPrimary) o;
        return email.equals(that.email) &&
                abbrVslM.equals(that.abbrVslM) &&
                inVoyN.equals(that.inVoyN);
    }

    @Override
    public int hashCode() {
        return Objects.hash(email, abbrVslM, inVoyN);
    }
}
