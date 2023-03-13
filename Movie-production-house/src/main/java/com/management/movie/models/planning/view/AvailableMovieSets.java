package com.management.movie.models.planning.view;

import lombok.Getter;
import static com.management.movie.util.DateUtil.toLocalDateTime;

import java.time.LocalDateTime;
@Getter
public class AvailableMovieSets {

    private Integer movieSetId;
    private LocalDateTime minDate;
    private LocalDateTime maxDate;


    public AvailableMovieSets(Integer movieSetId, String minDate, String maxDate) throws Exception {
       setMovieSetId(movieSetId);
       setMinDate(minDate);
       setMaxDate(maxDate);
       if(this.maxDate.isBefore(this.minDate)){
           throw new Exception("Max date should always be after min date");
       }
    }

    public void setMovieSetId(Integer movieSetId) throws Exception {
        if(movieSetId == null){
            throw new Exception("Movie set is mandatory");
        }
        this.movieSetId = movieSetId;
    }

    public void setMinDate(LocalDateTime minDate) {
        this.minDate = minDate;
    }

    public void setMinDate(String minDate) throws Exception {
        try{
            this.minDate = toLocalDateTime(minDate);
        }catch (Exception e){
            throw new Exception("Wrong value of date min of available movieset");
        }
    }

    public void setMaxDate(String maxDate) throws Exception {
        try{
            this.maxDate = toLocalDateTime(maxDate);
        }catch (Exception e){
            throw new Exception("Wrong value of date max of available movieset");
        }

    }
    public void setMaxDate(LocalDateTime maxDate) {
        this.maxDate = maxDate;
    }
}
