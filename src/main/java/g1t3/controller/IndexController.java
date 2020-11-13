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

    @GetMapping("/login")
    public String index() {
        return "index";
    }
//    @GetMapping("/favourite")
//    public String index() {
//        return "favourite";
//    }

    @GetMapping("/myfavorite/{email}") // TODO: link email from login to favourite
    public String listFavorite(@PathVariable String email, Model model) {
        List<Favorite> favoriteList= favoriteService.findByUser(email);
        List<Vessel> vesselList= new ArrayList<>();
        System.out.println(favoriteList);
        if(favoriteList.size() != 0){
            for(Favorite f: favoriteList){
                try {
                    Vessel v = vesselService.findByAbbrVslMAndInVoyN(f.getAbbrVslM(), f.getInVoyN());
                    vesselList.add(v);
                }catch(Exception e){
                    System.out.println("vessel not found");
                }
            }
        }
        model.addAttribute("vessels", vesselList);
        return "favorite";
    }


//    @GetMapping("/list_contact")
//    public String listContact(Model model) {
//
//        ContactBusiness business = new ContactBusiness();
//        List<Contact> contactList = business.getContactList();
//
//        model.addAttribute("contacts", contactList);
//
//        return "contact";
//    }



}
