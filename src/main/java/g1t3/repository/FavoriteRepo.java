package g1t3.repository;
import g1t3.entity.*;
import g1t3.entity.composite.*;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.*;
import org.springframework.stereotype.Repository;

@Repository
public interface FavoriteRepo extends JpaRepository<Favorite,FavoritePrimary>{
    List<Favorite> findByEmail(String email);
    List<Favorite> findByAbbrVslMAndInVoyN(String abbrVslM, String inVoyN);

}
