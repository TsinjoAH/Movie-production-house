package com.management.movie.util;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class DateUtil {

    public static LocalDateTime toLocalDateTime(String localDateTime){
       return LocalDateTime.parse(localDateTime, DateTimeFormatter.ISO_DATE_TIME);
    }

    public static LocalDate toLocalDate(String localDate){
        return LocalDate.parse(localDate, DateTimeFormatter.ISO_DATE);
    }
}
