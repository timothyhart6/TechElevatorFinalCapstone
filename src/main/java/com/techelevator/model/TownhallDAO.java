package com.techelevator.model;

import java.util.List;

public interface TownhallDAO {
	
	public List<Townhall> getAllTownhalls();

	List<Townhall> getAllTownhalls(String states);

}
