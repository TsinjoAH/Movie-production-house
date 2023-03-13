package com.management.movie.models.scene.view;

import com.management.movie.models.Feeling;
import com.management.movie.models.HourInterval;
import com.management.movie.models.MovieCharacter;
import com.management.movie.models.movieSet.MovieSet;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class SceneForm {
    private List<MovieSet> movieSets;
    private List<HourInterval> hourIntervals;
    private List<Feeling> feelings;
    private List<MovieCharacter> characters;

}
