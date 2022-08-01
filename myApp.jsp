<%@page import="java.sql.*" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>



<%
String gender = request.getParameter("gender");
String prefer = request.getParameter("preferences");
String loc = request.getParameter("location");


try {
	//1.loading the driver
	Class.forName("com.msql.jdbc.Driver");
	
	//2.this is where we can also  make the (connection to the mysql Database) within the try
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/customer","root","");
	//3.creating statements
	//we use object for the Connection (conn) to create statements
	Statement st = conn.createStatement();
	//4. Run the query
	st.executeUpdate("INSERT INTO customer(gender,preferences,location) VALUES('"+gender+"','"+prefer+",'"+loc+")");
	//r=st.executeQuery("select *from customer");
	
	}catch (SQLException e){
		out.println("Error "+e.getMessage());
	}
	%>