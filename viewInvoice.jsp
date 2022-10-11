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

	function validate()
	{
		 var fritype=document.order.frieghtType.value;
		 var paymode=document.order.paymentMode.value;
		 var insurance=document.order.insurance.value;
		
		 var shipdate=document.order.dateOfShipment.value;
	}
	
		function popUp(webadd,trancactionId)
		{ 
				window.open(webadd+'?salesQuotation='+trancactionId);
		}

		function closeInvoice()
		{
			//alert("HHHHHH");
			var agree=confirm("Are you sure you want to close this Invoice?");
			if (agree)
			{
			document.getElementById("header").style.visibility="visible";
			document.getElementById("cancellingreason").style.visibility="visible";
			document.getElementById("submitbutton").style.visibility="visible";
			
			return true ;
			}
			else return false;
		}

		function calculate()
		{	
			//alert("HTTT  ");
			var a;var k=0;
			var rowCount = document.getElementById("count").value;//alert(rowCount);
			for(k=0;k<rowCount;k++)
			{
				var tax=document.getElementById("stpercent"+k).value;//alert(tax);
				var discount=document.getElementById("discount"+k).value;//alert(discount);
				var qua=document.getElementById("quantity"+k).value;//alert(qua);
				var unitprice=document.getElementById("sellingprice"+k).value;//alert(unitprice);
				
				var tax1=(tax)/100*unitprice*qua;
				var discount1=(discount)/100*unitprice*qua;
				a=unitprice*qua+tax1-discount1;//alert(a);
				document.getElementById("amount"+k).value=a.toFixed(2);
			}	
				var rowCount = document.getElementById("count").value; 
				var z; 
				var i;
				var total;
				var s=0;
				
				for(i=0;i<rowCount;i++)
				{
					var z=(document.getElementById("amount"+i).value);
					s=parseFloat(s)+parseFloat(z);
				}

				document.getElementById('total').value=parseInt(s);

				var pfi=document.getElementById('pfi').value;
				if(pfi=="")
					pfi=0;

				var frieght=document.getElementById('frieght').value;
				if(frieght=="")
					frieght=0;
				
				document.getElementById('grandTotal').value=parseInt(s)+parseInt(pfi)+parseInt(frieght);

				
			    var junkVal=document.getElementById('grandTotal').value;
			    junkVal=Math.floor(junkVal);
			    var obStr=new String(junkVal);
			    numReversed=obStr.split("");
			    actnumber=numReversed.reverse();

			    if(Number(junkVal) >=0){
			        //do nothing
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
			            else {2
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

		function redirect(webadd,transactionId)
		{
		
			window.open(webadd+'?transactionId='+transactionId,'jav');
		}

		function redirectforpdf(webadd,transactionId)
		{
			window.open(webadd+'?transactionId='+transactionId,'jav');

		}
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
String pfi="",frieght="",grandTotal="",cst="";
String frieghtType="",grandtotal="";
String sqlDisplayDesc=" ",totalAmount="",totalAmountInWords="",termsconditions="",salesQuoNumber="",status="",statusTD="";

String todaysDate=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new java.util.Date());
String todaysTime=new SimpleDateFormat(" HH:mm:ss").format(new java.util.Date());

Date today = new Date();
String fromDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(today);


String type=request.getParameter("condition");
System.out.println(type);

String invoiceNumber=request.getParameter("Invoiceno");
String invoicerefNo=request.getParameter("InvoiceRefNo");

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

if(type.contains("View"))
{
	//*********************************  for View Invoice********************************************
	
	
	String SqlInvoiceDet="SELECT * from "+session.getAttribute("CompanyMasterID").toString()+"invoicedet WHERE invoiceRefNo='"+invoicerefNo+"' ";
	System.out.println(">>>>>>>>>>>      "+SqlInvoiceDet);
	ResultSet rsInvoiceDet=st4.executeQuery(SqlInvoiceDet);
		if(rsInvoiceDet.next()){
			totalAmount=rsInvoiceDet.getString("Total");
			totalAmountInWords=rsInvoiceDet.getString("TotalinWords");
			termsconditions=rsInvoiceDet.getString("Terms");
			pfi=rsInvoiceDet.getString("PFI");
			frieght=rsInvoiceDet.getString("FreightAmt");
			grandtotal=rsInvoiceDet.getString("GrandTotal");
			cst=rsInvoiceDet.getString("CST");
	%>
		<div align="center"
			style="font-size: 1.5em; margin-top: 0.3em;   height: 3px; background-color: #339CCB">
		</div>
		<div align="center" style="margin-top:0.3em;  margin-bottom:0.3em; font-size: 1.5em;"> Sales Invoice :<a><%=rsInvoiceDet.getString("invoiceRefNo") %></a></div>
			<div align="center"
			style="font-size: 1.5em; margin-top: 0.3em; margin-bottom:0.3em;  height: 3px; background-color: #339CCB">
		</div>

			<table border="0" align="left" valign="top" width="100%">
		<tr>
		<td style="width: 45%">
		  <table border="0" align="left" valign="top" width="100%" >
			
		  <tr>
			 <td><b>Invoice Date:</b></td>
		     <td>
		        <%=rsInvoiceDet.getString("InvoiceDate").substring(0,11) %>
	    	 </td>
			 <td><b>Ref NO:</b></td> 
			 <td><%=rsInvoiceDet.getString("invoiceRefNo") %></td>
		   </tr>

		   <tr>
			<td><b>SQ / SE Ref NO:</b></td>
			<td><%=rsInvoiceDet.getString("SEandSQRefNo") %></td>
					
			<td><b>Sign:</b></td>
			<td><%=rsInvoiceDet.getString("TWEmpName") %></td>
				
		  </tr>
							<!--  	<tr>
					<td><b>< %=sta tusTD %></b></td>
					<td colspan="3">< %=statusData %></td>
				</tr>
				 -->
		</table>
		</td>
		<td>	
			<table  border="0" bgcolor="#C6DEFF" align="right" valign="top">
			<tr>
			<td><b>Company:</b></td>
			<td><%=rsInvoiceDet.getString("CompanyName") %></td>
			
			<td><b>Contact:</b></td>
			<td><%=rsInvoiceDet.getString("ContactPerson") %></td>
			<td><b>Address:</b></td>
			<td style="width: 280px;"><%=rsInvoiceDet.getString("Address") %></td>
			</tr>
			<td>&nbsp;</td>
			<tr>
			<td><b>City:</b></td>
			<td><%=rsInvoiceDet.getString("city") %></td>
			<td><b>State:</b></td>
			<td><%=rsInvoiceDet.getString("State") %></td>
			<td><b>Country:</b></td>
			<td><%=rsInvoiceDet.getString("country") %></td>
			</tr>
			<td>&nbsp;</td>
			<tr>
			<td><b>Phone:</b></td>
			<td><div align="left"><%=((rsInvoiceDet.getString("Phone")!=null) ? rsInvoiceDet.getString("Phone") : "-") %></div></td>
			<td><b>Fax:</b></td>
			<td><div align="left"><%=((rsInvoiceDet.getString("Fax")!=null) ? rsInvoiceDet.getString("Fax") : "-") %></div></td>
			<td><b>Zip code:</b></td>
			<td><div align="left"><%=((rsInvoiceDet.getString("Zip")!=null) ? rsInvoiceDet.getString("Zip") : "-") %></div></td>
			</tr> 
			 
		<%}%>	
		</table>
	</td></tr><tr><td>&nbsp;</td></tr></table>	
	<div>&nbsp;&nbsp;</div>


		<table border="1px"  class="sortable">
		<tr>
		<th>Sr No</th>
		<th>Make</th>
		<th>Model</th>
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
		i=0;
		 		
		String sqlInvItems="SELECT * FROM  "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items WHERE InvoiceNo='"+invoiceNumber+"'";
		System.out.println(sqlInvItems);
		ResultSet rsQuoItems=st1.executeQuery(sqlInvItems);
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
			
				ResultSet rsDisplayDesc=st3.executeQuery(sqlDisplayDesc);
				
				if(rsDisplayDesc.next())
				{
					
					String descr="";
					if(rsQuoItems.getString("ItemDescription")=="-" || rsQuoItems.getString("ItemDescription").contains("-"))
					{
						descr=rsDisplayDesc.getString("Description");
					}
					else
						descr=rsQuoItems.getString("ItemDescription");
					
					System.out.println("DESCRIPTION IS  "+descr);
			    %>
			    <tr>
				    <td><%=i++ %></td>
				    <td><div align="left"><%=makeName %></div></td>
				    <td><%=rsDisplayDesc.getString("Model") %></td>
			   	     <td><%=rsDisplayDesc.getString("Partno") %></td>
			   	    <td><div align="left"><%=descr %></div></td>
				    <td><div align="right"><%=rsQuoItems.getString("Quantity") %></div></td>
				    <td><div align="right"><%=rsQuoItems.getString("SellingPrice") %></div></td>
				    <td><div align="right"><%=rsQuoItems.getString("DiscountPercent") %></div></td>
				    <td><div align="right"><%=rsQuoItems.getString("STPercent") %></div></td>
				    <% double sp=rsQuoItems.getDouble("SellingPrice");
				      double dp=rsQuoItems.getDouble("DiscountPercent");
				      double stper=rsQuoItems.getDouble("STPercent");
				      double qty=rsQuoItems.getInt("Quantity");
				      double disval=(sp-((dp/100)*sp));
				      System.out.println("disc value-->"+disval);
				      double tot1=((sp-((dp/100)*sp))+((stper/100)*disval))*qty;
				      double tot = (double) Math.round(tot1 * 100) / 100;
				      System.out.println("(("+sp+"-(("+dp+"/100)*"+sp+"))+(("+stper+"/100)*"+sp+"))*"+qty+"====>"+tot);
				    
				    %>
				    <td><div align="right"><%=nf.format(tot)%></div></td>
			    </tr>
			    <% 
			   }
				
			   }
	%>
		</table>
		
		<br>
				<div align="left"   style="position:absolute;   font-size: 1.1em"><b> &nbsp;TERMS & CONDITIONS :</b></div>
			<div align="left"   style="position:absolute; margin-top: 1em; font-size: 1.1em"> &nbsp;<textarea readonly="readonly" name="termsconditions"
		id="search-text" style='border:none; width: 430px; height: 150px;'><%=termsconditions %></textarea></div>
		
		<div>
		</div>
		<div style="font-size: 1.0em" align="right">
		 <b>Total:</b> &nbsp;&nbsp;<input type="text" readonly="readonly" name="total" id="total" style="width: 230px; border: none;" value="<%=totalAmount%>"/>
		</div>
		<%
	      double pfi1= Double.parseDouble(totalAmount)*Double.parseDouble(pfi)/100;
	%>
		<div style="font-size: 1.0em" align="right">
		 <b>P&F&I <%=pfi%>(%):</b> &nbsp;&nbsp;<input type=text readonly="readonly" name="pfitotal" id="pfitotal" style="width: 230px; border: none;" value="<%=pfi1%>"/><input type="hidden" readonly="readonly" name="pfi" id="pfi" style="width: 230px; border: none;" value="<%=pfi%>"/>
		</div>
		
		<div style="font-size: 1.0em" align="right">
		 <b>CST:</b> &nbsp;&nbsp;<input type="text" readonly="readonly" name="cst" id="cst" style="width: 230px; border: none;" value="<%=cst%>"/>
		</div>
		
		<div style="font-size: 1.0em" align="right">
		 <b>Freight:</b> &nbsp;&nbsp;<input type="text" readonly="readonly" name="fright" id="fright" style="width: 230px; border: none;" value="<%=frieght%>"/>
		</div>
		
		<div style="font-size: 1.0em" align="right">
		 <b>Grand Total :</b> &nbsp;&nbsp;<input type="text" readonly="readonly" name="grandtotal" id="grandtotal" style="width: 230px; border: none;" value="<%=grandtotal%>"/>
		</div>
		
		
		<div style="font-size: 1.0em" align="right" ><table><tr><td valign="top">
			<b>Total In Words : </b></td><td>
			<textarea readonly="readonly" name="rupees" id="rupees"   style="width: 230px; border: none;" ><%=totalAmountInWords %></textarea>
			</td></tr></table>
		</div>
		
<div align="center" id="printbutton" style="margin-top: 3em;">
	<input type="submit" name="printInvoice" value="Print" onclick="redirect('printSalesInvoice.jsp','<%=invoicerefNo %>');"  style="border: outset; background-color: #C6DEFF"  />
</div>	

<div align="center" id="pdfbutton" style="margin-top: 3em;">
	<input type="submit" name="pdfInvoice" value="PDF" onclick="redirectforpdf('pdf_salesinvoice.jsp','<%=invoicerefNo %>');"  style="border: outset; background-color: #C6DEFF"  />
</div>	

<%}
%>
	<div>&nbsp;&nbsp;</div>
<%
if(type.contains("close")) {	//*********************************  for closing Invoice********************************************
	
	
String SqlInvoiceDet="SELECT * from "+session.getAttribute("CompanyMasterID").toString()+"invoicedet WHERE invoiceRefNo='"+invoicerefNo+"' ";
System.out.println(">>>>>>>>>>>      "+SqlInvoiceDet);
ResultSet rsInvoiceDet=st4.executeQuery(SqlInvoiceDet);
	if(rsInvoiceDet.next()){
		totalAmount=rsInvoiceDet.getString("Total");
		totalAmountInWords=rsInvoiceDet.getString("TotalinWords");
		termsconditions=rsInvoiceDet.getString("Terms");

%>
	<div align="center"
		style="font-size: 1.5em; margin-top: 0.3em;   height: 3px; background-color: #339CCB">
	</div>
	<div align="center" style="margin-top:0.3em;  margin-bottom:0.3em; font-size: 1.5em;"> Sales Invoice :<a><%=rsInvoiceDet.getString("invoiceRefNo") %></a></div>
		<div align="center"
		style="font-size: 1.5em; margin-top: 0.3em; margin-bottom:0.3em;  height: 3px; background-color: #339CCB">
	</div>

		<table border="0" align="left" valign="top" width="100%">
	<tr>
	<td style="width: 45%">
	  <table border="0" align="left" valign="top" width="100%" >
		
	  <tr>
		 <td><b>Invoice Date:</b></td>
	     <td>
	        <%=rsInvoiceDet.getString("InvoiceDate").substring(0,11) %>
    	 </td>
		 <td><b>Ref NO:</b></td> 
		 <td><%=rsInvoiceDet.getString("invoiceRefNo") %></td>
	   </tr>

	   <tr>
		<td><b>SQ / SE Ref NO:</b></td>
		<td><%=rsInvoiceDet.getString("SEandSQRefNo") %></td>
				
		<td><b>Sign:</b></td>
		<td><%=rsInvoiceDet.getString("TWEmpName") %></td>
			
	  </tr>
						<!--  	<tr>
				<td><b>< %=sta tusTD %></b></td>
				<td colspan="3">< %=statusData %></td>
			</tr>
			 -->
	</table>
	</td>
	<td>	
		<table  border="0" bgcolor="#C6DEFF" align="right" valign="top">
		<tr>
		<td><b>Company:</b></td>
		<td><%=rsInvoiceDet.getString("CompanyName") %></td>
		
		<td><b>Contact:</b></td>
		<td><%=rsInvoiceDet.getString("ContactPerson") %></td>
		<td><b>Address:</b></td>
		<td style="width: 280px;"><%=rsInvoiceDet.getString("Address") %></td>
		</tr>
		<td>&nbsp;</td>
		<tr>
		<td><b>City:</b></td>
		<td><%=rsInvoiceDet.getString("city") %></td>
		<td><b>State:</b></td>
		<td><%=rsInvoiceDet.getString("State") %></td>
		<td><b>Country:</b></td>
		<td><%=rsInvoiceDet.getString("country") %></td>
		</tr>
		<td>&nbsp;</td>
		<tr>
		<td><b>Phone:</b></td>
		<td><div align="left"><%=((rsInvoiceDet.getString("Phone")!=null) ? rsInvoiceDet.getString("Phone") : "-") %></div></td>
		<td><b>Fax:</b></td>
		<td><div align="left"><%=((rsInvoiceDet.getString("Fax")!=null) ? rsInvoiceDet.getString("Fax") : "-") %></div></td>
		<td><b>Zip code:</b></td>
		<td><div align="left"><%=((rsInvoiceDet.getString("Zip")!=null) ? rsInvoiceDet.getString("Zip") : "-") %></div></td>
		</tr> 
		 
	<%}%>	
	</table>
</td></tr><tr><td>&nbsp;</td></tr></table>	
<div>&nbsp;&nbsp;</div>


	<table border="1px"  class="sortable">
	<tr>
	<th>Sr No</th>
	<th>Make</th>
	<th>Model</th>
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
	i=0;
	 		
	String sqlInvItems="SELECT * FROM  "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items WHERE InvoiceNo='"+invoiceNumber+"'";
	System.out.println(sqlInvItems);
	ResultSet rsQuoItems=st1.executeQuery(sqlInvItems);
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
		
			ResultSet rsDisplayDesc=st3.executeQuery(sqlDisplayDesc);
			
			if(rsDisplayDesc.next())
			{
				
				String descr="";
				if(rsQuoItems.getString("ItemDescription")=="-" || rsQuoItems.getString("ItemDescription").contains("-"))
				{
					descr=rsDisplayDesc.getString("Description");
				}
				else
					descr=rsQuoItems.getString("ItemDescription");
				
				System.out.println("DESCRIPTION IS  "+descr);
		    %>
		    <tr>
			    <td><%=i++ %></td>
			    <td><div align="left"><%=makeName %></div></td>
			    <td><%=rsDisplayDesc.getString("Model") %></td>
		   	    <td><%=rsDisplayDesc.getString("Partno") %></td>
		   	    <td><div align="left"><%=descr %></div></td>
			    <td><div align="right"><%=rsQuoItems.getString("Quantity") %></div></td>
			    <td><div align="right"><%=rsQuoItems.getString("SellingPrice") %></div></td>
			    <td><div align="right"><%=rsQuoItems.getString("DiscountPercent") %></div></td>
			    <td><div align="right"><%=rsQuoItems.getString("STPercent") %></div></td>
			    <% double sp=rsQuoItems.getDouble("SellingPrice");
				      double dp=rsQuoItems.getDouble("DiscountPercent");
				      double stper=rsQuoItems.getDouble("STPercent");
				      double qty=rsQuoItems.getInt("Quantity");
				      double disval=(sp-((dp/100)*sp));
				      System.out.println("disc value-->"+disval);
				      double tot1=((sp-((dp/100)*sp))+((stper/100)*disval))*qty;
				      double tot = (double) Math.round(tot1 * 100) / 100;
				      System.out.println("(("+sp+"-(("+dp+"/100)*"+sp+"))+(("+stper+"/100)*"+sp+"))*"+qty+"====>"+tot);
				    
				    %>
				    <td><div align="right"><%=nf.format(tot)%></div></td>
			    
			   
		    </tr>
		    <% 
		   }
			
		   }
%>
	</table>
	
	<br>
			<div align="left"   style="position:absolute;   font-size: 1.1em"><b> &nbsp;TERMS & CONDITIONS :</b></div>
		<div align="left"   style="position:absolute; margin-top: 1em; font-size: 1.1em"> &nbsp;<textarea readonly="readonly" name="termsconditions"
	id="search-text" style='border:none; width: 430px; height: 150px;'><%=termsconditions %></textarea></div>
	
	<div>
	</div>
	<div style="font-size: 1.0em" align="right">
	 <b>Total:</b> &nbsp;&nbsp;<input type="text" readonly="readonly" name="total" id="total" style="width: 230px; border: none;" value="<%=totalAmount%>"/>
	</div>
	
	<div style="font-size: 1.0em" align="right" ><table><tr><td valign="top">
		<b>Total In Words : </b></td><td>
		<textarea readonly="readonly" name="rupees" id="rupees"   style="width: 230px; border: none;" ><%=totalAmountInWords %></textarea>
		</td></tr></table>
	</div>
	


<div align="center" id="closebutton" style="margin-top: 3em;">
	<input type="submit" name="closeQuotation" value="close Invoice" onclick="closeInvoice();"  style="border: outset; background-color: #C6DEFF"  />
</div>	

<form name="quotation" method="get" action="closeInvoice.jsp">	
<div align="left"  id="header" style="position:absolute;   font-size: 1.1em"><b> &nbsp;Reason For Cancelling :</b>
	<script>document.getElementById("header").style.visibility="hidden";</script>
</div>
<div align="left"  id="cancellingreason" style="position:absolute; margin-top: 1em; font-size: 1.1em"> &nbsp;<textarea name="reasonforcancel"
	id="search-text" style='width: 430px; height: 130px;'></textarea>
	<script>document.getElementById("cancellingreason").style.visibility="hidden";</script>
</div>

<div align="center" id="submitbutton" style="margin-top: 3em;">
	<input type="submit" name="Submit TT" value="Submit Reason" style="border: outset; background-color: #C6DEFF"  />
	<script>document.getElementById("submitbutton").style.visibility="hidden";</script>
</div>

<input type="hidden" name="invoiceNo" value="<%=invoiceNumber %>">
<input type="hidden" name="invoiceRefNo" value="<%=invoicerefNo %>"/>
<input type="hidden" name="customercode" value="<%=rsInvoiceDet.getString("CustomerCode") %>"/>
<input type="hidden" name="reasonforcancel" value="reasonforcancel">
</form>	


<%
}
%>
	<div>&nbsp;&nbsp;</div>
