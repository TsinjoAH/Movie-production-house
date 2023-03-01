package com.management.movie.models.planning;

import com.management.movie.models.HourInterval;
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

    public List<PlanningElement> getElements(Timestamp startDate, List<Integer> dayOff) {
        List<PlanningElement> elements = new ArrayList<>();

        LocalDateTime start = getStartFrom(startDate.toLocalDateTime().toLocalDate());

        for (SceneView scene: scenes) {
            LocalDateTime end = start.plusSeconds(scene.getDuration().intValue());
            while (!isValid(end, dayOff)) {
                start = getStartFrom(start.plusDays(1).toLocalDate());
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

    private boolean isValid(LocalDateTime end, List<Integer> dayOff) {
        if (end.toLocalTime().isAfter(interval.getEndHour().toLocalTime())) {
            return false;
        }
        return !dayOff.contains(end.getDayOfWeek().getValue());
    }

    private LocalDateTime getEndFrom(LocalDateTime start, SceneView scene) {
        return start.plusSeconds(scene.getDuration().intValue());
    }

    private LocalDateTime getStartFrom(LocalDate date) {
        return LocalDateTime.of(date, interval.getStartHour().toLocalTime());
    }

}
