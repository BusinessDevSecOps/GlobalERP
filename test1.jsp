<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
System.out.println("in test");
try
{
Connection conn = null, cn = null;
Statement st = null, st1 = null, st3 = null, st4 = null;
String DBDriver="org.gjt.mm.mysql.Driver";
String DBNAME="jdbc:mysql://164.68.105.216:3306/db_GlobalERP";
String DBUSERNAME="fleetview";
String DBPASSWORD="1@flv";
Class.forName(DBDriver);
cn = DriverManager.getConnection(DBNAME,DBUSERNAME,DBPASSWORD);
st = cn.createStatement();
ResultSet rs = st.executeQuery("select invoicedate,terms,annexure from "+session.getAttribute("CompanyMasterID").toString()+"invoicedet");
while(rs.next())
{
	Date invoicedate = rs.getDate("invoicedate");
	System.out.println("Date is '"+invoicedate+"'");
	String terms = rs.getString("terms");
	System.out.println("Terms are"+terms);
	String annexure = rs.getString("annexure");
	System.out.println("Annexure is"+annexure);
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	String dt = format.format(invoicedate);
	System.out.println("Date is"+invoicedate);
}
}
catch(Exception e)
{
	System.out.println(e);
}
out.println("Hello");
%>
</body>
</html>