<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="header.jsp"%>
<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">


<script src="dropdown.js" type="text/javascript"></script>
<script src="ledgerDetails.js" type="text/javascript"></script>
<script language="JavaScript1.2">

function showHideAll()
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
	
}
	function getSupliers()
	{
		document.ledgerDetails.checkAll.checked=false;
		document.getElementById('suplierList').style.visibility = 'visible';
			var suplier=document.ledgerDetails.suplierNames.value;



			if(suplier=="")
			{
				document.getElementById('suplierList').style.visibility = 'hidden';
				
			}
			else
			{
				document.getElementById('suplierList').style.visibility = 'visible';
				suplier=suplier.replace(".", "");
				suplier=suplier.replace(",", "");
				suplier=suplier.replace("$", "");
				suplier=suplier.replace("#", "");
				suplier=suplier.replace("?", "");
				suplier=suplier.replace("-", "");
				suplier=suplier.replace("_", "");
				suplier=suplier.replace(" ", "");
				suplier=suplier.replace("(", "");
				suplier=suplier.replace(")", "");
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
			ajaxRequest.open("GET", "AjaxGetSuppliersList.jsp" + queryString, true);
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

	          document.purchasequo.action ="excel.jsp";     // CHANGE FORM NAME HERE

	          document.forms["purchasequo"].submit();       // CHANGE FORM NAME HERE

	} 
	 
	//if (document.all || document.getElementById)
		//document.body.style.background = "url('images/bg.jpg')  white top no-repeat "
</script>

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
	System.out.println(request.getParameter("checkAll"));
	System.out.println(request.getParameter("checkAll"));
	System.out.println(request.getParameter("checkAll"));
	System.out.println(request.getParameter("checkAll"));
	if (null == request.getParameter("checkAll") && null != request.getParameter("companyName"))
	{
		companyName=request.getParameter("companyName");
		phone=request.getParameter("companyPhone");
		email=request.getParameter("companyEmail");
		contact=request.getParameter("companyPerson");
		city=request.getParameter("companyCity");
		product=request.getParameter("companyProduct"); 
	}	
		try {
				conn = erp.ReturnConnection();
				st = conn.createStatement();
				st1 = conn.createStatement();
				st2 = conn.createStatement();
			} catch (Exception e) {
			}
			if (null == request.getParameter("repName"))
				selectedName = "All";
			else
				selectedName = request.getParameter("repName");
	%>
 
	<div
		style="font-size: 1.7em; text-align: center;"><a> 

		 Purchase Quatation list </a>
 </div>
<form name='ledgerDetails' action="" method="get" >
<input type="hidden" name="id" value="<%=id %>">


                                                                                                                                                                                                                                                                                              

<table width="100%" border="0">
<tr><td></td><td></td><td></td>
<td></td><td></td><td colspan="3">
			<table align="right"><tr>	
				<td align="right">
								<font size="1">&nbsp;&nbsp;&nbsp;<%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new java.util.Date())%></font>
				<a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('purchase','tableHTML');">

	     <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img>
	
					<a href="#" onclick="window.print();return false;" title="Print"><img src="images/print.jpg" width="15px" height="15px"></img></a>
			 
				</td>
		</tr></table>
	</td></tr>
		<tr>

							<td align="right" valign="top">
								<table><tr>
										<td align="right" valign="top">
		<input type="checkbox" id="checkAll" name="checkAll" checked="checked" onchange="showHideAll();" value="checkAll"/></td><td >All &nbsp;&nbsp;&nbsp;</td>
		 <td>
									<div id="suplierNames">Suplier Name: &nbsp;
									<input type="text" name="suplierNames" id="search-text" 
										  value=''  
										onkeyup="getSupliers()" /></div>

							</td></tr></table></td>
