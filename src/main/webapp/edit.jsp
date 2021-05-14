<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Page</title>
<style type="text/css">
fieldset.scheduler-border {
    border: 1px groove #ddd !important;
    padding: 0 1.4em 1.4em 1.4em !important;
    margin: 0 0 1.5em 0 !important;
    -webkit-box-shadow:  0px 0px 0px 0px #000;
            box-shadow:  0px 0px 0px 0px #000;
}

legend.scheduler-border {
    width:inherit; /* Or auto */
    padding:0 10px; /* To give a bit of padding on the left and right */
    border-bottom:none;
}
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript">
function validateform(){  
var inputText=document.myform.empDOB.value;  
  var dateformat = /^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/;
  // Match the date format through regular expression
  if(inputText.match(dateformat))
  {
  document.myform.text1.focus();
  //Test which seperator is used '/' or '-'
  var opera1 = inputText.split('/');
  var opera2 = inputText.split('-');
  lopera1 = opera1.length;
  lopera2 = opera2.length;
  // Extract the string into month, date and year
  if (lopera1>1)
  {
  var pdate = inputText.split('/');
  }
  else if (lopera2>1)
  {
  var pdate = inputText.split('-');
  }
  var dd = parseInt(pdate[0]);
  var mm  = parseInt(pdate[1]);
  var yy = parseInt(pdate[2]);
  // Create list of days of a month [assume there is no leap year by default]
  var ListofDays = [31,28,31,30,31,30,31,31,30,31,30,31];
  if (mm==1 || mm>2)
  {
  if (dd>ListofDays[mm-1])
  {
  alert('Invalid date format!');
  return false;
  }
  }
  if (mm==2)
  {
  var lyear = false;
  if ( (!(yy % 4) && yy % 100) || !(yy % 400)) 
  {
  lyear = true;
  }
  if ((lyear==false) && (dd>=29))
  {
  alert('Invalid date format!');
  return false;
  }
  if ((lyear==true) && (dd>29))
  {
  alert('Invalid date format!');
  return false;
  }
  }
  }
  else
  {
  alert("Invalid date format!");
  document.myform.empDOB.focus();
  return false;
  }
  }
</script>
</head>
<body>
    <header style="background-color:lavender; color:#0000A0;">
        <div align="right">
            <form action="SignOut">
            Welcome <c:out value = "${param.hrmId}"/>
			<input type = "submit" value = "Logout"/>
			</form>        
		</div>
		    <br>
		
    </header >
   	<fieldset class="scheduler-border">
    <legend class="scheduler-border">Edit Employee Details</legend>
		<div class = "container">
    <br>

        <form name="myform" action="/updateEmp" method = "post" align="center">
            <div class="row">
                <label class="col-md-6" >Employee Code : </label>
                <input type="text" class="col-md-4" name="empCode" value="<%=request.getParameter("empCode")  %>"readonly>
        	</div>

            <br>
            
            <div class="row">
                    <label class="col-md-6">Employee Name : </label>
                    <input type = "text"  class="col-md-4" name = "empName" value="${param.empName}" required maxlength="100"/>
            </div>
            <br>

                    <div class="row">
                            <label class="col-md-6" >Location : </label>
							<textarea style="overflow:auto;" class="col-md-4" name="empLoc" value="${param.empLoc}"  cols="20" rows="2" required maxlength="500"></textarea>						
					</div>
                    <br>

                    <div class="row">
                            <label class="col-md-6" >E-Mail  : </label>
							<input type = "email" name = "empMail" value="${param.empMail}"  class="col-md-4" required maxlength="100"/>
                    </div>

                    <br>
                    <div class="row">
                            <label class="col-md-6">Date of birth  : </label>
							<input type = "text" name = "empDOB" value="${param.empDOB}"  class="col-md-4" required/> 
                    </div>
                    <br>
                    <div style="margin-left:255px;" >
			 	        <input type = "submit" class="btn btn-primary col-md-1" value = "Save" onclick="return validateform()"/>
                    </div>
                    <div style="margin-left:565px;">
				        <input type="reset" class="btn btn-danger col-md-2" value="Cancel">
                    </div>          
                    <input type = "hidden" name = "hrmId" value = "${param.hrmId}">
                                
  			</form>
            </div>
            </fieldset>
            <footer style="background-color:lavender; color:#0000A0;">
<br>
<br>
<br>
</footer>
</body>
</html>