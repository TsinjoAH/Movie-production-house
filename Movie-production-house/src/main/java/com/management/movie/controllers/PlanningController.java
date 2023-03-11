package com.management.movie.controllers;

import com.fasterxml.jackson.databind.ObjectMapper;
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
    public ModelAndView getPlanning(ModelAndView modelAndView, @ModelAttribute PlanningSuggestionInputs inputs){
        try{
            PlanningSuggestionCriteria criteria = inputs.getCriteria();
            int movieId = 1;
            modelAndView.setViewName("movies/planning");
            modelAndView.addObject("planning", mapper.writeValueAsString(movieService.getPlanning(movieId, criteria)));
        }catch (Exception e){
            modelAndView.addObject("error", e.getMessage());
            e.printStackTrace();
            return getFormPlanning(modelAndView);
        }
        return modelAndView;

    }
}
