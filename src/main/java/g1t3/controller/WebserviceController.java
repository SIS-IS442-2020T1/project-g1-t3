package g1t3.controller;

import g1t3.entity.WebserviceInstructions;
import g1t3.service.WebserviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@CrossOrigin()
@RestController
public class WebserviceController {

    @Autowired
    private WebserviceService service;

    @PostMapping("/addWebservice/")
    public WebserviceInstructions saveWebserviceController(@RequestBody WebserviceInstructions webserviceInstructions){
        return service.saveWebservice(webserviceInstructions.hashingApiKey());
    }

    @PostMapping("/updateWebservice/")
    public String replaceWebserviceInstructionsController(@RequestBody WebserviceInstructions webserviceInstructions){
        if(webserviceInstructions.getApiKey() == "" || webserviceInstructions.getDailyUpdate() == 0 || webserviceInstructions.getCurrentDayUpdate() == 0){
            WebserviceInstructions webserviceFromDB = getWebserviceById(1);
            if(webserviceInstructions.getApiKey() == ""){
                String api = webserviceFromDB.getApiKey();
                webserviceInstructions.setApiKey(api);
            }
            if(webserviceInstructions.getDailyUpdate() == 0){
                int daily = webserviceFromDB.getDailyUpdate();
                webserviceInstructions.setDailyUpdate(daily);
            }
            if(webserviceInstructions.getCurrentDayUpdate() == 0){
                int currentDay = webserviceFromDB.getCurrentDayUpdate();
                webserviceInstructions.setCurrentDayUpdate(currentDay);
            }
            return service.replaceWebserviceInstructions(webserviceInstructions);
        } else{
            return service.replaceWebserviceInstructions(webserviceInstructions.hashingApiKey());
        }

    }

    @GetMapping("/getById/{id}")
    public WebserviceInstructions getWebserviceById(@PathVariable int id){return service.getWebserviceById(id);}
}
