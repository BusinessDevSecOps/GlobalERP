<%@ page language="java" import="java.sql.*" import="java.util.*" import="java.text.*" errorPage=""
    pageEncoding="ISO-8859-1"%>
    <%@ include file="header.jsp" %>
   <jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Collection Staff Report</title>

<link href="css/style.css" rel="stylesheet" type="text/css">
<script src="js/sorttable.js" type="text/javascript"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Export Options Links of DataTables -->

<link rel="stylesheet"
	href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css ">
	
<script type="text/javascript" src="datatablejs/bootstrap.js"></script>

<script
	src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js "></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js "></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js "></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js "></script>
<script
	src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js "></script>
<script
	src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script>

<script type="text/javascript" src="datatablejs/buttons.colVis.min.js"></script>

<style></style>

<script type="text/javascript">
$(document).ready(
		function() {
			$('#myTable').DataTable({
								//	"pagingType": "full_numbers",

								dom : 'Blfrtip',
								"bLengthChange" : false,
								buttons : [

										{
											extend : 'collection',

											text : 'Export',
											buttons : [
													{
														extend : 'excel',
														title : 'Collection Staff Report'
																+ $(
																		"#data")
																		.val()
																+ '-'
																+ $(
																		"#data1")
																		.val(),
													},
													{
														extend : 'pdf',
														orientation : 'landscape',
														pageSize : 'LEGAL',
														title : 'Collection Staff Report'
																+ $(
																		"#data")
																		.val()
																+ '-'
																+ $(
																		"#data1")
																		.val(),
													},
													{
														extend : 'csv',
														title : 'Collection Staff Report'
																+ $(
																		"#data")
																		.val()
																+ '-'
																+ $(
																		"#data1")
																		.val(),
													},
													{
														extend : 'print',
														title : 'Collection Staff Report'
																+ $(
																		"#data")
																		.val()
																+ '-'
																+ $(
																		"#data1")
																		.val(),
													},
													{
														extend : 'copy',
														title : 'Collection Staff Report'
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

										'colvis', 'pageLength' ],

								"oLanguage" : {
									"sSearch" : "Search"
								},

								lengthMenu : [
										[ 10, 25, 50, -1 ],
										[ '10 Rows', '25 Rows',
												'50 Rows',
												'Show all' ],

								],

								"aoColumns" : [ 
									            null, null, null, null, null, null, null,
										        null, null, null, null, null, null
										      ]
							});
		});
</script>
</head>

<body>

<% erp.getConnection(DB_Driver,DB_NAME,DB_USERNAME,DB_PASSWORD); %>
<%!
Connection conn=null;
%>

<%

conn=erp.ReturnConnection();
Statement st=conn.createStatement();
Statement st1=conn.createStatement();
%>

<%
NumberFormat nf1=NumberFormat.getInstance();
nf1.setMaximumFractionDigits(2);
nf1.setMinimumFractionDigits(2);
	String fromDate = "", toDate = "",fromDate1="";
	String data2="",data1="";
	String Sort="";
	try{
	if(null==request.getParameter("sorting") ||""==request.getParameter("sorting") )
	{
		Sort="srno"	;
	
	}else
	{
		Sort=request.getParameter("sorting");
	}
	}catch(Exception ex)
	{
		Sort="srno"	;
	}
	
	
	String dd = request.getParameter("data");
	if (dd == null) {
		Calendar cal = Calendar.getInstance();
		String today_dt = new SimpleDateFormat("dd-MMM-yyyy")
				.format(cal.getTime());
		data2 = today_dt;
		String temp = data2;
		toDate = new SimpleDateFormat("yyyy-MM-dd")
				.format(new SimpleDateFormat("dd-MMM-yyyy").parse(temp));

		//cal.add(Calendar.DATE, -1);
		cal.set(Calendar.DAY_OF_MONTH, 1);
		String yesterday_dt = new SimpleDateFormat("dd-MMM-yyyy")
				.format(cal.getTime());
		data1 = yesterday_dt;
		temp = data1;
		fromDate =new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
		fromDate1 =new SimpleDateFormat("dd-MMM-yyyy").format(cal.getTime());

	} else {

		data1 = request.getParameter("data");
		System.out.println("Data 1-->"+data1);
		

		fromDate = new SimpleDateFormat("yyyy-MM-dd")
				.format(new SimpleDateFormat("dd-MMM-yyyy")
						.parse(data1));
		fromDate1 =request.getParameter("data");
		data2 = request.getParameter("data1");
		System.out.println("Data 2-->"+data2);
		toDate = new SimpleDateFormat("yyyy-MM-dd")
				.format(new SimpleDateFormat("dd-MMM-yyyy")
						.parse(data2));  

	} //end of else
%>
<%Date d=new Date();
	
	
	Format df1= new SimpleDateFormat("dd-MMM-yyyy");
	String dtoday=df1.format(d);
	
	DateFormat df= new SimpleDateFormat("dd-MMM-yyyy");
	DateFormat d1= new SimpleDateFormat("yyyy-MM-dd"); %>
	 

<div align="center">

</div>

<div>
<table width ="100%" border="0">	
<tr align="left"><td><a href="addCollectionStaff.jsp"><b>Add New</b></a></td>

<td align="right">
<font size="1">&nbsp;&nbsp;&nbsp;<%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date())%></font>				
</td>					
</tr>
</table>
</div>
<%

String date1="",date2="";
if (request.getParameter("data")!=null) {
	System.out.println("In request get");
	
//	cust=request.getParameter("companyName");
//	cust= cust.replaceAll("'", "''");
//	System.out.println("Customer name is"+cust);
	 date1=request.getParameter("data");
	date2=request.getParameter("data1");

	fromDate = new SimpleDateFormat("yyyy-MM-dd")
	.format(new SimpleDateFormat("dd-MMM-yyyy")
			.parse(date1));
	
	toDate = new SimpleDateFormat("yyyy-MM-dd")
	.format(new SimpleDateFormat("dd-MMM-yyyy")
			.parse(date2));
	
}
	String fromDateTime = fromDate + " " + "00:00:00";
	String toDateTime = toDate + " " + "23:59:59";
	
%>
<br>
<br>
	<table id="myTable" class="display"
		style="width: 100%; background: #1582AB;">
		<thead>
			<tr>
				<th width="4%"
					style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">SrNo</th>
				<th
					style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Name</th>
				<th
					style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Branch</th>
				<th
					style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Contact
					No.</th>
				<th
					style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Email
					Id</th>
				<th
					style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Commission</th>
				<th
					style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Location</th>
				<th
					style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Valid
					From</th>
				<th
					style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Valid
					To</th>
				<th
					style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Remark</th>
				<th
					style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Entry
					By</th>
				<th
					style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Entry
					Date Time</th>
				<th
					style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Status</th>
			</tr>
		</thead>
		<%
			System.out.println("fromdate query:" + fromDateTime);
				System.out.println("todate query:" + toDateTime);
				Statement stmt = conn.createStatement();
				String sql = "select srno, name,branch,contact,email,cast(commission as decimal(10,2)) as commission,Location,DATE_FORMAT(validfrom,'%d-%b-%Y')  as validfrom,date_format(validto,'%d-%b-%Y') as validto,remark,EntryBy,date_format(entrydatetime,'%d-%b-%Y') as entrydatetime,status from "
						+ session.getAttribute("CompanyMasterID").toString()
						+ "collectionStaffMaster where entrydatetime between '" + fromDateTime + "' and '" + toDateTime
						+ "'  and Status='Active' ";
				System.out.println("Data Query:" + sql);

				ResultSet res = stmt.executeQuery(sql);
				while (res.next()) {
					int SrNo = res.getInt("srno");
					String name = res.getString("name");
					String branch = res.getString("branch");
					String contact = res.getString("contact");
					String email = res.getString("email");
					String commission = res.getString("commission");
					String location = res.getString("Location");
					String from_dt = res.getString("validfrom");
					String to_dt = res.getString("validto");
					String remark = res.getString("remark");
					String entryBy = res.getString("EntryBy");
					String entryDtTime = res.getString("entrydatetime");
					String Status = res.getString("status");
		%>
		<tbody>
			<tr>
				<td style="font-size: 11px; face: san-serif; color: black"
					align="right"><%=SrNo%></td>
				<td style="font-size: 11px; face: san-serif; color: black"
					align="left"><%=name%></td>
				<td style="font-size: 11px; face: san-serif; color: black"
					align="left"><%=branch%></td>
				<td style="font-size: 11px; face: san-serif; color: black"
					align="left"><%=contact%></td>
				<td style="font-size: 11px; face: san-serif; color: black"
					align="left"><%=email%></td>
				<td style="font-size: 11px; face: san-serif; color: black"
					align="right"><%=commission%></td>
				<td style="font-size: 11px; face: san-serif; color: black"
					align="left"><%=location%></td>
				<td style="font-size: 11px; face: san-serif; color: black"
					align="right"><%=from_dt%></td>
				<td style="font-size: 11px; face: san-serif; color: black"
					align="right"><%=to_dt%></td>
				<td style="font-size: 11px; face: san-serif; color: black"
					align="left"><%=remark%></td>
				<td style="font-size: 11px; face: san-serif; color: black"
					align="left"><%=entryBy%></td>
				<td style="font-size: 11px; face: san-serif; color: black"
					align="right"><%=entryDtTime%></td>
				<td style="font-size: 11px; face: san-serif; color: black"
					align="left"><%=Status%></td>
			</tr>
		</tbody>
		<%
			}
		%>
		<tfoot>
			<tr>
				<th width="4%"
					style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">SrNo</th>
				<th
					style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Name</th>
				<th
					style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Branch</th>
				<th
					style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Contact
					No.</th>
				<th
					style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Email
					Id</th>
				<th
					style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Commission</th>
				<th
					style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Location</th>
				<th
					style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Valid
					From</th>
				<th
					style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Valid
					To</th>
				<th
					style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Remark</th>
				<th
					style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Entry By</th>
				<th
					style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Entry Date Time</th>
				<th
					style="font-size: 12px; background: #1582AB; color: white; face: san-serif;">Status</th>
			</tr>
		</tfoot>
	</table>
	<br>
<br>
<%@include file="footer_new.jsp"%>
</body>
</html>



		
</jsp:useBean>
