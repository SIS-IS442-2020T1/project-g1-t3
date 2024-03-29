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
@Table(name = "WEBSERVICEINSTRUCTION_TBL")

public class WebserviceInstructions {
    @Id
    private int id = 1;
    private String apiKey;
    private String dailyUpdate = "* * * ? * *";
    private int currentDayUpdate;

    public Integer getId(){return id; }

    public String getApiKey(){
        return apiKey;
    }

    public String getDailyUpdate(){
        return dailyUpdate;
    }

    public Integer getCurrentDayUpdate(){
        return currentDayUpdate;
    }

    public void setApiKey(String apiKey){this.apiKey = apiKey;}

    public void setDailyUpdate(String dailyUpdate){this.dailyUpdate = dailyUpdate;}

    public void setCurrentDayUpdate(int currentDayUpdate){this.currentDayUpdate = currentDayUpdate;}

    public WebserviceInstructions hashingApiKey(){
        String apiKeyExtract = this.getApiKey();
        String encodedString = Base64.getEncoder().encodeToString(apiKeyExtract.getBytes());
        WebserviceInstructions webserviceInstructions = new WebserviceInstructions(this.id, encodedString, this.dailyUpdate, this.currentDayUpdate);//Do not remove or change this line, there is no error. It is a bug in lombok
        return webserviceInstructions;
    }
}
