package com.management.movie.services;

import com.management.movie.models.planning.MoviePlanningDetails;
import com.management.movie.models.scene.SceneDetails;
import com.spring.hibernate.dao.HibernateDao;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlanningDetailsService {
    @Autowired
    HibernateDao dao;

    public List<SceneDetails> findBySceneId(Integer sceneId){
        try (Session session = dao.getSessionFactory().openSession()) {
            List<SceneDetails> details = findBySceneId(session, sceneId);
            return details;
        }

    }

    public List<SceneDetails> findBySceneId(Session session, Integer sceneId){
        Criteria criteria = session.createCriteria(MoviePlanningDetails.class);
        criteria.add(Restrictions.eq("scene.id", sceneId));
        return criteria.list();
    }
}
