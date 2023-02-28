package com.management.movie.models;

import com.management.movie.models.common.HasId;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.sql.Time;
import java.util.List;

@Entity
@Getter
@Setter
public class Scene extends HasId {

    @ManyToOne
    @JoinColumn(name = "movie_id")
    private Movie movie;

    @ManyToOne
    @JoinColumn(name = "movie_set_id")
    private MovieSet movieSet;

    @Temporal(TemporalType.TIME)
    @DateTimeFormat(pattern = "HH:mm:ss")
    private Time startHour;

    @Temporal(TemporalType.TIME)
    @DateTimeFormat(pattern = "HH:mm:ss")
    private Time endHour;

    @Column(name = "scene_number")
    private String sceneNumber;

    @Transient
    private List<SceneDetails> sceneDetails;

}
