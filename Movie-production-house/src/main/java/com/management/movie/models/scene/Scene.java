package com.management.movie.models.scene;

import com.management.movie.models.HourInterval;
import com.management.movie.models.MovieSet;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Getter
@Setter
public class Scene extends SceneBase {

    @Transient
    private List<SceneDetails> sceneDetails;

    public Scene() {
    }

    public Scene(Integer movieSetId, Integer idealHourId, String sceneNumber) throws Exception {
        super();
        HourInterval hourInterval = new HourInterval();
        hourInterval.setId(idealHourId);
        MovieSet movieSet = new MovieSet();
        movieSet.setId(movieSetId);

        setHourInterval(hourInterval);
        setMovieSet(movieSet);
        setSceneNumber(sceneNumber);
    }


}
