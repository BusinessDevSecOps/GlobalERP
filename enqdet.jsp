<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="conn.jsp"%>

<%@page import="java.util.Date"%>
<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">
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

	<script src="dropdown.js" type="text/javascript"></script>
	<script src="ledgerDetails.js" type="text/javascript"></script>


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

<script language="JavaScript1.2">

	
	function generateQuo(Address,salesenqno,check)
	{ 
	alert(salesenqno+'  '+Address+'   '+check);
	window.open(Address+'&salesenqno='+salesenqno+'&check='+check,'jav');

	}


	function checkAll()
	{
	var field=document.getElementsByName('check');
	var i;
	try{
	for (i = 0; i < field.length; i++)
	field[i].checked = true ;
	}catch(e){alert(e);}
	}

	function unCheckAll()
	{
	var field=document.getElementsByName('check');
	var i;
	try{
	for (i = 0; i < field.length; i++)
	field[i].checked = false ;
	}catch(e){alert(e);}
	}

	</script>
	</head>
	<body>
	
<%
	erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
%>
<%
	Connection conn = null;
	Statement st = null, st1 = null,st2=null,st3=null;
	boolean isInvoiceSelected=false;
			
	double sumAmount=0; 
	int groupCode=0,makeCode=0;
	String groupName="",makeName="",itemCode="";
	String refMakeNameTable="";
	String sqlDisplayDesc=" ";
	String sellingPrice="" ,priceAccepted="",quantity="";
	String company=request.getParameter("companyName");
	System.out.println(">>>>>>   COMOMO    "+company);
	String salesrefno=request.getParameter("SalesEnqRefNo");
	System.out.println(">>>>>>   REF NO   <<<<< "+salesrefno);
	String salesenqno=request.getParameter("SalesEnqNo");	
	
	
	try {
	conn = erp.ReturnConnection();
	st = conn.createStatement();
	st2 = conn.createStatement();
	st1 = conn.createStatement();
	st3 = conn.createStatement();
	} catch (Exception e) {
	}
	%>
	<div align="center"
		style="font-size: 1.5em; margin-top: 0.5em; margin-bottom: 0.3em; height: 3px; background-color: #339CCB">
	</div>
	<div align="center" style="font-size: 1.5em; ">
	Domestic Enquiry Of : <a><%=request.getParameter("SalesEnqRefNo")%> </a>&nbsp;&nbsp; For: <a><%=request.getParameter("companyName")%> </a> 
	</div>
	<div align="center"
		style="font-size: 1.5em; margin-top:0.3em; margin-bottom:0.5em; height: 3px; background-color: #339CCB">
	</div>
	<form name="generateQuo" method="get" action="quotation.jsp"  >
	 
	<%
	String sqlDet="SELECT * from "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det WHERE SalesEnqNo='"+salesenqno+"' ";
	System.out.println(sqlDet);
	ResultSet rsDet=st.executeQuery(sqlDet);
	while(rsDet.next()){
	
	%>
	 <table width="100%"><tr>
	 <td style="width: 40%">
		<table  align="left" width="100%" cellpadding="3" cellspacing="3">
		<tr>
		<td><b>SE Date:</b></td>
		<td><%=new SimpleDateFormat(
						"dd-MMM-yyyy")
						.format(new SimpleDateFormat( 
								"yyyy-MM-dd")
								.parse(rsDet.getString("SalesEnqDate")))%></td>
		<td><b>SE Time:</b></td>
		<td><%=rsDet.getString("SalesEnqTime") %></td>
		</tr>
		<tr>
		<td><b>Cust Ref No:</b></td>
		<td><%=rsDet.getString("CustRefNo") %></td>
		<td><b>Due date :</b></td>
		<%String duedate ="NA";try{duedate=new SimpleDateFormat(
					"dd-MMM-yyyy")
					.format(new SimpleDateFormat( 
					"yyyy-MM-dd")
					.parse(rsDet.getString("SalesEnqDueDate"))); }
					catch(Exception e){}%>
		<td><input type="hidden" name="duedate" value=""/><%=duedate%>
		
		</td>
		</tr>
		<tr>
		<td><b>Remarks:</b></td>
		<td style="width:100px;"><input type="hidden" name="remarks" id="remarks" value="<%=rsDet.getString("CustRemarks") %>"/>
		<%=rsDet.getString("CustRemarks") %>
		</td>
		<td><b>Group:</b></td>
		<td><input type="text" value="-" id="groupTop"  name="groupTop" style="border: none;" /></td>
		</tr>
		<input type="hidden" name="addresscode" value="<%= rsDet.getString("AddressCode") %>"/>
		</table>
	</td>
	
	<td>
		<table  bgcolor="#C6DEFF" align="right" valign="top" cellpadding="3" cellspacing="3" >
		<tr>
		<td><b>Cust name:</b></td>
		<td><%=rsDet.getString("CompanyName") %></td>
		<td><b>Contact Person:</b></td>
		<td><%=rsDet.getString("ContactPerson") %></td>
		<td><b>Address:</b></td>
		<td style="width: 220px;"><%=rsDet.getString("Address") %></td>
		</tr>
		<tr>
		<td><b>City:</b></td>
		<td><%=rsDet.getString("city") %></td>
		<td><b>State:</b></td>
		<td><%=rsDet.getString("State") %></td>
		<td><b>Country:</b></td>
		<td><%=rsDet.getString("country") %></td>
		</tr>
		<tr>
		<td><b>Phone:</b></td>
		<td><div align="left"><%=((rsDet.getString("Phone")!=null) ? rsDet.getString("Phone") : "-") %></div></td>
		<td><b>Fax:</b></td>
		<td><div align="left"><%=((rsDet.getString("Fax")!=null) ? rsDet.getString("Fax") : "-") %></div></td>
		<td><b>Zip code:</b></td>
		<td><div align="left"><%=((rsDet.getString("Zip")!=null) ? rsDet.getString("Zip") : "-") %></div></td>
		</tr>
	<%}%>        		
	   	</table>
   	
   	</td></tr></table>
  <div>&nbsp;&nbsp;&nbsp;&nbsp;</div>
	<div>&nbsp;&nbsp;&nbsp;&nbsp;</div>


	<table  align="center" class='sortable'>
	<tr>
	 
	<th style="width: 125px;"><a href="#" onclick="checkAll()"><input type="hidden" name="check" id="check" value="">
	<font color="white">Chk All&nbsp;&nbsp;/&nbsp;</font></a> <a href="#"
	onclick="unCheckAll()"> <font color="white">UnChk all</font></a></th>

	<th>Option No</th>
	<th>Insert Or</th>
	<th>Make</th>
	<th>Model</th>
	<th>Part No</th>
	<th>Description</th>
	<th>Quantity</th>
	<th>Selling prize</th>
	<th>Prize Date</th>
	<th>OEM Prize</th>
	</tr>

