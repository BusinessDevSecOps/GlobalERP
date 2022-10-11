<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="conn.jsp"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.TimeZone"%><jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">
	<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<style type="text/css">
    @import url(jscalendar-1.0/calendar-win2k-1.css);
    </style>
	<style>
    </style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>

	<script src="sorttable.js" type="text/javascript"></script>


	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>Transworld Compressor-Technologies LTD, ERP</title>
	<link href="css/style.css" rel="stylesheet" type="text/css"
		media="screen" />
	<link href="css/table.css" rel="stylesheet" type="text/css"
		media="screen" />
	<style type="text/css">
    </style>
	
	<link rel="stylesheet" type="text/css" href="css/chromestyle2.css" />
	
	<script type="text/javascript" src="css/chrome.js">
	</script>	
	<script language="javascript">

	</script>
	</head>
	<body>
	
<%
	erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
%>
<%

	Connection conn = null;
	Statement st = null, st1 = null,st2=null,st3=null,st4=null;
	
	int groupCode=0,makeCode=0;
	int d=0,k=0;
	double tax=0,discount=0.00,amount=0;
	int i=1;
	String groupName="",makeName="",itemCode="",stpercent="",refMakeNameTable="",sqlDisplayDesc="";
	String type=request.getParameter("condition");
	System.out.println(type);
	String todaysDate=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	String todaysTime=new SimpleDateFormat("HH:mm:ss").format(new java.util.Date());
	
	Date today = new Date();
	String fromDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(today);
	
	String grnno=request.getParameter("GRNNo");
	String pono=request.getParameter("PONo");
	String suppliercode=request.getParameter("supplierCode");
	
	try {
	conn = erp.ReturnConnection();
	st = conn.createStatement();
	st2 = conn.createStatement();
	st1 = conn.createStatement();
	st3 = conn.createStatement();
	st4 = conn.createStatement();
	} catch (Exception e) {
	}
	 
	NumberFormat nf = new DecimalFormat("#0.00");
	
	String sqlGrn="SElect * from "+session.getAttribute("CompanyMasterID").toString()+"purchasegrn where GRNno='"+grnno+"'";
	ResultSet rsGrn=st.executeQuery(sqlGrn);
	rsGrn.next();
	
	String sqlcode="select SupplierName from "+session.getAttribute("CompanyMasterID").toString()+"supplierdet where SupplierCode='"+suppliercode+"'";
	ResultSet rscode=st1.executeQuery(sqlcode);
	rscode.next();
	String name=rscode.getString("SupplierName");
%>
 <div align="center" style="font-size: 1.5em; margin-top: 0.3em;   height: 3px; background-color: #339CCB">
	</div>
	<div align="center"
 		style="margin-top:0.3em; margin-bottom:0.3em; font-size: 1.5em;">
 	<a> Details Of GRN : <%=grnno %> </a> </div>
 		
 	 <div align="center" style="font-size: 1.5em; margin-top: 0.3em;   height: 3px; background-color: #339CCB">
	</div>
	<br>
	<br>		
	<table border="0px" align="left" valign="top" width="100%" style="background-color:#C6DEFF">
 	<tr>
 	<td><b>PO NO:</b></td>
 	<td><%=pono %></td>
 	<td><b>GRN DATE : </b></td>
 	<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsGrn.getString("GRNDate")))%></td>
 	<td><b>TW Emp Name : </b></td>
 	<td><%=rsGrn.getString("TWEmpName") %></td>
 	</tr>
 	<tr>
 	<td><b>Supplier Name : </b></td>
 	<td><%=name %></td>
 	<td><b>Shippment Date : </b></td>
 	<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsGrn.getString("ShipmentDate"))) %></td>
 	<td><b>Supplier order No : </b></td>
 	<td><%=((rsGrn.getString("SupOrderNo")!=null) ? rsGrn.getString("SupOrderNo") : "-") %> </td>
 	</tr>
 	</table>
 	
  <div>&nbsp;&nbsp;</div>
  <div>&nbsp;&nbsp;</div>		
 	<table  border="1px"  class="sortable">
 	<tr>
 	<th>Sr No</th>
 	<th>Group</th>
 	<th>Make</th>
 	<th>Part No</th>
 	<th>Description</th>
 	<th>Ordered Quantity</th>
 	<th>Shipped Quantity</th>
 	<th>Received Quantity</th>
 	</tr> 
