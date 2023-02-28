package com.management.movie.models;

import com.management.movie.models.common.HasId;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import java.sql.Time;

@Getter
@Setter
@Entity(name = "hour_interval")
public class HourInterval extends HasId {

    @Column(name = "start_hour")
    private Time startHour;

    @Column(name = "end_hour")
    private Time endHour;

}
