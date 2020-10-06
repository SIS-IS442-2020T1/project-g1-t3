package g1t3.repository;


import g1t3.entity.Vessel;
import g1t3.entity.composite.VesselPrimary;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VesselRepository extends JpaRepository<Vessel, VesselPrimary> {
    List<Vessel> findByBthgDtContaining(String date);
    String deleteByBthgDtContaining(String date);
}
