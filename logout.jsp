<%@ include file="headerhtml.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="connectionIndex.jsp" %>

<%@page import="sun.security.util.Password"%>
<jsp:useBean id="ERP" class="com.erp.beans.ERP" scope="page">
<% ERP.getConnection(DB_Driver,DB_NAME,DB_USERNAME,DB_PASSWORD); %>
<%!
Connection conn=null;
%>
<%
try{
	conn=ERP.ReturnConnection();
	Statement st=conn.createStatement();
	Statement st1=conn.createStatement();
	String logoutdet=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
	System.out.println(" IN THIS PAGE  ");

	String sql1="update "+session.getAttribute("CompanyMasterID").toString()+"logindetails set ActiveStatus='No' ,LogOutDetails='"+logoutdet+"' ,Updated='"+logoutdet+"' 	where SessionId='"+session.getId().toString()+"'";
	st.executeUpdate(sql1);
	
	System.out.println(">>>  >>>  >>  "+sql1);

}
catch(Exception e)
{
	out.print("Logout Exception--->"+e);
}
finally
{
	ERP.closeConnection(); 
}


session.invalidate();
response.sendRedirect("index.jsp");
%>
<%@ include file="footer.jsp" %>

</jsp:useBean>