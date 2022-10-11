<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="header.jsp"%>
<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">

<html>
<head>
<script src="dropdown.js" type="text/javascript"></script>
<script src="ledgerDetails.js" type="text/javascript"></script>

<script language="JavaScript1.2">

/*function showHideAll()
{
	if(document.ledgerDetails.checkAll.checked==true)
	{
		document.ledgerDetails.companyName.value="";
		document.ledgerDetails.companyPerson.value="";
		document.ledgerDetails.companyEmail.value="";
		document.ledgerDetails.companyCity.value="";
		document.ledgerDetails.companyProduct.value="";
		document.ledgerDetails.companyPhone.value="";
		document.getElementById('companyList').style.height = '10px'; 
		document.getElementById('companyList').style.visibility = 'hidden';
	}
	
}*/
	function getSupliers()
	{
		//document.ledgerDetails.checkAll.checked=false;
		document.getElementById('suplierList').style.visibility = 'visible';
			var suplier=document.ledgerDetails.suplierNames.value;
			var ajaxRequest;  // The variable that makes Ajax possible!

			try{
				// Opera 8.0+, Firefox, Safari
				ajaxRequest = new XMLHttpRequest();
			}  
			catch (e)
			{
				// Internet Explorer Browsers
				try
				{
					ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
				} 
				catch (e)
				{
					try
					{
						ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
					} 
					catch (e)
					{
						// Something went wrong
						alert("Your browser broke!");
						return false;
					}
				}
			}

			ajaxRequest.onreadystatechange = function()
			{
				if(ajaxRequest.readyState == 4)
				{
					var reslt=ajaxRequest.responseText;
					document.getElementById("suplierList").innerHTML=reslt;
				} 
			}
			var queryString = "?suplier=" +suplier;
			ajaxRequest.open("GET", "AjaxGetSupplierForPurchaseOrder.jsp" + queryString, true);
			ajaxRequest.send(null); 
		
	}
	
