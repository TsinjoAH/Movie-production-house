package com.management.movie.models;

import com.management.movie.models.common.HasName;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.util.List;

@Entity
@Table(name = "movie_character")
@Getter
@Setter
public class MovieCharacter extends HasName {

    @ManyToOne
    @JoinColumn(name = "movie_id")
    private Movie movie;

    @Override
    public void setId(Integer id) throws Exception {
        this.id = id ;
    }

    public static String characterList(List<MovieCharacter> movieCharacters){
        //concat the characters from movieCharacters
        StringBuilder characters = new StringBuilder();
        int i= 0;
        for (MovieCharacter character : movieCharacters) {
            if(i< movieCharacters.size()-1){
                characters.append(character.getName()).append(", ");
            }
            else{
                characters.append(character.getName());
            }
            i++;
        }
        return characters.toString();
    }
}
