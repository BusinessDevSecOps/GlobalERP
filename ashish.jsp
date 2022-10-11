<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.text.*" %>
    <%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int customerCode=0;	
//String repName=request.getParameter("repName");       
//String vendor=request.getParameter("vendorcode");
System.out.println("VENDOR CODE  IS *****************     "+vendor);

String companyName=request.getParameter("companyName");    
System.out.println("COMPANY IS *****************     "+companyName);
String companyafteredit=request.getParameter("companyNameafteredit");
System.out.println("COMPANY AFTER EDIT IS      *****************     "+companyafteredit);

String contactPerson=request.getParameter("contactPerson");  
System.out.println("CONTACT PERSON  IS      *****************     "+contactPerson);

String website=request.getParameter("website");              
String email=request.getParameter("email");                  

String zip=request.getParameter("zip");             
String state=request.getParameter("state");         
String country=request.getParameter("country");     
String phone=request.getParameter("ph");         
String fax=request.getParameter("fax");             
String category=request.getParameter("category");   
String product=request.getParameter("product");              
String weeklyOffOn=request.getParameter("weeklyOffOn");      
String alternateNumber=request.getParameter("alternateNumber");  
String address=request.getParameter("address");
String date=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
String mobile=request.getParameter("phone");//
String mobile1=request.getParameter("mobileno1");
String mobile2=request.getParameter("mobileno2");
String logo=request.getParameter("element_4"); 

String stdCode=request.getParameter("std"); 
String addedOn=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
String potentialValue=request.getParameter("potentialValue").toString().replaceAll(",","");
String comments=request.getParameter("comments").replaceAll("'"," ");
String assignedBy=request.getParameter("assignedBy");
String leadRef=request.getParameter("leadRef");
String noofunits=request.getParameter("noofunits");
System.out.println("UNITS ARE *********      "+noofunits);
String dateTime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
%>
</body>
</html>