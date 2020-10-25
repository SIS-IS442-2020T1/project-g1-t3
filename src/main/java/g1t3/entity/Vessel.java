package g1t3.entity;


import g1t3.entity.composite.VesselPrimary;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;

import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;
import java.io.Serializable;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@IdClass(VesselPrimary.class)
@Table(name = "VESSEL_TBL")
public class Vessel{

    @Id
    private String abbrVslM;
    @Id
    private String inVoyN;
    private int imoN;
    @Column(columnDefinition = "LONGBLOB")
    private String fullVslM;
    @Length(max = 12)
    private String fullInVoyN;
    @Length(max = 12)
    private String fullOutVoyN;
    @Length(max = 16)
    private String outVoyN;
    @Length(max = 6)
    private String shiftSeqN;
    @Length(max = 20)
    private String bthgDt;
    @Length(max = 20)
    private String unbthgDt;
    @Length(max = 6)
    private String berthN;
    @Length(max = 10)
    private String status;
    @Length(max = 6)
    private String abbrTerminalM;

    public String getAbbrVslM(){
        return abbrVslM;
    }

    public String getInVoyN(){
        return inVoyN;
    }

    public int getImoN(){
        return imoN;
    }

    public String getFullVslM(){
        return fullVslM;
    }

    public String getFullInVoyN(){
        return fullInVoyN;
    }

    public String getFullOutVoyN(){
        return fullOutVoyN;
    }

    public String getOutVoyN(){
        return outVoyN;
    }

    public String getShiftSeqN(){
        return shiftSeqN;
    }

    public String getBthgDt(){
        return bthgDt;
    }

    public String getUnbthgDt(){
        return unbthgDt;
    }

    public String getBerthN(){
        return berthN;
    }

    public String getStatus(){
        return status;
    }

    public String getAbbrTerminalM(){
        return abbrTerminalM;
    }
}
//    "imoN": 9400215,
//            "fullVslM": "AGLAIA",
//            "abbrVslM": "AGLAIA",
//            "fullInVoyN": "077S",
//            "inVoyN": "077S",
//            "fullOutVoyN": "077S",
//            "outVoyN": "077S",
//            "shiftSeqN": "1",
//            "bthgDt": "2020-10-02T23:00:00",
//            "unbthgDt": "2020-10-03T14:00:00",
//            "berthN": null,
//            "status": "BERTHING",
//            "abbrTerminalM": "PPT5"