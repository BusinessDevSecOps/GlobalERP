<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="conn.jsp"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.TimeZone"%>
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
	<STYLE TYPE="text/css">
     H2 
     {
     page-break-before: always
     }
    </STYLE>
	</head>
	<body>
	
<%
	erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
%>
<%
    Connection conn = null;
    Statement st = null, st1 = null,st2=null,st3=null,st4=null;

	int groupCode=0,makeCode=0;
	int d=0;

	int i=0;
	String groupName="",makeName="",itemCode="",stpercent="";
	String refMakeNameTable="",fromdate="";
	String pfi="",frieght="",grandTotal="";
	String frieghtType="",grandtotal="";
	String sqlDisplayDesc=" ",totalAmount="",totalAmountInWords="",termsconditions="",salesQuoNumber="",status="",statusTD="";
	
	String todaysDate=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new java.util.Date());
	String todaysTime=new SimpleDateFormat(" HH:mm:ss").format(new java.util.Date());
		
	NumberFormat nf = new DecimalFormat("#0.00");

	
		try {
	conn = erp.ReturnConnection();
	st = conn.createStatement();
	st2 = conn.createStatement();
	st1 = conn.createStatement();
	st3 = conn.createStatement();
	st4 = conn.createStatement();
	} catch (Exception e) {
	}

	String sono=request.getParameter("salesOrder");
	System.out.println("IN NEW PAGE   "+sono);
	String SqlOrderDet="SELECT * from "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det WHERE SalesOrderNo='"+sono+"' ";
 	System.out.println(">>>>>>>>>>>      "+SqlOrderDet);
 	ResultSet rsOrderDet=st4.executeQuery(SqlOrderDet);
 		if(rsOrderDet.next()){
 			totalAmount=rsOrderDet.getString("Total");
 			totalAmountInWords=rsOrderDet.getString("TotalinWords");
 			termsconditions=rsOrderDet.getString("SOTermsAndConditions");
 			System.out.println( "Terms And Conditions="+termsconditions);
%>

		<div align="left"><a href="http://www.transworldcompressor.com/">
		<img src="images/transworld.jpg" height="70" width="280"></img> </a></div>

 		<div align="right"><a href="#" onclick="window.print();return true;" title="Print"><img src="images/print.jpg" width="15px" height="15px"></img></a>
	</div>
	<table  align="center" width="100%" valign="top">
    <tr>
	
	<%
	String companydata="select * from CompanyMaster where companymid="+session.getAttribute("CompanyMasterID").toString();
	ResultSet rsdata=st.executeQuery(companydata);
	rsdata.next();
	String companyname=rsdata.getString("Companyname");
	String address=rsdata.getString("address");
	String phone=rsdata.getString("phone");
	String mail=rsdata.getString("emailid");
	String website=rsdata.getString("website");
	String fax=rsdata.getString("fax");
	%>
	<td style="font-size: small;">
	<b><%=companyname %></b><br>
	<%=address %><br>
	<%=phone %>   <%=fax %><br>
	<%=mail %>    <%=website %></td>
	
	<td align="right">
		<img src="images/UKAS BSI Logo.bmp" height="60" width="100"></img> </td>
	</tr>
    </table>
  <% String CurDate=rsOrderDet.getString("SalesOrderDate");
 		System.out.println("Date==>"+CurDate);	
 		CurDate=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(CurDate));
 		System.out.println("Date==>"+CurDate);	%>
	<br>							
							
	<table border="1" width="100%" style="font-size: small">
	<tr>
		 
		 <td><b>SalesOrder RefNO:</b> &nbsp;  &nbsp; &nbsp;     <%=rsOrderDet.getString("SalesorderRefNo") %>
		<br></br><br></br>
		<b> Sales Order Date:</b>  &nbsp;  &nbsp; &nbsp;          <%=CurDate%>
	<br></br><br></br>
		<b>Customer Name:</b>   &nbsp;  &nbsp; &nbsp;     <%=rsOrderDet.getString("CompanyName") %>
		
	
	</tr> 
		 
		
	</table>
</td></tr><tr><td>&nbsp;</td></tr></table>	
<div align="center" style="font-size: small;">
<b><u>SUB: SALES ORDER</u></b> 
</div>

