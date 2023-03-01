package com.management.movie.models;

import com.spring.hibernate.dao.Filter;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;

import java.util.List;

@Getter
@Setter
public class CharacterFilter extends Filter {
    Movie movie;
    @Override
    public List<Criterion> getConditions() {
        return null;
    }

    @Override
    public List<Order> getOrders() {
        return null;
    }

    @Override
    public int getPageSize() {
        return 10;
    }
}
