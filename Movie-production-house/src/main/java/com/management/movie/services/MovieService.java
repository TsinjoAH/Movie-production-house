package com.management.movie.services;

import com.management.movie.models.planning.Planning;
import com.spring.hibernate.dao.HibernateDao;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MovieService {

    @Autowired
    HibernateDao dao;

    public Planning getPlanning(int id) {
        try (Session session = dao.getSessionFactory().openSession()) {
            // get list of scenes by interval
        }
        return null;
    }

}
