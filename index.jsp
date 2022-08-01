<%@page import="java.sql.*" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JSP Page</title>
</head>
<body>

<%
String gender = request.getParameter("gender");
String prefer = request.getParameter("preference");
String loc = request.getParameter("location");
Connection conn = null;
Statement st = null;
ResultSet r= null;
try {
	//1.loading the driver
	Class.forName("com.msql.jdbc.Driver");
	try{
	//2.this is where we can also  make the (connection to the mysql Database) within the try
	 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/customer","root","");
	//3.creating statements
	//we use object for the Connection (conn) to create statements
	st = conn.createStatement();
	//4. Run the query
	//st.executeUpdate("INSERT INTO customer(gender,preferences,location) VALUES('"+gender+"','"+prefer+",'"+loc+")");
	r=st.executeQuery("select *from customer");
			%>
		<table>
			<tr>
			<th>Gender</th>
			<th>preferences</th>
			
			<th>location</th>
			</tr>
			</table>
			<% 
	while (r.next()){
		
		
		
	}
	}catch (SQLException e){
		out.println("Error "+e.getMessage());
		
	
	}
			
	}catch (ClassNotFoundException e){
		e.printStackTrace();
	
	}
%>
</body>
</html>