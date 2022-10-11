 <%@ include file="conn.jsp" %>
<%!
Connection con1;
%>
<% 
try {

Class.forName(DB_Driver);
con1 = DriverManager.getConnection(DB_NAME,DB_USERNAME,DB_PASSWORD);
Statement stmt1=con1.createStatement();
ResultSet rs1=null;
String sql1="";
boolean flag=false;
String company=request.getParameter("companyName");
  sql1="SELECT *  from "+session.getAttribute("CompanyMasterID").toString()+"customerdet where CustomerCode  = ('"+company+"') order by CompanyName limit 1 ";
  rs1=stmt1.executeQuery(sql1);
 String buffer=" ";
 int i=1;
   if(rs1.next())
     buffer+= "#"+rs1.getString("CompanyName")+"#"+rs1.getString("ContactPerson")+"#"+ rs1.getString("EMail")+"#"+
     rs1.getString("BillingCity")+"#"+ 
     rs1.getString("IntrestedProduct")+"#"+rs1.getString("BillingPhone")+"#";
   i++;
out.println(buffer);

} catch(Exception e) {  }
finally
{
	con1.close();
}
%>
