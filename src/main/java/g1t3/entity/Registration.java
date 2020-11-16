package g1t3.entity;

import lombok.*;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@NoArgsConstructor
@Entity
@Getter
@Setter
@Table(name = "Register_TBL")
public class Registration {
    @Id
    private String emailSuffix;

    public Registration(String emailSuffix) {
        this.emailSuffix = emailSuffix;
    }

    public String getEmailSuffix() {
        return emailSuffix;
    }

    public void setEmailSuffix(String emailSuffix) {
        this.emailSuffix = emailSuffix;
    }
}
