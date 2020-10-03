package g1t3.repository;


import g1t3.entity.Vessel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VesselRepository extends JpaRepository<Vessel,Integer> {
    Vessel findBybthgDt(String date);
}
