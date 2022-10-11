<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="header.jsp"%>
<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">
<%@page import="java.util.Date"%>
<html>
<head>

<link rel="stylesheet"
		href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"/>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>


	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
	<!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<!-- Export Options Links of DataTables -->

	<link rel="stylesheet"
		href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css"/>
	<script
		src=" https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
	<script
		src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
	<script
		src=" https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	<script
		src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
	<script
		src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
	<script
		src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
	<script
		src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script>
		<script type="text/javascript" src="datatablejs/buttons.colVis.min.js"></script>








	<script type="text/javascript">
		$(document).ready(
				function() {
					$('#example').DataTable(
							{
								"pagingType" : "full_numbers",

								dom : 'Blfrtip',

								buttons : [

								{
									extend : 'collection',

									text : 'Export',
									buttons : [
											{
												extend : 'excel',
												title : 'Payment Report '
														+ $("#fromdate").val()
														+ '-'
														+ $("#todate").val(),
											},
											{
												extend : 'pdf',
												orientation : 'landscape',
												pageSize : 'LEGAL',
												title : 'Payment Report '
														+ $("#fromdate").val()
														+ '-'
														+ $("#todate").val(),
											},
											{
												extend : 'csv',
												title : 'Payment Report '
														+ $("#fromdate").val()
														+ '-'
														+ $("#todate").val(),
											},
											{
												extend : 'print',
												title : 'Payment Report '
														+ $("#fromdate").val()
														+ '-'
														+ $("#todate").val(),
											},
											{
												extend : 'copy',
												title : 'Vehicle FTRP Report '
														+ $(
																"#data")
																.val()
														+ '-'
														+ $(
																"#data1")
																.val(),
											},

									/* 'copy', 'csv', 'excel', 'pdf', 'print' */

									]
								},

								'colvis' ],

						

						"aoColumns" : [ null, null, {
							"sType" : "date-uk"
						}, null, null, null, null, null,
								null, null

						]
					});
});
	</script>

<script language="JavaScript1.2">
function popUp(Address,PaymentEntryNo)
{
	
	window.open(Address+'?PaymentEntryNo='+PaymentEntryNo,'jav','scrollbars=yes,menubar=yes,height=300,width=600,resizable=yes');
}	
</script>
</head>                                	                                                                                                              
<%
	erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
%>
<%
	Connection conn = null;
	Statement st = null, st1 = null, st3 = null, st4 = null,st5=null;
	Statement st2 = null;
    String selectedName;
	String FollowUpType="",status="";
	Format format=new SimpleDateFormat("dd-MMM-yyyy");
	Format parse=new SimpleDateFormat("yyyy-MM-dd");
	String fromDate="",toDate="",fromDateCal="",toDateCal="",CompanyName="";
	String id=request.getParameter("id");
	System.out.println("ID CMING IS   ++++++++++++++          "+id);
