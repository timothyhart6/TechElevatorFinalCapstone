package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;


@Component
public class JDBCForumDAO  implements ForumDAO{
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCForumDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public void saveQuestion(String userName, String representative, String topic, String question) {
		jdbcTemplate.update("insert into forum_questions (user_name, representative_name, topic, question)\n" + 
				"values (?, ?, ?, ?);",
				userName, representative, topic, question);
		
	}

	@Override
	public List<Question> getQuestionsByUserName(String userName) {
		List<Question> forumQuestions = new ArrayList<Question>();
		String sqlQuery= "SELECT * FROM forum_questions WHERE user_name = ?";
		SqlRowSet result =jdbcTemplate.queryForRowSet(sqlQuery, userName);
		while(result.next()) {
			forumQuestions.add(mapRowToQuestionObject(result));
		}
		return forumQuestions;
	
	}
	
	private Question mapRowToQuestionObject(SqlRowSet result) {
		Question question = new Question();
		question.setUserName(result.getString("user_name"));
		question.setRepresentative(result.getString("representative_name"));
		question.setTopic(result.getString("topic"));
		question.setQuestion(result.getString("question"));
		return question;	
	}




}
