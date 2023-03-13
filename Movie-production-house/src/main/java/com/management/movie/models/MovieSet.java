package com.management.movie.models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.management.movie.models.common.HasName;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "movie_set")
@Getter
@Setter
public class MovieSet extends HasName {
}
