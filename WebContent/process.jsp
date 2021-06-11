<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Process.jsp</title>
</head>
<body>
<%@ page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>

<%
 	String db = "jsp";
 	String user = "root"; 
 	String pass = "admin";
  
  try {
	java.sql.Connection con;
    Class.forName("org.mariadb.jdbc.Driver").newInstance();
    con = DriverManager.getConnection("jdbc:mysql://localhost/"+db, user, pass);

	String url = request.getParameter("url_field");
	
	if(url!=null){
		String query = "INSERT INTO `jsp`.`url`(`original_url`)	VALUES('"+url+"');";

		con.createStatement().executeQuery(query);
		
		query = "SELECT id FROM jsp.url WHERE original_url='"+url+"'";
		ResultSet result = con.createStatement().executeQuery(query);
		
		if(result.next()){
			String id = String.valueOf(result.getInt("id"));
			String redirectURL = "index.jsp?id="+id;
        	response.sendRedirect(redirectURL);
		}	
		else
			out.println("Error: error fetching id of inserted url")	;	
	}

}   
  catch(SQLException e) {
    out.println("SQLException caught: " +e.getMessage());
  }
%>

</body>
</html>