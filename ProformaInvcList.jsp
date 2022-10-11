<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="header.jsp"%>
<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">
<%@page import="java.util.Date"%>

 
<script language="JavaScript1.2">

function showVisitingCardDetails(companyName,customerCode){
	document.data.companyNames.value=companyName;
	document.getElementById("companyList").style.display='none';
	document.data.isCheckedAll.checked=false;
}
	
function hideCompanyName(){
	document.data.companyNames.value='';
}
	
function getCompanies(type)
{
	document.getElementById("companyList").style.display='block';
	var company=document.data.companyNames.value;


	if(company.length=="")
	{
		document.getElementById('companyList').style.visibility = 'hidden';
		
	}
	else
	{
		document.getElementById("companyList").style.visibility="visible";
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
	var queryString = "?company=" +company+"&type="+type;
	ajaxRequest.open("GET", "GenericAjaxSearch.jsp" + queryString, true);
	ajaxRequest.send(null); 

	}//end of else
	
}	

function popUp(Address,proformaNumber,proformaRefNo)
{ 
    window.open(Address+'?proformaNumber='+proformaNumber+'&proformaRefNo='+proformaRefNo);
}

function popUpE(Address,proformaNumber,proformaRefNo,CType)
{ 
    window.open(Address+'?proformaNumber='+proformaNumber+'&proformaRefNo='+proformaRefNo+'&CType='+CType);
}





function popup1()
{
	window.open('AllSalesModule.jsp');
}	
</script>
                                 	                                                                                                              
<%
	erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
%>
<%
	Connection conn = null;
	Statement st = null, st1 = null, st3 = null, st4 = null,st5=null;
	Statement st2 = null;
	String FollowUpType="",status="";
	Format format=new SimpleDateFormat("dd-MMM-yyyy");
	Format parse=new SimpleDateFormat("yyyy-MM-dd");
	String fromDate="",toDate="",fromDateCal="",toDateCal="",CompanyName="";
	String condition=request.getParameter("id");
	System.out.println(">>>>>>>>>>    >"+condition);
%>
<%
	System.out.println("Upeer Date");
	Date today = new Date();
	Calendar cal = Calendar.getInstance();
	cal.setTime(today);
	cal.add(Calendar.DAY_OF_MONTH, -30);
	Date today30 = cal.getTime();
	fromDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(today30);
	toDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
	fromDate=toDate=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
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
	System.out.println("BELLOWW cONECTION");
	
	%>
		
	<body ONKEYDOWN="if (event.keyCode == 27){document.getElementById('companyList').style.display = 'none';}" >
	

	<div
		style="font-size: 1.6em; text-align: center; margin-top: 0.5em; margin-bottom: 0.5em;">
	<font face="Arial" size="4" color="black">Generate Invoice from Proforma Invoice</font></div>

				<div align="right"><a href="#" onclick="popup1();"><font color="blue";><u>GO TO SALES MENU</u></font></a>
</div> 
		
	<form name="data" action="" method="get">
	<div align="center">
	<input type="hidden" name="id" value="<%=condition %>"/>
	<table border="0">
	<tr> 
		
	<td  align="right" width="20%">
	<b>Check All</b>&nbsp; 
	
	</td>
	<td>
	<input type="checkbox" name="isCheckedAll" value="checkedAll" checked="checked" onclick="hideCompanyName();" />
	<input type="hidden" name="isdisplay" value="true"/>
	</td>
	<td align="right">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  <b>Or Enter Company :</b></td>
	<td><input type="text" name="companyNames" id="search-text" style="width:230px;" autocomplete="off"  value=""  onkeyup="if (event.keyCode == 27){document.getElementById('companyList').style.display = 'none';} else { getCompanies('quotation'); }" /> 
	&nbsp;&nbsp;&nbsp;<br>
	<div style="position: absolute;" >
	  <table><tr><td>
		
		</td></tr>
		<tr><td>
			<div id='companyList'>
			</div>
		</td></tr>
	  </table>
	</div>
