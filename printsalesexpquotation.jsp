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
	String sqlDisplayDesc=" ",totalAmount="",totalAmountInWords="",termsconditions="",salesQuoNumber="",status="",statusTD="",currval="",currsym="";
	
	String todaysDate=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new java.util.Date());
	String todaysTime=new SimpleDateFormat(" HH:mm:ss").format(new java.util.Date());
	
	
	NumberFormat nf = new DecimalFormat("#0.00");
	
	
	
	String salequo=request.getParameter("salesQuotation");
	
	String sal1[]=salequo.split("/");
	
	String salesquono=sal1[0];
	currsym=sal1[1];
	System.out.println("sale is " +salesquono);  

	System.out.println("value is " +currsym);  

	//salesquono
	
	System.out.println(salesquono);
	try {
	conn = erp.ReturnConnection();
	st = conn.createStatement();
	st2 = conn.createStatement();
	st1 = conn.createStatement();
	st3 = conn.createStatement();
	st4 = conn.createStatement();
	} catch (Exception e) {
	}

	String SqlQuoDet="SELECT * from "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det WHERE SalesQuoNo='"+salesquono+"' ";
 	System.out.println(">>>>>>>>>>>      "+SqlQuoDet);
 	ResultSet rsQuoDet=st4.executeQuery(SqlQuoDet);
 		if(rsQuoDet.next()){
 			totalAmount=rsQuoDet.getString("Total");
 			totalAmountInWords=rsQuoDet.getString("TotalinWords");
 			termsconditions=rsQuoDet.getString("TermsAndConditions");
 			currval=rsQuoDet.getString("CurrValue");
 			
 			
%>
	<table  align="center" width="100%" valign="top" style="font-size: small;">
    <tr>
	
	<%
	String companydata="select * from "+session.getAttribute("CompanyMasterID").toString()+"ourcompanydet where OurCompanyCode='1' ";
	ResultSet rsdata=st.executeQuery(companydata);
	rsdata.next();
	String companyname=rsdata.getString("OurCompanyName");
	String address=rsdata.getString("OurCompanyAddress");
	String phone=rsdata.getString("PhoneNo");
	String mail=rsdata.getString("EMail");
	String website=rsdata.getString("Website");
	String fax=rsdata.getString("FaxNo");
	%>
	<div align="right"><a href="#" onclick="window.print();return true;" title="Print"><img src="images/print.jpg" width="15px" height="15px"></img></a>
	</div>
	<td style="font-size: small;" align="center">
	<b><%=companyname %></b><br>
	<%=address %><br>
	<%=phone %>   <%=fax %><br>
	<%=mail %>    <%=website %></td>
	
	</tr>
    </table>
  		
	<table  style="font-size:small;" width="100%" border="1" cellspacing="0" cellpadding="0" >
	<tr>
		 
		 <td><b>Ref NO:</b>
		<%=rsQuoDet.getString("TWSalesRefNo") %>
		<br>
		<b><%=rsQuoDet.getString("CompanyName") %></b>
		<br>
		<%=rsQuoDet.getString("Address")  %></td>
		<td>
		 <b>Date:</b><%=new SimpleDateFormat(
			"dd-MMM-yyyy")
			.format(new SimpleDateFormat( 
					"yyyy-MM-dd")
					.parse(rsQuoDet.getString("SalesQuoDate")))%>
<br>
		
		<b>Kind Attn:</b>
	<%=rsQuoDet.getString("ContactPerson") %>
	<br>	

	
<b>Tel :</b> <%=((rsQuoDet.getString("Phone")!=null) ? rsQuoDet.getString("Phone") : "-") %></td>
		
	
	</tr> 
		 
	<%}%>	
	</table>
	