<%
	
 	String SqlgrnDet="SELECT * from "+session.getAttribute("CompanyMasterID").toString()+"purchasegrn_items WHERE GRNno='"+grnno+"' ";
 	System.out.println("*******    &&&&&&&&&&&&&&    "+SqlgrnDet);
 	ResultSet rsgrndet=st4.executeQuery(SqlgrnDet);
	while(rsgrndet.next())
	{	
		groupName="";makeName="";refMakeNameTable="";
		groupCode=rsgrndet.getInt("TheGroup");
		makeCode=rsgrndet.getInt("Make");
		itemCode=rsgrndet.getString("ItemCode");
		  
		String  sqlGroup="SELECT TheGroupName from "+session.getAttribute("CompanyMasterID").toString()+"tbl_groupmaster WHERE TheGroupCode='"+groupCode+"'";
		ResultSet rsGroup=st2.executeQuery(sqlGroup);
		if(rsGroup.next())
		groupName=rsGroup.getString("TheGroupName");
		if(groupCode<5)
		{
			refMakeNameTable="tbl_"+groupName.substring(0,5)+"makemaster";
			String sqlMakename="SELECT MakeName FROM "+refMakeNameTable.toLowerCase()+"  WHERE makecode='"+makeCode+"' ";
			ResultSet rsMakeName=st3.executeQuery(sqlMakename);
			if(rsMakeName.next())
			makeName=rsMakeName.getString(1);
			else
			makeName="-";
					      
			sqlDisplayDesc="SELECT * FROM tbl_"+groupName.substring(0,5).toLowerCase()+"im_make"+makeCode+" where ItemCode='"+itemCode+"'";
			System.out.println(sqlDisplayDesc);
		}
		else{
			sqlDisplayDesc="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"tbl_otherim_group"+groupCode+" where ItemCode='"+itemCode+"' ";
			System.out.println(sqlDisplayDesc);
			makeName="-"  ;
		}
	
		ResultSet rsDisplayDesc=st3.executeQuery(sqlDisplayDesc);
		
		if(rsDisplayDesc.next())
		{	
%>

 <tr>
 		<td><div align="right"><%=i++ %></div></td>
 		<td><div align="left"><%=groupName %></div></td>
		<td><div align="left"><%=makeName %></div></td>
		<td><div align="right"><%=rsDisplayDesc.getString("Partno") %></div></td>
		<td><div align="left"><%=rsDisplayDesc.getString("Description") %></div></td>
 		<td><div align="right"><%=((rsgrndet.getString("OrderedQuantity")!=null) ? rsgrndet.getString("OrderedQuantity") : "-")  %></div></td>
 		<td><div align="right"><%=((rsgrndet.getString("ShippedQuantity")!=null) ? rsgrndet.getString("ShippedQuantity") : "-")%></div></td>
 		<td><div align="right"><%=((rsgrndet.getString("ReceivedQuantity")!=null) ? rsgrndet.getString("ReceivedQuantity") : "-")  %></div></td>
 </tr>
 
<%
		}
		}
%>
 </table>			
 			
 			
 			
 <br><br><br><br><br><br>
 <br><br><br><br><br> 
 <br><br><br><br><br>


	<div id="footer">
	<p><a href="http://www.myfleetview.com"> Copyright &copy; 2009
	by Transworld Compressor Technologies Ltd. All Rights Reserved.</a></p>
	</div>
	</body>
	</html>
</jsp:useBean>			