function sendSMS(){

	var ajaxRequest;  // The variable that makes Ajax possible!
	var company=document.ledgerDetails.companyName.value;
	var contact=document.ledgerDetails.companyPerson.value;
	var phone=document.ledgerDetails.companyPhone.value;
	var email=document.ledgerDetails.companyEmail.value;
	var product=document.ledgerDetails.companyProduct.value;
	var city=document.ledgerDetails.companyCity.value;
	try{
		// Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
	}  
	catch (e)
	{
		// Internet Explorer Browsers
		try
		{
			ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
		} 
		catch (e)
		{
			try
			{
				ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
			} 
			catch (e)
			{
				// Something went wrong
				alert("Your browser broke!");
				return false;
			}
		}
	}

	ajaxRequest.onreadystatechange = function()
	{
		if(ajaxRequest.readyState == 4)
		{
			var reslt=ajaxRequest.responseText;
			//alert(reslt);
		}
	}
	var queryString = "?company=" +company+"&contact="+contact+"&phone="+phone+"&email="+email+"&city="+city+"&product="+product;
	ajaxRequest.open("GET", "AjaxSendSMS.jsp" + queryString, true);
	ajaxRequest.send(null); 
}
	
	function showVisitingCardDetails(companyName) {
		document.getElementById('visitingCard').style.visibility='visible';
		document.ledgerDetails.companyNames.value='';
		document.getElementById('companyList').style.height = '10px'; 
		document.getElementById('companyList').style.visibility = 'hidden';

		try{
			// Opera 8.0+, Firefox, Safari
			ajaxRequest = new XMLHttpRequest();
		}  
		catch (e)
		{
			// Internet Explorer Browsers
			try
			{
				ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
			} 
			catch (e)
			{
				try
				{
					ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
				} 
				catch (e)
				{
					// Something went wrong
					alert("Your browser broke!");
					return false;
				}
			}
		}

		ajaxRequest.onreadystatechange = function()
		{
			if(ajaxRequest.readyState == 4)
			{
				var reslt=ajaxRequest.responseText;

				var data=reslt.split("#");
				document.ledgerDetails.companyName.value=data[1];
				document.ledgerDetails.companyPerson.value=data[2];
				document.ledgerDetails.companyEmail.value=data[3];
				document.ledgerDetails.companyCity.value=data[4];
				document.ledgerDetails.companyProduct.value=data[5];
				document.ledgerDetails.companyPhone.value=data[6];
			}
		}
		var queryString = "?companyName=" +companyName;
		ajaxRequest.open("GET", "AjaxShowVisitingCard.jsp" + queryString, true);
		ajaxRequest.send(null); 

		 document.getElementById('tabS').style.visibility='hidden';
	}
	
	function newwindow(webadd)
	{ 
		if(document.ledgerDetails.companyName.value=="" || document.ledgerDetails.companyName.value==null)
			alert("Please select a company ");
		else
			window.open(webadd+'?email='+document.ledgerDetails.companyEmail.value+'&toDate='+document.ledgerDetails.todate.value+'&fromDate='+document.ledgerDetails.fromdate.value+'&company='+document.ledgerDetails.companyName.value,'jav','width=470,height=500,top=250,left=600,resizable=no');
		
	}
	
	function popUp(webadd,trancactionId,condition)
	{ 
		
			window.open(webadd+'?transactionId='+trancactionId+'&condition='+condition,'jav','width=870,height=500,top=150,left=250,resizable=no');
		
	}

	function newSMSwindow(weba)
	{ 
		if(document.ledgerDetails.companyName.value=='' || document.ledgerDetails.companyName.value==null)
			alert("Please select a company ");
		else
		window.open(weba+'?companyName='+document.ledgerDetails.companyName.value+'&email='+document.ledgerDetails.companyEmail.value+'&contactPerson='+document.ledgerDetails.companyPerson.value+'&companyPhone='+document.ledgerDetails.companyPhone.value+'&companyProduct='+document.ledgerDetails.companyProduct.value+'&companyCity='+document.ledgerDetails.companyCity.value,'jav','width=470,height=350,top=250,left=600,resizable=no');
	}

	function gotoPaymentEntry(webadd)
	{ 
 		
		var company=document.ledgerDetails.companyName.value;
		var companyPerson=document.ledgerDetails.companyPerson.value;
		var companyPhone=document.ledgerDetails.companyPhone.value;
		var companyEmail=document.ledgerDetails.companyEmail.value;
		var companyCity=document.ledgerDetails.companyCity.value;
		var companyProduct=document.ledgerDetails.companyProduct.value;
		
		window.location=webadd+'?companyName='+company+'&companyPerson='+companyPerson+'&companyPhone='+companyPhone+'&companyEmail='+companyEmail+'&companyCity='+companyCity+'&companyProduct='+companyProduct;
	}
	function showSelectedSuppliers(SuplierCode,SuplierName)
	{
		//alert(SuplierName);
		//alert(SuplierCode);
		document.ledgerDetails.suplierNames.value=SuplierName;
		//alert(document.ledgerDetails.suplierCode.value='');
		//alert("++++++++");
		document.getElementById('suplierList').style.visibility = 'hidden';
	}


	function gotoExcel (elemId, frmFldId)  
	{  
//		alert("*********** ");

	         var obj = document.getElementById(elemId);  

	         var oFld = document.getElementById(frmFldId); 

	          oFld.value = obj.innerHTML;  

	          document.purchaseenq.action ="excel.jsp";     // CHANGE FORM NAME HERE

	          document.forms["purchaseenq"].submit();       // CHANGE FORM NAME HERE

	} 	 
//	if (document.all || document.getElementById)
	//	document.body.style.background = "url('images/bg.jpg')  white top no-repeat "
</script>
</head>
<body>
	<%
		erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
	%>
	<%
		Connection conn = null;
			Statement st = null, st1 = null, st3 = null, st4 = null;
			Statement st2 = null;
			String selectedName;
			String FollowUpType="";
			Format format=new SimpleDateFormat("dd-MMM-yyyy");
			Format parse=new SimpleDateFormat("yyyy-MM-dd");
			String fromDate="",toDate="",fromDateCal="",toDateCal="";
			String companyName="",phone="",contact="",email="",product="",city="";
			String status="all";
			if(request.getParameter("purchaseorder")!=null)
			{
				status=request.getParameter("purchaseorder");
			}
			
			String id=request.getParameter("id");
	%>
	<%
	Date today = new Date();
	Calendar cal = Calendar.getInstance();
	cal.setTime(today);
	cal.add(Calendar.DAY_OF_MONTH, -30);
	Date today30 = cal.getTime();
	fromDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(today30);
	toDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
	fromDate=new SimpleDateFormat("yyyy-MM-dd").format(today30);
	toDate=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	if (!(null == request.getParameter("fromdate"))) {
	fromDate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("fromdate")));
	fromDateCal=request.getParameter("fromdate");
	}
	if (!(null == request.getParameter("todate"))){
		toDate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("todate")));
		toDateCal=request.getParameter("todate");
	}	
		try {
				conn = erp.ReturnConnection();
				st = conn.createStatement();
				st1 = conn.createStatement();
				st2 = conn.createStatement();
			} catch (Exception e) {
			}
	%>
 
	
