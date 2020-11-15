package g1t3.controller;

import g1t3.entity.Account;
import g1t3.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@CrossOrigin()
@RestController
public class AccountController {
    @Autowired
    private AccountService service;

    @PostMapping("/addAccount/")
    public String addAccountController(@RequestBody Account account){
        return service.saveAccount(account);
    }

    @GetMapping("findByEmail/{email}")
    public Account getAccountByEmailController(@PathVariable String email){
        return service.getAccountByEmail(email);
    }

    @PostMapping("/updateAccountPassword/")
    public String updateAccountByPasswordController(@RequestBody Account account) {
        return service.replaceAccountPassword(account);
    }
}
