package g1t3.entity;

import lombok.*;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Base64;

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

    public String getEmail(){
        return email;
    }
    public String getPassword(){
        return password;
    }

    public void setPassword(String password){
        this.password = password;
    }

}
