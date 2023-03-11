package com.management.movie.controllers;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.management.movie.models.planning.Planning;
import com.management.movie.models.planning.view.PlanningSuggestionCriteria;
import com.management.movie.models.planning.view.PlanningSuggestionInputs;
import com.management.movie.services.MovieService;
import com.management.movie.services.MovieSetService;
import com.management.movie.services.SceneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class PlanningController {

    @Autowired
    MovieSetService movieSetService;

    @Autowired
    MovieService movieService;

    ObjectMapper mapper = new ObjectMapper();

    @Autowired
    SceneService sceneService;

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
}
