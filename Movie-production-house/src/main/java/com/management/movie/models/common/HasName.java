package com.management.movie.models.common;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
@Getter
@Setter
public class HasName extends HasId {

    @Column
    private String name;


}
