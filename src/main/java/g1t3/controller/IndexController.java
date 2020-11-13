package g1t3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;

@CrossOrigin()
@Controller
public class IndexController {

    @GetMapping("/webservice")
    public String webservice() {
        return "webservice";
    }

    @GetMapping("/login")
    public String login() {
        return "index";
    }

    @GetMapping("/favourite")
    public String favourite() {
        return "favourite";
    }



}
