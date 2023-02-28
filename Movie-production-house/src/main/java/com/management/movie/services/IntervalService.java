package com.management.movie.services;


import com.management.movie.models.HourInterval;
import com.spring.hibernate.dao.HibernateDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IntervalService {

    @Autowired
    HibernateDao dao;


    public List<HourInterval> findAll () {
        return dao.findAll(HourInterval.class);
    }

}
