package g1t3.controller;

import g1t3.entity.Vessel;
import g1t3.service.VesselService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class VesselController {

    @Autowired
    private VesselService service;

    @PostMapping("/addVessel")
    public Vessel addVessel(@RequestBody Vessel vessel){
        return service.saveVessel(vessel);
    }

    @PostMapping("/addVessels")
    public List<Vessel> addVessels(@RequestBody List<Vessel> vessel){
        return service.saveVessels(vessel);
    }

    @GetMapping("/vessels")
    public List<Vessel> findAllVessels(){
        return service.getVessels();
    }

//    @RequestMapping(value = "/vesselid/{id}", method = RequestMethod.GET)
//    public Vessel findVesselById(@PathVariable Integer id){
//        return service.getVesselsById(id);
//    }

    @GetMapping("/vesseldate/{date}")
    public Vessel findVesselByDate(@PathVariable String date){
        return service.getVesselsByBthgDt(date);
    }
}
