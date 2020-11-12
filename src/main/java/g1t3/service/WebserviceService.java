package g1t3.service;

import g1t3.entity.WebserviceInstructions;
import g1t3.repository.WebserviceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class WebserviceService {
    @Autowired
    private WebserviceRepository repository;

    public WebserviceInstructions saveWebservice(WebserviceInstructions webserviceInstructions) {return repository.save(webserviceInstructions);}

    public WebserviceInstructions getWebserviceById(Integer id){return repository.findById(id).orElse(null);}

    public String replaceWebserviceInstructions(WebserviceInstructions webserviceInstructions){
        if(getWebserviceById(webserviceInstructions.getId()) == null){
            return "id doesnt exist";
        }
        repository.deleteById(webserviceInstructions.getId());
        repository.save(webserviceInstructions);
        return "Data replaced.";
    }
}
