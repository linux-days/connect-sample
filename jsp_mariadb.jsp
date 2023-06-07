<%@ page import="java.sql.*" contentType="text/html; charset=UTF-8" %>
<%
String DB_URL = "jdbc:mariadb://127.0.0.1:3306/디비";
String DB_USER = "아이디";
String DB_PASSWORD= "비번";
Connection conn;
Statement stmt;
try
{
 Class.forName("org.mariadb.jdbc.Driver");
 conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
 stmt = conn.createStatement();
 conn.close();																		  
 out.println("mariadb jdbc test: connect ok!!");
}
catch(Exception e)
{
 out.println(e.getMessage());
}
%>
