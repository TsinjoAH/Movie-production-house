package com.management.movie.util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class DateUtil {

    static SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
    static SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSSSSSSSS");


    public static LocalDateTime toLocalDateTime(String localDateTime){
       return LocalDateTime.parse(localDateTime, DateTimeFormatter.ISO_DATE_TIME);
    }

    public static LocalDate toLocalDate(String localDate){
        return LocalDate.parse(localDate, DateTimeFormatter.ISO_DATE);
    }

    public static Timestamp toTimestamp (String timestamp) throws ParseException {
          return Timestamp.valueOf(outputFormat.format(inputFormat.parse(timestamp)));
    }
}
