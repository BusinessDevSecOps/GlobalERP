<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="header.jsp"%>

<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">

<%@ page import="java.text.NumberFormat" %>
<%
    NumberFormat nf = NumberFormat.getInstance();
    nf.setMaximumFractionDigits(2);
    nf.setMinimumFractionDigits(2);
    
%>

	<script src="dropdown.js" type="text/javascript"></script>
		<script src="ledgerDetails.js" type="text/javascript"></script>


	<script language="JavaScript1.2">

	function getCompanies()
	{
		document.getElementById('companyList').style.visibility = 'visible';
			var company=document.ledgerDetails.companyNames.value;

			if(company=="")
			{
				document.getElementById('companyList').style.visibility = 'hidden';
			}else
			{
				company=company.replace(".", "");
				company=company.replace(",", "");
				company=company.replace("$", "");
				company=company.replace("#", "");
				company=company.replace("?", "");
				company=company.replace("-", "");
				company=company.replace("_", "");
				company=company.replace(" ", "");
				company=company.replace("(", "");
				company=company.replace(")", "");
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
					document.getElementById("companyList").innerHTML=reslt;
				} 
			}
			var queryString = "?company=" +company;
			ajaxRequest.open("GET", "AjaxGetLedgerCompanies.jsp" + queryString, true);
			ajaxRequest.send(null); 
			}//end of else
		
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
			alert(reslt);
		}
	}
	var queryString = "?company=" +company+"&contact="+contact+"&phone="+phone+"&email="+email+"&city="+city+"&product="+product;
	ajaxRequest.open("GET", "AjaxSendSMS.jsp" + queryString, true);
	ajaxRequest.send(null); 
}

	
	function showVisitingCardDetails(companyName) {
		document.getElementById('visitingCard').style.visibility='visible';
		//document.ledgerDetails.companyNames.value='';
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
				document.ledgerDetails.companyNames.value=data[1];
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
	function popUp(webadd,trancactionId)
	{ 
		var company=document.ledgerDetails.companyName.value;
			window.open(webadd+'?company='+company+'&transactionId='+trancactionId,'jav','width=870,height=500,top=150,left=250,resizable=yes');
		
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

	function updatebalance()
	{  
		
		var customercodes=document.getElementById("customercodes").value;
		//alert(customercodes);
		document.ledgerDetails1.action ="updatebalance.jsp?customercodes="+customercodes;
		document.forms["ledgerDetails1"].submit();
		window.reload();
	}

	function excelReport()
	{  
		
		var customercodes=document.getElementById("customercodes").value;
		//alert(customercodes);
		document.ledgerDetails1.action =".jsp?customercodes="+customercodes;
		document.forms["ledgerDetails1"].submit();
		window.reload();
	}

	function gotoExcel(elemId, frmFldId)  
	{  
		
		var originalContents = document.body.innerHTML;
		var input = document.ledgerDetails1.getElementsByTagName("a");
	    var count = input.length;
	    for(var i =0; i < count; i++)
	    {
	 		document.ledgerDetails1.getElementsByTagName("a")[i].removeAttribute("href");
	    }
	    var obj = document.getElementById(elemId);  
	    var oFld = document.getElementById(frmFldId); 
	    oFld.value = obj.innerHTML;
	    //alert("ok");  
	    document.ledgerDetails1.action ="excel.jsp";
	    document.forms["ledgerDetails1"].submit();
	    //alert("zale");
	    document.body.innerHTML = originalContents;
	}
		
	function chk()
	{

		
		
		var chkf="";
		var chkt="";
		var objFromDate = document.getElementById("fromdate").value;
		var fdate=objFromDate.split("-");
		if(fdate[1]=="Jan")
		{
			chkf="01";
		}
		if(fdate[1]=="Feb")
		{
			chkf="02";
		}
		if(fdate[1]=="Mar")
		{
			chkf="03";
		}
		if(fdate[1]=="Apr")
		{
			chkf="04";
		}
		if(fdate[1]=="May")
		{
			chkf="05";
		}
		if(fdate[1]=="Jun")
		{
			chkf="06";
		}
		if(fdate[1]=="Jul")
		{
			chkf="07";
		}
		if(fdate[1]=="Aug")
		{
			chkf="08";
		}
		if(fdate[1]=="Sep")
		{
			chkf="09";
		}
		if(fdate[1]=="Oct")
		{
			chkf="10";
		}
		if(fdate[1]=="Nov")
		{
			chkf="11";
		}
		if(fdate[1]=="Dec")
		{
			chkf="12";
		}
		var objFromDate1=""+fdate[2]+"-"+chkf+"-"+fdate[0]+"";
	    var objToDate = document.getElementById("todate").value;
	    var tdate=objToDate.split("-");
	    if(tdate[1]=="Jan")
		{
	    	chkt="01";
		}
		if(tdate[1]=="Feb")
		{
			chkt="02";
		}
		if(tdate[1]=="Mar")
		{
			chkt="03";
		}
		if(tdate[1]=="Apr")
		{
			chkt="04";
		}
		if(tdate[1]=="May")
		{
			chkt="05";
		}
		if(tdate[1]=="Jun")
		{
			chkt="06";
		}
		if(tdate[1]=="Jul")
		{
			chkt="07";
		}
		if(tdate[1]=="Aug")
		{
			chkt="08";
		}
		if(tdate[1]=="Sep")
		{
			chkt="09";
		}
		if(tdate[1]=="Oct")
		{
			chkt="10";
		}
		if(tdate[1]=="Nov")
		{
			chkt="11";
		}
		if(tdate[1]=="Dec")
		{
			chkt="12";
		}
	    var objToDate1=""+tdate[2]+"-"+chkt+"-"+tdate[0]+"";
	   // alert("Entry from date > "+objFromDate1+" Todate > "+objToDate1);
	     
	    var date1 = new Date(objFromDate1);
	    var date2 = new Date(objToDate1);
	    
	    //alert("from > "+date1+" Todate > "+date2);
	    
	    var date3 = new Date();
	    var date4 = date3.getMonth() + "-" + date3.getDay() + "-" + date3.getYear();
	    var currentDate = new Date(date4);
	     
	        if(date1 > date2)
	        {
	            alert("From Date Should be Less Than To Date");
	            return false; 
	        }
//	         else if(date1 > currentDate)
//	         {
//	             alert("From Date should be less than current date");
//	             return false; 
//	         }
	         /* else if(date2 > currentDate) 
	         {
	             alert("To Date should be less than current date");
	             return false; 
	         } */

	        return true;
		
	}
	 
	//if (document.all || document.getElementById)
//		document.body.style.background = "url('images/bg.jpg')  white top no-repeat "
</script>

<body>
	 
	<%
		erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
	%>
	<%
	String exportFileName="ledgerdetails.xls";
		Connection conn = null;
			Statement st = null, st1 = null, st3 = null, st4 = null;
			Statement st2 = null;
			String selectedName;
			String FollowUpType="";
			Format format=new SimpleDateFormat("dd-MMM-yyyy");
			Format parse=new SimpleDateFormat("yyyy-MM-dd");
			String fromDate="",toDate="",fromDateCal="",toDateCal="";
			String companyName="",phone="",contact="",email="",product="",city="",customercode="";
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
	if (!(null == request.getParameter("companyName"))) 
	{
		companyName=request.getParameter("companyName").replace("...","&");
		phone=request.getParameter("companyPhone");
		email=request.getParameter("companyEmail");
		contact=request.getParameter("companyPerson");
		city=request.getParameter("companyCity");
		product=request.getParameter("companyProduct");
		customercode=request.getParameter("customercode");
		
		%>
		
		<% 
	}	
		try {
				conn = erp.ReturnConnection();
				st = conn.createStatement();
				st1 = conn.createStatement();
				st2 = conn.createStatement();
				st3 = conn.createStatement();
		
			if (null == request.getParameter("repName"))
				selectedName = "All";
			else
				selectedName = request.getParameter("repName");
	%>
 

	<!-- <div
		style="font-size: 1.8em; text-align: center;"><a> 

		  Ledger A/c's Details</a>
 </div>-->
  <div align="center"> 
 <font size="3" >
	<B>	<a> Ledger A/c's Details</a></B>  </font>
 </div> 
 <form name='ledgerDetails' action="" method="get" >

<table width="100%" border="0">
<tr>
<td style="width: 20px">

<div id="visitingCard" style="visibility: visible;">
			<table  bgcolor="#C6DEFF">
				<tr>
					<td align="left" ><div id="Company"><b>Company</b></div></td>
					<td align="left">
					<div id="companyName"><input type="text" name="companyName" 
						id="search-text" value="<%=companyName %>"
						style='border-style: none; width: 200px; height: 12px; background-color: #C6DEFF;'' readonly="readonly" /></div>
					</td>
					<input type="hidden" name="customercode" id="customercode" value="<%=customercode%>"/>
					<td align="center" style="width: 25%"><div id="Contact"><b>Contact </b></div></td>
					<td valign="top" align="right">
					<div id="companyPerson"><input type="text"
						name="companyPerson" id="search-text" value="<%=contact %>" readonly="readonly"
						style='border-style: none; width: 200px; background-color: #C6DEFF;'' /></div>
					</td>

								<td valign="top" style="width: 30px;">
				<a href="javascript:void(0)" style="font-weight: bold; color: black; " onclick="newSMSwindow('smsvc.jsp');">
<img src="images/sms.png" width="25px" height="22px" style="border-style: none"></img>
</a> 
			</td>

				</tr>
								<tr>
					<td align="left"><div id="Phone"><b>Phone</b></div></td>
					<td align="left">
					<div id="companyPhone"><input type="text" name="companyPhone"
						id="search-text" value="<%=phone %>"
						style='border-style: none; width: 200px; height: 12px; background-color: #C6DEFF;'' readonly="readonly"/></div>
					</td>
					<td align="center" style="width: 25%" valign="middle"><div id="Email"><b>E-Mail </b></div></td>
					<td valign="top" align="right" style="">
					<div id="companyEmail">
					<textarea
										name="companyEmail" rows="1" id="search-text"   readonly="readonly"
										style='border-style: none; width: 200px; height: 30px; background-color: #C6DEFF;''><%=email %></textarea>
		 </div>
					</td>
					<td>
						
					</td>

					</tr>
								<tr>
					<td align="left"><div id="Product"><b>Product</b></div></td>
					<td align="left">
					<div id="companyProduct"><input type="text" name="companyProduct"
						id="search-text" value="<%=product %>"
						style='border-style: none; width: 200px; height: 12px; background-color: #C6DEFF;'' readonly="readonly"/></div>
					</td>
					<td align="center" style="width: 25%"><div id=City"><b>City </b></div></td>
					<td valign="top" align="right">
					<div id="companyCity"><input type="text" readonly="readonly"
						name="companyCity" id="search-text" value="<%=city %>"
						style='border-style: none; width: 200px; background-color: #C6DEFF;'' /></div>
					</td>
<td></td>
				</tr>
				</table>

</div>

</td><td align="left" valign="top"> 
			<table width="100%" border="0">
			<tr>
			<td valign="top" style="width: 70px;" rowspan="4" >
				<a href="javascript:void(0)" style="font-weight: bold; color: black; " onclick="newwindow('emailTransactions.jsp');">
<img src="images/email.png" width="25px" height="22px" style="border-style: none"></img>
</a>  
			</td>
			</tr>
				<tr> 
					<td align="left" style="height: 30px;" valign="top">
					
					 <a href="javascript:void(0)" ><input type="button" onclick="gotoPaymentEntry('addPayment.jsp');"
						style="font-size:small; color: black; background-color: #C6DEFF; border-style: outset"
						name="addpayment" value="Payment Entry" /></a>
	
					
				</td></tr>
				<!--</tr>
					
					
					<a
						href="addPayment.jsp"
						style="font-weight: bold; color: black; background-color: #C6DEFF;">Customer
					Transaction Details
 </a></td>

				</tr>
				<tr>
					<td align="left" style="height: 30px;"><a
						href="addPayment.jsp"
						style="font-weight: bold; color: black; background-color: #C6DEFF;">View
					Payment Details &nbsp;&nbsp; &nbsp;</a>
					
					<a
						href="addPayment.jsp"
						style="font-weight: bold; color: black; background-color: #C6DEFF;">Update
					Payments &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;
					&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</a></td>
				</tr>
				<tr>
					<td align="left" style="height: 30px;"><a
						href="addPayment.jsp"
						style="font-weight: bold; color: black; background-color: #C6DEFF;">Cancel
					Transactions &nbsp;&nbsp; &nbsp;&nbsp;  </a>&nbsp; 
					<a
						href="addPayment.jsp"
						style="font-weight: bold; color: black; background-color: #C6DEFF;">PDC
						&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
	 

					&nbsp;</a></td>
				</tr>

 -->
			</table>
			</td>
<td>
 

</td>
</tr>
</table>

<table width="100%" style="border:thin solid black;">
		<tr>
			<td align="left" valign="top" width="200">
			<div id="companyNames">Company Name: 
			<input type="text" name="companyNames" id="search-text"  value='' onkeyup="getCompanies()" />
			</div>
			</td>
			<td align="left" style="width: 250px;">
			<div id='companyList'>
			<div style="height: 10px; width: 400px; overflow: auto;"></div>
			</div>
			</td>
 			<td align="left" valign="top">
			<table><tr><td> 
			&nbsp;<b>From </b>&nbsp;</td><td>
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
			</td>
			<td>
			&nbsp;<b>To </b>&nbsp;</td><td>
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
			</script></td>
			<td>
	 		 <input type="submit" name="submit" id="submit" style="border: outset;"	value="GO" onclick="return chk()"></input></td>
			<%-- <td align="right"><font size="1">&nbsp;&nbsp;&nbsp;<%=new java.util.Date()%></font> --%> 
			<%-- <td align="right"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=new java.util.Date()%></font> --%>
			<td align="right"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date())%>
			
			 <a href="javascript:void(0)" style="font-weight: bold; color: black; " onclick="gotoExcel('tabS', 'tableHTML');">
			<img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img>
			</a>
			<!-- <a href="javascript:void(0)" onclick="javascript:window.open('excelLedgerDetails.jsp?company=<%=companyName %>&companyPhone=<%=phone %>&companyEmail=<%=email %>&companyPerson=<%=email %>&companyCity=<%=city %>&companyProduct=<%=product %>&fromDate=<%=fromDate %>&toDate=<%=toDate %>');" title="Export To Excel">

				<img src="images/excel.jpg"	width="15px" height="15px"></img></a>&nbsp;&nbsp;&nbsp;
				 -->
			 <a href="javascript:void(0)" onclick="window.print();return false;" title="Print"><img src="images/print.jpg" width="15px" height="15px"></img></a>
			 </td>
			 </tr>
			 
	         </table>
				</td>
		</tr>
	</table>


</form>
<form name='ledgerDetails1' action="" method="post" >
<%
if(null != request.getQueryString() )
{
%> 
<%	
String sqlDetails="",companyCode="";
double sumDebit=0,sumCredit=0,openingBalance=0;
			String sql = "SELECT CustomerCode FROM  "+session.getAttribute("CompanyMasterID").toString()+"customerdet where CustomerCode ='"
					+ customercode + "' ";
			ResultSet rsCode = st1.executeQuery(sql);
 System.out.println(sql);

            if (rsCode.next())
			{
     %>

      <%
        
				ResultSet rsBalance=st.executeQuery("SELECT Balance,TransactionDate  FROM  "+session.getAttribute("CompanyMasterID").toString()+"customerledgeraccount where CustomerCode='"+ rsCode.getString(1)+"'"+
						 " and  TransactionDate <'"+fromDate+"' order by concat(TransactionDate , TransactionId ) desc limit 1");
            	 System.out.println("SELECT Balance,TransactionDate  FROM  "+session.getAttribute("CompanyMasterID").toString()+"customerledgeraccount where CustomerCode='"+ rsCode.getString(1)+"'"+
						 " and  TransactionDate <'"+fromDate+"' order by concat(TransactionDate , TransactionId ) desc limit 1");
				if (rsBalance.next())
				{
					openingBalance=rsBalance.getFloat(1);
					 System.out.println("OPENING BALANCE ------------========"+openingBalance);
				}
				
%>
<div style="width:100%; text-align:right;">
 <input type="hidden" name="customercodes" id="customercodes" value="<%=rsCode.getString(1)%>"/>
<a href="excelinvoicedet.jsp?company=<%=request.getParameter("companyName") %>&fromdate=<%=fromDateCal %>&todate=<%= toDateCal%>"><!-- DETAIL REPORT(.xls) --></a>
&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="regenerate" id="regenerate" value="Re-Calculate Balance" onclick="updatebalance()"></input>
<input type="hidden" id="tableHTML" name="tableHTML" value="" />
<input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" />
</div>

<div id="tabS" style="visibility: visible;">


 <!--  
<table border="1px" width="100%" class="sortable">
 	<tr style="background-color: #C6DEFF;">
		<td style="background-color: #C6DEFF;" width="35%">Total:  
          </td>
 	<td style="background-color: #C6DEFF;" align="left"><div align="left">
 < %=rsTotal.getString(1) %> 
 < %=rsTotal.getString(2) %> 
 < %=rsTotal.getString(3) %> </div></td> 
	</tr>
 
 
	</table> -->
	 <input type="hidden" name="openingBalance" id="openingBalance" value="<%=openingBalance %>"/>



	 
	<table border="1px"  class="sortable">
	<tr>
	<td colspan="9" align="center" style="background-color:#C6DEFF;">
	<h3>Ledger Details: <%=request.getParameter("companyName")%></h3>
	</td>
	</tr>
	<tr >
	<td colspan="9" align="center" style="background-color:#C6DEFF;">
	<b>From <%= fromDateCal%> &nbsp;To <%=toDateCal%></b>
	</td> 
	</tr>
	<tr>
		<th>Sr.No</th>
		<th>Tr. Date</th>
		<th style="width: 140px;">Tr. ID</th>
		<th>Debit</th>
		<th>Credit</th>
		<th>Balance(o/s)</th>
		<th>Desc.</th>
		<th>Desc. Id</th>
		<th>Sign</th>
	</tr>
	
	<tr>
 <%if(openingBalance!=0.00) {
	 double credit=0.00,debit=0.00;
	 if(openingBalance<0)
		 credit=openingBalance;
	 else if(openingBalance>0)
	 	debit=openingBalance;
 %>

		<td style="background-color: #C6DEFF;" align="right"><div align="right">1</div></td>
 	<td style="background-color: #C6DEFF;" align="right"  ><div align="right">  <%=fromDateCal %></div> </td>
 	<td style="background-color: #C6DEFF;" align="right"  > Opening Balance </td>
 	<td style="background-color: #C6DEFF;" align="right"  > <div align="right"> <%=nf.format(debit) %> </div></td>
 	<td style="background-color: #C6DEFF;" align="right"  ><div align="right">  <%=nf.format(credit) %> </div></td>
 	<td style="background-color: #C6DEFF;" align="right"  > <div align="right"> 0.00 </div></td>
 	<td style="background-color: #C6DEFF;" align="right"  >  --- </td>
 	<td style="background-color: #C6DEFF;" align="right"  >  --- </td>
 	<td style="background-color: #C6DEFF;" align="right"  >  --- </td>
 
 </tr>

	<%}
 else{
	//	}
			
			%>

			<tr><td style="background-color: #C6DEFF;" colspan="9" >---- NO DATA ----</td></tr>
			<%}
					companyCode = rsCode.getString(1);
					sumDebit=sumDebit+openingBalance;
					int i = 2;
					String id="",trDetails="";
					sqlDetails = "SELECT * FROM  "+session.getAttribute("CompanyMasterID").toString()+"customerledgeraccount where CustomerCode='"
							+ companyCode
							+ "' and  TransactionDate between '"
							+ fromDate
							+ "' and '"
							+ toDate
							+ "' ORDER BY  concat(TransactionDate , TransactionId ) ASC";
					System.out.println(sqlDetails);
					System.out.println(sqlDetails);
					ResultSet rsDetails = st.executeQuery(sqlDetails);
					System.out.println("OPENING BALANCE ------------========"+openingBalance);
					while (rsDetails.next()) {
						id="";
						sumDebit=sumDebit+rsDetails.getDouble("DebitAmount");
						
						sumCredit+=rsDetails.getDouble("CreditAmount");
						if(!rsDetails.getString("TransactionDetail").startsWith("S")){
							
							id=rsDetails.getString("TransactionDetail");
							trDetails=rsDetails.getString("PaymentVoucherNo");
						}
						else{
							trDetails=rsDetails.getString("TransactionDetail");
							id=rsDetails.getString("PaymentVoucherNo");
						}
						
						if(rsDetails.getString("TransactionDetail").startsWith("SPC") || rsDetails.getString("TransactionDetail").startsWith("SIC"))
						{
							
							//id=trDetails;
							
							trDetails=rsDetails.getString("PaymentVoucherNo");
							
							String TrVoucherInv="SELECT * FROM  "+session.getAttribute("CompanyMasterID").toString()+"customerledgeraccount where CustomerCode='"
									+ companyCode
							        + "' and PaymentVoucherNo='"+trDetails+"' ORDER BY  concat(TransactionDate , TransactionId ) ASC";
							ResultSet rsTrVoucherInv=st3.executeQuery(TrVoucherInv);
							
							if(rsTrVoucherInv.next())
							{
								id=rsTrVoucherInv.getString("TransactionDetail");
							}
									
							System.out.println("OPENING BALANCE -----------ffffffffffffff-========"+TrVoucherInv);
						} 
	%>
	<tr>
		<td align="right">
		<div align="right"><%=i++%></div>
		</td>
		<td>
		<div align="right"><%=new SimpleDateFormat(
												"dd-MMM-yyyy")
												.format(new SimpleDateFormat(
														"yyyy-MM-dd")
														.parse(rsDetails
																.getString("TransactionDate")))%></div>
		</td>
		<td>
		<div align="left"><a href="javascript:void(0)" style="font-weight: bold;" onclick="popUp('transactionDetails.jsp','<%=trDetails%>')"><%=trDetails%></a></div>
		</td>
		<td>
		<div align="right"><%=rsDetails.getString("DebitAmount")%></div>
		</td>
		<td><%if(!(rsDetails.getString("CreditAmount")==null)){%><div align="right"><%=rsDetails.getString("CreditAmount")%></div>

		<%}else{ %>
		<div align="right">0.00</div>
		<%}%>
		</td>
		<td>
		<div align="right"><%=rsDetails.getString("Balance")%></div>
		</td>
 
		<td>
		<div align="left"><%=rsDetails.getString("TransactionType")%></div>
		</td>
		<td>
		<div align="left"><%=id%></div>
		</td>
		<td>
		<div align="left"><%=rsDetails.getString("EmpName")%></div>
		</td>

	</tr>
	<%
		}
				String bal="NA";	
					try{
					rsDetails.last();
					bal=rsDetails.getString("Balance");
					%>

<tr style="background-color: #C6DEFF;" class="sortbottom">
		<td colspan="3" style="background-color: #C6DEFF;" >Total:  
          </td>
 	<td style="background-color: #C6DEFF;" align="right" class="hed"> <div align="right"><%=new DecimalFormat("0.00").format(sumDebit) %></div></td>
 	<td style="background-color: #C6DEFF;" align="right" class="hed"> <div align="right"><%=new DecimalFormat("0.00").format(sumCredit) %></div></td>
 	<td style="background-color: #C6DEFF;" align="right" class="hed"> <div align="right"><%=bal%></div></td>
 	<td colspan="3" style="background-color: #C6DEFF;" align="left"> .</td>  
 
 </tr>
					<%
					}catch(Exception e){}
				}
 }
} catch (Exception e) {
	out.print("!!!Connection Lost!!!");
	}
	finally{
		conn.close();
	}
%>
</table>
</div>

</form>
</body>


<!-- 	<br><br> <br><br> <br><br> <br><br> -->
<!-- 	<br><br> <br><br> <br><br> <br><br> -->
<!-- 		<br><br> <br><br> <br><br> <br><br> -->
<!-- 	<div id="footer"> -->
<!-- 	<p><a href="http://www.myfleetview.com"> Copyright &copy; 2009-2015 -->
<!-- 	by Transworld Technologies Ltd. All Rights Reserved.</a></p> -->
<!-- 	</div> -->
	<!-- end #footer -->
</jsp:useBean>

	
	

<div>


</div>