package com.management.movie.services;

import com.management.movie.models.scene.*;
import com.management.movie.models.scene.view.*;
import com.management.movie.models.Feeling;
import com.management.movie.models.HourInterval;
import com.management.movie.models.MovieCharacter;
import com.management.movie.models.movieSet.MovieSet;
import com.spring.hibernate.dao.HibernateDao;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.hibernate.Transaction;

import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Service
public class SceneService {

    @Autowired
    HibernateDao dao;

    @Autowired
    SceneDetailsService sceneDetailsService;

    public void save (Scene scene) throws Exception {
        Transaction transaction = null;
        Session session = null;
        try{
            session = dao.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            SceneStatus status = new SceneStatus();
            status.setId(10);
            scene.setSceneStatus(status);
            save(session, scene);
            transaction.commit();
        }catch (Exception e){
            if(transaction != null){
                transaction.rollback();
            }
            throw e;
        }finally {
            if(session != null) {
                session.close();
            }
        }
    }



    public void save (Session session, Scene scene){
        List<SceneDetails> sceneDetails = scene.getSceneDetails();
        scene.setSceneDetails(null);
        session.persist(scene);
        for (SceneDetails detail : sceneDetails) {
            detail.setScene(scene);
            session.persist(detail);
        }
    }

    public SceneReturn getSceneReturn(SceneFilter sceneFilter, String startHour, String endHour){
        SceneReturn sceneReturn=new SceneReturn();
        if (!Objects.equals(startHour, "")) {
            startHour+=":00";
            sceneFilter.setStartHour(Time.valueOf(startHour));
        }
        else {
            sceneFilter.setStartHour(null);
        }
        if (!Objects.equals(endHour, "")) {
            endHour+=":00";
            sceneFilter.setEndHour(Time.valueOf(endHour));
        }
        else {
            sceneFilter.setStartHour(null);
        }
        if(Objects.equals(sceneFilter.getSceneNumber(), "")){
            sceneFilter.setSceneNumber(null);
        }
        sceneReturn.setSceneList(list(sceneFilter));
        sceneReturn.setSceneFilter(sceneFilter);
        return sceneReturn;
    }

    public void update(Scene scene, Integer sceneId) throws Exception {
        Session session = null;
        Transaction transaction = null;
        try{
            session = dao.getSessionFactory().openSession();
            transaction = session.beginTransaction();

            Scene oldScene = dao.findById(session, Scene.class, sceneId);
            oldScene.setSceneNumber(scene.getSceneNumber());
            oldScene.setHourInterval(scene.getHourInterval());
            oldScene.setMovieSet(scene.getMovieSet());
            oldScene.setSceneDetails(scene.getSceneDetails());

            sceneDetailsService.deleteAllSceneDetails(session, sceneId);
            save(session, oldScene);
            transaction.commit();
        } catch (Exception e){
            if(transaction != null){
                transaction.rollback();
            }
            throw e;
        }finally {
            if(session != null){
                session.close();
            }
        }
    }

    public void updateStatus(Integer id, Integer statusId) throws Exception {
        try(Session session = dao.getSessionFactory().openSession()){
            Transaction transaction = session.beginTransaction();
            Scene scene = dao.findById(session, Scene.class, id) ;
            scene.setSceneStatus(dao.findById(session, SceneStatus.class, statusId));
            session.save(scene);
            session.flush();
            transaction.commit();
        }
    }


    public Scene findById(Integer id){
         Scene scene = dao.findById(Scene.class, id);
         scene.setSceneDetails(sceneDetailsService.findBySceneId(id));
        return scene;
    }

    public SceneForm getInputSceneForm(){
        SceneForm sceneForm = new SceneForm();
        sceneForm.setCharacters(dao.findAll(MovieCharacter.class));
        sceneForm.setFeelings(dao.findAll(Feeling.class));
        sceneForm.setHourIntervals(dao.findAll(HourInterval.class));
        sceneForm.setMovieSets(dao.findAll(MovieSet.class));
        return sceneForm;
    }

    public List<Scene> getOngoingPlanning(){
        List<Scene> scenes = new ArrayList<>();
        try(Session session = dao.getSessionFactory().openSession()){
            Criteria criteria = session.createCriteria(Scene.class);
            criteria.add(Restrictions.eq("sceneStatus.id", 20));
            scenes = criteria.list();
        }
        return scenes;
    }

    public List<Scene> list(SceneFilter sceneFilter){
        try (Session session = dao.getSessionFactory().openSession()) {
            List<Scene> sceneList = dao.findBy(session, Scene.class, sceneFilter);
            for (Scene scene : sceneList) {
                scene.setSceneDetails(sceneDetailsService.findBySceneId(session, scene.getId()));
            }
            return sceneList;
        }
    }
}
