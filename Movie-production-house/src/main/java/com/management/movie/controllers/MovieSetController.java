package com.management.movie.controllers;

import com.management.movie.models.movieSet.AvailableMovieSets;
import com.management.movie.services.MovieSetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MovieSetController {
    @Autowired
    MovieSetService service;

    @GetMapping("/available-movieset/form")
    public ModelAndView formAvailableMovieSet(ModelAndView modelAndView){
        modelAndView.addObject("movieSets", service.getAll());
        modelAndView.setViewName("/movieset/form-available");
        return modelAndView;
    }


    @PostMapping("/available-movieset/create")
    public ModelAndView insertAvailableMovieSet(@RequestParam Integer movieSet, @RequestParam String minDate,
                                              @RequestParam String maxDate){
        ModelAndView modelAndView = new ModelAndView();
        try{
            service.insertAvailable(new AvailableMovieSets(movieSet, minDate, maxDate));
            modelAndView.setViewName("/movieset/form-available");
        }catch (Exception e){
            modelAndView.addObject("error", e.getMessage());
            return formAvailableMovieSet(modelAndView);
        }
        return modelAndView;
    }


}
