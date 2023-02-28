package com.management.movie.models.scene;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity(name = "v_scene")
public class SceneView extends SceneBase{

    @Column
    private Double duration;

    public Double getDuration() {
        return duration;
    }

    public void setDuration(Double duration) {
        this.duration = duration;
    }
}
