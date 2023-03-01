package com.management.movie.services;


import com.management.movie.models.HourInterval;
import com.management.movie.models.scene.Scene;
import com.management.movie.models.scene.SceneView;
import com.spring.hibernate.dao.HibernateDao;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IntervalService {

    @Autowired
    HibernateDao dao;


    public List<HourInterval> findAll () {
        return dao.findAll(HourInterval.class);
    }

    public List<HourInterval> findAll (Session session) {
        return dao.findAll(session,HourInterval.class);
    }

    public List<SceneView> findScenes(Session session, int movieId, int intervalId) {
        Criteria criteria = session.createCriteria(SceneView.class);
        criteria.add(Restrictions.eq("movie.id", movieId));
        criteria.add(Restrictions.eq("hourInterval.id", intervalId));
        return criteria.list();
    }

}
