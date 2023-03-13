package com.management.movie.models.scene;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.management.movie.models.HourInterval;
import com.management.movie.models.Movie;
import com.management.movie.models.MovieCharacter;
import com.management.movie.models.MovieSet;
import com.spring.hibernate.dao.Filter;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.Criteria;
import org.hibernate.criterion.*;

import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@JsonIgnoreProperties({"conditions", "orders"})
public class SceneFilter extends Filter {
    private Movie movie;
    private Time startHour;
    private Time endHour;
    private MovieSet movieSet;
    private MovieCharacter movieCharacter;

    private String sceneNumber;
//    private
@Override
public List<Criterion> getConditions() {
    List<Criterion> conditions = new ArrayList<>();
//    Criteria criteria=Criteria
    if(sceneNumber!=null){
        conditions.add(Restrictions.eq("sceneNumber",sceneNumber));
    }
    if(movie!=null){
        conditions.add(Restrictions.eq("movie",movie));
    }

    if (movieSet != null) {
        conditions.add(Restrictions.eq("movieSet", movieSet));
    }
    if (movieCharacter != null) {
        // Create a subquery to filter scenes based on the movie_character field in the SceneDetails model
        DetachedCriteria subquery = DetachedCriteria.forClass(SceneDetails.class)
                .add(Restrictions.eq("character", movieCharacter))
                .setProjection(Property.forName("scene"));
        conditions.add(Subqueries.propertyIn("id", subquery));
    }
    if (startHour != null) {
        // Create a subquery to filter scenes based on the startHour field in the HourInterval model
        DetachedCriteria subquery = DetachedCriteria.forClass(HourInterval.class)
                .add(Restrictions.ge("startHour", startHour))
                .setProjection(Property.forName("id"));
        conditions.add(Subqueries.propertyIn("hourInterval.id", subquery));
    }
    if (endHour != null) {
        // Create a subquery to filter scenes based on the endHour field in the HourInterval model
        DetachedCriteria subquery = DetachedCriteria.forClass(HourInterval.class)
                .add(Restrictions.le("endHour", endHour))
                .setProjection(Property.forName("id"));
        conditions.add(Subqueries.propertyIn("hourInterval.id", subquery));
    }
    return conditions;
}

    @Override
    public List<Order> getOrders() {
        List<Order> orders=new ArrayList<>();
        orders.add(Order.asc("sceneNumber"));
        return orders;
    }

    @Override
    public int getPageSize() {
        return 6;
    }

    @Override
    public String toString() {
        return "SceneFilter{" +
                "beginHour=" + startHour +
                ", endHour=" + endHour +
                ", movieSet=" + movieSet +
                ", movieCharacter=" + movieCharacter +
                '}';
    }
}
