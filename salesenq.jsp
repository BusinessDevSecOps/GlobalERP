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
function popUp(Address,companyName,SalesEnqNo,SalesEnqRefNo)
{ 
    window.open(Address+'?companyName='+companyName+'&SalesEnqNo='+SalesEnqNo+'&SalesEnqRefNo='+SalesEnqRefNo);
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
    String selectedName;
	String FollowUpType="",status="";
	Format format=new SimpleDateFormat("dd-MMM-yyyy");
	Format parse=new SimpleDateFormat("yyyy-MM-dd");
	String fromDate="",toDate="",fromDateCal="",toDateCal="",CompanyName="";
%>
<%
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
	
	if (null == request.getParameter("customer"))
	selectedName = "All";
	else
	selectedName = request.getParameter("customer");
 		
	try {
	conn = erp.ReturnConnection();
	st = conn.createStatement();
	st1 = conn.createStatement();

	if (null == request.getParameter("customer"))
	selectedName = "All";
	else
	selectedName = request.getParameter("customer");
	%>

	<body ONKEYDOWN="if (event.keyCode == 27){document.getElementById('companyList').style.display = 'none';}" >
	
		<div
		style="font-size: 1.6em; text-align: center; margin-top: 0.5em; margin-bottom: 0.5em;">
	<font face="Arial" size="4" color="black">Generate Sales Quotation form Sales Enquiries</font></div>
	<div align="right"><a href="#" onclick="popup1();"><font color="blue";><u>GO TO SALES MENU</u></font></a>
</div> 
	<form name="data" action="" method="get">
	<div align="center">
	<table border="0">
	<tr> 

	<td  align="right" width="20%">
	<font face="Arial" size="2" color="black">Check All</font>&nbsp; 
	
	</td>
	<td>
	<input type="checkbox" name="isCheckedAll" value="checkedAll" checked="checked" onclick="hideCompanyName();" />
	</td>
	<td align="right">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  <font face="Arial" size="2" color="black">Or Enter Company :</font></td>
	<td><input type="text" name="companyNames" id="search-text" style="width:230px;" autocomplete="off"  value=""  onkeyup="if (event.keyCode == 27){document.getElementById('companyList').style.display = 'none';} else { getCompanies('quotation'); }" /> 
	&nbsp;&nbsp;&nbsp;<br>
	<div style="position: absolute;"  >
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
	if(null != request.getQueryString())
	{
%>
	<table align="center" class='sortable'> 
	<tr>
	<th>Sr no</th>
	<th>Sales Enq Ref no</th>
	<th>End Date</th>
	<th>Enq Type</th>
	<th>Company</th>
	<th>Cust Ref No</th>
	<th>Sign</th>
	</tr>
<%
	String sqlEnq="";
	
	if(null != request.getParameter("isCheckedAll"))
	sqlEnq="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det as a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items as b ON(a.SalesEnqNo=b.SalesEnqNo) WHERE b.PriceQuoted=0 AND SalesEnqClosed=0 AND a.SalesEnqDate BETWEEN '"+fromDate+"' and '"+toDate+"' GROUP BY a.SalesEnqRefNo, a.SalesEnqDate, a.SalesEnqType, a.CompanyName, a.CustRefNo, a.TWEmpName,a.SalesEnqNo ";
	else
	sqlEnq="SELECT a.SalesEnqRefNo, a.SalesEnqDate, a.SalesEnqType, a.CompanyName, a.CustRefNo, a.TWEmpName ,a.SalesEnqNo FROM "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det AS a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items AS b ON ( a.SalesEnqNo = b.SalesEnqNo ) WHERE a.CompanyName in ('"+request.getParameter("companyNames")+"') AND b.PriceQuoted =0 AND SalesEnqClosed=0 AND a.SalesEnqDate BETWEEN '"+fromDate+"'AND '"+toDate+"' GROUP BY a.SalesEnqRefNo, a.SalesEnqDate, a.SalesEnqType, a.CompanyName, a.CustRefNo, a.TWEmpName ,a.SalesEnqNo  ";	
	
	System.out.println(sqlEnq);			
	ResultSet rsEnq=st.executeQuery(sqlEnq);
	int i=1;
	while(rsEnq.next()){
%>
	<tr>
	<td><%=i++ %></td>
	<td><div align="right">
	<%
	if(rsEnq.getString("SalesEnqRefNo").contains("EXP"))
	{
		%>
		<a href="#" onclick="popUp('enqexpdet.jsp','<%= rsEnq.getString("companyName")%>','<%= rsEnq.getString("SalesEnqNo")%>','<%=rsEnq.getString("SalesEnqRefNo")%>')"> 
	
	
	<%=rsEnq.getString("SalesEnqRefNo")%></a>
	
		<%
		
	}
	else{
	%>
	
	<a href="#" onclick="popUp('enqdet.jsp','<%= rsEnq.getString("companyName")%>','<%= rsEnq.getString("SalesEnqNo")%>','<%=rsEnq.getString("SalesEnqRefNo")%>')"> 
	
	
	<%=rsEnq.getString("SalesEnqRefNo")%></a>
	
	<%} %>
	
	</div></td>
	
	
	<td><div align="right"><%=new SimpleDateFormat(
					"dd-MMM-yyyy")
					.format(new SimpleDateFormat(
							"yyyy-MM-dd")
							.parse(rsEnq.getString("SalesEnqDate")))%></div></td>
	<td><div align="right"><%=rsEnq.getString("SalesEnqType")%></div></td>
	<td><div align="left"><%=rsEnq.getString("CompanyName")%></div></td>
	<td><div align="left"><%=rsEnq.getString("CustRefNo")%></div></td>
	<td><div align="left"><%=rsEnq.getString("TWEmpName")%></div></td>
	</tr>
<%}
	}
	} catch (Exception e) {
	e.printStackTrace();
	}
%>
	</table>

 <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
  <br><br><br><br><br><br><br><br><br>
	<div id="footer">
	<p><a href="http://www.myfleetview.com"> Copyright &copy; 2009
	by Transworld Compressor Technologies Ltd. All Rights Reserved.</a></p>
	</div>
<!-- end #footer -->
</body>
</html>
</jsp:useBean>