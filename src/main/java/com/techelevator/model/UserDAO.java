package com.techelevator.model;

public interface UserDAO {

	public void saveUser(String userName, String password, String address, String apt, String city, String state, String zipCode);

	public boolean searchForUsernameAndPassword(String userName, String password);

	public void updatePassword(String userName, String password);

	public Object getUserByUserName(String userName);

}
