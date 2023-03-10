package com.management.movie.models.scene;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.management.movie.models.Feeling;
import com.management.movie.models.MovieCharacter;
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
    @JsonIgnore
    private Scene scene;

    public SceneDetails() {
    }


    public SceneDetails(Integer characterId, Integer feelingId, String script, Double duration) throws Exception {
        setCharacter(characterId);
        setFeeling(feelingId);
        setDuration(duration);
        setScript(script);
    }

    public void setCharacter(MovieCharacter character) {
        this.character = character;
    }

    public void setFeeling(Feeling feeling) {
        this.feeling = feeling;
    }

    public void setCharacter(Integer characterId) throws Exception {
        if(characterId != null){
            MovieCharacter character = new MovieCharacter();
            character.setId(characterId);
            this.character = character;
        }
    }

    public void setFeeling(Integer feelingId) throws Exception {
        if(feelingId != null){
            Feeling feeling = new Feeling();
            feeling.setId(feelingId);
            this.feeling = feeling;
        }
    }

    public void setScript(String script) throws Exception {
        if(script == null || script.trim().equals("")){
            throw new Exception("Script is required when creating an action .");
        }
        this.script = script;
    }

    public void setDuration(Double duration) throws Exception {
        if(duration == null || duration <= 0 || duration.isNaN()){
            throw new Exception("Duration is required when creating an action.");
        }
        this.duration = duration;
    }
}
