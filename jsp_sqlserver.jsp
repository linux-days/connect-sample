
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DB Connection Test</title>
</head>
<body>
<%
String DB_URL = "jdbc:sqlserver://아이피:1433;DataBaseName=데이터베이스명";
String DB_USER = "아이디"; 
String DB_PASSWORD= "비밀번호";
Connection conn;
Statement stmt;
try {
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    stmt = conn.createStatement();
    conn.close();
    out.println("MsSql jdbc test: connect ok!!");
} catch(Exception e) {
    out.println("[ERROR] "+e.getMessage());
}
%>
</body>
</html>