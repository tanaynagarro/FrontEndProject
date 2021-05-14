<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<header style="background-color:lavender; color:#0000A0;">
					<center><h2>HR Management System</h2></center>

	</header>
	<div class="container" align="middle">
				<br>
				<div class="row mt-5" > 
				<form action="authenticate" method="post" align="middle">
					<div class="row m-5">
					<label class="col-md-5"  for="name">UserId:</label>

					<input type="text" class="col-md-5"
						name="username" placeholder="Enter Username" required>
					</div>
					<div class="row m-5">
					<label class="col-md-5"  for="name">Password:</label>

					 <input type="password" class="col-md-5"
					name="password" placeholder="Enter Password"
						required><br> 
					</div>
			 <div class="row m-5">
			 	<label class="col-md-5">
				</label>
				<input type="submit"
						class="btn btn-primary col-md-1" value="Login">
          </div>  
        </div>
				</form>
		</div>
				<p
					style="color: crimson; text-align: center; font-weight: bold; font-family: Arial, Helvetica, sans-serif;">
					${errorMessage}</p>
				<p 
					style="color: blue; text-align: center; font-weight: bold; font-family: Arial, Helvetica, sans-serif;">
					${logoutMessage}
				</p>
			</div>
		</div>
	</div>
	<footer style="background-color:lavender; color:#0000A0;">
<br>
<br>
<br>
</footer>
</body>
</html>