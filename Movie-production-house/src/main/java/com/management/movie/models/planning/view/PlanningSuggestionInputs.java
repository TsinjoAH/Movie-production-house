package com.management.movie.models.planning.view;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class PlanningSuggestionInputs {
    private List<Integer> scenes;
    private String beginDate;
    private String endDate;
    private List<Integer> movieSets;
    private List<String> maxDates;
    private List<String> minDates;

    public PlanningSuggestionCriteria getCriteria() throws Exception{
        PlanningSuggestionCriteria criteria = new PlanningSuggestionCriteria(
                scenes, beginDate, endDate, getMovieSets());
        return criteria;
    }

    public List<AvailableMovieSets> getMovieSets() throws Exception {
        List<AvailableMovieSets> availableMovieSets = new ArrayList<>();
        for (int i = 0; i < movieSets.size(); i++) {
            availableMovieSets.add(new AvailableMovieSets(
                   movieSets.get(i), minDates.get(i), maxDates.get(i)));
        }
        return availableMovieSets;
    }

}
