package com.spring1.app.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring1.app.iterfaceServices.CityServiceInterface;
import com.spring1.app.models.City;
import com.spring1.app.repositories.CityInterface;

@Service
public class CityService implements CityServiceInterface{
	
	@Autowired
	private CityInterface cityInterface;
	
	@Override
	public List<City> listCites() {
		return (List<City>) cityInterface.findAll();
	}

}
