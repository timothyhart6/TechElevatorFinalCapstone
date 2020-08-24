package com.techelevator.model;

import java.util.List;

public interface ForumDAO {

	public void saveQuestion(String userName, String representative, String topic, String question);
	public List<Question> getQuestionsByUserName(String userName);
	
}
