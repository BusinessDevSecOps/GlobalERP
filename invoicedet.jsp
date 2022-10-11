<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="conn.jsp"%>

<%@page import="java.util.Date"%>
<%@page import="java.io.*"%>
<%@page import="java.text.*"%>
<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">
	<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<style type="text/css">
@import url(jscalendar-1.0/calendar-win2k-1.css);
</style>
	<style>
</style>
<style type="text/css">
@import url(jscalendar-1.0/calendar-blue.css);
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
<script type="text/javascript" src="convert.js">
	</script>
<script language="JavaScript1.2">

function validate()
{
	calculate();
	var cnt=0;
	for(i=0;i<document.generateInvoice.checkedNumber.value;i++)									
		if(document.getElementById('check'+i).checked==true)
			cnt++;
	if(cnt==0)
	{	
		alert("Please select atleast 1 item");
		return false;
	}
            var agree=confirm("Please conform following values\n\n Total Items in Order: "+cnt+"\n Total Amount : "+document.getElementById('grandTotal').value+"");
    		if (agree){
    		return true ;
    	
    		
    		}else
    			return false ;
		
}

function calculate()
{
	cnt=0;
	for(i=0;i<document.generateInvoice.checkedNumber.value;i++)									
		if(document.getElementById('check'+i).checked==true)
			cnt++;
	if(cnt==0)
	{
		alert("Please select atleast 1 item");
		document.getElementById('total').value=0;
		document.getElementById('rupees').value='';
	}
	
	var a;	var finaldiscount;
	var totalunitprice;
	var totaldiscount=0;var tax1=0;
	var z; var i;var total;var s=0;var finalamt;
	var rowCount = document.generateInvoice.checkedNumber.value;
	try{
		 for(i=0;i<rowCount;i++)									
		  {
			  if(document.getElementById('check'+i).checked==true)
			  {
				var tax=document.getElementById("STPercent"+i).value;
				var discount=document.getElementById("discountPercent"+i).value;
			//	alert("DISCOUNT ENTERED   ::  "+discount);
				var qua=document.getElementById("quantity"+i).value;
				var unitprice=document.getElementById("sellingPrice"+i).value;
				
				totalunitprice=unitprice*qua;	
				//alert("TOTAL UNIT PRIZE   "+totalunitprice);
				if(discount==0){
				totaldiscount=0;}	
				else
				{
				totaldiscount=(discount/100)*totalunitprice;
				}	 
					
				//alert("TOTAL DISCOUNt  "+totaldiscount);
				
				if(tax==0)
				{
				tax1=0;
				}
				else{
				tax1=(tax/100)*(totalunitprice-totaldiscount);}
				//alert("TAX TAx   "+tax1);
				//tax1=a;
				a=totalunitprice+tax1-totaldiscount;					
				
				//alert("FINAL AMOUNT  "+a);
				//alert("FINAL AMOUNT  "+a);		
				document.getElementById("amount"+i).value=a.toFixed(2);
	
				z=(document.getElementById("amount"+i).value);
				s=parseFloat(s)+parseFloat(z);
			  }
			  else
				  document.getElementById("amount"+i).value=0;
		   }
			document.getElementById('total').value=parseInt(s);
			var pfi=document.getElementById('pfi').value;
			//alert("pfi:  "+pfi);
			if(pfi=="")
				pfi=0;

            var pfi1=parseFloat(s)*(parseFloat(pfi)/100);
           // alert("new pfi1:  "+pfi1);
			var frieght=document.getElementById('frieght').value;
			if(frieght=="")
				frieght=0;
			
			document.getElementById('grandTotal').value=Math.round(parseFloat(s)+parseFloat(pfi1)+parseFloat(frieght));
	}	

	catch(e){ }

	var junkVal=document.getElementById('grandTotal').value;
	    junkVal=Math.floor(junkVal);
	    var obStr=new String(junkVal);
	     numReversed=obStr.split("");
	    actnumber=numReversed.reverse();

	   if(Number(junkVal) >=0){
	    }
	    else{
	    alert('wrong Number cannot be converted');
	    return false;
	    }
	    if(Number(junkVal)==0){
	        document.getElementById('container').innerHTML=obStr+''+'Rupees Zero Only';
	        return false;
	    }
	    if(actnumber.length>9){
	        alert('Oops!!!! the Number is too big to covertes');
	        return false;
	    }
	 
	    var iWords=["Zero", " One", " Two", " Three", " Four", " Five", " Six", " Seven", " Eight", " Nine"];
	    var ePlace=['Ten', ' Eleven', ' Twelve', ' Thirteen', ' Fourteen', ' Fifteen', ' Sixteen', ' Seventeen', ' Eighteen', ' Nineteen'];
	    var tensPlace=['dummy', ' Ten', ' Twenty', ' Thirty', ' Forty', ' Fifty', ' Sixty', ' Seventy', ' Eighty', ' Ninety' ];
	 
	    var iWordsLength=numReversed.length;
	    var totalWords="";
	    var inWords=new Array();
	    var finalWord="";
	    j=0;
		for(i=0; i<iWordsLength; i++){
	    switch(i)
	        {
	        case 0:
	        if(actnumber[i]==0 || actnumber[i+1]==1 ) {
	                inWords[j]='';
	            }
	            else {
	                inWords[j]=iWords[actnumber[i]];
	            }
	            inWords[j]=inWords[j]+' Only';
	        break;
	        case 1:
	            tens_complication();
	            break;
	        case 2:
	       if(actnumber[i]==0) {
	           inWords[j]='';
	        }
	        else if(actnumber[i-1]!=0 && actnumber[i-2]!=0) {
	                inWords[j]=iWords[actnumber[i]]+' Hundred and';
	        }
	            else {
	            inWords[j]=iWords[actnumber[i]]+' Hundred';
	            }
	       break;
	        case 3:
	            if(actnumber[i]==0 || actnumber[i+1]==1) {
	                inWords[j]='';
	            }
	            else {
	            inWords[j]=iWords[actnumber[i]];
	            }
	            if(actnumber[i+1] != 0 || actnumber[i] > 0){
	            inWords[j]=inWords[j]+" Thousand";
	        }
	            break;
	        case 4:
	            tens_complication();
	        break;
	        case 5:
	            if(actnumber[i]==0 || actnumber[i+1]==1) {
	            inWords[j]='';
	            }
	        else {
	            inWords[j]=iWords[actnumber[i]];
	        }
	            if(actnumber[i+1] != 0 || actnumber[i] > 0){
	                inWords[j]=inWords[j]+" Lacs";
	       }
	            break;
	        case 6:
	            tens_complication();
	            break;
	        case 7:
	            if(actnumber[i]==0 || actnumber[i+1]==1 ){
	                inWords[j]='';
	            }
	            else {
	                inWords[j]=iWords[actnumber[i]];
	            }
	            inWords[j]=inWords[j]+" Crore";
	            break;
	        case 8:
	            tens_complication();
	        break;
	        default:
	            break;
	    }
	        j++;
	}

		function tens_complication() {
	        if(actnumber[i]==0) {
	            inWords[j]='';
	        }
	        else if(actnumber[i]==1) {
	        inWords[j]=ePlace[actnumber[i-1]];
	        }
	        else {
	       inWords[j]=tensPlace[actnumber[i]];
	        }
		}
	inWords.reverse();
	for(i=0; i<inWords.length; i++) {
	    finalWord+=inWords[i];
	}
	    document.getElementById('rupees').value=finalWord;

}	

