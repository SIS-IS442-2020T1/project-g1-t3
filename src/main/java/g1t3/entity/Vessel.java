package g1t3.entity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity

@Table(name = "VESSEL_TBL")
public class Vessel {
    @Id
    @GeneratedValue
    private int id;
    private int imoN;
    private String fullVslM;
    private String abbrVslM;
    private String fullInVoyN;
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
}