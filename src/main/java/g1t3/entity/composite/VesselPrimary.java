package g1t3.entity.composite;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;
import org.springframework.beans.factory.annotation.Autowired;

import javax.validation.constraints.NotNull;
import java.io.Serializable;

@Data
@NoArgsConstructor

public class VesselPrimary implements Serializable {

    @Length(max = 20)
    private String abbrVslM;
    @Length(max = 16)
    private String inVoyN;

//    @Autowired
//    public VesselPrimary(){
//
//    }
//    @Autowired
//    public VesselPrimary(String abbrVslM, String inVoyN){
//        this.abbrVslM = abbrVslM;
//        this.inVoyN = inVoyN;
//    }
}
