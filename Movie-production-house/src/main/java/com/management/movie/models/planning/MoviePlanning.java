package com.management.movie.models.planning;

import com.management.movie.models.Movie;
import com.management.movie.models.common.HasId;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Getter
@Setter
@Table(name = "planning")
public class MoviePlanning extends HasId {
    @ManyToOne
    @JoinColumn(name = "movie_id")
    private Movie movie;

    @Column(name = "date_start")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateStart;

    @Column(name = "date_end")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateEnd;

    @Transient
    List<MoviePlanningDetails> moviePlanningDetails;


}