<%


//*****************************************   FOR REVISE ************************************************************************* ************************
if(type.contains("revise")){

String SqlInvoice="SELECT * from "+session.getAttribute("CompanyMasterID").toString()+"invoicedet WHERE invoiceRefNo='"+invoicerefNo+"' ";
System.out.println(">>>>>>>>>>>      "+SqlInvoice);
ResultSet rsInvoice=st4.executeQuery(SqlInvoice);
	if(rsInvoice.next()){
		
		totalAmount=rsInvoice.getString("Total");
		totalAmountInWords=rsInvoice.getString("TotalinWords");
		termsconditions=rsInvoice.getString("Terms");
		grandtotal=rsInvoice.getString("GrandTotal");
%>	

<form name="order" method="post" action="ReviseInvoice.jsp" onsubmit="return validate();">
   <div align="center" style="font-size: 1.5em; margin-top: 0.3em;   height: 3px; background-color: #339CCB">
	</div>
	<div align="center" style="margin-top:0.3em;  margin-bottom:0.3em; font-size: 1.5em;"> Sales Invoice :<a><%=invoicerefNo%></a></div>
		<div align="center"
		style="font-size: 1.5em; margin-top: 0.3em; margin-bottom:0.3em;  height: 3px; background-color: #339CCB">
	</div>
	
	<table border="0" align="left" valign="top" width="100%">
	<tr>
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
				<td><b>SInv Date:</b></td>
				<td><input type="hidden" name="invoicedate" value="<%=todaysDate %>"/><%=todaysDate %></td>
				<td><b>SInv Time:</b></td>
				<td><input type="hidden" name="invoicetime" value="<%=todaysTime %>"/><%=todaysTime %></td>
				</tr>
				<tr>
				<td><b>Currency:</b></td>
				<td><%=rsInvoice.getString("CurrType") %></td>
				
		<%
			String group="";
			String sqlgroup="SELECT TheGroupName from "+session.getAttribute("CompanyMasterID").toString()+"tbl_groupmaster WHERE TheGroupCode='"+rsInvoice.getString("TheGroup")+"'";
			ResultSet rs=st.executeQuery(sqlgroup);
			if(rs.next())
			group=rs.getString(1);
		
		%>
				<td><b>Group:</b></td>
				<td><input type="hidden" name="group" value="<%=group %>"/><%=group %></td>
				</tr>
				
				<tr>
				</tr>
				</table>
			
			</div>
			</div>
		
			<div class="Page">
			<div class="Pad">
				<table>
					<tr>
						<td><b>Freight: </b></td>
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
						name="dateOfShipment" value="<%=fromdate %>" size="15" readonly
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
			 				<input type="text" name="shipBy" id="search-text" style="width: 120px;" />
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
	<td>	
		<table  border="0" bgcolor="#C6DEFF" align="right" valign="top">
		<tr>
		<td><b>Company:</b></td>
		<td><input type="hidden" name="company" value="<%=rsInvoice.getString("CompanyName") %>"/><%=rsInvoice.getString("CompanyName") %></td>
		
		<td><b>Contact:</b></td>
		<td><input type="hidden" name="conatctperson" value="<%=rsInvoice.getString("ContactPerson") %>"/><%=rsInvoice.getString("ContactPerson") %></td>
		<td><b>Address:</b></td>
		<td style="width: 280px;"><input type="hidden" name="address" value="<%=rsInvoice.getString("Address") %>"/><%=rsInvoice.getString("Address") %></td>
		</tr>
		<td>&nbsp;</td>
		<tr>
		<td><b>City:</b></td>
		<td><input type="hidden" name="city" value="<%=rsInvoice.getString("city") %>"/><%=rsInvoice.getString("city") %></td>
		<td><b>State:</b></td>
		<td><input type="hidden" name="state" value="<%=rsInvoice.getString("State") %>"/><%=rsInvoice.getString("State") %></td>
		<td><b>Country:</b></td>
		<td><input type="hidden" name="country" value="<%=rsInvoice.getString("country") %>"/><%=rsInvoice.getString("country") %></td>
		</tr>
		<td>&nbsp;</td>
		<tr>
		<td><b>Phone:</b></td>
		<td><input type="hidden" name="phone" value="<%=rsInvoice.getString("Phone") %>"/><div align="left"><%=((rsInvoice.getString("Phone")!=null) ? rsInvoice.getString("Phone") : "-") %></div></td>
		<td><b>Fax:</b></td>
		<td><input type="hidden" name="fax" value="<%=rsInvoice.getString("Fax") %>"/><div align="left"><%=((rsInvoice.getString("Fax")!=null) ? rsInvoice.getString("Fax") : "-") %></div></td>
		<td><b>Zip code:</b></td>
		<td><input type="hidden" name="zip" value="<%=rsInvoice.getString("Zip") %>"/><div align="left"><%=((rsInvoice.getString("Zip")!=null) ? rsInvoice.getString("Zip") : "-") %></div></td>
		</tr> 
		 
	<%}%>	
	</table>
	<input type="hidden" name="addresscode" value="<%=rsInvoice.getString("AddressCode") %>"/>
	<input type="hidden" name="SOno" value="<%=rsInvoice.getString("TWSalesOrderNo") %>"/>
	<input type="hidden" name="SESQrefno" value="<%=rsInvoice.getString("SEandSQRefNo") %>"/>
	<input type="hidden" name="invoicerefno" value="<%=invoicerefNo %>"/>
	<input type="hidden" name="customercode" value="<%=rsInvoice.getString("CustomerCode") %>"/>
	<input type="hidden" name="groupCode" value="<%=rsInvoice.getString("TheGroup") %>"/>
	<input type="hidden" name="pono" value="<%=rsInvoice.getString("PONo") %>"/>
	<input type="hidden" name="podate" value="<%=rsInvoice.getString("PODate") %>"/>
	
</td></tr><tr><td>&nbsp;</td></tr></table>
	<div>&nbsp;&nbsp;</div>
	
	<table border="1px"  class="sortable">
	

	<tr>
	<th>Sr No</th>
	<th>Make</th>
	<th>Model</th>
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
	i=0;
	 		
	String sqlInvItems="SELECT * FROM  "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items WHERE InvoiceNo='"+invoiceNumber+"'";
	System.out.println(sqlInvItems);
	ResultSet rsQuoItems=st1.executeQuery(sqlInvItems);
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
		
			ResultSet rsDisplayDesc=st3.executeQuery(sqlDisplayDesc);
			
			if(rsDisplayDesc.next())
			{
				
				String descr="";
				if(rsQuoItems.getString("ItemDescription")=="-" || rsQuoItems.getString("ItemDescription").contains("-"))
				{
					descr=rsDisplayDesc.getString("Description");
				}
				else
					descr=rsQuoItems.getString("ItemDescription");
				
				System.out.println("DESCRIPTION IS  "+descr);
		    %>
		    <tr>
			    <td><%=i++ %></td>
			    <td><div align="left"><%=makeName %></div></td>
			    <td><%=rsDisplayDesc.getString("Model") %></td>
			    <td><%=rsDisplayDesc.getString("Partno") %></td>
		   	    <td><div align="left"><input type="hidden" name="description<%=d %>" value="<%=descr %>"/><%=descr %></div></td>
			    <td><div align="right"><input type="text"  id="quantity<%=d %>" name="quantity<%=d %>" style="width : 70px; padding: 4px 5px 2px 5px;
	               border: 1px solid black; text-align:right;	background: #FFFFFF;	font: normal 11px Arial, Helvetica, sans-serif;
	               color: #000000;" value="<%=rsQuoItems.getString("Quantity") %>" /></div></td>
			    <td><div align="right"><input type="text"  id="sellingprice<%=d %>" name="sellingprice<%=d %>" style="width : 70px; padding: 4px 5px 2px 5px;
	               border: 1px solid black; text-align:right;	background: #FFFFFF;	font: normal 11px Arial, Helvetica, sans-serif;
	               color: #000000;" value="<%=rsQuoItems.getString("SellingPrice") %>" /></div></td>
			    <td><div align="right"><input type="text"  id="discount<%=d %>" name="discount<%=d %>" style="width : 70px; padding: 4px 5px 2px 5px;
	               border: 1px solid black; text-align:right;	background: #FFFFFF;	font: normal 11px Arial, Helvetica, sans-serif;
	               color: #000000;" value="<%=rsQuoItems.getString("DiscountPercent") %>" /></div></td>
			    <td><div align="right"><input type="text"  id="stpercent<%=d %>" name="stpercent<%=d %>" style="width : 70px; padding: 4px 5px 2px 5px;
	               border: 1px solid black; text-align:right;	background: #FFFFFF;	font: normal 11px Arial, Helvetica, sans-serif;
	               color: #000000;" value="<%=rsQuoItems.getString("STPercent") %>" /></div></td>
	                <% double sp=rsQuoItems.getDouble("SellingPrice");
				      double dp=rsQuoItems.getDouble("DiscountPercent");
				      double stper=rsQuoItems.getDouble("STPercent");
				      double qty=rsQuoItems.getInt("Quantity");
				      double disval=(sp-((dp/100)*sp));
				      System.out.println("disc value-->"+disval);
				      double tot1=((sp-((dp/100)*sp))+((stper/100)*disval))*qty;
				      double tot = (double) Math.round(tot1 * 100) / 100;
				      System.out.println("(("+sp+"-(("+dp+"/100)*"+sp+"))+(("+stper+"/100)*"+sp+"))*"+qty+"====>"+tot);
				    
				    %>
				    
	               
	               
	               
			    <td><div align="right"><input type="text"  id="amount<%=d %>" name="amount<%=d %>" style="width : 70px; padding: 4px 5px 2px 5px;
	               border: 1px solid black; text-align:right;	background: #FFFFFF;	font: normal 11px Arial, Helvetica, sans-serif;
	               color: #000000;" value="<%=nf.format(tot)%>"/>
			   </td>
		    </tr>
		      <input type="hidden" name="groupcode<%=d %>" value="<%=groupCode%>"/>
			<input type="hidden" name="makecode<%=d %>" value="<%=makeCode%>"/>
			<input type="hidden" name="itemcode<%=d %>" value="<%=itemCode%>"/>
			<input type="hidden" name="stpercent<%=d %>" id="stpercent<%=d %>" value="<%=stpercent %>"/>
			<input type="hidden" name="discount<%=d %>" id="discount<%=d %>"  value="<%=discount %>"/>
			<input type="hidden" name="quantity<%=d %>" value="<%=rsQuoItems.getString("Quantity") %> "/>
			<input type="hidden" name="sellingprice<%=d %>" value="<%=rsQuoItems.getString("SellingPrice") %> "/>
			
		    <% d++;
		   }
			
		  }
		int count=i-1;
