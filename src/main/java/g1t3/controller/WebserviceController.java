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
        return service.replaceWebserviceInstructions(webserviceInstructions.hashingApiKey());
    }

    @GetMapping("/getById/{id}")
    public WebserviceInstructions getWebserviceById(@PathVariable int id){return service.getWebserviceById(id);}
}
