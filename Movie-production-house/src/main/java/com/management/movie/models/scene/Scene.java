package com.management.movie.models.scene;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.management.movie.models.HourInterval;
import com.management.movie.models.MovieCharacter;
import com.management.movie.models.movieSet.MovieSet;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Setter
public class Scene extends SceneBase {

    @Transient
    private List<SceneDetails> sceneDetails;

    @Transient
    private List<MovieCharacter> movieCharacters;

    private void setMovieCharacters() {
        this.movieCharacters = getMovieCharacters();
    }

    public List<MovieCharacter> getMovieCharacters() {
        movieCharacters = new ArrayList<>(); // initialize the list
        for (SceneDetails detail : sceneDetails) {
            MovieCharacter character = detail.getCharacter();
            if (!movieCharacters.contains(character)) { // check for duplicates
                movieCharacters.add(character);
            }
        }
        return movieCharacters;
    }
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

    @JsonIgnore
    public String getPlanLink(SceneFilter filter ) {
//        String requestParam =
//                "sceneNumber="
//                +filter.getSceneNumber()
//                +"&movieSet.id="
//                +filter.getMovieSet().getId()
//                +"&movieCharacter.id="
//                +filter.getMovieCharacter().getId()+
//                "&begin="+filter.getStartHour()
//                +"&end="+filter.getEndHour();
//        requestParam = requestParam .replaceAll("null", "");
        return "";
    }


}
