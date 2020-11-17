package g1t3.controller;

import java.util.*;
import g1t3.entity.*;
import g1t3.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;

//@CrossOrigin()
@Controller
public class IndexController {
    @Autowired
    private FavoriteService favoriteService;

    @Autowired
    private VesselService vesselService;

    @GetMapping("/myfavorite")
    public String myfavorite() {
        return "favorite";
    }

    @GetMapping("/myfavorite2")
    public String myfavorite2() {
        return "favorite2";
    }

    @GetMapping("/vesselschedules")
    public String vesselschedules(Model model) {
//        model.addAttribute("email", "df@gmail.com");
//        model.addAttribute("vessels", vesselService.getVessels());
        return "vesselschedules";
    }
    @GetMapping("/vesselschedules2")
    public String vesselschedules2(Model model) {
        return "vesselschedules2";
    }

    @GetMapping("/webservice")
    public String webservice() {
        return "webservice";
    }

    @GetMapping("/login")
    public String login() {
        return "index";
    }

    @GetMapping("/register")
    public String register() {
        return "register";
    }

    @GetMapping("/forgetPassword")
    public String forgetPassword() {
        return "forgetPassword";
    }

    @GetMapping("/emailSettings")
    public String emailSettings() {
        return "emailSettings";
    }
}
