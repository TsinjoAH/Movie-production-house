package com.management.movie.services;

import com.management.movie.models.scene.Scene;
import com.management.movie.models.scene.SceneDetails;
import com.management.movie.models.scene.SceneView;
import com.spring.hibernate.dao.HibernateDao;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import com.management.movie.models.scene.SceneDetailsFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SceneDetailsService {
    @Autowired
    HibernateDao hibernateDao;

    public List<SceneDetails> findBySceneId(Integer sceneId){
        try (Session session = hibernateDao.getSessionFactory().openSession()) {
            List<SceneDetails> details = findBySceneId(session, sceneId);
            return details;
        }

    }

    public List<SceneDetails> findBySceneId(Session session, Integer sceneId){
        Criteria criteria = session.createCriteria(SceneDetails.class);
        criteria.add(Restrictions.eq("scene.id", sceneId));
        return criteria.list();
    }

    public void deleteAllSceneDetails(Session session, Integer sceneId){
        String deleteQuery = "DELETE FROM SceneDetails s where s.scene.id=:sId";
        Query query = session.createQuery(deleteQuery);
        query.setParameter("sId", sceneId);
        query.executeUpdate();
    }

    public List<SceneDetails> getByScene(Scene scene){
        SceneDetailsFilter sceneDetailsFilter=new SceneDetailsFilter();
        sceneDetailsFilter.setScene(scene);
        return hibernateDao.findBy(SceneDetails.class,sceneDetailsFilter);
    }
}
