package g1t3.repository;

import g1t3.entity.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EmailServerRepo extends JpaRepository<EmailServer, Integer>{
    String deleteById(int id);
}