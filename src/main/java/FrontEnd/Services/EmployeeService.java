package FrontEnd.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import FrontEnd.models.Employee;

@Service
public class EmployeeService {
	
	@Autowired
	private RestTemplate restTemplate;
	
	//For Getting List Of Employees
    public List<Object> getUsers()
    {
    	String url="http://localhost:8090";
    	List userList = restTemplate.getForObject(url, List.class);
    	return userList;
    }
    
	//For Adding New Employee
    public String  addEmployee(Employee emp)
    {
    	String url="http://localhost:8090";
    	String Resp="Error";
    	ResponseEntity<String> responseEntityObj = restTemplate.postForEntity(url, emp, String.class);
		
    	if(responseEntityObj.getStatusCodeValue()==200) {
    		Resp=responseEntityObj.getBody();
    	}
    	return Resp;    	
    }
    
    //For updating existing Employee
    public void updateEmployee(Employee emp)
    {
    	String url="http://localhost:8090";
    	
    	restTemplate.put(url, emp);
    	
    }
    
    

}
