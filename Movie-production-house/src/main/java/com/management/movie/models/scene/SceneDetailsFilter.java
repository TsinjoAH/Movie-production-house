package com.management.movie.models.scene;

import com.spring.hibernate.dao.Filter;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class SceneDetailsFilter extends Filter {
    private Scene scene;
    @Override
    public List<Criterion> getConditions() {
        List<Criterion> conditions=new ArrayList<>();
        if(scene!=null){
            conditions.add(Restrictions.eq("scene",scene));
        }
        return conditions;
    }

    @Override
    public List<Order> getOrders() {
        List<Order> orders=new ArrayList<>();
        orders.add(Order.asc("id"));
        return orders;
    }

    @Override
    public int getPageSize() {
        return 0;
    }
}
