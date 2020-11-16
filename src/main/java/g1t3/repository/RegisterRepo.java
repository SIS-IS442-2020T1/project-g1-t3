package g1t3.repository;

import g1t3.entity.Favorite;
import g1t3.entity.Registration;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RegisterRepo extends JpaRepository<Registration, String> {
    void deleteById(String emailSuffix);
}
