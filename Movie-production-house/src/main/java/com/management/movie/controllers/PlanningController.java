package com.management.movie.controllers;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.management.movie.models.Movie;
import com.management.movie.models.planning.MoviePlanning;
import com.management.movie.models.planning.MoviePlanningDetails;
import com.management.movie.models.planning.Planning;
import com.management.movie.models.planning.PlanningElement;
import com.management.movie.models.planning.view.PlanningSuggestionCriteria;
import com.management.movie.models.planning.view.PlanningSuggestionInputs;
import com.management.movie.models.scene.Scene;
import com.management.movie.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.crypto.Data;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

@Controller
public class PlanningController {

    @Autowired
    MovieSetService movieSetService;

    @Autowired
    MovieService movieService;

    ObjectMapper mapper = new ObjectMapper();

    @Autowired
    SceneService sceneService;

    @Autowired
    PlanningDetailsService planningDetailsService;

    @Autowired
    PlanningService planningService;

    @GetMapping("planning/form")
    public ModelAndView getFormPlanning(ModelAndView modelAndView) {
        modelAndView.addObject("movieSets", movieSetService.getAll());
        modelAndView.addObject("scenes", sceneService.getOngoingPlanning());
        modelAndView.setViewName("movies/form-planning");
        return modelAndView;
    }

    @PostMapping("/planning/suggestion")
    public ModelAndView getPlanning(ModelAndView modelAndView, @ModelAttribute PlanningSuggestionInputs inputs, HttpSession session) {
        try {
            PlanningSuggestionCriteria criteria = inputs.getCriteria();
            int movieId = 1;
            Planning planning = movieService.getPlanning(movieId, criteria);
            modelAndView.setViewName("movies/planning");
            session.setAttribute("planning", planning);
            session.setAttribute("criteria", criteria);
            modelAndView.addObject("planning", mapper.writeValueAsString(planning));
            modelAndView.addObject("planningObject", planning);
        } catch (Exception e) {
            modelAndView.addObject("error", e.getMessage());
            e.printStackTrace();
            return getFormPlanning(modelAndView);
        }
        return modelAndView;
    }

    @GetMapping("/planning/last-suggestion")
    public ModelAndView getLastSuggestedPlan(ModelAndView modelAndView, HttpSession session) throws JsonProcessingException {
        modelAndView.addObject("planning", mapper.writeValueAsString(session.getAttribute("planning")));
        modelAndView.addObject("planningObject", session.getAttribute("planning"));
        modelAndView.setViewName("movies/planning");
        return modelAndView;
    }

    @PostMapping("/planning/updatePlanning")
    public ModelAndView updatePlanning(@RequestParam("timestampStart[]") List<String> timestampStarts,
                                       @RequestParam("timestampEnd[]") List<String> timestampEnds,
                                       @RequestParam("sceneIds[]") List<Integer> sceneIds,
                                        HttpSession session) throws Exception {

        MoviePlanning moviePlanning = new MoviePlanning();
        PlanningSuggestionCriteria criteria = (PlanningSuggestionCriteria) session.getAttribute("criteria");
        Movie movie = new Movie();
        movie.setId(1);
        moviePlanning.setMovie(movie);
        moviePlanning.setDateStart(Date.valueOf(criteria.getBeginDate()));
        moviePlanning.setDateEnd(Date.valueOf(criteria.getEndDate()));
        //set the movieplanningdetails
        List<MoviePlanningDetails> moviePlanningDetailsList = new ArrayList<>();
//        for (int i = 0; i < timestampStarts.size(); i++) {
//            MoviePlanningDetails moviePlanningDetails = new MoviePlanningDetails();
//            moviePlanningDetails.setTimestampStart(Timestamp.valueOf(timestampStarts.get(i)));
//            moviePlanningDetails.setTimestampEnd(Timestamp.valueOf(timestampEnds.get(i)));
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSSSSSSSS");

        for (int i = 0; i < timestampStarts.size(); i++) {
            String start = timestampStarts.get(i);
            String end = timestampEnds.get(i);

            Timestamp startTimestamp = Timestamp.valueOf(outputFormat.format(inputFormat.parse(start)));
            Timestamp endTimestamp = Timestamp.valueOf(outputFormat.format(inputFormat.parse(end)));

            MoviePlanningDetails moviePlanningDetails = new MoviePlanningDetails();
            moviePlanningDetails.setTimestampStart(startTimestamp);
            moviePlanningDetails.setTimestampEnd(endTimestamp);
            Scene scene = new Scene();
            scene.setId(sceneIds.get(i));
            moviePlanningDetails.setScene(scene);
            moviePlanningDetailsList.add(moviePlanningDetails);
        }
        moviePlanning.setMoviePlanningDetails(moviePlanningDetailsList);
        planningService.save(moviePlanning);
        return new ModelAndView("redirect:/planning/last-suggestion");
    }
}
