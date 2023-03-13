package com.management.movie.models.planning;

import com.management.movie.models.HourInterval;
import com.management.movie.models.planning.view.AvailableMovieSets;
import com.management.movie.models.scene.SceneView;
import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class PlanningRaw {

    HourInterval interval;
    List<SceneView> scenes;

    public List<PlanningElement> getElements(Timestamp startDate, List<Integer> dayOff, List<AvailableMovieSets> availableMovieSets) {
        List<PlanningElement> elements = new ArrayList<>();
        if (scenes.size() == 0) return elements;
        LocalDateTime start = getStartFrom(scenes.get(0), startDate.toLocalDateTime().toLocalDate(), availableMovieSets);

        for (SceneView scene: scenes) {
            LocalDateTime end = start.plusSeconds(scene.getDuration().intValue());
            while (!isValid(scene, end, dayOff, availableMovieSets)) {
                start = getStartFrom(scene, start.plusDays(1).toLocalDate(), availableMovieSets);
                end = getEndFrom(start, scene);
            }
            PlanningElement elt = new PlanningElement(
                Timestamp.valueOf(start),
                Timestamp.valueOf(end),
                scene
            );
            elements.add(elt);
            start = end;
        }
        return elements;
    }

    private boolean isValid(SceneView scene, LocalDateTime end, List<Integer> dayOff, List<AvailableMovieSets> availableMovieSets) {
        if (end.toLocalTime().isAfter(interval.getEndHour().toLocalTime())) {
            return false;
        }
        if(dayOff.contains(end.getDayOfWeek().getValue())) {
            return false;
        }
        Integer movieSetId = scene.getMovieSet().getId();
        return check(movieSetId, end, availableMovieSets);
    }

    private boolean check(Integer setId, LocalDateTime date, List<AvailableMovieSets> availableMovieSets) {
        for (AvailableMovieSets available: availableMovieSets) {
            if (available.getMovieSetId().equals(setId)) {
                if (available.contains(date)) {
                    return true;
                }
            }
        }
        return false;
    }

    private LocalDateTime getEndFrom(LocalDateTime start, SceneView scene) {
        return start.plusSeconds(scene.getDuration().intValue());
    }

    private LocalDateTime getStartFrom(SceneView scene, LocalDate date, List<AvailableMovieSets> movieSets) {
        LocalDateTime defaultStart = LocalDateTime.of(date, interval.getStartHour().toLocalTime());
        LocalDateTime newStart = check(scene.getId(), date, interval, movieSets);
        if (newStart != null) {
            return newStart;
        }
        return defaultStart;
    }

    private LocalDateTime check(Integer setId, LocalDate date, HourInterval interval, List<AvailableMovieSets> movieSets) {
        for (AvailableMovieSets available: movieSets) {
            if (available.getMovieSetId().equals(setId)) {
                if (available.containsOne(interval, date)) {
                    return available.getMinDate();
                }
            }
        }
        return null;
    }

}
