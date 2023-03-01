package com.management.movie.models.common;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@MappedSuperclass
@Getter
@Setter
public class HasId {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    protected Integer id;

    public HasId() {
    }

    public HasId(Integer id) throws Exception {
        setId(id);
    }

    public void setId(Integer id) throws Exception {
        if(id == null){
            throw new Exception(getClass().getSimpleName()+" id is required.");
        }
        this.id = id;
    }
}
