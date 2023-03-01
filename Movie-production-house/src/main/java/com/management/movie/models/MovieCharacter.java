package com.management.movie.models;

import com.management.movie.models.common.HasName;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "movie_character")
@Getter
@Setter
public class MovieCharacter extends HasName {

    @ManyToOne
    @JoinColumn(name = "movie_id")
    private Movie movie;
}
