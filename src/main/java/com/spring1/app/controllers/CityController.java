package com.spring1.app.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring1.app.models.City;
import com.spring1.app.repositories.CityInterface;
import com.spring1.app.services.CityService;

@RestController
@RequestMapping("/city")
public class CityController {
	
	
	//private CityInterface cityInterface;
	@Autowired
	private CityService cityService;
	
	@GetMapping()
	public List<City> listCities(){
		//return (List<City>)cityInterface.findAll();
		return cityService.listCites();
	}
	
	
	
}
