package g1t3.controller;

import g1t3.entity.*;
import g1t3.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.*;

@RestController
public class RegisterController{

    @Autowired
    private RegisterService service;

    @GetMapping("/allEmailSuffix")
    public List<Registration> getAllEmailSuffix(){
        return service.getALl();
    }

    @PostMapping("/addEmailSuffix")
    public Registration saveEmailSuffix(@RequestBody Registration regis){
        return service.saveRegis(regis);
    }

    @DeleteMapping("/deleteEmailSuffix/{emailSuffix}")
    public void deleteEmailSuffix(@PathVariable String emailSuffix){
        service.deleteEmail(emailSuffix);
    }


}