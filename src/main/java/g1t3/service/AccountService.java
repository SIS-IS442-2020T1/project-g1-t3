package g1t3.service;

import g1t3.entity.Account;
import g1t3.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class AccountService {
    @Autowired
    private AccountRepository repository;

    public Account getAccountByEmail(String email){
        return repository.findByEmail(email);
    }

    public String saveAccount(Account account){
        repository.save(account);
        return ("Account created");
    }

    public String replaceAccountPassword(Account account){
        String email = account.getEmail();
        String password = account.getPassword();
        Account accountRetrieved = getAccountByEmail(email);
        if(accountRetrieved == null){
            return "email does not exist!";
        }
        accountRetrieved.setPassword(password);
        saveAccount(accountRetrieved);
        return "Password have been replaced";
    }

}
