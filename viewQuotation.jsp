<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="conn.jsp"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.TimeZone"%>
<%@page import="com.sun.org.apache.xalan.internal.xsltc.compiler.sym"%>
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
	function popUp(webadd,trancactionId,company)
	{ 
			window.open(webadd+'?company='+company+'&transactionId='+trancactionId,'jav','width=870,height=500,top=150,left=250,resizable=no');
	}

	function closeQuotation()
	{
		var agree=confirm("Are you sure you want to close this Quotation?");
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
		var rowCount = document.getElementById("checkedNumber").value;
		//var rowCount = document.generatequo.checkedNumber.value; 
		//alert(rowCount);
		for(k=0;k<rowCount;k++)
		{
			var tax=document.getElementById("stpercent"+k).value;//alert(tax);
			var discount=document.getElementById("discount"+k).value;//alert(discount);
			var qua=document.getElementById("quantity"+k).value;//alert(qua);
			var unitprice=document.getElementById("sellingPrice"+k).value;//alert(unitprice);
			
			//var tax1=(tax)/100*unitprice*qua;
			//var discount1=(discount)/100*unitprice*qua;
			//a=unitprice*qua+tax1-discount1;//alert(a);
			
			var discount1=((discount)*unitprice/100);
			//alert("disc"+discount1);
			var afterdiscprice=unitprice-discount1;
			//alert("aft disc"+afterdiscprice);
			var tax1=((tax)*afterdiscprice)/100;
			//alert("aft tax"+tax1);
			unitprice++;
			unitprice--;
			tax1++;
			tax1--;
			a=unitprice+tax1;
			//alert("a vvv"+a);
			a=a-discount1;
			//alert("a vvv11"+a);
			var bb=a*qua;
			//alert("valll==>"+bb);
			a++;
			a--;
			//alert("val of kkkkkkkkkkkkkkkkk AMOUNT"+k+" total amount==>"+bb.toFixed(2));
			//document.getElementById("amount"+k).value=bb.toFixed(2);
		}
		//alert("Outside for");	
		//	var rowCount = document.getElementById("count").value;
		var rowCount = document.getElementById("checkedNumber").value; 
			var z; 
			var i;
			var total;
			var s=0;
			
			for(i=0;i<rowCount;i++)
			{
				//alert("Inside Addition");
				var z=(document.getElementById("amount"+i).value);
				//alert("val of amt=====>"+z);
				s=parseFloat(s)+parseFloat(z);
				
				//alert("after round of"+s);
			}
			s=Math.round(s);
			//alert("after round of"+s);
			document.getElementById('total').value=parseInt(s);
			
		    var junkVal=document.getElementById('total').value;
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
	
	function redirect(webadd,salesQuotation)
	{
		//alert("IN FUNCYION  ");
		window.open(webadd+'?salesQuotation='+salesQuotation,'jav');
	}

	function redirectforpdf(webadd,salesQuotation)
	{
		window.open(webadd+'?salesQuotation='+salesQuotation,'jav');

		
	}
	</script>
	</head>
	<body>
	
<%
	erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
%>

	
<%

	if(null!=request.getParameter("inserted")){
		%>
		<script language="javascript">
			alert('Quotaion saved successfully in System with ID <%=request.getParameter("salesQuotation")%>');
		</script>
	
		<%
	}

	Connection conn = null;
	Statement st = null, st1 = null,st2=null,st3=null,st4=null;
	
	int groupCode=0,makeCode=0;
	int d=0,k=0;
	
	int i=0;
	String groupName="",makeName="",itemCode="";
	String refMakeNameTable="";
	String sqlDisplayDesc=" ",totalAmount="",totalAmountInWords="",termsconditions="",status="",statusTD="",statusData="";
	String salesEnqNumber="",salesenqno="",salesquorefno="";
	String customercode="",fromdate="",TermsAndConditions = "";
	double tax=0,discount=0.00 ,total=0.00;
	double stpercent=0,amount=0,sellingPrice=0;
	String todaysDate=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	String todaysTime=new SimpleDateFormat("HH:mm:ss").format(new java.util.Date());
	
	Date today = new Date();
	String fromDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(today);
	
	String type=request.getParameter("condition");
	System.out.println(">>>>>>>>>>>>>>>"+type);
	NumberFormat nf = new DecimalFormat("#0.00");
	String salesQuotaion=request.getParameter("salesQuotation");
	System.out.println("IN THE VIEW PAGE    "+salesQuotaion);
	try {
	conn = erp.ReturnConnection();
	st = conn.createStatement();
	st2 = conn.createStatement();
	st1 = conn.createStatement();
	st3 = conn.createStatement();
	st4 = conn.createStatement();
	} catch (Exception e) {
		e.printStackTrace();
	}


	String SqlQuotaionDet="SELECT * from "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det WHERE SalesQuoNo='"+salesQuotaion+"' ";
	System.out.println(">>>>>>>>>>>      "+SqlQuotaionDet);
	ResultSet rsQuotaionDet=st4.executeQuery(SqlQuotaionDet);
	System.out.println(">>>>61>");
	if(type.equals("View")) { 
			
		System.out.println(">>>>1>");
		
		if(rsQuotaionDet.next()){
			totalAmount=rsQuotaionDet.getString("Total");
			totalAmountInWords=rsQuotaionDet.getString("TotalinWords");
			termsconditions=rsQuotaionDet.getString("termsandconditions");
			customercode=rsQuotaionDet.getString("CustomerCode");
			salesenqno=rsQuotaionDet.getString("SalesEnqNo"); 
			salesquorefno=rsQuotaionDet.getString("SalesquoRefNo");
			TermsAndConditions=rsQuotaionDet.getString("TermsAndConditions");
				
			
%>

	<div align="center"
		style="font-size: 1.5em; margin-top: 0.3em;   height: 3px; background-color: #339CCB">
	</div>
	<%
	
	
	
		if(null!=request.getParameter("inserted")){
		%>
	<div  style="position: absolute; margin-top: 1em; left: 0.7em; ">
		<a href="#" onclick="window.location='orderdet.jsp?CompanyName=<%=rsQuotaionDet.getString("CompanyName") %>&SalesQuoRefNo=<%=rsQuotaionDet.getString("SalesQuoRefNo") %>&SalesQuoNo=<%=rsQuotaionDet.getString("SalesQuoNo") %>'" style="border: outset;  
				 ">
			<b><font color="black">GENERATE ORDER</font></b>
		</a>
	</div>
	<%} %>
	
	
	<div align="center" style="margin-top:0.3em;  margin-bottom:0.3em; font-size: 1.5em;"> Sales Quotation :<a><%=rsQuotaionDet.getString("SalesquoRefNo") %></a></div>
		<div align="center"
		style="font-size: 1.5em; margin-top: 0.3em; margin-bottom:0.3em;  height: 3px; background-color: #339CCB">
	</div>
	
<%
			
			ResultSet rs=st3.executeQuery("SELECT TheGroupName from "+session.getAttribute("CompanyMasterID").toString()+"tbl_groupmaster WHERE TheGroupCode='"+rsQuotaionDet.getString("TheGroup")+"'");
			if(rs.next())
				groupName=rs.getString(1);
			
			rs=st3.executeQuery("SELECT SalesEnqRefNo FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det where SalesEnqNo="+rsQuotaionDet.getString("SalesEnqNo")+" ");
			if(rs.next())
				salesEnqNumber=rs.getString(1);
			
			if(rsQuotaionDet.getInt("InvoiceGenerated")==1)
			{
				status="Invoice Generated";	statusTD="Invoice ID :"; 
			}
			else if(rsQuotaionDet.getInt("ThisIsSalesOrder")==1)
			{
				status="Order Generated"; statusTD="Sales Order ID :";
			}
			else if(rsQuotaionDet.getInt("SalesQuoCancelled")==1)
			{
				status="Cancelled"; statusTD="Reason For Cancelling :";
			}
			else{
				status="Pending"; statusTD="";
			}
			System.out.println(">>>>>");
			
	%>
		

	<table  align="left" valign="top" width="100%">
	<tr>
	<td style="width: 45%">
		<table border="0" align="left" valign="top" width="100%" >
		
		<tr>
		<td><b>Quotation Date:</b></td>
	<td>
	 <%=rsQuotaionDet.getString("SalesQuoDate").substring(0,11) %>
	 </td>
		<td><b>Ref NO:</b></td> 
		<td><%=rsQuotaionDet.getString("TWSalesRefNo") %></td>
		</tr>
		<tr>
		<td><b>Time :</b></td>
		<td><font size="2.5"><%=rsQuotaionDet.getString("SalesQuoTime") %></font></td>
		<td><b>Expiry date:</b></td>
		 
		<td><input type="text" id="todate" onmousedown="unCheckAll()"
		name="todate" value="<%=rsQuotaionDet.getString("SQValidityPeriod").substring(0,11) %>" size="10"
		readonly="readonly"
		style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF" />
	 	</td>
		</tr>
		<tr>
		<td><b>SE ID:</b></td>
		<td><%=salesEnqNumber%>
<%-- 			<a href="#" style="font-weight: bold;" onclick="popUp('SEDetails.jsp','<%=salesEnqNumber%>','<%=rsQuotaionDet.getString("CompanyName") %>')"><%=salesEnqNumber %> --%>
<!-- 			</a> -->
		</td>
		<td><b>Group:</b></td>
		<td><%=groupName %></td>
		</tr>
		
		<tr>
			<td><b>Customer RefNo:</b></td>
			<td><%=rsQuotaionDet.getString("CustRefNo") %></td>
			<td><b>Sign:</b></td>
			<td><%=rsQuotaionDet.getString("TWEmpName") %></td>
			
		</tr>
		<tr>
			<td><b>Status:</b></td>
			<td><%=status %></td>
			
		</tr>
		<!--  	<tr>
				<td><b>< %=sta tusTD %></b></td>
				<td colspan="3">< %=statusData %></td>
			</tr>
			 -->
	</table>
	</td>
	<td>	
		<table bgcolor="#C6DEFF" align="right" valign="top">
		<tr>
		<td><b>Company:</b></td>
		<td><%=rsQuotaionDet.getString("CompanyName") %></td>
		
		<td><b>Contact:</b></td>
		<td><%=rsQuotaionDet.getString("ContactPerson") %></td>
		<td><b>Address:</b></td>
		<td style="width: 280px;"><%=rsQuotaionDet.getString("Address") %></td>
		</tr>
		<td>&nbsp;</td>
		<tr>
		<td><b>City:</b></td>
		<td><%=rsQuotaionDet.getString("city") %></td>
		<td><b>State:</b></td>
		<td><%=rsQuotaionDet.getString("State") %></td>
		<td><b>Country:</b></td>
		<td><%=rsQuotaionDet.getString("country") %></td>
		</tr>
		<td>&nbsp;</td>
		<tr>
		<td><b>Phone:</b></td>
		<td><div align="left"><%=((rsQuotaionDet.getString("Phone")!=null) ? rsQuotaionDet.getString("Phone") : "-") %></div></td>
		<td><b>Fax:</b></td>
		<td><div align="left"><%=((rsQuotaionDet.getString("Fax")!=null) ? rsQuotaionDet.getString("Fax") : "-") %></div></td>
		<td><b>Zip code:</b></td>
		<td><div align="left"><%=((rsQuotaionDet.getString("Zip")!=null) ? rsQuotaionDet.getString("Zip") : "-") %></div></td>
		</tr> 
		 
	<%}%>	
	</table>
		 
	</td></tr><tr><td>&nbsp;</td></tr>
</table>	
<div>&nbsp;&nbsp;</div>


	<table class="sortable">
	<tr>
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
 	
	i=0;
	 		
	String sqlQuoItems="SELECT * FROM  "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items WHERE SalesQuoNo='"+salesQuotaion+"'";
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
		
			ResultSet rsDisplayDesc=st3.executeQuery(sqlDisplayDesc);
			
			if(rsDisplayDesc.next())
			{
		    %>
		    <tr>
			    <td><%=i++ %></td>
			    <td><div align="left"><%=makeName %></div></td>
			    <td><%=rsDisplayDesc.getString("Partno") %></td>
		   	    <td><div align="left"><%=rsDisplayDesc.getString("Description") %></div></td>
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
				      double tot=((sp-((dp/100)*sp))+((stper/100)*disval))*qty;
				      System.out.println("(("+sp+"-(("+dp+"/100)*"+sp+"))+(("+stper+"/100)*"+sp+"))*"+qty+"====>"+tot);
				    
				    %>
			    <td><div align="right"><%=nf.format(tot)%></td>
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
	
	<div style="font-size: 1.0em" align="right">
	 <b>Total:</b> &nbsp;&nbsp;<input type="text" readonly="readonly" name="total" id="total" style="width: 230px; border: none;" value="<%=totalAmount%>"/>
	</div>
	
	<div style="font-size: 1.0em" align="right" ><table border="0"><tr><td valign="top">
		<b>Total In Words : </b></td><td>
		<textarea readonly="readonly" name="rupees" id="rupees"   style="width: 230px; border: none;" ><%=totalAmountInWords %></textarea>
		</td></tr></table>
	</div>
	
	<br>
<div align="center" id="printbutton" style="margin-top: 3em;">
	<input type="submit" name="printquotation" value="Print" onclick="redirect('printsalesquotation.jsp','<%=salesQuotaion %>');"  style="border: outset; background-color: #C6DEFF"  />
</div>	


<div align="center" id="pdfbutton" style="margin-top: 3em;">
	<input type="submit" name="pdfquotation" value="PDF" onclick="redirectforpdf('pdf_salesquotation.jsp','<%=salesQuotaion %>');"  style="border: outset; background-color: #C6DEFF"  />
<%
}
%>
	
<table><tr><td>&nbsp;</td></tr></table>

<div>&nbsp;&nbsp;</div>

<!-- ******************************************************************************************************************************************* -->
<!-- ********************* Start of close ********************************************************************  ************************* -->
	
	<%
	
	
	
	
	
	if(type.contains("close")) { 			
	
		if(rsQuotaionDet.next()){
			totalAmount=rsQuotaionDet.getString("Total");
			totalAmountInWords=rsQuotaionDet.getString("TotalinWords");
			termsconditions=rsQuotaionDet.getString("termsandconditions");
			customercode=rsQuotaionDet.getString("CustomerCode");
			salesenqno=rsQuotaionDet.getString("SalesEnqNo"); 
			salesquorefno=rsQuotaionDet.getString("SalesquoRefNo");
				
%>

	<div align="center"
		style="font-size: 1.5em; margin-top: 0.3em;   height: 3px; background-color: #339CCB">
	</div>
	<%
	
	
	
		if(null!=request.getParameter("inserted")){
		%>
	<div  style="position: absolute; margin-top: 1em; left: 0.7em; ">
		<a href="#" onclick="window.location='orderdet.jsp?CompanyName=<%=rsQuotaionDet.getString("CompanyName") %>&SalesQuoRefNo=<%=rsQuotaionDet.getString("SalesQuoRefNo") %>&SalesQuoNo=<%=rsQuotaionDet.getString("SalesQuoNo") %>'" style="border: outset;  
				 ">
			<b><font color="black">GENERATE ORDER</font></b>
		</a>
	</div>
	<%} %>
	
	
	<div align="center" style="margin-top:0.3em;  margin-bottom:0.3em; font-size: 1.5em;"> Sales Quotation :<a><%=rsQuotaionDet.getString("SalesquoRefNo") %></a></div>
		<div align="center"
		style="font-size: 1.5em; margin-top: 0.3em; margin-bottom:0.3em;  height: 3px; background-color: #339CCB">
	</div>
	
<%
			
			ResultSet rs=st3.executeQuery("SELECT TheGroupName from "+session.getAttribute("CompanyMasterID").toString()+"tbl_groupmaster WHERE TheGroupCode='"+rsQuotaionDet.getString("TheGroup")+"'");
			if(rs.next())
				groupName=rs.getString(1);
			
			rs=st3.executeQuery("SELECT SalesEnqRefNo FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det where SalesEnqNo="+rsQuotaionDet.getString("SalesEnqNo")+" ");
			if(rs.next())
				salesEnqNumber=rs.getString(1);
			
			if(rsQuotaionDet.getInt("InvoiceGenerated")==1)
			{
				status="Invoice Generated";	statusTD="Invoice ID :"; 
			}
			else if(rsQuotaionDet.getInt("ThisIsSalesOrder")==1)
			{
				status="Order Generated"; statusTD="Sales Order ID :";
			}
			else if(rsQuotaionDet.getInt("SalesQuoCancelled")==1)
			{
				status="Cancelled"; statusTD="Reason For Cancelling :";
			}
			else{
				status="Pending"; statusTD="";
			}

			
	%>
		

	<table  align="left" valign="top" width="100%">
	<tr>
	<td style="width: 45%">
		<table border="0" align="left" valign="top" width="100%" >
		
		<tr>
		<td><b>Quotation Date:</b></td>
	<td>
	 <%=rsQuotaionDet.getString("SalesQuoDate").substring(0,11) %>
	 </td>
		<td><b>Ref NO:</b></td> 
		<td><%=rsQuotaionDet.getString("TWSalesRefNo") %></td>
		</tr>
		<tr>
		<td><b>Time :</b></td>
		<td><font size="2.5"><%=rsQuotaionDet.getString("SalesQuoTime") %></font></td>
		<td><b>Expiry date:</b></td>
		 
		<td><input type="text" id="todate" onmousedown="unCheckAll()"
		name="todate" value="<%=rsQuotaionDet.getString("SQValidityPeriod").substring(0,11) %>" size="10"
		readonly="readonly"
		style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF" />
	 	</td>
		</tr>
		<tr>
		<td><b>SE ID:</b></td>
		<td>
	<a href="#" style="font-weight: bold;" onclick="popUp('SEDetails.jsp','<%=salesEnqNumber%>','<%=rsQuotaionDet.getString("CompanyName") %>')">
 <%=salesEnqNumber %></a></td>
		<td><b>Group:</b></td>
		<td><%=groupName %></td>
		</tr>
		
		<tr>
			<td><b>Customer RefNo:</b></td>
			<td><%=rsQuotaionDet.getString("CustRefNo") %></td>
			<td><b>Sign:</b></td>
			<td><%=rsQuotaionDet.getString("TWEmpName") %></td>
			
		</tr>
		<tr>
			<td><b>Status:</b></td>
			<td><%=status %></td>
			
		</tr>
		<!--  	<tr>
				<td><b>< %=sta tusTD %></b></td>
				<td colspan="3">< %=statusData %></td>
			</tr>
			 -->
	</table>
	</td>
	<td>	
		<table bgcolor="#C6DEFF" align="right" valign="top">
		<tr>
		<td><b>Company:</b></td>
		<td><%=rsQuotaionDet.getString("CompanyName") %></td>
		
		<td><b>Contact:</b></td>
		<td><%=rsQuotaionDet.getString("ContactPerson") %></td>
		<td><b>Address:</b></td>
		<td style="width: 280px;"><%=rsQuotaionDet.getString("Address") %></td>
		</tr>
		<td>&nbsp;</td>
		<tr>
		<td><b>City:</b></td>
		<td><%=rsQuotaionDet.getString("city") %></td>
		<td><b>State:</b></td>
		<td><%=rsQuotaionDet.getString("State") %></td>
		<td><b>Country:</b></td>
		<td><%=rsQuotaionDet.getString("country") %></td>
		</tr>
		<td>&nbsp;</td>
		<tr>
		<td><b>Phone:</b></td>
		<td><div align="left"><%=((rsQuotaionDet.getString("Phone")!=null) ? rsQuotaionDet.getString("Phone") : "-") %></div></td>
		<td><b>Fax:</b></td>
		<td><div align="left"><%=((rsQuotaionDet.getString("Fax")!=null) ? rsQuotaionDet.getString("Fax") : "-") %></div></td>
		<td><b>Zip code:</b></td>
		<td><div align="left"><%=((rsQuotaionDet.getString("Zip")!=null) ? rsQuotaionDet.getString("Zip") : "-") %></div></td>
		</tr> 
		 
	<%}%>	
	</table>
		 
	</td></tr><tr><td>&nbsp;</td></tr>
</table>	
<div>&nbsp;&nbsp;</div>


	<table class="sortable">
	<tr>
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
 	
	i=0;
	 		
	String sqlQuoItems="SELECT * FROM  "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items WHERE SalesQuoNo='"+salesQuotaion+"'";
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
		
			ResultSet rsDisplayDesc=st3.executeQuery(sqlDisplayDesc);
			
			if(rsDisplayDesc.next())
			{
		    %>
		    <tr>
			    <td><%=i++ %></td>
			    <td><div align="left"><%=makeName %></div></td>
			    <td><%=rsDisplayDesc.getString("Partno") %></td>
		   	    <td><div align="left"><%=rsDisplayDesc.getString("Description") %></div></td>
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
				      double tot=((sp-((dp/100)*sp))+((stper/100)*disval))*qty;
				      System.out.println("(("+sp+"-(("+dp+"/100)*"+sp+"))+(("+stper+"/100)*"+sp+"))*"+qty+"====>"+tot);
				    
				    %>
			    <td><div align="right"><%=nf.format(tot)%></td>
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
	
	<div style="font-size: 1.0em" align="right">
	 <b>Total:</b> &nbsp;&nbsp;<input type="text" readonly="readonly" name="total" id="total" style="width: 230px; border: none;" value="<%=totalAmount%>"/>
	</div>
	
	<div style="font-size: 1.0em" align="right" ><table border="0"><tr><td valign="top">
		<b>Total In Words : </b></td><td>
		<textarea readonly="readonly" name="rupees" id="rupees"   style="width: 230px; border: none;" ><%=totalAmountInWords %></textarea>
		</td></tr></table>
	</div>
	
	
<div align="center" id="closebutton" style="margin-top: 3em;">
	<input type="submit" name="closeQuotation" value="close Quotation" onclick="closeQuotation();"  style="border: outset; background-color: #C6DEFF"  />
</div>	

<form name="quotation" method="get" action="closeQuotation.jsp">	
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

<input type="hidden" name="salesquono" value="<%=salesQuotaion %>">
<input type="hidden" name="reasonforcancel" value="reasonforcancel">
</form></br>

<%
}
%>
	
<table><tr><td>&nbsp;</td></tr></table>

<div>&nbsp;&nbsp;</div>
<%
//*****************************************   FOR REVISE ************************************************************************* 

if(type.contains("revise"))
{
System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
	
	String sqldata="SELECT * from "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det WHERE SalesQuoNo='"+salesQuotaion+"'";
	ResultSet rsdata=st4.executeQuery(sqldata);
	if(rsdata.next())
	{	
		
		System.out.println("%66666666666666666666666666666666666%%");
%>	

	
	<div align="center" style="margin-top:0.3em;  margin-bottom:0.3em; font-size: 1.5em;"> Sales Quotation :<a><%=rsdata.getString("SalesquoRefNo") %></a></div>
		<div align="center"
		style="font-size: 1.5em; margin-top: 0.3em; margin-bottom:0.3em;  height: 3px; background-color: #339CCB">
	</div>

<form name="revicequo" method="get" action="ReviseQuotation.jsp">
 	 <table  align="left" valign="top" width="100%">
	<tr>
	<td style="width: 45%">
		<table border="0" align="left" valign="top" width="100%" >
		
		<tr>
		<td><b>Quotation Date:</b></td>
		<td><%=todaysDate %></td>
		<td><b>Quotation Time:</b></td>
		<td><%=todaysTime %></td>
		</tr>
		<tr>
		<td><b>Expiry date:</b></td>
		<td><input type="hidden" name="expirydate" value="<%=fromdate %>"/>
					 <div id="seRefNo">
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
			</script></div>
		</td>
		<td>Group : </td>
		
		<%
		String group="";
		String sqlgroup="SELECT TheGroupName from "+session.getAttribute("CompanyMasterID").toString()+"tbl_groupmaster WHERE TheGroupCode='"+rsdata.getString("TheGroup")+"'";
		ResultSet rs=st.executeQuery(sqlgroup);
		if(rs.next())
		group=rs.getString("TheGroupName");
		System.out.println("THE GROUP  IS           "+group);
		 %>
		<td><input type="hidden" name="group" value="<%=group %>"/><%=group %></td>
		
		</tr>
	</table>
	</td>
		<td>	
		<table bgcolor="#C6DEFF" align="right" valign="top">
		<tr>
		<td><b>Company:</b></td>
		<td><input type="hidden" name="company" value="<%=rsdata.getString("CompanyName") %>"/><%=rsdata.getString("CompanyName") %></td>
		
		<td><b>Contact:</b></td>
		<td><input type="hidden" name="contactperson" value="<%=rsdata.getString("ContactPerson") %>"/><%=rsdata.getString("ContactPerson") %></td>
		<td><b>Address:</b></td>
		<td style="width: 280px;"><input type="hidden" name="address" value="<%=rsdata.getString("Address") %>"/><%=rsdata.getString("Address") %></td>
		</tr>
		<td>&nbsp;</td>
		<tr>
		<td><b>City:</b></td>
		<td><input type="hidden" name="city" value="<%=rsdata.getString("city") %>"/><%=rsdata.getString("city") %></td>
		<td><b>State:</b></td>
		<td><input type="hidden" name="state" value="<%=rsdata.getString("state") %>"/><%=rsdata.getString("State") %></td>
		<td><b>Country:</b></td>
		<td><input type="hidden" name="country" value="<%=rsdata.getString("country") %>"/><%=rsdata.getString("country") %></td>
		</tr>
		<td>&nbsp;</td>
		<tr>
		<td><b>Phone:</b></td>
		<td><input type="hidden" name="phone" value="<%=rsdata.getString("Phone") %>"/><div align="left"><%=((rsdata.getString("Phone")!=null) ? rsdata.getString("Phone") : "-") %></div></td>
		<td><b>Fax:</b></td>
		<td><input type="hidden" name="fax" value="<%=rsdata.getString("Fax") %>"/><div align="left"><%=((rsdata.getString("Fax")!=null) ? rsdata.getString("Fax") : "-") %></div></td>
		<td><b>Zip code:</b></td>
		<td><input type="hidden" name="zip" value="<%=rsdata.getString("Zip") %>"/><div align="left"><%=((rsdata.getString("Zip")!=null) ? rsdata.getString("Zip") : "-") %></div></td>
		</tr> 
		 
	<%}%>	
	</table>
		 <input type="hidden" name="custremark" value="<%=rsdata.getString("CustRemarks") %>"/>
		 <input type="hidden" name="addresscode" value="<%=rsdata.getString("AddressCode") %>"/>
		 <input type="hidden" name="salenqno" value="<%=rsdata.getString("SalesEnqNo") %>"/>
		 <input type="hidden" name="customercode" value="<%=rsdata.getString("CustomerCode") %>"/>
		 
	</td></tr><tr><td>&nbsp;</td></tr>
	

</table>	
<div>&nbsp;&nbsp;</div>
 	 
	
	<table border="1px" class="sortable">
	<tr>
	<th>Sr No</th>
	<th>Make</th>
	<th>Part No</th>													
	<th style="width:400px;">Description</th>
	<th>Quantity</th>
	<th>Unit prize</th>
	<th>Discount %</th>
	<th>Tax %</th>
	<th>Amount</th>	
	</tr>
<% 		 		
System.out.println("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr%");
	String sqlQuoItemsForRevise="SELECT * FROM  "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items WHERE SalesQuoNo='"+salesQuotaion+"'";
	ResultSet rsQuoItemsRevise=st1.executeQuery(sqlQuoItemsForRevise);
	int j=1,cnt=0;
	while(rsQuoItemsRevise.next())
	{
		System.out.println("rIN WHILE %");
			groupName="";makeName="";refMakeNameTable="";
			groupCode=rsQuoItemsRevise.getInt("TheGroup");
			makeCode=rsQuoItemsRevise.getInt("Make");
			itemCode=rsQuoItemsRevise.getString("ItemCode");
			  
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
			else
			{
				sqlDisplayDesc="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"tbl_otherim_group"+groupCode+" where ItemCode='"+itemCode+"' ";
				makeName="-"  ;
			}
			ResultSet rsDisplayDesc=st3.executeQuery(sqlDisplayDesc);
			System.out.println(sqlDisplayDesc);
			if(rsDisplayDesc.next())
			{System.out.println("rIN IFF %");
			
		
%>			
			<tr>
			    <td><%=j++%></td>
			    <td><div align="left"><%=makeName %></div></td>
			    <td><%=rsDisplayDesc.getString("Partno") %></td>
		   	    <td><div align="left"><input type="hidden" name="description<%=d %>" value="<%=rsDisplayDesc.getString("Description") %>"/><%=rsDisplayDesc.getString("Description") %></div></td>
			    <td style="width: 85px;"><div align="right"><input type="text"  id="quantity<%=d %>" name="quantity<%=d %>" style="width : 70px; padding: 4px 5px 2px 5px;
	               border: 1px solid black; text-align:right;	background: #FFFFFF;	font: normal 11px Arial, Helvetica, sans-serif;
	               color: #000000;" value="<%=rsQuoItemsRevise.getString("Quantity") %>" /></div></td>
			    <td style="width: 85px;"><div align="right"><input type="text"  id="sellingPrice<%=d %>" name="sellingPrice<%=d %>" style="width : 70px; padding: 4px 5px 2px 5px;
	               border: 1px solid black; text-align:right;	background: #FFFFFF;	font: normal 11px Arial, Helvetica, sans-serif;
	               color: #000000;" value="<%=rsQuoItemsRevise.getString("SellingPrice") %>" /></div></td>
			    <td style="width: 85px;"><div align="right"><input type="text"  id="discount<%=d %>" name="discount<%=d %>" style="width : 70px; padding: 4px 5px 2px 5px;
	               border: 1px solid black; text-align:right;	background: #FFFFFF;	font: normal 11px Arial, Helvetica, sans-serif;
	               color: #000000;" value="<%=rsQuoItemsRevise.getString("DiscountPercent") %>" /></div></td>
			    <td style="width: 85px;"><div align="right"><input type="text"  id="stpercent<%=d %>" name="stpercent<%=d %>" style="width : 70px; padding: 4px 5px 2px 5px;
	               border: 1px solid black; text-align:right;	background: #FFFFFF;	font: normal 11px Arial, Helvetica, sans-serif;
	               color: #000000;" value="<%=rsQuoItemsRevise.getString("STPercent") %>" /></div></td>
			    <% double sp=rsQuoItemsRevise.getDouble("SellingPrice");
				      double dp=rsQuoItemsRevise.getDouble("DiscountPercent");
				      double stper=rsQuoItemsRevise.getDouble("STPercent");
				      double qty=rsQuoItemsRevise.getInt("Quantity");
				      double disval=(sp-((dp/100)*sp));
				      System.out.println("disc value-->"+disval);
				      double tot=((sp-((dp/100)*sp))+((stper/100)*disval))*qty;
				      System.out.println("(("+sp+"-(("+dp+"/100)*"+sp+"))+(("+stper+"/100)*"+sp+"))*"+qty+"====>"+tot);
				    
				    %>
				     <td><input type="text" id="amount<%=d %>" style="width : 70px;padding: 4px 5px 2px 5px;
	border:none; text-align:right;	background:inherit; " value="<%=nf.format(tot)%>" /></td>
			   
			    	
		    </tr>
		    <input type="hidden" name="groupcode<%=d %>" value="<%=groupCode%>"/>
			<input type="hidden" name="makecode<%=d %>" value="<%=makeCode%>"/>
			<input type="hidden" name="itemcode<%=d %>" value="<%=itemCode%>"/>
			<input type="hidden" name="stpercent<%=d %>" id="stpercent<%=d %>" value="<%=stpercent %>"/>
			<input type="hidden" name="discount<%=d %>" id="discount<%=d %>"  value="<%=discount %>"/>
			<input type="hidden" name="quantity<%=d %>" value="<%=rsQuoItemsRevise.getString("Quantity") %> "/>
			<input type="hidden" name="sellingPrice<%=d %>" value="<%=rsQuoItemsRevise.getString("SellingPrice") %> "/>
			<input type="hidden" name="description<%=d %>" value="<%=rsDisplayDesc.getString("Description") %> "/>
			
<%      cnt++;
		d++;
		 }  
	   }    
	int count=j-1;
	System.out.println("00000000000000");
%>	
	<tr>
    <td>
	<input type="hidden" name="amount<%=k %>" id="amount<%=k %>" value="<%=amount %>"/>
	<input type="hidden" name="sellingPrice<%=k %>" id="sellingPrice<%=k %>" value="<%=sellingPrice %>"/>
	</td>
	

	
	</tr>
	
	</table>
	
	
	<input type="hidden" name="checkedNumber" id="checkedNumber" value="<%=cnt %>"/>
	<input type="hidden" name="salesenqno" value="<%=salesenqno %>"/>
	<input type="hidden" name="salesquono" value="<%=request.getParameter("salesQuotation") %>">
	<input type="hidden" id="count" name="count" value="<%=count %>"/>
	<input type="hidden" name="quodate" value="<%=todaysDate%>"/>
	<input type="hidden" name="quotime" value="<%=todaysTime %>">
	
	<br>
<div align="left"   style="position:absolute;   font-size: 1.1em"><b> &nbsp;TERMS & CONDITIONS :</b></div>
			
		<div align="left"   style="position:absolute; margin-top: 1em; font-size: 1.1em"> &nbsp;<textarea name="termsconditions"
	id="search-text" style='width: 430px; height: 160px;'><%= rsdata.getString("TermsAndConditions") %></textarea></div>
	<input type="hidden" name="termsconditions" value="<%=rsdata.getString("TermsAndConditions") %>"/>
	<div align="right">
	<input type="button" style="border: outset; background-color: #C6DEFF;width: 165px;" onclick="calculate();"	name="Calculate" value="Calculate Amount" />
	</div>
	
	<br>
	
	<div style="font-size: 1.0em" align="right">
	 <b>Total:</b> &nbsp;&nbsp;<input type="text" readonly="readonly" name="total" id="total" style="width: 230px; border: none;" value="<%=totalAmount%>"/>
	 <input type="hidden" name="total" value="<%=totalAmount %>">
	</div>
	
	<div style="font-size: 1.0em" align="right" ><table border="0"><tr><td valign="top">
		<b>Total In Words : </b></td><td>
		<textarea name="rupees" id="rupees"   style="width: 230px; border: none;" ><%=totalAmountInWords %></textarea>
		</td></tr></table>
		
	</div>
	<input type="hidden" name="rupees" value="<%=totalAmountInWords %>"/>
	
	<br>	
	<div align="center">
	<input type="submit" style="border: outset; background-color: #C6DEFF;width: 165px;"  name="ReviseQuotation" value="Revise Quotation" />
	</div>
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