function checkAll()
{
	var field=document.getElementsById('check');
	var i;
	try{
	for (i = 0; i < field.length; i++)
	field[i].checked = true ;
	}catch(e){alert(e);}
}

function unCheckAll()
{
var field=document.getElementsById('check');
var i;
try{
for (i = 0; i < field.length; i++)
field[i].checked = false ;
}catch(e){alert(e);}
}

function newwindow(webadd,salesOrderNumber,company)
{ 
		window.open(webadd+'?salesOrderNumber='+salesOrderNumber+'&company='+company,'jav','width=470,height=500,top=250,left=600,resizable=no');
}
	</script>
	</head>
	<body onload="calculate()">
	
<%
		erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
	%>
<%
	    Connection conn = null;
		Statement st = null, st1 = null, st2 = null, st3 = null;
		boolean isInvoiceSelected = false;

		double sumAmount = 0, total = 0;
		double total1 = 0;
		int groupCode = 0, makeCode = 0, a = 0;
		String groupName = "", makeName = "", itemCode = "";
		String refMakeNameTable = "";
		String sqlDisplayDesc = " ";
		String words = "";
		String sellingPrice = "", priceAccepted = "", quantity = "";
		
		String type=request.getParameter("condition");
		System.out.println("*(((((*******())(())()****    "+type);
		
		String salesOrderNumber = request.getParameter("salesOrderNumber");
		String fromDate = "", terms = "",status="Pending";
		String check = request.getParameter("check");
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.DAY_OF_MONTH, -30);
		fromDate = new SimpleDateFormat("dd-MMM-yyyy").format(cal
				.getTime());

		String s = "";
		try {
			conn = erp.ReturnConnection();
			st = conn.createStatement();
			st2 = conn.createStatement();
			st1 = conn.createStatement();
			st3 = conn.createStatement();
		} catch (Exception e) {
		}

		String sqlDet = "SELECT * from "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det WHERE SalesOrderNo='"
					+ salesOrderNumber + "' ";
			System.out.println(sqlDet);
			ResultSet rsDet = st.executeQuery(sqlDet);
