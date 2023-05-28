package com.spring1.app.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.spring1.app.models.City;

@Repository
public interface CityInterface extends CrudRepository<City, Integer>{
	
}
