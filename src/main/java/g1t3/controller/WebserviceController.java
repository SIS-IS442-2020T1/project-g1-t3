package g1t3.controller;

import g1t3.entity.WebserviceInstructions;
import g1t3.service.WebserviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class WebserviceController {

    @Autowired
    private WebserviceService service;

    @PostMapping("/updateWebservice/")
    public String replaceWebserviceInstructionsController(@RequestBody WebserviceInstructions webserviceInstructions){
        return service.replaceWebserviceInstructions(webserviceInstructions);
    }

    @GetMapping("/getById/{id}")
    public WebserviceInstructions getWebserviceById(@PathVariable int id){return service.getWebserviceById(id);}
}