if (rsDet.next()) 
{
	terms=rsDet.getString("SOTermsAndConditions");
	if(rsDet.getInt("InvoiceGenerated")==1)
		status="Invoice Generated";
	
	if(rsDet.getInt("SOCancelled")==1)
		status="Cancelled";
	%>	
	<div align="center"
		style="font-size: 1.5em; margin-top: 0.5em; margin-bottom:0.2em; height: 3px; background-color: #339CCB">
	</div>
	<div align="center" style="font-size: 1.5em">Domestic Order
	Of :<a><%=rsDet.getString("SalesorderRefNo")%> </a> For: <a><%=rsDet.getString("CompanyName")%>
	</a></div>
	<div align="center"
		style="font-size: 1.5em; margin-top: 0.3em; margin-bottom:0.5em; height: 3px; background-color: #339CCB">
	</div>
	
	<form name="generateInvoice" method="get" action="insertInvoice.jsp" onSubmit="return validate();">
	
	 <table border="0" width="100%"><tr>
	 <input type="hidden" name="type" value="<%=type %>"/>
	 <td style="width: 40%">
	 
	 	<div class="TabView" id="TabView">
			<div class="Tabs" style="width: 100%;"><a>SO Details</a>
			<a> CheckList </a>
			<a>SI Raised By </a></div>
			<div class="Pages" style="width: 450px; height: 135px;">
			<div class="Page">
			<div class="Pad">
	 
				<table  align="left" width="100%" cellpadding="3" cellspacing="3">
				<tr>
				<td><b>SO Date:</b></td>
				<td><%=new SimpleDateFormat(
								"dd-MMM-yyyy")
								.format(new SimpleDateFormat( 
										"yyyy-MM-dd")
										.parse(rsDet.getString("SalesOrderDate")))%></td>
				<td><b>SO Time:</b></td>
				<td><%=rsDet.getString("SalesOrderTime") %></td>
				</tr>
				<tr>
				<td><b>Group:</b></td>
				<td><input type="text" value="-" id="groupTop" readonly="readonly"  name="groupTop" style="border: none;" />
				<input type="hidden" name="addresscode" value="<%= rsDet.getString("AddressCode") %>"/>
				</td>
						<td><b>Currency:</b></td>
				<td><input type="hidden" name="currencyType" value="<%= rsDet.getString("CurrType") %>"  />
				<%= rsDet.getString("CurrType") %>
				</td>
				</tr>
				
				<tr>
				<td><b>Customer SO No:</b></td>
				<td><%= rsDet.getString("CustSalesOrderNo") %>
				</td>
				
				<td><b>Status:</b></td>
				<td><%= status %>
				</td>
				</tr>
				</table>
			
			</div>
			</div>
		
			<div class="Page">
			<div class="Pad">
				<table>
					<tr>
						<td><b>Frieght: </b></td>
						<td>
						<select
							name="frieghtType" id="frieghtType"    style="
					  		width: 120px; height:20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; "
							 >
							 <option>Collect(To Pay)</option>
							 <option>Prepaid(Bill Us)</option>
							 </select>
						 </td>
						 
						 <td><b>Payment Mode: </b></td>
						<td>
						<select
							name="paymentMode" id="paymentMode"    style="
					  		width: 80px; height:20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; "
							 >
							 <option>COD</option>
							 <option>CVC</option>
							 <option>COD/CVC</option>
							 <option>By Us</option>
							 <option>Through Bank</option>
							 </select>
						 </td>
					</tr>
					
					<tr>
						<td><b>Insurance: </b></td>
						<td>
						<select
							name="insurance" id="insurance"    style="
					  		width: 120px; height:20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; "
							 >
							 <option>Ins Cert Enclosed</option>
							 <option>By Customer</option>
							 <option>By Carrier</option>
							 <option>By Us</option>
							 </select>
						 </td>
						 
						 <td><b>Date Of Shipment: </b></td>
						<td>
						<input type="text" id="dateOfShipment"
						name="dateOfShipment" value="<%=fromDate %>" size="15" readonly
						style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF" />
						<script type="text/javascript">
							  Calendar.setup(
							    {
							      inputField  : "dateOfShipment",         // ID of the input field
							      ifFormat    : "%d-%b-%Y",     // the date format
							      button      : "dateOfShipment"       // ID of the button
							    }
							  );
						</script>
			
						 </td>
					</tr>
					
					<tr>
						<td><b>Shipped By: </b></td>
						<td>
			 				<input type="text" name="shippedBy" id="search-text" style="width: 120px;" />
						 </td>
						 
						 <td><b>Docket Filled By: </b></td>
						<td>
			 				<input type="text" name="docketFilledBy" id="search-text" style="width: 120px;" />
						 </td>
					</tr>
					
					<tr>
						<td><b>Checked By: </b></td>
						<td>
			 				<input type="text" name="checkedBy" id="search-text" style="width: 120px;" />
						 </td>
						 
						 <td><b>Packing Slip Checked By: </b></td>
						<td>
			 				<input type="text" name="packingSlipCheckedBy" id="search-text" style="width: 120px;" />
						 </td>
					</tr>
					
				</table>
			 </div>
			 </div>
			 
			<div class="Page">
			<div class="Pad">
			<div align="center">
				<textarea  name="SIRaisedBy" rows="4" id="search-text"
										style='width: 300px; height: auto; margin-top: 1em; '>Transworld Compressor Technologies Ltd.
C-3/8,Rakshalekha
KoregaonPark,Pune-411001</textarea>
			 	</div>
			 </div>
			 </div>
			 
		</div>
		</div>
			 
	<script type="text/javascript">
		tabview_initialize('TabView');
	</script>
	
	</td>
	
	<td><input type="hidden" name="customercode" value="<%=rsDet.getString("CustomerCode")%>"/>
		<table  bgcolor="#C6DEFF" align="right" valign="top" cellpadding="3" cellspacing="3" >
		<tr>
		<td><b>Cust name:</b></td>
		<td><input type="hidden" name="company" value="<%=rsDet.getString("CompanyName") %>"/><%=rsDet.getString("CompanyName") %></td>
		<td><b>Contact Person:</b></td>
		<td><%=rsDet.getString("ContactPerson") %></td>
		<td><b>Address:</b></td>
		<td style="width: 250px;"><%=rsDet.getString("Address") %></td>
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
<br></br>
	<table  align="center" class='sortable'>
	<tr>
	<th style="width: 125px;">Sr No</th>
	<th>Make</th>
	<th>Model</th>
	<th>Part No</th>
	<th>Description</th>
	<th>Quantity</th>
	<th>Unit prize</th>
	<th>Discount %</th>
	<th>Tax %</th>
	<th>Amount</th>
	</tr>	
	<%
			String sqlEnq = "SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items WHERE SalesOrderNo='"
						+ salesOrderNumber + "'";
				int i = 0;
				ResultSet rsEnq = st1.executeQuery(sqlEnq);
			while (rsEnq.next()) {

					groupName = "";
					makeName = "";
					refMakeNameTable = "";

					double amount = 0.00;

					groupCode = rsEnq.getInt("TheGroup");

					makeCode = rsEnq.getInt("Make");
					itemCode = rsEnq.getString("ItemCode");

					String sqlGroup = "SELECT TheGroupName from "+session.getAttribute("CompanyMasterID").toString()+"tbl_groupmaster WHERE TheGroupCode='"
							+ groupCode + "'";
					ResultSet rsGroup = st2.executeQuery(sqlGroup);
					if (rsGroup.next())
						groupName = rsGroup.getString("TheGroupName");
					if (groupCode < 5) {
						refMakeNameTable = "tbl_" + groupName.substring(0, 5)
								+ "makemaster";

						String sqlMakename = "SELECT MakeName FROM "
								+ refMakeNameTable.toLowerCase()
								+ "  WHERE makecode='" + makeCode + "' ";

						ResultSet rsMakeName = st3.executeQuery(sqlMakename);
						if (rsMakeName.next())
							makeName = rsMakeName.getString(1);
						else
							makeName = "-";
		%>

	<script type="text/javascript">
	document.getElementById('groupTop').value='<%=groupName%>';
	  
	  </script>
	  <%
	  	sqlDisplayDesc = "SELECT * FROM tbl_"
	  						+ groupName.substring(0, 5).toLowerCase()
	  						+ "im_make" + makeCode + " where ItemCode='"
	  						+ itemCode + "'";
	  			} else {
	  				sqlDisplayDesc = "SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"tbl_otherim_group"
	  						+ groupCode + " where ItemCode='" + itemCode
	  						+ "' ";
	  				makeName = "-";
	  			}


	  			ResultSet rsDetails1 = st.executeQuery(sqlDisplayDesc);
	  			while (rsDetails1.next()) {

	  				String Sql = "SELECT * FROM  "+ rsEnq.getString("TheTableToBeAccessed").toLowerCase() + " WHERE ItemCode='"
	  						+ itemCode + "' ";

	  				ResultSet rsSql = st2.executeQuery(Sql);

					while (rsSql.next()) 
					{
						  %>
					<tr>
						<td><input type="checkbox" checked="checked" name="check<%=i%>"   id="check<%=i%>" value="check<%=i%>" /></td>
						<td><div align="left"><%=makeName%></div></td>
						<td><div align="left"><%=rsSql.getString("Model")%></div></td>
						<td><div align="right"><%=rsSql.getString("Partno")%></div></td>
						
						<td>
							<div align="left">
								<input type="hidden" id="description<%=i%>" name="description<%=i%>" value="<%=rsEnq.getString("ItemDescription")%>" />
								<%=rsEnq.getString("ItemDescription")%>
							</div>
						</td>
						
						<td style="width: 85px;">
							<input type="text"  id="quantity<%=i%>" name="quantity<%=i%>" style="width:70px; padding: 4px 5px 2px 5px;
							border: 1px solid black;	background: #FFFFFF;	font: normal 11px Arial, Helvetica, sans-serif;
							color: #000000; text-align: right;" value="<%=rsEnq.getString("Quantity")%>" />
						</td>
						
						<td style="width: 85px;">
							<input type="text" id="sellingPrice<%=i%>" name="sellingPrice<%=i%>" style="width:70px;padding: 4px 5px 2px 5px;
							border: 1px solid black;	background: #FFFFFF;	font: normal 11px Arial, Helvetica, sans-serif;
							color: #000000; text-align: right;" value="<%=rsEnq.getString("SellingPrice")%>" />
						</td>
						
						<td style="width: 85px;">
							<input type="text" id="discountPercent<%=i%>" name="discountPercent<%=i%>" style="width:70px; padding: 4px 5px 2px 5px;
							border: 1px solid black;	background: #FFFFFF;	font: normal 11px Arial, Helvetica, sans-serif;
							color: #000000;text-align: right; " value="<%=rsEnq.getString("DiscountPercent")%>"/>
						</td>
						
						<td style="width: 85px;">
							<input type="text" id="STPercent<%=i%>" name="STPercent<%=i%>" style="width:70px;padding: 4px 5px 2px 5px;
							border: 1px solid black;	background: #FFFFFF;	font: normal 11px Arial, Helvetica, sans-serif;
							color: #000000; text-align: right;" value="<%=rsEnq.getString("STPercent")%>" />
						</td>
						
						<td style="width: 85px;">
							<input type="text" id="amount<%=i%>" name="amount<%=i%>" style="text-align:right; width:70px;padding: 4px 5px 2px 5px;
							border: none;	background: inherit;	
							" value="<%=amount%>" />
							
							<input type="hidden" id="quantity<%=i%>" name="quantity<%=i%>" value="<%=rsEnq.getString("Quantity")%>" />
							<input type="hidden" id="discountPercent<%=i%>" name="discountPercent<%=i%>" value="<%=rsEnq.getString("DiscountPercent")%>"/>
							<input type="hidden" id="STPercent<%=i%>" name="STPercent<%=i%>" value="<%=rsEnq.getString("STPercent")%>"/>
							<input type="hidden" id="sellingPrice<%=i%>" name="sellingPrice<%=i%>" value="<%=rsEnq.getString("SellingPrice")%>"/>
							<input type="hidden" id="mcode<%=i%>" name="mcode<%=i%>" value="<%=makeCode%>"/>
							<input type="hidden" id="icode<%=i%>" name="icode<%=i%>" value="<%=itemCode%>"/>
							<input type="hidden" id="gcode<%=i%>" name="gcode<%=i%>" value="<%=groupCode%>"/>
						</td>
					</tr>


					<%
						i++;
									}
			}

		}
%>
	</table>
<br>
				<input type="hidden" id="SONumber" name="SONumber" value="<%=salesOrderNumber%>" />
				<input type="hidden" id="group" name="group" value="<%=groupName%>"/>
				
			    <input type="hidden" name="twempname" id="twempname" value='<%=session.getAttribute("EmpName")%>'/>
				<input type="hidden" id="check" name="chk" value="<%=check%>" />  
				<input type="hidden" name="checkedNumber" id="checkedNumber" value="<%=i%>"/>
					 
			<div align="left"   style="position:absolute;   font-size: 1.1em">
			<b> &nbsp;TERMS & CONDITIONS : </b> &nbsp;&nbsp;*Editable</div>
			
		<div align="left"   style="position:absolute; margin-top: 1em; font-size: 1.1em"> &nbsp;<textarea name="terms" 
	id="search-text" style='width: 450px; height: 150px;'><%=terms%></textarea></div>
	
	<div style="font-size: 1.0em" align="right">
	 <b>Total:</b>&nbsp;&nbsp; &nbsp;&nbsp;<input type="text" readonly="readonly" name="total" id="total" 
	 style="width: 75px; border: none;" value=""/>&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
	
	  <div style="font-size: 1.0em" align="right">
	 <b>P & F & I(%):</b> &nbsp;&nbsp;<input type="text" name="pfi" id="pfi" 
							style="width:70px;padding: 4px 5px 2px 5px;
							border: 1px solid black;	background: #FFFFFF;	font: normal 11px Arial, Helvetica, sans-serif;
							color: #000000; text-align: right;" value="0"/>&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
	
	 <div style="font-size: 1.0em" align="right">
	 <b>Frieght:</b> &nbsp;&nbsp;<input type="text" name="frieght" id="frieght" 
							style="width:70px;padding: 4px 5px 2px 5px; margin-top:0.1em;
							border: 1px solid black;	background: #FFFFFF;	font: normal 11px Arial, Helvetica, sans-serif;
							color: #000000; text-align: right;" value="0"/>&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
	
	
		<div style="font-size: 1.0em;margin-top: 0.1em;" align="right" >
	 <b>Grand Total:</b> &nbsp;&nbsp;<input type="text" readonly="readonly"  name="grandTotal" id="grandTotal" 
	style="width: 75px; border: none;"/>&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
	<div style="font-size: 1.0em" align="right" ><table><tr><td valign="top">
		<b>Total In Words :</b></td><td>
		<textarea readonly="readonly" name="rupees" id="rupees"   style="width: 230px; border: none;" ></textarea>
		</td></tr></table>
	</div>
	
		<div align="right" style="margin-bottom: 0.1em;">
	<input type="button" style="border: outset; background-color: #C6DEFF;width: 150px;" onclick="calculate();"	name="Calculate" value="Calculate Amount" />
	</div>
	
		
	<%if(type.equalsIgnoreCase("proforma")){ %>
	<div align="right" >
		<input type="submit"  name="submitOrder"
	value="Save Proforma Invoice" style="border: outset; background-color: #C6DEFF; width: 150px; " />
	</div>
	<%}else if(type.equalsIgnoreCase("main")) {%>
	<div align="right"  >
		<input type="submit"  name="submitOrder"
	value="Save Sales Invoice" style="border: outset; background-color: #C6DEFF; width: 150px; " />
	</div>
	<%} %>
	
	</form>
	
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