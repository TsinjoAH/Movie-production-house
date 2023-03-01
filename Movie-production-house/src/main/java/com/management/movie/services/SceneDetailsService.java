package com.management.movie.services;

import com.management.movie.models.scene.Scene;
import com.management.movie.models.scene.SceneDetails;
import com.management.movie.models.scene.SceneDetailsFilter;
import com.spring.hibernate.dao.HibernateDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SceneDetailsService {
    @Autowired
    HibernateDao hibernateDao;

    public List<SceneDetails> getByScene(Scene scene){
        SceneDetailsFilter sceneDetailsFilter=new SceneDetailsFilter();
        sceneDetailsFilter.setScene(scene);
        return hibernateDao.findBy(SceneDetails.class,sceneDetailsFilter);
    }
}