%>  
	</table>
	<input type="hidden" id="count" name="count" value="<%=count %>"/>
	<br>
	
	<div align="left"   style="position:absolute;   font-size: 1.1em"><b> &nbsp;TERMS & CONDITIONS :  &nbsp;&nbsp;  *Editable</b></div>
	<div align="left"   style="position:absolute; margin-top: 1em; font-size: 1.1em"> &nbsp;<textarea  name="termsconditions"
	id="search-text" style='width: 430px; height: 160px;'><%=termsconditions %></textarea></div>
	<input type="hidden" name="termsconditions" value="<%=termsconditions %>"/>
	
	<div align="right">
	<input type="button" style="border: outset; background-color: #C6DEFF;width: 165px;" onclick="calculate();"	name="Calculate" value="Calculate Amount" />
	</div>
	<br>

	<div style="font-size: 1.0em" align="right">
	<b>Total:</b> &nbsp;&nbsp;<input type="text" readonly="readonly" name="total" id="total" style="width: 230px; border: none;" value="<%=totalAmount%>"/>
	<input type="hidden" name="total" value="<%=totalAmount %>"/>
	</div>
	
	<div style="font-size: 1.0em" align="right">
	<b>P & F & I  (Rs.):  </b> &nbsp;&nbsp;<input type="text" name="pfi" id="pfi" 
							style="width:70px;padding: 4px 5px 2px 5px;
							border: 1px solid black;	background: #FFFFFF;	font: normal 11px Arial, Helvetica, sans-serif;
							color: #000000; text-align: right;" value="0"/>&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="hidden" name="pfi" value="<%=pfi %>"/>						
	</div>
	
	<div style="font-size: 1.0em" align="right">
	<b>Freight (Rs.) : </b> &nbsp;&nbsp;<input type="text" name="frieght" id="frieght" 
							style="width:70px;padding: 4px 5px 2px 5px; margin-top:0.1em;
							border: 1px solid black;	background: #FFFFFF;	font: normal 11px Arial, Helvetica, sans-serif;
							color: #000000; text-align: right;" value="0"/>&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="hidden" name="frieght" value="<%=frieght %>"/>						
	</div>
	
	<div style="font-size: 1.0em;margin-top: 0.1em;" align="right" >
	 <b> * Grand Total:</b> &nbsp;&nbsp;<input type="text" readonly="readonly"  name="grandTotal" id="grandTotal" 
	style="width: 75px; border: none;" value="<%=grandtotal %>"/>&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="hidden" name="grandTotal" value="<%=grandTotal %>"/>
	</div>
	
	<div style="font-size: 1.0em" align="right" ><table><tr><td valign="top">
		<b>Total In Words : </b></td><td>
		<textarea readonly="readonly" name="rupees" id="rupees"   style="width: 230px; border: none;" ><%=totalAmountInWords %></textarea>
		</td></tr></table>
		<input type="hidden" name="rupees" value="<%=totalAmountInWords %>"/>
	</div>	
	
	<div align="center">
	<input type="submit" style="border: outset; background-color: #C6DEFF;width: 165px;" 	name="ReviseInvoice" value="Revise Invoice" />
	</div>		
	</br>
	</br>
	</br>
	</form>
<%} %>
	
	
<br><br><br><br><br><br><br><br><br><br><br> 
	<div id="footer">
	<p><a href="http://www.myfleetview.com"> Copyright &copy; 2009
	by Transworld Compressor Technologies Ltd. All Rights Reserved.</a></p>
	</div>
	</body>
	</html>
</jsp:useBean>