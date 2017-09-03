<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  import javax.servlet.*; import javax.servlet.http.*; import java.sql.*; -->
<%@ page import ="javax.sql.*" %>
<%@page import ="java.sql.*" %>
<%@page import ="java.io.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
try{

String userid = request.getParameter("uname");    
String pwd = request.getParameter("pass");

Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parklot","root","root");

if(userid !=null && pwd !=null){
	
	Statement st= con.createStatement();
	ResultSet rs=st.executeQuery("select * from logintable where userid='" + userid + "' and password='" + pwd + "'");
	if (rs.next()) {
	    out.println("welcome " + userid);
	    response.sendRedirect("admin.jsp");
	} else {
	    out.println("Invalid username or password <a href='Index.jsp'>try again</a>");
	}	
}

else{
	out.println("please enter a valid user id and password");
}
con.close();
}
catch(SQLException e){
  out.println("error occured"+e.getMessage());
}

%> 
</body>
</html>