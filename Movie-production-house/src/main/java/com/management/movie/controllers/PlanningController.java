package com.management.movie.controllers;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.management.movie.models.planning.MoviePlanning;
import com.management.movie.models.planning.MoviePlanningDetails;
import com.management.movie.models.planning.Planning;
import com.management.movie.models.planning.view.PlanningSuggestionCriteria;
import com.management.movie.models.planning.view.PlanningSuggestionInputs;
import com.management.movie.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.Enumeration;

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
        modelAndView.addObject("movieSets", movieSetService.getAll() );
        modelAndView.addObject("scenes", sceneService.getOngoingPlanning());
        modelAndView.setViewName("movies/form-planning");
        return modelAndView;
    }

    @PostMapping("/planning/suggestion")
    public ModelAndView getPlanning(ModelAndView modelAndView, @ModelAttribute PlanningSuggestionInputs inputs, HttpSession session){
        try{
            PlanningSuggestionCriteria criteria = inputs.getCriteria();
            int movieId = 1;
            Planning planning = movieService.getPlanning(movieId, criteria);
            modelAndView.setViewName("movies/planning");
            session.setAttribute("planning", planning);
            session.setAttribute("criteria", criteria);
            modelAndView.addObject("planning", mapper.writeValueAsString(planning));
            modelAndView.addObject("planningObject", planning);
        }catch (Exception e){
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

    @PostMapping("/updatePlanning")
    public String updatePlanning(@RequestParam("planningId") Integer planningId,
                                 @RequestParam("startTimes[]") String[] startTimes,
                                 @RequestParam("endTimes[]") String[] endTimes,
                                 @RequestParam("sceneIds[]") Long[] sceneIds) {
        // retrieve the planning object to update
        MoviePlanning planning = planningService.findById(planningId);

        // iterate over the input arrays to update the planning details
        for (int i = 0; i < sceneIds.length; i++) {
            Long sceneId = sceneIds[i];
            Timestamp startTime = Timestamp.valueOf(startTimes[i]);
            Timestamp endTime = Timestamp.valueOf(endTimes[i]);

            // find the corresponding planning detail object for the scene ID
            MoviePlanningDetails planningDetails = planning.getMoviePlanningDetails().stream()
                    .filter(pd -> pd.getScene().getId().equals(sceneId))
                    .findFirst()
                    .orElseThrow(() -> new RuntimeException("Invalid scene ID"));

            // update the start and end times of the planning detail object
            planningDetails.setTimestampStart(startTime);
            planningDetails.setTimestampEnd(endTime);
        }

        // save the updated planning object
        planningService.save(planning);

        return "redirect:/planning/" + planningId;
    }
}
