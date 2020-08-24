package com.techelevator.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;

import java.util.List;


import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.model.ForumDAO;
import com.techelevator.model.Question;
import com.techelevator.model.State;
import com.techelevator.model.Townhall;
import com.techelevator.model.TownhallDAO;
import com.techelevator.model.User;
import com.techelevator.model.UserDAO;


@Controller
@SessionAttributes("selectedState")

public class mainController {
	
	@Autowired
	private TownhallDAO townhallDAO;
	
	@Autowired
	private ForumDAO forumDAO;
	

	@RequestMapping("/")
	public String displayHomePage() {
		return "main"; 
	}
	
	@RequestMapping("/main")
	public String displayMainPage(ModelMap model) {
		return "main";
	}

	@RequestMapping(path="/stateInput", method=RequestMethod.GET)
	public String displayState(@RequestParam String state, ModelMap model) {
		model.addAttribute("selectedState", state);
		return "/state"; // <---- the jsp, not the js
	}
	
	
	@RequestMapping(path="/state", method=RequestMethod.GET)
	public String displayStatePage(@RequestParam String locationName, ModelMap map) {
		List<Townhall> townhalls = townhallDAO.getAllTownhalls(locationName);
		map.addAttribute("townhalls", townhalls);
		return "/state";
	}
	
	@RequestMapping("/district")
	public String displayDistrictPage(ModelMap map) {
		return "/district";
	}
	
	@RequestMapping(path="/districtInput", method=RequestMethod.GET)
	public String displayDistrictInput (@RequestParam String address,
										@RequestParam String apt, 
										@RequestParam String city, 
										@RequestParam String state, 
										@RequestParam int zipCode ) {
		return "/district";
	}
	
	@RequestMapping (path="/users/{userUrl}/messages/new", method=RequestMethod.GET)
	public String displayAskQuestion(HttpSession session, @PathVariable String userUrl) {
		session.getAttribute("currentUser");
		return "askQuestion";
	}
	@RequestMapping (path="/users/{forumUrl}/messages", method=RequestMethod.GET)
	public String displayForum(ModelMap map, HttpSession session, @PathVariable String forumUrl) {
		 User user = new User();
		 user = (User) session.getAttribute("currentUser");
		map.addAttribute("userQuestions", forumDAO.getQuestionsByUserName(user.getUserName()));
		return "forum";
	}
	
	@RequestMapping(path="/submit", method=RequestMethod.POST)
	public String displayForumFromQuestionPage(
											   ModelMap map,
											   HttpSession session,
											   @RequestParam String representative,
								   			   @RequestParam String topic,
								   			   @RequestParam String question) {
		 User user = new User();
		 user = (User) session.getAttribute("currentUser");
		 
		
		forumDAO.saveQuestion(user.getUserName(), representative, topic, question);
		
		return "redirect:/";
	}
	
	
	
	
	@RequestMapping (path="/forum", method=RequestMethod.GET)
	public String displayForum(ModelMap map, HttpSession session) {

		return "forum";
	}

//	@RequestMapping(path="/submit", method=RequestMethod.POST)
//	public String displayAskQuestionPage(Model model) {
//		return "redirect:/forum";
//	}
	
	@RequestMapping(path="/terms", method=RequestMethod.GET)
	public String displayTerms() {
		return "terms";
	}
	
	@RequestMapping(path="/copyright", method=RequestMethod.GET)
	public String displayCopyright() {
		return "copyright";
	}
	
	@RequestMapping(path="/cookies", method=RequestMethod.GET)
	public String displayCookies() {
		return "cookies";
	}
}
	
	