<form name='ledgerDetails' action="" method="get" >
<input type="hidden" name="id" value="<%=id %>">
                                                                                                                                                                                                                                                                                              
<br></br>
<table width="90%" border="0" style="font-family: arial;font-size: 8;" align="center">
		<tr>
                                <td>Select:</td>
								<td>
								<select name="purchaseorder" id="purchaseorder" style="width: 100px; height:20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; ">
								<option value="all" <% if(status.equals("all")){ %>Selected<% } %> >All</option>
								<option value="grn" <% if(status.equals("grn")){ %>Selected<% } %>>GRN Generated</option>
								<option value="invraised" <% if(status.equals("invraised")){ %>Selected<% } %>>Invoice Raised</option>
								<option value="popending" <% if(status.equals("popending")){ %>Selected<% } %>>PO Pending</option>
								</select>
		 </td>
		 <td></td>
							<td>Suplier Name:</td>
									<td style="width: 270px;"><div id="suplierNames">
									<input type="text" name="suplierNames" id="search-text" style="width:270px;"
										  value=''  
										/></div>
                           <div id='suplierList' style="width:275px;position:absolute; margin-top:0.2%; margin-left:0.2%; height:150px;overflow: auto; background:#94ECF6;border:thin solid black;">
							
							<table style="display: none;">

							</table>

							
							</div>
							</td>							
							<td colspan="4"><input type="button" value="Search" style="border: outset; background-color: #C6DEFF" id="searchbutton" onclick="getSupliers()"/></td>
							

			<td  style="width: 80px;">
			 
			<input type="text" id="fromdate"
						name="fromdate" value="<%=fromDateCal %>" size="15" readonly
						style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF" />
					
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
 </td><td style="width: 10px;">
			&nbsp;<b>To </b> </td><td style="width: 80px;">
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
			 </td><td>
	 <input type="submit" name="submit" id="submit" style="border: outset;"
				value="GO"></input></td>
										<td>
			<table align="right"><tr>	
				<td align="right">
								<font size="1">&nbsp;&nbsp;&nbsp;<%=new java.util.Date()%></font>
				<a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('purchase','tableHTML');">

	     <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img>
	
					<a href="#" onclick="window.print();return false;" title="Print"><img src="images/print.jpg" width="15px" height="15px"></img></a>
			 
				</td>
		</tr></table>
	</td>
		</tr>
	</table>

</form>


<br></br>

