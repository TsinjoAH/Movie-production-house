package com.management.movie.controllers;

import com.management.movie.models.scene.Scene;
import com.management.movie.models.scene.SceneFilter;
import com.management.movie.models.scene.SceneReturn;
import com.management.movie.services.SceneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/scenes")
public class SceneController {
    @Autowired
    SceneService sceneService;

//    @GetMapping
//    public ModelAndView list(@ModelAttribute SceneFilter sceneFilter){
//        ModelAndView modelAndView = new ModelAndView();
//        List<Scene> sceneList=sceneService.list(sceneFilter);
//        modelAndView.addObject("scenes",sceneList);
//        modelAndView.addObject(sceneFilter);
//        modelAndView.setViewName("sceneList");
//        return modelAndView;
//    }

    @GetMapping
    public ResponseEntity<?> list(SceneFilter sceneFilter){
        SceneReturn sceneReturn=new SceneReturn();
        sceneReturn.setSceneList(sceneService.list(sceneFilter));
        sceneReturn.setSceneFilter(sceneFilter);
        return new ResponseEntity<>(sceneReturn, HttpStatus.OK);
    }


}
