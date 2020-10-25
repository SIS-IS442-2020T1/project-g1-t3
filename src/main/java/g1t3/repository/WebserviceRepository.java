package g1t3.repository;

import g1t3.entity.WebserviceInstructions;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

//import java.util.List;

@Repository
public interface WebserviceRepository extends JpaRepository <WebserviceInstructions, Integer>{
    String deleteById(int id);
}

