package g1t3.controller;

import g1t3.entity.Favorite;
import g1t3.entity.composite.FavoritePrimary;
import g1t3.service.FavoriteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
public class FavoriteController{

    @Autowired
    private FavoriteService service;

    @PostMapping("/addFavorite")
    public Favorite addFavorite(@RequestBody Favorite s) {
        return service.saveFavorite(s);
    }

    @PostMapping("/addFavorites")
    public List<Favorite> addFavorites(@RequestBody List<Favorite> Favorites) {
        return service.saveFavorites(Favorites);
    }

    @GetMapping("/allFavorites")
    public List<Favorite> findAllFavorites() {
        return service.getFavorites();
    }

    @GetMapping("/FavoriteByUser/{email}")
    public List<Favorite> findFavoriteByUserEmail(@PathVariable String email) {
        return service.findByUser(email);
    }

    @GetMapping ("/FavoriteByVessel/{abbrVslM}/{inVoyN}")
    public List<Favorite> findFavoriteByVesselId(@PathVariable String abbrVslM,@PathVariable String inVoyN) {
        return service.findByVessel(abbrVslM, inVoyN);
    }


    @DeleteMapping("/deleteFavorite")
    public void deleteFavorite(@RequestBody FavoritePrimary FavoriteIds ){
        service.deleteFavorite(FavoriteIds);
    }



}