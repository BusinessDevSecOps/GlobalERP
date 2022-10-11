<%@page import="java.util.Date"%>
<%@page import="com.erp.beans.LedgerUpdatation"%>
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
	
	String invoiceRefno=request.getParameter("invoiceRefNo");
	System.out.println("inv ref no for cancelation"+invoiceRefno);
	
	
	String custcode=request.getParameter("customercode");
	System.out.println("custcode==>"+custcode);
	String cancelreason=request.getParameter("reasonforcancel");
	System.out.println(cancelreason);
		
	String sqlUpdate="UPDATE "+session.getAttribute("CompanyMasterID").toString()+"invoicedet SET InvoiceCancelled=1 , ReasonForCancelling='"+cancelreason+"' where InvoiceNo='"+invoiceno+"' and invoiceRefNo='"+invoiceRefno+"'";
	
	System.out.println(sqlUpdate);
	st.executeUpdate(sqlUpdate);	
	
	
String sqlDelete="delete from "+session.getAttribute("CompanyMasterID").toString()+"customerledgeraccount  where TransactionDetail='"+invoiceRefno+"'";
	
	System.out.println("Deletion qry for customerLedgerAcnt "+sqlDelete);
	st1.executeUpdate(sqlDelete);

	LedgerUpdatation ld =new LedgerUpdatation();
	ld.calulation(custcode,session.getAttribute("CompanyMasterID").toString());
	//response.sendRedirect("alertGoTo.jsp?msg=Invoice Cancelled.&goto=showinvoicelist.jsp");
	response.sendRedirect("alertgoToIDPage.jsp?msg=Invoice Cancelled.&goto=showinvoicelist.jsp&id=close");
	}
catch(Exception e)
	{
	System.out.println("Exception ::"+e);
	e.printStackTrace();
	response.sendRedirect("alertGoTo.jsp?msg=!!!! ERROR Inserting Record.Please try again.&goto=SEDetails.jsp");
		}
finally
{
	con.close();

}
%>		