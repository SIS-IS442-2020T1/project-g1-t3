package g1t3.repository;

import g1t3.entity.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.*;
import org.springframework.stereotype.Repository;

@Repository
public interface AccountRepository extends JpaRepository<Account, String>{
    Account findByEmail(String email);
}
