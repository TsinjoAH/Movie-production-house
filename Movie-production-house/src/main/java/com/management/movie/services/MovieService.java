package com.management.movie.services;

import com.management.movie.models.HourInterval;
import com.management.movie.models.Movie;
import com.management.movie.models.planning.Planning;
import com.management.movie.models.planning.PlanningElement;
import com.management.movie.models.planning.PlanningRaw;
import com.management.movie.models.planning.view.PlanningSuggestionCriteria;
import com.spring.hibernate.dao.HibernateDao;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class MovieService {

    HibernateDao dao;

    @Autowired
    IntervalService intervalService;

    @Autowired
    SceneService sceneService;

    public MovieService(HibernateDao dao) {
        this.dao = dao;
    }

    public Planning getPlanning(int id, PlanningSuggestionCriteria criteria) throws Exception {
        Planning planning = new Planning();
        try (Session session = dao.getSessionFactory().openSession()) {

            Movie movie = dao.findById(session, Movie.class, id);

            // get list of scenes by interval
            List<PlanningRaw> raws = getPlanningRaw(session, id);
            List<PlanningElement> elements = new ArrayList<>();

            // create list of elements
            for (PlanningRaw raw : raws) {
                elements.addAll(raw.getElements(
                    Timestamp.valueOf(LocalDateTime.of(criteria.getBeginDate(), LocalTime.of(0,0,0))),
                    intervalService.getDayOff(session),
                    criteria.getMovieSets()
                ));
            }

            planning.setElements(elements);
        }
        return planning;
    }

    private List<PlanningRaw> getPlanningRaw(Session session, int id) {
        List<PlanningRaw> raws = new ArrayList<>();

        for (HourInterval interval : intervalService.findAll(session)) {
            PlanningRaw raw = new PlanningRaw();
            raw.setInterval(interval);
            raw.setScenes(intervalService.findScenes(session, id, interval.getId()));
            raws.add(raw);
        }

        return raws;
    }

}
