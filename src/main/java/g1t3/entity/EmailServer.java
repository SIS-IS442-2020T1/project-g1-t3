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
@Table(name = "EMAILSERVER_TBL")
public class EmailServer {
    @Id
    private int id;
    private String server;
    private String senderEmail;

    public Integer getId(){return id; }

    public String getServer(){
        return server;
    }

    public String getSender(){
        return senderEmail;
    }

    public EmailServer(int id, String server, String senderEmail) {
        this.id = id;
        this.server = server;
        this.senderEmail = senderEmail;
    }
}
