package com.management.movie.models;

import com.management.movie.models.common.HasId;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "scene_details")
@Getter
@Setter
public class SceneDetails extends HasId {

    @ManyToOne
    @JoinColumn(name = "character_id")
    private MovieCharacter character;

    @ManyToOne
    @JoinColumn(name = "feeling_id")
    private Feeling feeling;

    @Column
    private String script;

    @Column
    private Double duration;

    @ManyToOne
    @JoinColumn(name = "scene_id")
    private Scene scene;
}
