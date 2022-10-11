<%@ include file="conn.jsp"%>
<%@page import="java.util.Date"%>
<%
Connection con1 = null;
%>
<%
try 
{
System.out.println("\n>>>>>$$$$$$$$$$$$$>>>In AjaxClaimEnq.jsp>>>>>>>>>>>>>>>>");	
Class.forName(DB_Driver);
con1 = DriverManager.getConnection(DB_NAME, DB_USERNAME,DB_PASSWORD);
Statement stmt1 = con1.createStatement();

String Buffer="";
String Empname=request.getParameter("name");
System.out.println(">>>>>Name:"+Empname);


String select="select * from "+session.getAttribute("CompanyMasterID").toString()+"security where EmpName='"+Empname+"' and Dept='Marketing'";
ResultSet rs= stmt1.executeQuery(select);
while(rs.next())
{
	Buffer="ZZ"+rs.getString("UserName");
	Buffer+="ZZ"+rs.getString("email");
	Buffer+="ZZ"+rs.getString("mobileno");
	Buffer+="ZZ"+rs.getString("Password");
    Buffer+="ZZ"+rs.getString("UserLevel");
	Buffer+="ZZ"+rs.getString("TALevel");
	
	System.out.println("-------Buffer:"+Buffer);
}
String Buffer1="Yes"+Buffer;
out.println("Yes"+Buffer);

}
catch(Exception e)
{
}
%>