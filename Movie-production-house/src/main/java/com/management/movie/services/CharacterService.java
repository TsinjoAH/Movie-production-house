package com.management.movie.services;

import com.management.movie.models.Movie;
import com.management.movie.models.MovieCharacter;
import com.spring.hibernate.dao.HibernateDao;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CharacterService {
    @Autowired
    HibernateDao hibernateDao;

    public List<MovieCharacter> getByMovie(Movie movie){
        Session session=hibernateDao.getSessionFactory().openSession();
        List<MovieCharacter> characterList=null;
        try {
            characterList=session.createCriteria(MovieCharacter.class)
                    .add(Restrictions.eq("movie",movie))
                    .list();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return characterList;
    }
}
