package com.management.movie.services;

import com.management.movie.models.scene.SceneFilter;
import com.management.movie.models.scene.Scene;
import com.spring.hibernate.dao.HibernateDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SceneService {
    @Autowired
    HibernateDao hibernateDao;

    @Autowired
    SceneDetailsService sceneDetailsService;

    public List<Scene> list(SceneFilter sceneFilter){
        List<Scene> sceneList= hibernateDao.findBy(Scene.class,sceneFilter);
        for(Scene scene:sceneList){
            scene.setSceneDetails(sceneDetailsService.getByScene(scene));
        }
        return sceneList;
    }
}
