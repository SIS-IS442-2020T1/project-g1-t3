package g1t3.entity;

import g1t3.entity.composite.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import java.util.Objects;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@IdClass(FavoritePrimary.class)
@Table(name = "FAVORITE_TBL")
public class Favorite {
    @NotNull
    @Email
    @Id
    private String email;

    @NotNull
    @Id
    private String abbrVslM;

    @NotNull
    @Id
    private String inVoyN;

    public String getEmail() {
        return email;
    }

    public String getAbbrVslM() {
        return abbrVslM;
    }

    public String getInVoyN() {
        return inVoyN;
    }


    @Override
    public boolean equals(Object o) {
        if (!(o instanceof Favorite)) return false;
        Favorite favorite = (Favorite) o;
        return Objects.equals(getEmail(), favorite.getEmail()) &&
                Objects.equals(getAbbrVslM(), favorite.getAbbrVslM()) &&
                Objects.equals(getInVoyN(), favorite.getInVoyN());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getEmail(), getAbbrVslM(), getInVoyN());
    }
}