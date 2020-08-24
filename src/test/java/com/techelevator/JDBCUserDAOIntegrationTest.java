package com.techelevator;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.sql.SQLException;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.techelevator.model.JDBCUserDAO;
import com.techelevator.model.User;
import com.techelevator.security.PasswordHasher;

@Component
public class JDBCUserDAOIntegrationTest extends DAOIntegrationTest {
	PasswordHasher hashMaster = new PasswordHasher();
	
	@Autowired	
	private JDBCUserDAO userDAO;
	String userName = "user";
	String password = "0123456789Abcde";

//	@Before
//	public void setup() {
//		userDAO = new JDBCUserDAO(dataSource, hashMaster);
//		userDAO.saveUser(userName, password);
//	}
	
	@Test 
	public void test_search_for_username_and_password() {
		boolean results = userDAO.searchForUsernameAndPassword(userName, password);
		assertTrue(results);
		assertNotNull(results);
		assertEquals(true, results);
	}
	
	@Test
	public void test_get_user_by_user_name() {
		Object results = userDAO.getUserByUserName(userName);
		assertNotNull(results);
		assertEquals("user", results);
	}
}
 



