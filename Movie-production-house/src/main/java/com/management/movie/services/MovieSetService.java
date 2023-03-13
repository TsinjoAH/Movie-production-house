package com.management.movie.services;

import com.management.movie.models.movieSet.AvailableMovieSets;
import com.management.movie.models.movieSet.MovieSet;
import com.spring.hibernate.dao.HibernateDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MovieSetService {
    @Autowired
    HibernateDao hibernateDao;

    public List<MovieSet> getAll(){
        return hibernateDao.findAll(MovieSet.class);
    }

    public AvailableMovieSets insertAvailable(AvailableMovieSets movieSets){
        return hibernateDao.save(movieSets);
    }

    public List<AvailableMovieSets> getAvailables (){
        return hibernateDao.findAll(AvailableMovieSets.class);
    }
}
