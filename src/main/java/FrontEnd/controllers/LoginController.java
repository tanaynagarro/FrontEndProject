package FrontEnd.controllers;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import FrontEnd.Services.EmployeeService;
import FrontEnd.Services.UserService;
import FrontEnd.models.Employee;
import FrontEnd.models.User;


@RestController
public class LoginController {

	
	@Autowired
	private UserService service;
	
	@Autowired
	private EmployeeService empservice;
	
    @RequestMapping("/")
	public ModelAndView home() {
		return new ModelAndView("login");
	}
 
	 @PostMapping(value = "/authenticate")
	 public ModelAndView authenticate( User user){	
		  String username = user.getUsername();
		  String password = user.getPassword();
		  ModelAndView modelView = new ModelAndView();
		  if(service.authenticate(username, password)){	
			  modelView.addObject("hrmId", username);
			  List<Object> emplist = empservice.getUsers();
			  modelView.addObject("employees", emplist);
			  modelView.setViewName("success");
			  return modelView;
		  	}
		  else{
	    		modelView.addObject("errorMessage", "Invalid UserName or Password");
	    		modelView.setViewName("login");
	    	}
		  return modelView;
	 }
	 
	 
	 
	@RequestMapping("/SignOut")
	public ModelAndView signOut() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("logoutMessage", "You have successfully logged out!");
		mv.setViewName("login");
		return mv;
	}
	  
}
