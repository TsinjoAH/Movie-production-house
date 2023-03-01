package com.management.movie.controllers;

import com.management.movie.models.Movie;
import com.management.movie.models.scene.Scene;
import com.management.movie.models.scene.SceneFilter;
import com.management.movie.models.scene.SceneReturn;
import com.management.movie.models.scene.view.SceneInput;
import com.management.movie.services.SceneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class SceneController {

    @Autowired
    SceneService sceneService;

    @GetMapping("/scene/create")
    public ModelAndView loadCreateForm(ModelAndView modelAndView){
        modelAndView.addObject("sceneForm", sceneService.getInputSceneForm());
        modelAndView.setViewName("scenes/create-scene");
        return modelAndView;
    }

    @PostMapping("/scene/create")
    public ModelAndView create(@ModelAttribute SceneInput sceneInput, HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        try{
            System.out.println(sceneInput.getScence());
            Scene scene = sceneInput.getScence();
            Movie movie = new Movie();
            movie.setId(1);
            scene.setMovie(movie);
            sceneService.save(scene);
        }catch (Exception e){
            e.printStackTrace();
            modelAndView.addObject("error", e.getMessage());
            return loadCreateForm(modelAndView);
        }
        return loadCreateForm(modelAndView);
    }

    @GetMapping("/scene/update")
    public ModelAndView loadUpdateForm (ModelAndView model, @RequestParam Integer sceneId){
        model.addObject("scene", sceneService.findById(sceneId));
        model.addObject("sceneForm", sceneService.getInputSceneForm());
        model.setViewName("update-scene");
        return model;
    }

    @PostMapping("/scene/update")
    public ModelAndView update (@ModelAttribute SceneInput sceneInput, @RequestParam Integer sceneId, HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        try{
            Scene scene = sceneInput.getScence();
            Movie movie = new Movie();
            movie.setId(1);
            scene.setMovie(movie);
            sceneService.update(scene, sceneId);
        }catch (Exception e){
            e.printStackTrace();
            modelAndView.addObject("error", e.getMessage());
            return loadUpdateForm(modelAndView, sceneId);
        }
        return loadUpdateForm(modelAndView, sceneId);
    }

    @GetMapping("/scene/filter")
    public ResponseEntity<?> list(SceneFilter sceneFilter){
        SceneReturn sceneReturn=new SceneReturn();
        sceneReturn.setSceneList(sceneService.list(sceneFilter));
        sceneReturn.setSceneFilter(sceneFilter);
        return new ResponseEntity<>(sceneReturn, HttpStatus.OK);
    }
}