%>
<%
	Date today = new Date();
	Calendar cal = Calendar.getInstance();
	cal.setTime(today);
	cal.add(Calendar.DAY_OF_MONTH, -30);
	Date today30 = cal.getTime();
	fromDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(today30);
	toDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
	fromDate=toDate=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	if (!(null == request.getParameter("fromdate"))) {
		fromDate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("fromdate")));
		fromDateCal=request.getParameter("fromdate");
	}
	if (!(null == request.getParameter("todate"))){
		toDate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("todate")));
		toDateCal=request.getParameter("todate");
	}
	
	int i=1;
 		
	try {
	conn = erp.ReturnConnection();
	st = conn.createStatement();
	st1 = conn.createStatement();

	%>
	
    
<body ONKEYDOWN="if (event.keyCode == 27){document.getElementById('companyList').style.display = 'none';}" >
	<div
		style="font-size: 1.6em; text-align: center; margin-top: 0.5em; margin-bottom: 0.5em;">
	<a>Payment Report </a></div>
	
	<form name="data" action="" method="get">
	<input type="hidden" name="id" value="<%=id %>">
	<div align="center">
	<table border="0">
	<tr> 
	
	<!-- <td  align="right" width="20%">
	<b>Check All</b>&nbsp; 
	
	</td>
	<td>
	<input type="checkbox" name="isCheckedAll" value="checkedAll" checked="checked" onclick="hideCompanyName();" />
	<input type="hidden" name="isdisplay" value="true"/>
 	</td>
	<td align="right">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  <b>Or Enter Company :</b></td>
	<td><input type="text" name="companyNames" id="search-text" style="width:230px;" autocomplete="off"  value=""  onkeyup="if (event.keyCode == 27){document.getElementById('companyList').style.display = 'none';} else { getCompanies('quotation'); }" /> 
	 &nbsp;&nbsp;&nbsp;<br>
	 <div style="position: absolute;"  >
	 <table><tr><td>
	 	
	 </td></tr>
	 <tr><td>
	 <div id='companyList'>
	 </div>
	 </td></tr>
	 </table>
	 </div>
     </td> -->
	  		
	<td align="left">
	<b>From </b>&nbsp;&nbsp;&nbsp;
	<input type="text" id="fromdate"
	name="fromdate" value="<%=fromDateCal %>" size="15" readonly
	style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF" />&nbsp;&nbsp;
	 				
	<!--<input type="button" name="From Date" value="From Date" id="trigger">-->
	<script type="text/javascript">
	Calendar.setup(
	{
	inputField  : "fromdate",         // ID of the input field
	ifFormat    : "%d-%b-%Y",     // the date format
	button      : "fromdate"       // ID of the button
	}
	);
	</script>
			
	<b>To </b>&nbsp;&nbsp;
	<input type="text" id="todate"
	name="todate" value="<%=toDateCal %>" size="15" readonly
	style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF" />
					
	<script type="text/javascript">
	Calendar.setup(
	{
	inputField  : "todate",         // ID of the input field
	ifFormat    : "%d-%b-%Y",    // the date format
	button      : "todate"       // ID of the button
	}
	);
	</script>
	&nbsp;&nbsp;<input type="submit" name="submit" id="submit" style="border: outset;"
	value="Submit" /></td>
	</tr>
	
	</table></div>
	</form>
	
	<br>
	<%   
	if(null != request.getQueryString())
	{
	%> 
	
	<table id="example" class="sortable" align="center">
	<tr>
	<th>Sr no</th>
	<th>Payment Entry On</th>
	<th>Company</th>
	<th>Bill No</th>
	<th>Biil Date</th>
	<th>Due Date</th>
	<th>Amount</th>
	<th>Status</th>
	<th>Account Comments</th>
	</tr>
	
	
	<%
	//String Sql="Select * from "+session.getAttribute("CompanyMasterID").toString()+"paymentEntryDet where EntryDate  between '"+fromDate+"' AND '"+toDate+"' AND Status ='Pending' AND  MailTo=(select email from "+session.getAttribute("CompanyMasterID").toString()+"security where EmpName='"+session.getAttribute("EmpName")+"' and ActiveStatus='Yes') order by EntryDate ";
	String Sql="Select * from "+session.getAttribute("CompanyMasterID").toString()+"paymentEntryDet where EntryDate  between '"+fromDate+"' AND '"+toDate+"' AND Status ='Pending'  order by EntryDate ";
	System.out.println("QUERY    "+Sql);
	ResultSet rsData=st.executeQuery(Sql);
	//st.executeQuery(Sql);
	while(rsData.next())
	{	
		String a=rsData.getString("EntryDate");
		String payno=rsData.getString("PaymentEntryNO");
		System.out.println("payemnt nO  ::  "+payno);
	%>
	<tr>
	<td><%=i++ %></td>
	<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsData.getString("EntryDate")))  %></td>
	<td><%=rsData.getString("PartyName") %></td>
	<td><%=rsData.getString("BillNo") %></td>
	<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsData.getString("BillDate"))) %></td>
	<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsData.getString("DueDate"))) %></td>
	<td><%=rsData.getString("Amount") %></td>
	<td><%=rsData.getString("Status") %></td>
	<td><%=rsData.getString("AccountComments") %></td>
	<td><input type="button" style="width:100px; border: outset; background-color: #C6DEFF" value="Approve" onclick="popUp('paymentApprovalDet.jsp',<%=payno %>)"/></td>
	</tr>

	<%
	}
	}
	} catch (Exception e) {
	e.printStackTrace();
	} 
	%>
	</table>
	
  <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
  <br><br><br><br><br><br><br><br><br>
	<div id="footer">
	<p><a href="http://www.myfleetview.com"> Copyright &copy; 2009
	by Transworld  Technologies Ltd. All Rights Reserved.</a></p>
	</div>
<!-- end #footer -->
</body>
</html>
</jsp:useBean>