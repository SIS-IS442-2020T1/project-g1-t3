package g1t3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;

@CrossOrigin()
@Controller
public class IndexController {

//    @GetMapping("/")
//    public String index() {
//        return "index";
//    }
//    @GetMapping("/favourite")
//    public String index() {
//        return "favourite";
//    }

    @GetMapping("/")
    public String index() {
        return "favourite";
    }



}
