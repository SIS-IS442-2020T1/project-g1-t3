package g1t3.entity;

import lombok.*;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Base64;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Getter
@Setter
@Table(name = "Account_TBL")

public class Account {
    @Id
    private String email;
    private String password;
    private String dateOfBirth;

    public String getEmail(){
        return email;
    }
    public String getPassword(){
        return password;
    }
    public String getDateOfBirth() { return dateOfBirth;}

    public void setPassword(String password){
        this.password = password;
    }

}
