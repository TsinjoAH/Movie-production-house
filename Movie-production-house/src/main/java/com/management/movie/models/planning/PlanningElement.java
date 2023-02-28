package com.management.movie.models.planning;

import com.management.movie.models.Scene;
import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
public class PlanningElement {

    private Timestamp start, end;

    private Scene scene;

    public PlanningElement(Timestamp start, Timestamp end, Scene scene) {
        setStart(start);
        setEnd(end);
        setScene(scene);
    }

    public PlanningElement() {
    }
}
