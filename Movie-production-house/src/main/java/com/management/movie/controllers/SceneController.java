package com.management.movie.controllers;

import com.management.movie.models.Movie;
import com.management.movie.models.MovieCharacter;
import com.management.movie.models.MovieSet;
import com.management.movie.models.scene.*;
import com.management.movie.models.scene.view.SceneInput;
import com.management.movie.services.CharacterService;
import com.management.movie.services.MovieSetService;
import com.management.movie.services.SceneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.sql.Time;
import java.util.List;
import java.util.Objects;

@Controller
public class SceneController {

    @Autowired
    SceneService sceneService;

    @Autowired
    CharacterService characterService;

    @Autowired
    MovieSetService movieSetService;

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

    @GetMapping("/scene/update/{sceneId}")
    public ModelAndView loadUpdateForm (ModelAndView model, @PathVariable Integer sceneId){
        model.addObject("scene", sceneService.findById(sceneId));
        model.addObject("sceneForm", sceneService.getInputSceneForm());
        model.setViewName("scenes/update-scene");
        return model;
    }

    @GetMapping("/scene/load")
    public ModelAndView list() throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        Movie movie=new Movie();
        movie.setId(1);
        List<MovieCharacter> characterList=characterService.getByMovie(movie);
        List<MovieSet> movieSetList=movieSetService.getAll();
        modelAndView.addObject("characterList",characterList);
        modelAndView.addObject("movieSetList",movieSetList);
        modelAndView.setViewName("scenes/list");
        return modelAndView;
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

    @GetMapping(value={"","/scenes"})
    public ModelAndView listv2(SceneFilter sceneFilter, @RequestParam(required = false,defaultValue = "",value = "begin") @DateTimeFormat(pattern="HH:mm") String startHour,@RequestParam(required = false,defaultValue = "",value = "end") @DateTimeFormat(pattern="HH:mm") String endHour) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        Movie movie=new Movie();
        movie.setId(1);
        List<MovieCharacter> characterList=characterService.getByMovie(movie);
        List<MovieSet> movieSetList=movieSetService.getAll();
        modelAndView.addObject("characterList",characterList);
        modelAndView.addObject("movieSetList",movieSetList);
        modelAndView.addObject("sceneReturn", sceneService.getSceneReturn(sceneFilter, startHour, endHour));
        modelAndView.setViewName("scenes/list");
        return modelAndView;
    }

    @GetMapping("/test-ajax")
    public ModelAndView listTestAjax(SceneFilter sceneFilter, @RequestParam(required = false,defaultValue = "",value = "begin") @DateTimeFormat(pattern="HH:mm") String startHour,@RequestParam(required = false,defaultValue = "",value = "end") @DateTimeFormat(pattern="HH:mm") String endHour) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        Movie movie=new Movie();
        movie.setId(1);
        List<MovieCharacter> characterList=characterService.getByMovie(movie);
        List<MovieSet> movieSetList=movieSetService.getAll();
        modelAndView.addObject("characterList",characterList);
        modelAndView.addObject("movieSetList",movieSetList);
        modelAndView.addObject("sceneReturn", sceneService.getSceneReturn(sceneFilter, startHour, endHour));
        modelAndView.setViewName("scenes/list-ajax");
        return modelAndView;
    }

    @PostMapping("/scenes-ajax")
    public @ResponseBody SceneReturn listAjax(@RequestBody  SceneFilter sceneFilter, @RequestParam(required = false,defaultValue = "",value = "begin") @DateTimeFormat(pattern="HH:mm") String startHour,@RequestParam(required = false,defaultValue = "",value = "end") @DateTimeFormat(pattern="HH:mm") String endHour) throws Exception {
        return sceneService.getSceneReturn(sceneFilter, startHour, endHour);
    }

    @GetMapping("/scenes/plan/{id}")
    public ModelAndView planScene(@PathVariable Integer id, SceneFilter sceneFilter, @RequestParam(required = false,defaultValue = "",value = "begin") @DateTimeFormat(pattern="HH:mm") String startHour,@RequestParam(required = false,defaultValue = "",value = "end") @DateTimeFormat(pattern="HH:mm") String endHour) throws Exception {
        sceneService.updateStatus(id, 20);
        return listv2(sceneFilter, startHour, endHour);
    }

    @GetMapping("/scenes/ongoing-plan/remove/{id}")
    public String removeFromOnGoinPlan(@PathVariable Integer id) throws Exception {
        sceneService.updateStatus(id, 10);
        return "redirect:/planning/form";
    }

    @GetMapping("/data/scenes/list")
    public ResponseEntity<?> listScene() throws Exception {
        List<Scene> sceneList=sceneService.getNotPlannified();
        Movie movie=new Movie();
        movie.setId(1);
        List<MovieCharacter> characterList=characterService.getByMovie(movie);
        SceneActor sceneActor=new SceneActor();
        sceneActor.setActors(MovieCharacter.characterList(characterList));
        sceneActor.setScenes(sceneList);
        return new ResponseEntity<>(sceneActor, HttpStatus.OK);
    }
}
