package g1t3.controller;

import g1t3.entity.WebserviceInstructions;
import g1t3.service.WebserviceService;
import g1t3.webserviceBackend.ScheduleTaskDaily;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@CrossOrigin()
@RestController
public class WebserviceController {

    @Autowired
    private ScheduleTaskDaily scheduleTaskDaily;

    @Autowired
    private WebserviceService service;

    @PostMapping("/addWebservice/")
    public WebserviceInstructions saveWebserviceController(@RequestBody WebserviceInstructions webserviceInstructions){
        return service.saveWebservice(webserviceInstructions.hashingApiKey());
    }

    @PostMapping("/updateWebservice/")
    public String replaceWebserviceInstructionsController(@RequestBody WebserviceInstructions webserviceInstructions){
        if(webserviceInstructions.getApiKey() == "" || webserviceInstructions.getDailyUpdate() == "" || webserviceInstructions.getCurrentDayUpdate() == 0){
            WebserviceInstructions webserviceFromDB = getWebserviceById(1);
            if(webserviceInstructions.getApiKey() == ""){
                String api = webserviceFromDB.getApiKey();
                webserviceInstructions.setApiKey(api);
            }
            if(webserviceInstructions.getDailyUpdate() == ""){
                String daily = webserviceFromDB.getDailyUpdate();
                webserviceInstructions.setDailyUpdate(daily);
            }
            if(webserviceInstructions.getCurrentDayUpdate() == 0){
                int currentDay = webserviceFromDB.getCurrentDayUpdate();
                webserviceInstructions.setCurrentDayUpdate(currentDay);
            }
            service.replaceWebserviceInstructions(webserviceInstructions);
            scheduleTaskDaily.initializeScheduler();
            return "Data replaced";
        } else{
            service.replaceWebserviceInstructions(webserviceInstructions.hashingApiKey());
            scheduleTaskDaily.initializeScheduler();
            return "Data replaced";
        }

    }

    @GetMapping("/getById/{id}")
    public WebserviceInstructions getWebserviceById(@PathVariable int id){return service.getWebserviceById(id);}
}