</td></tr><tr><td>&nbsp;</td></tr></table>	
<div align="center" style="font-size: small;"><b><u>
SUB: QUOTATION </u></b>
</div>
<div align="left" style="font-size: small;">
Dear Sir,<br>
We thank you for your valuable enquiry forwarded to us. Kindly find enclosed our lowest quote for the same;
</div>
<br></br>
<table style="font-size: small;">
<tr><td>
<b>Group : <input type="text" value="-" id="groupTop"  name="groupTop" style="border: none;font-size: small;" /></b></td></tr>
<tr>
<td><b>Make :</b> <input type="text" value="-" id="makeTop"  name="makeTop" style="border: none;font-size: small;" /></td>
<td><b>Model : </b><input type="text" value="-" id="modelTop"  name="modelTop" style="border: none;font-size: small;" /></td>
</tr>
</table>
	<table border="1" style="border-spacing: 0px;font-size: small;" class="sortable">
	<tr style="border-spacing: 0px">
	<th>Sr No</th>

	<th>Part No</th>													
	<th style="width: 400px;">Description</th>
	<th>Quantity</th>
	<th>Unit Price</th>
	<th>Discount %</th>
	<th>Tax %</th>
	<th>Amount</th>	
	</tr>

<% 
 	double tax=0,discount=0.00 ,total=0.00;

	String sqlQuoItems="SELECT * FROM  "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items WHERE SalesQuoNo='"+salesquono+"'";
	System.out.println(sqlQuoItems);
	ResultSet rsQuoItems=st1.executeQuery(sqlQuoItems);
	i=1;
		while(rsQuoItems.next())
		{
			groupName="";makeName="";refMakeNameTable="";
			groupCode=rsQuoItems.getInt("TheGroup");
			makeCode=rsQuoItems.getInt("Make");
			itemCode=rsQuoItems.getString("ItemCode");
			  
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
		
			%>
			    <script type="text/javascript">
	  	document.getElementById('groupTop').value='<%=groupName%>';
	  	document.getElementById('makeTop').value='<%=makeName%>';
	  </script>
			<%
			ResultSet rsDisplayDesc=st3.executeQuery(sqlDisplayDesc);
			
			if(rsDisplayDesc.next())
			{
		    %>
    <script type="text/javascript">
	  	document.getElementById('modelTop').value='<%=rsDisplayDesc.getString("Model")%>';
	  </script>
		    
		    <tr>
			    <td><%=i %></td>
			   
			    <td><%=rsDisplayDesc.getString("Partno") %></td>
		   	    <td><div align="left"><%=rsDisplayDesc.getString("Description") %></div></td>
			    <td><div align="right"><%=rsQuoItems.getString("Quantity") %></div></td>
			    <td><div align="right"><%=rsQuoItems.getString("SellingPrice") %></div></td>
			    <td><div align="right"><%=rsQuoItems.getString("DiscountPercent") %></div></td>
			    <td><div align="right"><%=rsQuoItems.getString("STPercent") %></div></td>
			  
			    
			    <td><div align="right"><%=nf.format((rsQuoItems.getDouble("SellingPrice")-((rsQuoItems.getDouble("DiscountPercent")/100)*rsQuoItems.getDouble("SellingPrice"))
			    +((rsQuoItems.getDouble("STPercent")/100)*rsQuoItems.getDouble("SellingPrice")))*rsQuoItems.getInt("Quantity"))
			    %></td>
		    </tr>
		    <% i++;
		   }
			
		   }
%>   
	</table>

	<table align="right" style="font-size: small;">
	<tr>
	 <td><u><b>Total : <%=currsym %> <%=totalAmount%></b></u></td>
	</tr>
	<tr> <td>* Total value rounded off </td></tr>
<tr>
		<textarea readonly="readonly" name="rupees" id="rupees"   style="width: 230px; border: none;" ><%=totalAmountInWords %></textarea>
		</td></tr></table>
	</div>
	
	<div style="font-size: small; "><b><u>TERMS & CONDITIONS :</u></b><br>
<textarea style='border:none; width:100%;height:300px;'><%=termsconditions %></textarea></div>

<div align="left"  style="font-size: small;">	
	
We hope our offer falls in the line of your requirement & look forward to the pleasure of receiving your valuable purchase order.<br>
Thanking You

	</div>	
<div align="right" style="font-size: small;"><b>
For Transworld Compressor Technologies Ltd.</b><br>

<%=session.getAttribute("EmpName") %><br>
(Authorised Signatory)
</div>
	
	</body>
	</html>
</jsp:useBean>