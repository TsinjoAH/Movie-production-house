package com.management.movie.models.scene;

import com.management.movie.models.common.HasName;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;

@Getter
@Setter
@Entity(name = "scene_status")
public class SceneStatus extends HasName {

}
