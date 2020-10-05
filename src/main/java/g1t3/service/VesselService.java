package g1t3.service;

import g1t3.entity.Vessel;
import g1t3.repository.VesselRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

//    public Vessel getVesselsById(int id){
//        return repository.findById(id).orElse(null);
//    }

    public Vessel getVesselsByBthgDt(String date){
        return repository.findBybthgDt(date);
    }

}
