<%@page import="java.io.Flushable" import="java.util.Date"%>
<%@page import="com.sun.org.apache.xalan.internal.xsltc.compiler.sym"%><%@ include file="conn.jsp" %>

<%!
Connection con1;
%>

<% 
session.setAttribute("flag","company");
try 
{
Class.forName(DB_Driver);
con1 = DriverManager.getConnection(DB_NAME,DB_USERNAME,DB_PASSWORD);
Statement stmt1=con1.createStatement();
ResultSet rs1=null;
String sql1="";
String newstring="";
boolean flag=false;
int element=99; 
String company=request.getParameter("prospect").replace(".","").replace(" ","");
System.out.println("*&&&&&&&&&&&******&&&&&&&&&&&&*  "+company);

int k;
int counter=0;
  sql1="(SELECT CompanyName from "+session.getAttribute("CompanyMasterID").toString()+"prospectivecustmaster where CompanyName like ('"+company+"')  order by CompanyName )"+
  " union "+

  "( SELECT CompanyName from "+session.getAttribute("CompanyMasterID").toString()+"prospectivecustmaster where  Replace(Replace(CompanyName,' ',''),'.',' ') like ('"+company+"')  order by CompanyName)";
  System.out.println("><><><><   ????????"+sql1);
  rs1=stmt1.executeQuery(sql1);

 if(rs1.next())
  {
	 System.out.println("IN IF   ");
	  out.println("Yes");
  }

}
catch(Exception e)
{ 
  
}
finally
{
  con1.close();
}
%>