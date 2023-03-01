package com.management.movie.controllers;

import com.management.movie.models.Movie;
import com.management.movie.models.MovieCharacter;
import com.management.movie.models.MovieSet;
import com.management.movie.models.scene.Scene;
import com.management.movie.models.scene.SceneFilter;
import com.management.movie.models.scene.SceneReturn;
import com.management.movie.models.scene.view.SceneInput;
import com.management.movie.services.CharacterService;
import com.management.movie.services.MovieSetService;
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
import java.util.List;

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

    @GetMapping("/scene/update")
    public ModelAndView loadUpdateForm (ModelAndView model, @RequestParam Integer sceneId){
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

    @GetMapping("/scene/filterv2")
    public ModelAndView listv2(SceneFilter sceneFilter) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        SceneReturn sceneReturn=new SceneReturn();
        Movie movie=new Movie();
        movie.setId(1);
        List<MovieCharacter> characterList=characterService.getByMovie(movie);
        List<MovieSet> movieSetList=movieSetService.getAll();
        modelAndView.addObject("characterList",characterList);
        modelAndView.addObject("movieSetList",movieSetList);
//        List<Scene> sceneList=sceneService.list(sceneFilter);
//        for(Scene scene:sceneList){
//            scene.setMovieCharacters(scene.getMovieCharacters());
//        }
        sceneReturn.setSceneList(sceneService.list(sceneFilter));
        sceneReturn.setSceneFilter(sceneFilter);
        modelAndView.addObject("sceneReturn", sceneReturn);
        modelAndView.setViewName("scenes/list");
        return modelAndView;
    }
}