<%
if(request.getQueryString()!=null)
{
%> 
<%	
//boolean isCheckedAll=false;
//isCheckedAll=(request.getParameter("checkAll")!=null ? true : false);
String sqlDetails="",suplierCode="",openingBalance=null;

suplierCode=request.getParameter("suplierNames");
String option=request.getParameter("purchaseorder");
System.out.println(">>>>>>option:"+option);
String supplier="";
String SQLPending="",type="";
if(suplierCode!="")
{type=suplierCode;}
else
{if(option.contains("all")){ type="All Supplier";}
else if(option.contains("grn")){ type="GRN Generated";}
else if(option.contains("invraised")){type="Invoice Raised";}
else if(option.contains("popending")){type="PO Pending";}
}
 
%>
<div style="font-size: 1.5em; text-align: center;"><a>Purchase Order Report For <%=type %> </a></div>
<br></br>
<div id="tabS" style="visibility: visible;">
<br></br> 

<form name="purchaseenq" method="post" >

<%
String exportFileName="PurchaseOrder_det.xls";   // GIVE YOUR REPORT NAME
%>
<div id='purchase'>

<input type="hidden" id="tableHTML" name="tableHTML" value="" />   

	<input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" /> 
 	<table border="1px"  class="sortable" style="font-family: arial;font-size: 8;">
	<tr>
		<th>Sr.No</th>
		<th>PO No</th>
		<th>PO Date</th>
		<th>PO Due Date</th>
		<th>Total</th>
		<th>Currency</th>
		<th>Supplier</th>
		<th>Sign</th>
	</tr>
	<%
	 


	
	int i=1;
	if(suplierCode!="")
	{
		sqlDetails ="SELECT * FROM  "+session.getAttribute("CompanyMasterID").toString()+"purchaseorder  as a INNER JOIN "+session.getAttribute("CompanyMasterID").toString()+"supplierdet as b on (a.Suppliercode = b.SupplierCode) where b.SupplierName ='"+suplierCode+"' and a.PODate BETWEEN '"+fromDate+"' and '"+toDate+"' Order by  a.PODate Desc ";

	}
	else
	{
		if(option.contains("all"))
	{
		sqlDetails ="SELECT * FROM  "+session.getAttribute("CompanyMasterID").toString()+"purchaseorder  as a INNER JOIN "+session.getAttribute("CompanyMasterID").toString()+"supplierdet as b on (a.Suppliercode = b.SupplierCode) where a.PODate between '"+fromDate+"' and '"+toDate+"'  Order by  a.PODate Desc";
	}
	else if(option.contains("grn"))
	{
	       ///sqlDetails ="SELECT * FROM  "+session.getAttribute("CompanyMasterID").toString()+"purchasegrn  as a INNER JOIN "+session.getAttribute("CompanyMasterID").toString()+"supplierdet as b on (a.Suppliercode = b.SupplierCode) where  a.PODate BETWEEN '"+fromDate+"' and '"+toDate+"' Order by  a.PODate Desc ";
	    //sqlDetails="SELECT * FROM  "+session.getAttribute("CompanyMasterID").toString()+"purchasegrn as a LEFT OUTER JOIN  "+session.getAttribute("CompanyMasterID").toString()+"purchaseorder as b on  ( a.PONo = b.PONo )  WHERE b.PODate BETWEEN '"+fromDate+"' and '"+toDate+"'";
	     sqlDetails="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"purchaseorder where PODate BETWEEN '"+fromDate+"' and '"+toDate+"' and pono in (select distinct(pono) from "+session.getAttribute("CompanyMasterID").toString()+"purchasegrn)";

	}
	else if(option.contains("invraised"))
	{
	    //sqlDetails="SELECT * FROM  "+session.getAttribute("CompanyMasterID").toString()+"purchaseinvoice as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"purchaseorder as b on  ( a.PONo = b.PONo )  WHERE b.PODate BETWEEN '"+fromDate+"' and '"+toDate+"'";
        sqlDetails="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"purchaseorder where PODate BETWEEN '"+fromDate+"' and '"+toDate+"' and pono in (select distinct(pono) from "+session.getAttribute("CompanyMasterID").toString()+"purchaseinvoice)";
	}
	else if(option.contains("popending"))
	{
		//sqlDetails ="SELECT * FROM `"+session.getAttribute("CompanyMasterID").toString()+"purchaseorder` where PONo Not IN (select PONo from  "+session.getAttribute("CompanyMasterID").toString()+"purchasegrn)  limit 20";
	     // sqlDetails="SELECT DISTINCT (a.PONO) FROM "+session.getAttribute("CompanyMasterID").toString()+"purchaseorder AS a LEFT JOIN "+session.getAttribute("CompanyMasterID").toString()+"purchasegrn AS b ON (a.PONo <>b.PONo) WHERE a.PODate BETWEEN '"+fromDate+"' and '"+toDate+"' limit 0,20";
	   //SQLPending= "SELECT DISTINCT d.pono1 AS pono2 FROM (SELECT DISTINCT (a.pono) AS pono1, PODate FROM "+session.getAttribute("CompanyMasterID").toString()+"purchaseorder AS a LEFT JOIN "+session.getAttribute("CompanyMasterID").toString()+"purchasegrn AS b ON ( a.PONo <> b.PONo ) WHERE a.PODate BETWEEN '"+fromDate+"' AND '"+toDate+"')d LEFT JOIN "+session.getAttribute("CompanyMasterID").toString()+"purchaseinvoice AS c ON ( d.pono1 <> c.PONo ) WHERE d.PODate BETWEEN '"+fromDate+"' AND '"+toDate+"' ";
		SQLPending=" select distinct(pono) from "+session.getAttribute("CompanyMasterID").toString()+"purchaseorder WHERE PODate BETWEEN '"+fromDate+"' AND '"+toDate+"' and pono not in (select distinct(pono) from "+session.getAttribute("CompanyMasterID").toString()+"purchasegrn) and pono not in (select distinct(pono) from "+session.getAttribute("CompanyMasterID").toString()+"purchaseinvoice)   ";   
	}
	}

	
					try
					{
						
				     if(option.contains("popending"))
				     {
				    	   System.out.println(">>>>>SQLPending:"+SQLPending);
					       ResultSet rsPending=st1.executeQuery(SQLPending);
					       while(rsPending.next())
					       {
					    	   String PONO=rsPending.getString(1);
					    	   sqlDetails="Select * from "+session.getAttribute("CompanyMasterID").toString()+"purchaseorder where PONo='"+PONO+"' ";  
					    	   ResultSet rsDetails = st.executeQuery(sqlDetails);
							   while (rsDetails.next()) 
							   {
								   %>
									<tr>
										<td align="right">
										<div align="right"> <%=i++ %></div>
										</td>
												
										<td>
										<div align="right">
										
										<a href="#" style="font-weight: bold;" onclick="popUp('PODetails.jsp','<%=rsDetails.getString("PONo")%>','<%=id %>')">
											<%=rsDetails.getString("PONo")%></a>
										 </div>
										</td>
										<td>
										<div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rsDetails.getString("PODate")))%></div>
										</td>
										
											<td>
										<div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsDetails.getString("PODueDate")))%></div>
										</td>
										
										<td>
										<div align="right"><%=rsDetails.getString("Total")%></div>
										</td>
										<td><div align="left"><%=rsDetails.getString("CurrType")%></div></td>
										<% 
											
											try{
											String supcode=rsDetails.getString("SupplierCode");	
											
										    String sqlSupplier="select SupplierName from "+session.getAttribute("CompanyMasterID").toString()+"supplierdet where SupplierCode='"+supcode+"'";
										    //System.out.println(">>>>>>sqlSupllier:"+sqlSupplier);
										    ResultSet rsSup=st2.executeQuery(sqlSupplier);
										    rsSup.next();
										     supplier=rsSup.getString("Suppliername");
											}
											catch(Exception e){ System.out.println(e);}
										    
										    %>
										   
										<td><div align="left"><%=supplier%></div></td>
										<td><div align="left"><%=rsDetails.getString("SentBy")%></div></td>
												

									</tr>
									<%
										}
									
							   }
					       
				     }
				     else
				     {
				    	 
				     
					System.out.println(">>>>>>sqlDetails:"+sqlDetails);
					//System.out.println(sqlDetails);
					ResultSet rsDetails = st.executeQuery(sqlDetails);
					while (rsDetails.next()) 
					{
						
						
	%>
	<tr>
		<td align="right">
		<div align="right"> <%=i++ %></div>
		</td>
				
		<td>
		<div align="right">
		
		<a href="#" style="font-weight: bold;" onclick="popUp('PODetails.jsp','<%=rsDetails.getString("PONo")%>','<%=id %>')">
			<%=rsDetails.getString("PONo")%></a>
		 </div>
		</td>
		<td>
		<div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rsDetails.getString("PODate")))%></div>
		</td>
		<td>
		<div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsDetails.getString("PODueDate")))%></div>
		</td>
		<td>
		<div align="right"><%=rsDetails.getString("Total")%></div>
		</td>
		<td><div align="left"><%=rsDetails.getString("CurrType")%></div></td>
		<% if(option.contains("grn") ||option.contains("invraised"))
			{
			try{
			String supcode=rsDetails.getString("SupplierCode");	
			
		    String sqlSupplier="select SupplierName from "+session.getAttribute("CompanyMasterID").toString()+"supplierdet where SupplierCode='"+supcode+"'";
		    //System.out.println(">>>>>>sqlSupllier:"+sqlSupplier);
		    ResultSet rsSup=st1.executeQuery(sqlSupplier);
		    rsSup.next();
		     supplier=rsSup.getString("Suppliername");
			}
			catch(Exception e){ System.out.println(e);}
		    }
		    else
		    {
		    	supplier=rsDetails.getString("SupplierName");
		    }
		    %>
		   
		<td><div align="left"><%=supplier%></div></td>
		<td><div align="left"><%=rsDetails.getString("SentBy")%></div></td>
				

	</tr>
	<%
		}
					}}catch(Exception e)
					{
						System.out.println(e);
					}
}
%>
</table>
</div>

</form>
</div>

<script>document.getElementById("suplierList").style.visibility="hidden";</script>
	<br><br> <br><br> <br><br> <br><br>
	<br><br> <br><br> <br><br> <br><br>
		<br><br> <br><br> <br><br> <br><br>
	<div id="footer">
	<p><a href="http://www.myfleetview.com"> Copyright &copy; 2009
	by Transworld Compressor Technologies Ltd. All Rights Reserved.</a></p>
	</div>
	<!-- end #footer -->
	</body>
	</html>
</jsp:useBean>