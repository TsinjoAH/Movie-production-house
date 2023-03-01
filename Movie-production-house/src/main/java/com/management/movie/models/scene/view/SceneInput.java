package com.management.movie.models.scene.view;

import com.management.movie.models.scene.Scene;
import com.management.movie.models.scene.SceneDetails;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class SceneInput {
    private Integer movieSet;
    private Integer idealHour;
    private String sceneNumber;
    private List<Integer> characters;
    private List<Integer> feelings;
    private List<String> scripts;
    private List<Double> durations;

    public Scene getScence() throws Exception {
        Scene scene = new Scene(movieSet, idealHour, sceneNumber);
        List<SceneDetails> details = new ArrayList<>();

        for (int i = 0; i < characters.size(); i++) {
            details.add(new SceneDetails(characters.get(i), feelings.get(i),
                    scripts.get(i), durations.get(i)));
        }
        scene.setSceneDetails(details);
        return scene;
    }
}
