package com.management.movie.models.planning;

import com.management.movie.models.scene.Scene;
import com.management.movie.models.scene.SceneView;
import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
public class PlanningElement {

    private Timestamp start, end;

    private SceneView scene;

    public PlanningElement(Timestamp start, Timestamp end, SceneView scene) {
        setStart(start);
        setEnd(end);
        setScene(scene);
    }

    public PlanningElement() {
    }
}
