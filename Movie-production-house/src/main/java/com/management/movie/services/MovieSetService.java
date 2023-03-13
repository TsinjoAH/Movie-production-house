package com.management.movie.services;

import com.management.movie.models.Movie;
import com.management.movie.models.MovieSet;
import com.management.movie.models.scene.Scene;
import com.spring.hibernate.dao.HibernateDao;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class MovieSetService {
    @Autowired
    HibernateDao hibernateDao;

    public List<MovieSet> getAll(){
        return hibernateDao.findAll(MovieSet.class);
    }

    public HashMap<Integer, MovieSet> getMoviesets(List<Scene> scenes){
        HashMap<Integer, MovieSet> movieSets = new HashMap<>();
        for (Scene scene: scenes
             ) {
            movieSets.put(scene.getMovieSet().getId(), scene.getMovieSet());
        }
        return movieSets;
    }
}
