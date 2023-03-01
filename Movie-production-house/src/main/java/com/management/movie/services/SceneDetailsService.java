package com.management.movie.services;

import com.management.movie.models.scene.Scene;
import com.management.movie.models.scene.SceneDetails;
import com.spring.hibernate.dao.HibernateDao;
import org.hibernate.Session;
import org.hibernate.criterion.Example;
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
        Session session = hibernateDao.getSessionFactory().openSession();
        List<SceneDetails> details = findBySceneId(hibernateDao.getSessionFactory().openSession(), sceneId);
        session.close();
        return details;

    }

    public List<SceneDetails> findBySceneId(Session session, Integer sceneId){
        SceneDetails sceneDetails = new SceneDetails();
        sceneDetails.setSceneId(sceneId);
        Example example = Example.create(sceneDetails);
        List<SceneDetails> results = session.createCriteria(SceneDetails.class)
                .add(example)
                .list();
        return results;
    }

    public void deleteAllSceneDetails(Session session, Integer sceneId){
        String deleteQuery = "DELETE FROM SceneDetails s where s.sceneId=:sId";
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
