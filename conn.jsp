<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" import="java.text.*" import="java.util.Calendar"%>

	<% 
	String DB_Driver="org.gjt.mm.mysql.Driver";
	//String DB_NAME="jdbc:mysql://164.68.105.216:3306/db_GlobalERP";
	//String DB_NAME="jdbc:mysql://202.65.131.44:3306/db_GlobalERP";
	String DB_NAME="jdbc:mysql://164.68.105.216/db_GlobalERP";
	String DB_NAME1="jdbc:mysql://164.68.105.216/NewBlankERP";
	
	String DB_USERNAME="fleetview";
	String DB_PASSWORD="1@flv";
    //String DB_USERNAME="java";
    //String DB_PASSWORD="transjava!1";
	/*String DB_NAMEPAY="jdbc:mysql://164.68.105.216:3306/db_leaveapplication";*/
	 //String DB_NAMEPAY="jdbc:mysql://202.65.131.44:3306/db_leaveapplication";
	String DB_NAMEPAY="jdbc:mysql://164.68.105.216/db_leaveapplication";
	try {
		String abc = session.getAttribute("user").toString();
	} catch (Exception ee) {
		response.sendRedirect("index.jsp?err=err2");
		return;
	}
%>