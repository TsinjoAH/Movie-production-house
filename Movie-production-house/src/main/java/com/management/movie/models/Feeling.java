package com.management.movie.models;

import com.management.movie.models.common.HasName;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;

@Entity
@Getter
@Setter
public class Feeling extends HasName {
    @Override
    public void setId(Integer id) throws Exception {
        this.id = id;
    }
}
