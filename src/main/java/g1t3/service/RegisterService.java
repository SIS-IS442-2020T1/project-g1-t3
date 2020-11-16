package g1t3.service;
import g1t3.entity.*;
import g1t3.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RegisterService  {
    @Autowired
    private RegisterRepo repository;

    public Registration saveRegis(Registration registration) {return repository.save(registration);}

    public List<Registration> getALl(){
        return repository.findAll();
    }

    public void deleteEmail(String emailSuffix){
        repository.deleteById(emailSuffix);
    }
}