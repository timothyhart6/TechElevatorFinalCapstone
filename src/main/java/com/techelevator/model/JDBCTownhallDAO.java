package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCTownhallDAO implements TownhallDAO {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCTownhallDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Townhall> getAllTownhalls(String states) {
		
		List<Townhall> allTownhalls = new ArrayList<Townhall>();
		String sqlGetAllTownhalls = "SELECT * FROM townhall WHERE states = ?";
		System.out.println("states" + states);
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllTownhalls, states);
		while (results.next()) {
			Townhall townhall = mapRowToTownhall(results);
			allTownhalls.add(townhall);
		}
		
		return allTownhalls;
	}
	
	private Townhall mapRowToTownhall(SqlRowSet results) {
		Townhall townhall;
		townhall = new Townhall();
		townhall.setStates(results.getString("states"));
		townhall.setRepresentative(results.getString("representative"));
		townhall.setDistrict(results.getString("district"));
		townhall.setDates(results.getString("dates"));
		townhall.setTimes(results.getString("times"));
		townhall.setAddress(results.getString("address"));
		
		return townhall;
	}

	@Override
	public List<Townhall> getAllTownhalls() {
		// TODO Auto-generated method stub
		return null;
	}

}
