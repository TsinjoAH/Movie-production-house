package com.management.movie;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.sql.Time;
import java.sql.Timestamp;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

public class Main {

    static String getQuery(Time startHour, Time endHour) {
        // return insert query to table interval hour
        return "INSERT INTO interval_hour (start_hour, end_hour) VALUES ('" + startHour + "', '" + endHour + "');";
    }

    public static void main(String[] args) throws JsonProcessingException {
        /*
            // interval generation

            Time start = Time.valueOf("00:00:00");
            int i = 0;
            while (i != 24) {
                Time end = Time.valueOf(start.toLocalTime().plusMinutes(59).plusSeconds(59));
                System.out.println(getQuery(start, end));
                start = Time.valueOf(end.toLocalTime().plusSeconds(1));
                i++;
            }
        */

        System.out.println(Timestamp.valueOf(LocalDateTime.now()));
    }
}
