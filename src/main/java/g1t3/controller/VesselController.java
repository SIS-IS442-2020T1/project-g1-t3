package g1t3.controller;

import g1t3.entity.Vessel;
import g1t3.service.VesselService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin()
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

    @GetMapping("/vesseldate/{date}")
    public List<Vessel> findVesselByDate(@PathVariable String date){
        return service.getVesselsByBthgDt(date);
    }

    @GetMapping("/checkvesseldate/{date}")
    public Boolean checkVesselByDate(@PathVariable String date){
        return service.checkVesselsByBthgDt(date);
    }

    @DeleteMapping("/vesseldelete/{date}")
    public String deleteVesselForCurrentDate(@PathVariable String date){
        return service.deleteCurrentDay(date);
    }
}
