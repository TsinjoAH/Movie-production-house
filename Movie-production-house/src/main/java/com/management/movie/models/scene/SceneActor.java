package com.management.movie.models.scene;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class SceneActor {
    List<Scene> scenes;
    String actors;
}
