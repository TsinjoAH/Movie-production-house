package com.management.movie.models.planning.view;

import com.management.movie.models.movieSet.AvailableMovieSets;
import com.management.movie.models.scene.Scene;
import lombok.Getter;

import java.time.LocalDate;
import java.util.List;

import static com.management.movie.util.DateUtil.toLocalDate;

@Getter
public class PlanningSuggestionCriteria {

    private List<Scene> scenes;
    private LocalDate beginDate;
    private LocalDate endDate;
    private List<AvailableMovieSets> movieSets;


    public PlanningSuggestionCriteria(String beginDate, String endDate) throws Exception {
        setBeginDate(beginDate);
        setEndDate(endDate);
        if(this.endDate.isBefore(this.beginDate)){
            throw new Exception("End date should always after end date");
        }
    }

    public void setScenes(List<Scene> scenes) throws Exception {
        if(scenes == null || scenes.size() == 0){
            throw new Exception("Please choose at least one scene");
        }
        this.scenes = scenes;
    }

    public void setBeginDate(LocalDate beginDate) {
        this.beginDate = beginDate;
    }

    public void setBeginDate(String beginDate) throws Exception {
        try{
            this.beginDate = toLocalDate(beginDate);
        }catch (Exception e){
            throw new Exception("Begin date has wrong value");
        }
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public void setEndDate(String endDate) throws Exception {
        try{
            this.endDate = toLocalDate(endDate);
        }catch (Exception e){
            throw new Exception("End date has wrong value");
        }
    }

    public void setMovieSets(List<AvailableMovieSets> movieSets) throws Exception {
        if(movieSets == null || movieSets.size() == 0){
            throw new Exception("Please insert at least one available movieset");
        }
        this.movieSets = movieSets;
    }
}
