package com.management.movie.controllers;

import com.management.movie.models.planning.view.PlanningSuggestionInputs;
import com.management.movie.services.MovieSetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PlanningController {

    @Autowired
    MovieSetService movieSetService;

    @GetMapping("planning/form")
    public ModelAndView getFormPlanning(ModelAndView modelAndView) {
        modelAndView.addObject("movieSets", movieSetService.getAll() );
        modelAndView.setViewName("movies/form-planning");
        return modelAndView;
    }

    @PostMapping("/planning/suggestion")
    public ModelAndView getPlanning(ModelAndView modelAndView, @RequestBody PlanningSuggestionInputs inputs){
        System.out.println(inputs);
        return modelAndView;

    }
}
