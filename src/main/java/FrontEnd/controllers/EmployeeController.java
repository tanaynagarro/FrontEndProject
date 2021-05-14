package FrontEnd.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import FrontEnd.Services.EmployeeService;
import FrontEnd.models.Employee;
import FrontEnd.models.User;

@RestController
public class EmployeeController {

	@Autowired
	private EmployeeService empservice;
	 
	@PostMapping(value="/addEmployee")
	public ModelAndView addEmployee(Employee emp,@RequestParam(value = "hrmId") String hrmId) {
		ModelAndView modelView = new ModelAndView();
			
		  //Adding new Employee
		  String response = empservice.addEmployee(emp);
		  
		  List<Object> emplist = empservice.getUsers();
		  modelView.addObject("hrmId",hrmId);
		  
		  if(response.equalsIgnoreCase("OK"))
		  {
		  modelView.addObject("result", "Added Successfully");
		  modelView.addObject("employees", emplist);
		  modelView.setViewName("success");
		  }
		  
		  else
		  {
			  modelView.addObject("result", "New Employee Not Added");
			  modelView.addObject("employees", emplist);
			  modelView.setViewName("success");
		  }

		  return modelView;

	}
	
	@PostMapping(value="/updateEmp")
	public ModelAndView updateEmp(Employee emp , @RequestParam(value = "hrmId") String hrmId) {
			
		  ModelAndView modelView = new ModelAndView();

		  empservice.updateEmployee(emp);
		
		  List<Object> emplist = empservice.getUsers();
		  
		  modelView.addObject("hrmId",hrmId);
		  
		  modelView.addObject("result", "Changed Successfully");
		  modelView.addObject("employees", emplist);
		  modelView.setViewName("success");
		  return modelView;

	}
}
