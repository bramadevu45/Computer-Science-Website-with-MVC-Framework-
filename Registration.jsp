<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Data</title>
</head>
<style>
div.ex {
	text-align: right width:300px;
	padding: 10px;
	border: 5px solid grey;
	margin: 0px
}
</style>
<script type="text/javascript">
            function validate()
            {
                var usermail = document.getElementById("usermail");
                var password = document.getElementById("password").value;
                var cpassword= document.getElementById("cpassword").value;
                var valid=true;
                if(password!=cpassword)
                    {
                        alert("Password didn't match");
                       valid=false;
                    }   
                        
                    
               
                return valid;
                
            };

        </script>
<body onload="hidedisplay()">
      <img align="middle" src="img/Logo.jpg" alt="" width="800" height="100" border="1"/ align="center"></h1>
	
	<div class="ex" align center>
	  <h1>Registration </h1>
<%
String ErrorMessage=(String)request.getAttribute("Error");%>
	 

		<form action="RegistrationServlet" method="post" onsubmit="return validate();">
		
			<table style="Justify" 	"width: 50%">
			    
			    
				<tr>
				
				
  				<input type="radio" name="type" value="faculty" id="ft"> Faculty
  				<input type="radio" name="type" value="staff"> Staff
				
				</tr>
				<tr>
					<td>First Name</td>
					<td><input type="text" name="Fname" id="Fname" /></td>
				</tr>
				<tr>
					<td>Last Name</td>
					<td><input type="text" name="Lname" id="Lname" required/></td>
				</tr>
				<tr>
					<td>Net ID </td>
					<td><input type="text" name="netID" required/></td>
				</tr>
				
				<tr>
					<td>Password</td>
					<td><input type="password" name="password" id="password" /></td>
				</tr>
				<tr>
					<td>Confirm Password</td>
					<td><input type="password" name="cpassword" id="cpassword"/></td>
				</tr>
				<tr><p style="Color:red"><%if(ErrorMessage!=null){%>
				<red><%=ErrorMessage %></red>
				<%} %></p></tr>
			</table>
			<input type="submit" value="register" />
		</form>
	</div>
</body>
</html>