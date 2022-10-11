<%@page import="java.util.Date"%>
<%@ include file="conn.jsp"%>

<%
	Connection con=null ;
	DecimalFormat twoDForm = new DecimalFormat("#.##");
	Statement st=null,st1=null,st2=null,st3=null;
	String todaysDate=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	String todaysTime=new SimpleDateFormat(" HH:mm:ss").format(new java.util.Date());
%>
<%
	try{	
	Class.forName(DB_Driver);
	con = DriverManager.getConnection(DB_NAME,DB_USERNAME,DB_PASSWORD);
	st=con.createStatement();
	st1=con.createStatement();
	st2=con.createStatement();
	st3=con.createStatement();
	
	String invoiceno=request.getParameter("invoiceNo");
	System.out.println(invoiceno);
		
	String cancelreason=request.getParameter("reasonforcancel");
	System.out.println(cancelreason);
		
	String sqlUpdate="UPDATE "+session.getAttribute("CompanyMasterID").toString()+"performainvoicedet SET InvoiceCancelled=1 , ReasonForCancelling='"+cancelreason+"' where InvoiceNo='"+invoiceno+"' ";
	
	System.out.println(sqlUpdate);
	st.executeUpdate(sqlUpdate);	

	response.sendRedirect("alertGoTo.jsp?msg=Proforma Invoice Cancelled.&goto=showinvoicelist.jsp");
	}
catch(Exception e)
	{
	System.out.println("Exception ::"+e);
	e.printStackTrace();
	response.sendRedirect("alertGoTo.jsp?msg=!!!! ERROR Inserting Record.Please try again.&goto=home.jsp");
		}
finally
{
	con.close();

}
%>		