</td>

	<td align="left">
	<b> </b>&nbsp;&nbsp;
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
			
	<b>To </b>&nbsp;&nbsp;
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
	<input type="submit" name="submit" id="submit" style="border: outset;"
	value="Go" /></td>
	</tr>

	</table></div>
	</form>
	<br>
<%
	if((null != request.getParameter("isdisplay")))
	{
	%>
		<table align="center" class='sortable'> 
		<tr>
		<th>Sr no</th>
		<th>PI Ref no</th>
		<th>PI DateTime</th>
		<th>Total</th>
		<th>Currency</th>
		<th>group</th>
		<th>Company Name</th>
		<th>Sign</th>
		</tr>
	<%	
		String sql="";
		if(null != request.getParameter("isCheckedAll"))
		{
			sql="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"performainvoicedet as a "+
			" LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"performainvoice_items as b ON(a.InvoiceNo=b.InvoiceNo) "+
			" WHERE a.InvoiceCancelled=0 AND a.InvoiceGenerated=0 AND a.InvoiceDate BETWEEN '"+fromDate+"' and '"+toDate+"' "+
			" GROUP BY a.invoiceRefNo, a.InvoiceDate, a.InvoiceType, a.CompanyName, a.TWEmpName,a.InvoiceNo";
		}
		else
		{
		sql="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"performainvoicedet AS a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"performainvoice_items AS b "+
			" ON ( a.InvoiceNo = b.InvoiceNo ) "+
			" WHERE a.CompanyName in ('"+request.getParameter("companyNames")+"') "+
			" AND a.InvoiceCancelled =0 AND a.InvoiceGenerated=0 AND a.InvoiceDate BETWEEN '"+fromDate+"'AND '"+toDate+"' "+
			" GROUP BY a.invoiceRefNo, a.InvoiceDate, a.InvoiceType, a.CompanyName, a.TWEmpName,a.InvoiceNo    ";	
		}
		System.out.println(sql);			
		ResultSet rs=st.executeQuery(sql);
		int i=1;
		while(rs.next())
		{
		%>
			<tr>
			<td><%=i++ %></td>
			
			
			<td>
			<div align="right">
			
		<%
		
		if(rs.getString("invoiceRefNo").contains("EXP"))
		{
			%>
			<a href="#" onclick="popUpE('EXPProfInvcDet.jsp','<%=rs.getString("InvoiceNo")%>','<%=rs.getString("invoiceRefNo")%>','<%=rs.getString("CurrType")%>')"> 
			
			
			<%=rs.getString("invoiceRefNo")%>
			</a>
			
			<%
		}
		else{
			
			%>
			<a href="#" onclick="popUp('ProfInvcDet.jsp','<%=rs.getString("InvoiceNo")%>','<%=rs.getString("invoiceRefNo")%>')"> 
			
			
			<%=rs.getString("invoiceRefNo")%>
			</a>
			<%
			
		}
		
		%>
			
			
			
			
			</div>
			</td>
			
			
			
			<td><div align="right"><%=new SimpleDateFormat(
							"dd-MMM-yyyy")
							.format(new SimpleDateFormat(
									"yyyy-MM-dd")
									.parse(rs.getString("InvoiceDate")))%></div></td>
			<td><div align="right"><%=rs.getString("Total")%></div></td>
			<td><div align="left"><%=rs.getString("currType")%></div></td>
			<td><div align="right"><%=rs.getString("TheGroup")%></div></td>
			<td><div align="left"><%=rs.getString("companyName")%></div></td>
			<td><div align="left"><%=rs.getString("TWEmpName")%></div></td>
			</tr>
	<%	
		}
	}	
} catch (Exception e) {
	e.printStackTrace();
}			
%>		
	</table>

 <br><br><br><br><br><br><br><br><br><br><br>
  <br><br><br><br><br><br><br><br><br>
	<div id="footer">
	<p><a href="http://www.myfleetview.com"> Copyright &copy; 2009
	by Transworld Compressor Technologies Ltd. All Rights Reserved.</a></p>
	</div>
<!-- end #footer -->
</body>
</html>
</jsp:useBean>