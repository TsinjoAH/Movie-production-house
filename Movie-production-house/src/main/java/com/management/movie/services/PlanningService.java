package com.management.movie.services;

import com.management.movie.models.planning.MoviePlanning;
import com.management.movie.models.planning.MoviePlanningDetails;
import com.management.movie.models.scene.Scene;
import com.management.movie.models.scene.SceneDetails;
import com.management.movie.models.scene.SceneStatus;
import com.spring.hibernate.dao.HibernateDao;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlanningService {
    @Autowired
    HibernateDao dao;

    @Autowired
    PlanningDetailsService planningDetailsService;

    public void save(MoviePlanning planning){
        Transaction transaction = null;
        Session session = null;
        try{
            session = dao.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            save(session, planning);
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

    public MoviePlanning findById(Integer id){
        MoviePlanning moviePlanning = dao.findById(MoviePlanning.class, id);
        moviePlanning.setMoviePlanningDetails(planningDetailsService.findByPlanningId(id));
        return moviePlanning;
    }



    public void save (Session session, MoviePlanning planning){
        List<MoviePlanningDetails> moviePlanningDetails = planning.getMoviePlanningDetails();
        session.persist(planning);
        for (MoviePlanningDetails detail : moviePlanningDetails) {
            detail.setMoviePlanning(planning);
            session.persist(detail);
        }
    }

}