<br>

	<table border="1" style="border-spacing: 0px" class="sortable">
	<tr style="border-spacing: 0px"> 
	<th>Sr No</th>
	<th>Make</th>
	<th>Part No</th>													
	<th style="width: 400px;">Description</th>
	<th>Quantity</th>
	<th>Unit prize</th>
	<th>Discount %</th>
	<th>Tax %</th>
	<th>Amount</th>	
	</tr>

<% 
 	double tax=0,discount=0.00 ,total=0.00;

	String sqlOrderItems="SELECT * FROM  "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items WHERE SalesOrderNo='"+sono+"'";
	System.out.println(sqlOrderItems);
	ResultSet rsOrderItems=st1.executeQuery(sqlOrderItems);
	i=1;
		while(rsOrderItems.next())
		{
			groupName="";makeName="";refMakeNameTable="";
			groupCode=rsOrderItems.getInt("TheGroup");
			makeCode=rsOrderItems.getInt("Make");
			itemCode=rsOrderItems.getString("ItemCode");
			  
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
			}
			else{
				sqlDisplayDesc="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"tbl_otherim_group"+groupCode+" where ItemCode='"+itemCode+"' ";
				makeName="-"  ;
			}
		
			ResultSet rsDisplayDesc=st3.executeQuery(sqlDisplayDesc);
			
			if(rsDisplayDesc.next())
			{
		    %>
		    <tr style="border-spacing: 0px">
			    <td><%=i %></td>
			    <td><div align="left"><%=makeName %></div></td>
			    <td><%=rsDisplayDesc.getString("Partno") %></td>
		   	    <td><div align="left"><%=rsDisplayDesc.getString("Description") %></div></td>
			    <td><div align="right"><%=rsOrderItems.getString("Quantity") %></div></td>
			    <td><div align="right"><%=rsOrderItems.getString("SellingPrice") %></div></td>
			    <td><div align="right"><%=rsOrderItems.getString("DiscountPercent") %></div></td>
			    <td><div align="right"><%=rsOrderItems.getString("STPercent") %></div></td>
			    <% double sp=rsOrderItems.getDouble("SellingPrice");
				      double dp=rsOrderItems.getDouble("DiscountPercent");
				      double stper=rsOrderItems.getDouble("STPercent");
				      double qty=rsOrderItems.getInt("Quantity");
				      double disval=(sp-((dp/100)*sp));
				      System.out.println("disc value-->"+disval);
				      double tot=((sp-((dp/100)*sp))+((stper/100)*disval))*qty;
				      System.out.println("(("+sp+"-(("+dp+"/100)*"+sp+"))+(("+stper+"/100)*"+sp+"))*"+qty+"====>"+tot);
				    
				    %>
			    <td><div align="right"><%=nf.format(tot)%></td>
		    </tr>
		    <% i++;
		  
		    
		   }
			
		   }
%>
	</table>
	
	<div style="font-size: 1.0em;" align="right">
	<b>Total:</b> &nbsp;&nbsp;<input type="text" readonly="readonly" name="total" id="total" style="width: 230px; border: none;" value="<%=totalAmount%>"/>
	<input type="hidden" name="total" value="<%=totalAmount%>"/>
	</div>
	
	<div style="font-size: 1.0em" align="right" ><table><tr><td valign="top">
	<b>Total In Words : </b></td><td>
	<textarea readonly="readonly" name="rupees" id="rupees"   style="width: 230px; border: none;" ><%=totalAmountInWords %></textarea>
	</td></tr></table>
	<input type="hidden" name="rupees" value="<%=totalAmountInWords %>"/>
	</div>
	
	<table align="left" style="font-size: small">
	<tr>
	<td><b><u>TERMS & CONDITIONS :</u></b></td>
	</tr>
	</table>
	
	<br>
	<div align="left" style="position:absolute; margin-top: 1em; font-size: 1.1em"> &nbsp;<textarea readonly="readonly" name="termsconditions"
 	    id="search-text" style='border:none; width: 430px; height: 150px;'><%=termsconditions %></textarea></div>
 	</br>
	

	<div align="right" style="font-size:small;">
		For Sales Dept.
	</div>
	<br>
	<div align="right" style="font-size: small;">
		<%= rsOrderDet.getString("TWEmpName")%><br>
		</div>
<%}%>
	</body>
	</html>
</jsp:useBean>