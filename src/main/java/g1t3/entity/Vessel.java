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
    @Length(max = 20)
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