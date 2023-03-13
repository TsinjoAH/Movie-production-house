package com.management.movie.models.movieSet;

import com.management.movie.models.common.HasId;
import lombok.Getter;

import javax.persistence.Column;
import javax.persistence.Entity;

import static com.management.movie.util.DateUtil.toTimestamp;

import java.sql.Time;
import java.sql.Timestamp;
import java.time.LocalDateTime;
@Getter
@Entity(name = "available_movie_sets")
public class AvailableMovieSets extends HasId {
    @Column(name = "movie_set_id")
    private Integer movieSetId;

    @Column(name = "timestamp_start")
    private Timestamp minDate;

    @Column(name = "timestamp_end")
    private Timestamp maxDate;

    public AvailableMovieSets() {
        super();
    }

    public AvailableMovieSets(Integer movieSetId, String minDate, String maxDate) throws Exception {
       setMovieSetId(movieSetId);
       setMinDate(minDate);
       setMaxDate(maxDate);
       if(this.maxDate.compareTo(this.minDate) < 0){
           throw new Exception("Max date should always be after min date");
       }
    }


    public void setMovieSetId(Integer movieSetId) throws Exception {
        if(movieSetId == null){
            throw new Exception("Movie set is mandatory");
        }
        this.movieSetId = movieSetId;
    }

    public void setMinDate(Timestamp minDate) {
        this.minDate = minDate;
    }

    public void setMinDate(String minDate) throws Exception {
        try{
            this.minDate = toTimestamp(minDate);
        }catch (Exception e){
            throw new Exception("Wrong value of date min of available movieset");
        }
    }

    public void setMaxDate(String maxDate) throws Exception {
        try{
            this.maxDate = toTimestamp(maxDate);
        }catch (Exception e){
            throw new Exception("Wrong value of date max of available movieset");
        }

    }
    public void setMaxDate(Timestamp maxDate) {
        this.maxDate = maxDate;
    }
}
