package g1t3.controller;

import g1t3.entity.*;
import g1t3.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class EmailServerController {

    @Autowired
    private EmailServerService service;

    @PostMapping("/addEmailServerService")
    public EmailServer saveEmailServer(@RequestBody EmailServer emailServer){
        return service.saveEmailServer(emailServer);
    }

    @PostMapping("/updateEmailServerservice/")
    public String replaceEmailServer(@RequestBody EmailServer emailServer){
        return service.replaceEmailServer(emailServer);
    }

    @GetMapping("/getByEmailServerId/{id}")
    public EmailServer getEmailServerById(@PathVariable int id){return service.getEmailServerById(id);}
}