package g1t3.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "WEBSERVICEINSTRUCTION_TBL")

public class WebserviceInstructions {
    @Id
    private int id;
    private String apiKey;
    private int dailyUpdate;
    private int currentDayUpdate;

    public Integer getId(){
        return id;
    }
    public String getApiKey(){
        return apiKey;
    }

    public Integer getDailyUpdate(){
        return dailyUpdate;
    }

    public Integer getCurrentDayUpdate(){
        return currentDayUpdate;
    }
}
