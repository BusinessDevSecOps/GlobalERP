<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" import="java.text.*" import="java.util.Calendar"%>

	<% 
	String DB_Driver1="org.gjt.mm.mysql.Driver";
	String DB_NAME12="jdbc:mysql://164.68.105.216:3306/db_gps";
	String DB_USERNAME1="fleetview";
	String DB_PASSWORD1="1@flv";
    	try {
		String abc = session.getAttribute("user").toString();

	} catch (Exception ee) {
		response.sendRedirect("index.jsp?err=err2");
		return;
	}
%>
