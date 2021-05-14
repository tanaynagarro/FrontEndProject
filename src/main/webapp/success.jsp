<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script>

	//For Downloading Employee List
	window.onload = function () {
    document.getElementById("download")
        .addEventListener("click", () => {
            const invoice = this.document.getElementById("invoice");
            console.log(invoice);
            console.log(window);
            var opt = {
                margin: 1,
                filename: 'EmployeeList.pdf',
                jsPDF: { unit: 'in', format: 'a3', orientation: 'landscape' }
            };
            html2pdf().from(invoice).set(opt).save();
        })
	}
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>
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
</head>
<body>
		<header style="background-color:lavender; color:#0000A0;">			
							<form action="SignOut" align="right">
							Welcome <c:out value = "${hrmId}"/>
							<input type = "submit" value = "LogOut"/>
							</form>
								<br>
							
		</header>
	<fieldset class="scheduler-border">
    <legend class="scheduler-border">Employee Listings</legend>		
    
    			 <div align = "right">
					<a href="upload.jsp?hrmId=${hrmId}" > <input
						type="submit" value="Upload Employee Details" />
					</a>
             		<button id="download"> Download Employee Details</button>
					
					</div>
  			
  		
  			<br>
  				<p 
					style="color: blue; text-align: center; font-weight: bold; font-family: Arial, Helvetica, sans-serif;">
					${result}
				</p>
  			<br>
  			<div class="card" id="invoice">
  			
  			<table class = "table table-striped table-bordered table-hover">
  				<tr>
  					<th bgcolor="#000000"><font color="#fff">Employee Code</font></th>
  					<th bgcolor="#000000"><font color="#fff">Employee Name</font></th>
  					<th bgcolor="#000000"><font color="#fff">Location</font></th>
  					<th bgcolor="#000000"><font color="#fff">E-mail</font></th>
  					<th bgcolor="#000000"><font color="#fff">Date Of Birth</font></th>
  					<th bgcolor="#000000"><font color="#fff">Actions</font></th>
  				</tr>
  				<c:forEach items = "${employees}" var = "employee">
				
				<tr class = "emp_row">
  					<td>${employee.empCode}</td>
  					<td>${employee.empName}</td>
  					<td>${employee.empLoc}</td>
  					<td>${employee.empMail}</td>
  					<td>${employee.empDOB}</td>
					<td>
						<form action = "edit.jsp" method = "get">
							<input type = "hidden" name = "hrmId" value = "${hrmId}">
							<input type = "hidden" name = "empCode" value = "${employee.empCode}">
							<input type = "hidden" name = "empName" value = "${employee.empName}">
							<input type = "hidden" name = "empLoc" value = "${employee.empLoc}">
							<input type = "hidden" name = "empMail" value = "${employee.empMail}">
							<input type = "hidden" name = "empMail" value = "${employee.empDOB}">
							<input type = "submit" value = "Edit" >
						</form>
						
					</td>
				</tr>
  			</c:forEach>
  			</table>
  			</div>
		</fieldset>
<footer style="background-color:lavender; color:#0000A0;">
<br>
<br>
<br>
</footer>
</body>
</html>