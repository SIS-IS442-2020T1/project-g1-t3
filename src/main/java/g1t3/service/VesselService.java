package g1t3.service;

import g1t3.entity.Vessel;
import g1t3.repository.VesselRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class VesselService {
    @Autowired
    private VesselRepository repository;

    public Vessel saveVessel(Vessel vessel){
        return repository.save(vessel);
    }

    public List<Vessel> saveVessels(List<Vessel> vessels){
        return repository.saveAll(vessels);
    }

    public List<Vessel> getVessels(){
        return repository.findAll();
    }

    @Transactional
    public String deleteCurrentDay(String date){
        return repository.deleteByBthgDtContaining(date);
//        return "Vessel has been updated!";
    }

    public List<Vessel> getVesselsByBthgDt(String date){
        return repository.findByBthgDtContaining(date);
    }

    public Boolean checkVesselsByBthgDt(String date){
        List<Vessel> vesselList = repository.findByBthgDtContaining(date);
        if(vesselList.isEmpty()){
            return false;
        }
        return true;
    }
}
