package com.management.movie.controllers;

import com.management.movie.services.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MovieController {

    @Autowired
    MovieService service;

    @GetMapping("/planning")
    public ResponseEntity<?> getPlanning () {
        return ResponseEntity.ok(service.getPlanning(1));
    }

}
