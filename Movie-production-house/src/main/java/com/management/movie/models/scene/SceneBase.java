package com.management.movie.models.scene;

import com.management.movie.models.HourInterval;
import com.management.movie.models.Movie;
import com.management.movie.models.movieSet.MovieSet;
import com.management.movie.models.common.HasId;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@MappedSuperclass
public class SceneBase extends HasId {

    @ManyToOne
    @JoinColumn(name = "movie_id")
    private Movie movie;

    @ManyToOne
    @JoinColumn(name = "movie_set_id")
    private MovieSet movieSet;

    @ManyToOne
    @JoinColumn(name = "interval_id")
    private HourInterval hourInterval;

    @Column(name = "scene_number")
    private String sceneNumber;

    @ManyToOne
    @JoinColumn(name = "scene_status_id")
    private SceneStatus sceneStatus;

    public void setSceneNumber(String sceneNumber) throws Exception {
        if(sceneNumber == null || sceneNumber.trim().equals("")){
            throw new Exception("Scene number is required when creating a scene.");
        }
        this.sceneNumber = sceneNumber;
    }
}
