package com.management.movie.controllers;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.management.movie.services.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class MovieController {

    @Autowired
    MovieService service;

    ObjectMapper mapper = new ObjectMapper();

    @GetMapping("/planning")
    public ModelAndView getPlanning () throws Exception {
        int id = 1;
        ModelAndView view = new ModelAndView("movies/planning");
        view.addObject("planning", mapper.writeValueAsString(service.getPlanning(id)));
        return view;
    }

}
