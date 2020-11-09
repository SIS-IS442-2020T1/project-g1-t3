package g1t3.service;

import g1t3.entity.Favorite;
import g1t3.entity.composite.FavoritePrimary;
import g1t3.repository.FavoriteRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FavoriteService {
    @Autowired
    private FavoriteRepo repository;

    public Favorite saveFavorite(Favorite Favorite) {
        return repository.save(Favorite);
    }

    public List<Favorite> saveFavorites(List<Favorite> Favorites) {
        return repository.saveAll(Favorites);
    }

    public List<Favorite> getFavorites() {
        return repository.findAll();
    }


    public List<Favorite> findByUser(String email){
        return repository.findByEmail(email);
    }

    public List<Favorite> findByVessel(String abbrVslM, String inVoyN){
        return repository.findByAbbrVslMAndInVoyN(abbrVslM, inVoyN);
    }

    public void deleteFavorite(FavoritePrimary FavoriteIds) {
        repository.deleteById(FavoriteIds);
    }

}
