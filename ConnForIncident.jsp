<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" import="java.text.*" import="java.util.Calendar" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Transworld</title>
</head>
<body>
<%
Connection conn=null;
try
{
Class.forName("org.gjt.mm.mysql.Driver");
//conn=DriverManager.getConnection("jdbc:mysql://164.68.105.216/db_leaveapplication","erp","1@erp");
conn=DriverManager.getConnection("jdbc:mysql://164.68.105.216:3306/db_leaveapplication","fleetview","1@flv");
//conn=DriverManager.getConnection("jdbc:mysql://164.68.105.216/db_leaveapplication","fleetview","1@flv");
}
catch(Exception e)
{
	System.out.println("Exception=========>>"+e);
}
%>
</body>
</html>