<!--							<td align="left" style="width: 250px;">-->
<!---->
<!---->
<!--							<div id='suplierList'>-->
<!--							<div style="height: 10px; width: 400px; overflow: auto;">-->
<!--							<table style="display: none;">-->
<!---->
<!--							</table>-->
<!---->
<!--							</div>-->
<!--							</div>-->
<!--							</td>-->

			<td align="left" valign="top" style="width: 50px;">
			 &nbsp;<b>From </b> </td><td align="left" valign="top" style="width: 50px;">
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
 </td><td align="left" valign="top" style="width: 10px;">
			&nbsp;<b>To </b> </td><td align="left" valign="top" style="width: 80px;">
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
			 </td><td align="left" valign="top">&nbsp;&nbsp;
	 <input type="submit" name="submit" id="submit" style="border: outset;"
				value="GO"></input></td>
				</tr>
				<tr>
		<td align="right" valign="top">
								<table><tr>
										<td align="right" valign="top">
		</td><td></td>
		 <td>
<!--					<div id='suplierList'>-->
<!--							<div style="height: 100px; width: 400px; overflow: auto;">-->
<!--							<table style="display: none;">-->
<!---->
<!--							</table>-->
<!---->
<!--							</div>-->
<!--							</div>-->
							
							<div style="position: absolute;">
	 <table><tr><td>
	 	
	 </td></tr>
	 <tr><td>
	 <div id='suplierList'>
	 </div>
	 </td></tr>
	 </table>
	 </div>				

							</td></tr></table></td>
		

							<td></td>
			<td></td><td></td>
<td></td><td></td></tr>
									
				
		
	</table>

</form>

<br></br>

<%
if(request.getParameter("suplierNames")!=null )
{
%> 
<%	
boolean isCheckedAll=false;
isCheckedAll=(request.getParameter("checkAll")!=null ? true : false);
String sqlDetails="",suplierCode="",openingBalance=null;

suplierCode=(request.getParameter("suplierNames")!=null ? request.getParameter("suplierNames") : "-");
 
 
 
%>

<form name="purchasequo" method="post" >

<%
String exportFileName="PurchaseQuotation_det.xls";   // GIVE YOUR REPORT NAME
%>
<div id='purchase'>

<input type="hidden" id="tableHTML" name="tableHTML" value="" />   

	<input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" /> 

<div id="tabS" style="visibility: visible;">
 
 	<table border="1px"  class="sortable">
	<tr>
		<th>Sr.No</th>
		<th>PurQuo No</th>
		<th>TW REF NO</th>
		<th>PurQuoDate</th>
		<th>Total</th>
		<th>Currency</th>
		<th>Supplier</th>
		
	</tr>
	<%
	 


	
	int i=1;
					if(!isCheckedAll)
							sqlDetails ="SELECT * FROM  "+session.getAttribute("CompanyMasterID").toString()+"purchasequo as a INNER JOIN "+session.getAttribute("CompanyMasterID").toString()+"supplierdet as b on (a.Suppliercode = b.SupplierCode) where b.SupplierName ='"+suplierCode+"' and a.PurQuoDate BETWEEN '"+fromDate+"' and '"+toDate+"' order by a.PurQuoDate Desc ";
					else
							sqlDetails ="SELECT * FROM  "+session.getAttribute("CompanyMasterID").toString()+"purchasequo  as a INNER JOIN "+session.getAttribute("CompanyMasterID").toString()+"supplierdet as b on (a.Suppliercode = b.SupplierCode) where a.PurQuoDate between '"+fromDate+"' and '"+toDate+"' order by a.PurQuoDate Desc ";
					
					System.out.println(sqlDetails);
					System.out.println(sqlDetails);
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
		<a href="#" style="font-weight: bold;" onclick="popUp('PQDetails.jsp','<%=rsDetails.getString("PurQuoNo")%>','<%=id %>')">
			<%=rsDetails.getString("PurQuoNo")%></a>
		 </div>
		</td>
		<td><div align="right"><%=rsDetails.getString("TWRefNo")%></div></td>
		<td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy ").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsDetails.getString("PurQuoDate")))%></div>
		</td>
		<td><div align="right"><%=rsDetails.getString("GrandTotal")%></div></td>
		<td><div align="left"><%=rsDetails.getString("CurrType")%></div></td>
		<td><div align="left"><%=rsDetails.getString("SupplierName")%></div></td>
	</tr>
	<%
		}if(i==1){
			%>
			<tr><td colspan="12">
			NO DATA AVAILABLE
			</td></tr>	
			<%}
}
%>
</table>
</div>
</div>
</form>

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