<%
	String sqlEnq="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items WHERE SalesEnqNo='"+salesenqno+"'";
	
	System.out.println("+++++++++++++++++"+sqlEnq);
	int i=0;
	ResultSet rsEnq=st1.executeQuery(sqlEnq);
while(rsEnq.next())
{
	
	groupName="";makeName="";refMakeNameTable="";
	
	double amount=0.00,discount=0;
	
	groupCode=rsEnq.getInt("TheGroup");
	
	makeCode=rsEnq.getInt("Make");
	itemCode=rsEnq.getString("ItemCode");
	     
	     
	String sqlGroup="SELECT TheGroupName from "+session.getAttribute("CompanyMasterID").toString()+"tbl_groupmaster WHERE TheGroupCode='"+groupCode+"'";
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
	}
	else
	{
		sqlDisplayDesc="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"tbl_otherim_group"+groupCode+" where ItemCode='"+itemCode+"' ";
		makeName="-"  ;
	}
	%>
	<script type="text/javascript">
	document.getElementById('groupTop').value='<%=groupName%>';
	</script>
	<%  
	ResultSet rsDetails1=st.executeQuery(sqlDisplayDesc);
	if(rsDetails1.next())
	{
		String Sql="SELECT * FROM "+rsEnq.getString("TheTableToBeAccessed").toLowerCase()+" WHERE ItemCode='"+itemCode+"' ";
		ResultSet rsSql=st2.executeQuery(Sql);
		if(rsSql.next())
		{
			%>
			<tr>
			<td><input type="checkbox" checked="checked" name="check<%=i %>"   id="check<%=i %>" value="check<%=i %>" /></td>
			<td><div align="right"><%=rsEnq.getString("TheOptionNo") %></div></td>
			<td><div align="right"><%=rsEnq.getString("InsertOR") %></div></td>
			<td><div align="left"><%=makeName %></div></td>
			<td><div align="left"><%=rsSql.getString("Model") %></div></td>
			<td><div align="right"><%=rsSql.getString("Partno") %></div></td>
			<td><div align="left"><input type="hidden" id="description<%=i %>" name="description<%=i %>" value="<%=rsSql.getString("Description") %>"/><%=rsSql.getString("Description") %></div></td>
			<td style="width: 85px;"><div align="right"><input type="text" id="quantity<%=i %>" name="quantity<%=i %>" style="width:70px;padding: 4px 5px 2px 5px;
			border: 1px solid black; text-align:right;	background: #FFFFFF;	font: normal 11px Arial, Helvetica, sans-serif;
				color: #000000; " value="<%=rsEnq.getString("Quantity") %>" /></div></td>
			<td style="width: 85px;"><div align="right"><input type="text" id="sellingPrice<%=i %>" name="sellingPrice<%=i %>" style="width:70px;padding: 4px 5px 2px 5px;
			border: 1px solid black; text-align:right;	background: #FFFFFF;	font: normal 11px Arial, Helvetica, sans-serif;
			color: #000000; " value="<%=rsSql.getString("SellingPrice") %>" /></div></td>
			
			<%String pricedate ="NA";try{pricedate=new SimpleDateFormat(
						"dd-MMM-yyyy")
						.format(new SimpleDateFormat( 
						"yyyy-MM-dd")
						.parse(rsDet.getString("PriceDate"))); }
						catch(Exception e){}%>
			
			<td><div align="left"><%=((pricedate!=null) ? pricedate : "-") %></div></td>
			 
			<td><div align="right"><%=rsSql.getString("OEMPrices") %></div></td>
			
			</tr>
		<%
		i++;
			}
	}
	
}
%>
	 </table>
	<div align="center" style="margin-top: 3em;">
		<input type="hidden" name="group" value="<%= request.getParameter("TheGroup")%>" />
	    <input type="hidden" name="checkedNumber" id="checkedNumber" value="<%=i %>"/>
	    <input type="hidden" name="company" id="company" value="<%=company %>"/>
	    <input type="hidden" name="salesenqno" value="<%=salesenqno %>" />
		<input type="submit" value="submit" style="border: outset; background-color: #C6DEFF"  />
	</div>
	      
	</form>
	
	
	
	<br><br> <br><br> 
	<br><br> <br><br> <br><br> <br><br>
	<div id="footer">
	<p><a href="http://www.myfleetview.com"> Copyright &copy; 2009
	by Transworld Compressor Technologies Ltd. All Rights Reserved.</a></p>
	</div>
	<!-- end #footer -->
	</body>
	</html>
</jsp:useBean>