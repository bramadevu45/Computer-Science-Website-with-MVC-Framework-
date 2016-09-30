<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>UALABNY COMPUTER SCIENCE WEBSITE</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	
    <!-- Custom CSS -->
    <link href="css/simple-sidebar.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body onload="hidedisplay()" >

 	<script type="text/javascript">
        function includefile(a) 
        {
        	document.getElementById("a").style.display="block";
        	}
        	
        function hidedisplay()
        {
        	document.getElementById("T1").style.display="none";
        	}
        </script>
    <div id="wrapper">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                   
                </li>
               
                <li>
                    <a href="ResourceReservation.jsp" >Resource Reservation</a>
                </li>
                <li>
                    <a href="StudentCancellation.jsp">Resource Cancellation</a>
                </li>
                <li>
                    <a href="ViewAnnouncement.jsp">Announcements</a>
                </li>
                <li>
                    <a href="ViewCoursesStudent.jsp">View Courses</a>
                </li>
                 
                 <li>
                    <a href="ViewExam.jsp">View Examination</a>
                </li>
                <li>
                    <a href="ExamRegistration.jsp">Exam Registration</a>
                </li>
                <li>
                    <a href="EditProfileServlet">Edit Profile</a>
                </li>
                <li>
                    <a href="StudentDiscussionBoard.jsp">Discussion Board</a>
                </li>
                <li>
                    <a input type="button" value="Click Here"  onclick="includefile(T2)">Contact</a>
                </li>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->
        <div align="right">
                 Welcome,
<%HttpSession session3 = request.getSession(); 
  String sri = (String) session.getAttribute("name");%>
  <%=sri %> 
  <br>
  
  <form action="LogoutServlet" method="post">
  <input type="submit" name="logout" value="Logout">
  </form>
        </div>

        <!-- Page Content -->
        <div>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                       <img src="img/Logo.jpg" alt="" width="somewidthhere" height="someheighthere" border="0"/ >
                        
                        <br>
                        <a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Toggle Menu</a>
                    </div>
                    <div>
                     <li>
                    <a href="Sindex.jsp">HOME</a>
                </li>
                    
                    </div>
                  
                    <div align="right">
                   <li>
                    <a href="ChangePassword.jsp">Change Password</a>
                </li>
                    </div>
                    <script type="text/javascript">
					
					</script>
                </div>
            </div>
        </div>
        <div>
       <% String Status=(String)request.getAttribute("Status");
       String name=(String)request.getAttribute("name"); 
      %>
        
         <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/termproject" user="root" password="" />
  <sql:query dataSource="${snapshot}" var="result">
  <c:set var="empId" value="<%=name %>"/>
   SELECT * from examination Where nameOfExam=  ?;
   <sql:param value="${empId}" />
  
</sql:query>
 <form action="ExamRegistrationServlet" method="post">
<table border="1" width="100%">
<tr>
<th>Name Of examiner</th>
<th>Name of Exam</th>
<th>Date of Exam</th>
<th>Details</th>
<th>Registration Link</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
<td><c:out value="${row.owner}"/></td>
<td><c:out value="${row.nameOfExam}"/></td>
<td><c:out value="${row.dateOfExam}"/></td>
<td><c:out value="${row.details}"/></td>
<%if(Status.contains("Not")){ %>
<td><input type="submit" name="submit" value="Register">
<%} %>
<%if(Status.contains("Registered")) { %>
<td>Already Registered</td>
<%} %>

<input type="hidden" value="${row.nameOfExam}" name="name">


</tr>
</c:forEach>
</table></div>
        
    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Menu Toggle Script -->
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>

</body>

</html>
