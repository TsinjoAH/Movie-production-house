package com.management.movie.models.planning;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.management.movie.models.common.HasId;
import com.management.movie.models.scene.Scene;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Getter
@Setter
@Table(name = "planning_details")
public class MoviePlanningDetails extends HasId {

    @ManyToOne
    @JoinColumn(name = "scene_id")
    @JsonIgnore
    private Scene scene;

    @ManyToOne
    @JoinColumn(name = "planning_id")
    @JsonIgnore
    private MoviePlanning moviePlanning;

    @Column(name = "timestamp_start")
    private Timestamp timestampStart;

    @Column(name = "timestamp_end")
    private Timestamp timestampEnd;

}
