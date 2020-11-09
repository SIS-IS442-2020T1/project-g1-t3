package g1t3.entity.composite;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Objects;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FavoritePrimary implements Serializable {

    @NotNull
    @Email
    private String email;

    @NotNull
    private String abbrVslM;

    @NotNull
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
        if (!(o instanceof FavoritePrimary)) return false;
        FavoritePrimary that = (FavoritePrimary) o;
        return Objects.equals(getEmail(), that.getEmail()) &&
                Objects.equals(getAbbrVslM(), that.getAbbrVslM()) &&
                Objects.equals(getInVoyN(), that.getInVoyN());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getEmail(), getAbbrVslM(), getInVoyN());
    }
}
