package com.management.movie.models.scene;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.Hibernate;

import java.util.List;

@Getter
@Setter
public class SceneReturn {
    private SceneFilter sceneFilter;
    private List<Scene> sceneList;

}
