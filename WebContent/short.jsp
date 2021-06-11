<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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

	String id = request.getParameter("id");
	
	if(id!=null){
		String query = "SELECT original_url FROM jsp.url WHERE id='"+id+"'";
		ResultSet result = con.createStatement().executeQuery(query);
		
		if(result.next()){
			String original_url = result.getString("original_url");
        	response.sendRedirect(original_url);
		}	
		else
			out.println("Error: error fetching url of id.")	;	
	}

}   
  catch(SQLException e) {
    out.println("SQLException caught: " +e.getMessage());
  }
%>
</body>
</html>