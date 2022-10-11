
<%@ include file="conn.jsp"%>

<%!
Connection con;
%>
<% 
try {

	Class.forName(DB_Driver);
	con = DriverManager.getConnection(DB_NAME,DB_USERNAME,DB_PASSWORD);
	Statement stmt=con.createStatement();
	ResultSet rs=null;
	String sql="";

	if(request.getParameter("type").equals("quotation"))
	{
		 String company=request.getParameter("company");
		 sql="SELECT DISTINCT(CompanyName),CustomerCode 	 FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det  WHERE CompanyName LIKE('%"+company+"%') ORDER BY CompanyName LIMIT 20 ";
		 System.out.println(sql);
		 rs=stmt.executeQuery(sql);
		 String buffer="<div style='height:120px;width:400px;overflow:auto; '><table style='background-color:white; width:400px; display: block';>";
		 int i=1;
		   while(rs.next())
		   {
		     buffer+="<tr><td><a href='#' onClick='showVisitingCardDetails(\""+rs.getString("CompanyName")+"\",\""+rs.getString("CustomerCode")+"\");'  style='color: black;'>"+rs.getString("CompanyName").replaceAll("(?i)"+company,"<font color=blue><u>"+company.toUpperCase()+"</u></font>")+".</a></tr></td>";
		        i++;
		   } 
		   buffer+="</table></div>";
		out.println(buffer);
	}
	
	else if(request.getParameter("type").equals("order"))
	{
		 String company=request.getParameter("company");
		 sql="SELECT DISTINCT(CompanyName),CustomerCode 	 FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det  WHERE CompanyName LIKE('%"+company+"%') ORDER BY CompanyName LIMIT 20 ";
		 rs=stmt.executeQuery(sql);
		 String buffer="<div style='height:120px;width:400px;overflow:auto; '><table style='background-color:white; width:400px; display: block';>";
		 int i=1;
		   while(rs.next())
		   {
		     buffer+="<tr><td><a href='#' onClick='showVisitingCardDetails(\""+rs.getString("CompanyName")+"\",\""+rs.getString("CustomerCode")+"\");'  style='color: black;'>"+rs.getString("CompanyName").replaceAll("(?i)"+company,"<font color=blue><u>"+company.toUpperCase()+"</u></font>")+".</a></tr></td>";
		        i++;
		   } 
		   buffer+="</table></div>";
		out.println(buffer);
	}
	
	else if(request.getParameter("type").equals("invoice"))
	{
		 String company=request.getParameter("company");
		 sql="SELECT DISTINCT(CompanyName),CustomerCode 	 FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det  WHERE CompanyName LIKE('%"+company+"%') ORDER BY CompanyName LIMIT 20 ";
		 rs=stmt.executeQuery(sql);
		 String buffer="<div style='height:120px;width:400px;overflow:auto; '><table style='background-color:white; width:400px; display: block';>";
		 int i=1;
		   while(rs.next())
		   {
		     buffer+="<tr><td><a href='#' onClick='showVisitingCardDetails(\""+rs.getString("CompanyName")+"\",\""+rs.getString("CustomerCode")+"\");'  style='color: black;'>"+rs.getString("CompanyName").replaceAll("(?i)"+company,"<font color=blue><u>"+company.toUpperCase()+"</u></font>")+".</a></tr></td>";
		        i++;
		   } 
		   buffer+="</table></div>";
		out.println(buffer);
	}


} catch(Exception e) {  
	System.out.println("!!!ERROR!!!  GenericAjaxSearch  ::  "+e);
}
finally
{
	con.close();
}
%>
