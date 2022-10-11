<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="header.jsp"%>
<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">
<%@page import="java.util.Date"%>
<%@page import="java.math.*"%>
 
<script language="JavaScript1.2">

function gotoExcel (elemId, frmFldId)  
{  
	//alert("*********** ");

         var obj = document.getElementById(elemId);  

         var oFld = document.getElementById(frmFldId); 

          oFld.value = obj.innerHTML;  

          document.order.action ="excel.jsp";     // CHANGE FORM NAME HERE

          document.forms["order"].submit();       // CHANGE FORM NAME HERE

} 

function hideField(){
try{
	if(document.data.isCheckedAll.checked){
    		document.getElementById('col1').style.display='none';
			document.getElementById('col2').style.display='none';
			}	
		else
		{
			document.getElementById('col1').style.display="";
			document.getElementById('col2').style.display="";
		}	
	}catch(e){alert(e);}
}
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
	
}


function openOrder(Address,salesOrder,condition)
{
	//alert("hihihih    ");
	window.open(Address+'?salesOrder='+salesOrder+'&condition='+condition);
}
</script>
                                 	                                                                                                              
<%
	erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
%>
<%
	Connection conn = null;
	Statement st = null, st1 = null, st3 = null, st4 = null,st5=null;
	Statement st2 = null;
	String FollowUpType="",status="",emp="";
	Format format=new SimpleDateFormat("dd-MMM-yyyy");
	Format parse=new SimpleDateFormat("yyyy-MM-dd");
	String fromDate="",toDate="",fromDateCal="",toDateCal="",CompanyName="";
	double totalAmount=0.00;
	String id=request.getParameter("id");
	System.out.println("ID CMING IS   ++++++++++++++          "+id);
	 NumberFormat formatter = NumberFormat.getInstance();
	 formatter.getMaximumFractionDigits();
     formatter.getMinimumFractionDigits();
		
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
	if (!(null == request.getParameter("companyNames")))
	{  CompanyName= request.getParameter("companyNames");	}
	
	if (!(null == request.getParameter("SrByEmp")))
	{  emp= request.getParameter("SrByEmp");	}
	
try {
	conn = erp.ReturnConnection();
	st = conn.createStatement();
	st1 = conn.createStatement();

	//    Get Employee Names
	 String sqlemp ="select EmpName from  "+session.getAttribute("CompanyMasterID").toString()+"security order By EmpName";
	 ResultSet rsEmp= st.executeQuery(sqlemp);
	
	%>

	<body ONKEYDOWN="if (event.keyCode == 27){document.getElementById('companyList').style.display = 'none';}" >

		


		<div
		style="font-size: 1.6em; text-align: center; margin-top: 0.5em; margin-bottom: 0.5em;">
	<a><%=id %> Sales Order</a></div>
	
	<form name="data" action="" method="get">
	<input type="hidden" name="id" value="<%=id %>">
	<div align="center">
	<table border="0" width="100%" align="center">
	<tr> 

	<td  align="right" >
	<b>Check All</b>&nbsp; 
	
	</td>
	<td>
	<input type="checkbox" id="isCheckedAll" name="isCheckedAll" value="checkedAll"  onclick="hideField()" />
	<input type="hidden" name="isdisplay" value="true"/>
	</td>
	<td id ="col1" align="left">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  <b>Enter Company :</b>
	<input type="text" name="companyNames" id="companyNames" id="search-text" style="width:230px;" autocomplete="off"  value=""  onkeyup="if (event.keyCode == 27){document.getElementById('companyList').style.display = 'none';} else { getCompanies('quotation'); }" /> 
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
<td id="col2"><b>Select EmployeeName:</b>
	  <select  name="SrByEmp" id="SrByEmp"> 
				<option value='All'>All</option>
				<%while (rsEmp.next()) {
				%>
				<option value="<%=rsEmp.getString("EmpName") %>"><%=rsEmp.getString("EmpName") %></option>
				 <%} %>
				</select>
		</td>
	  
	<td align="left" valign="middle">
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
		</td>
		<td>	
	<b>To </b>&nbsp;&nbsp;
	</td>
	<td valign="middle">	
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
	</td>
	<td>&nbsp;&nbsp;&nbsp;</td>
	<td valign="middle">

	<input type="submit" name="submit" id="submit" style="border: outset;" value="Go" /></td>
	<td align="right" width="8%">
				     <a href="#" onclick="gotoExcel('table','tableHTML');"  title="Export To Excel">
				     <img src="images/excel.jpg" width="15px" height="15px"></a>	</td>
	
	</tr>

	</table></div>
	</form>
	<br>
<%
//	if(null != request.getParameter("isdisplay"))
	//{
	%>
	<form name="order" method="post" >
	<%
	String exportFileName="Order_det.xls";   // GIVE YOUR REPORT NAME
	%>	
	<div  id="table">
	<input type="hidden" id="tableHTML" name="tableHTML" value="" />   
	<input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" /> 
	
		<table align="center" class='sortable'> 
		<tr>
		<th>Sr no</th>
		<th>SO Ref no</th>
		<th>SO DateTime</th>
		<th>Currency</th>
		<th>group</th>
		<th>Status</th>
		<th>Company Name</th>
		<th>Sign</th>
		<th>Total</th>
		</tr>
	<%
		String sql="";
	String sqlEnq="",sqlGroup="", condition="",condition1="",condition2="",condition3="";
    condition="a.SalesOrderDate BETWEEN '"+fromDate+"' and '"+toDate+"' ";
	condition1="a.TWEmpname='"+emp+"'";
    condition2=" a.CompanyName in ('"+request.getParameter("companyNames")+"')";
   condition3=" GROUP BY a.SalesorderRefNo, a.SalesOrderDate, a.OrderType, a.CompanyName, a.TWEmpName,a.SalesOrderNo  ";
	
   if(null != request.getParameter("isCheckedAll"))
		sql="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det as a "+
			" LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items as b ON(a.SalesOrderNo=b.SalesOrderNo) "+
			" WHERE a.SOCancelled=0 AND "+condition+" "+condition3+"";
				
			else
			 if(CompanyName.equals(""))
			 {
						if(emp.equals("All"))
			 			{  
							sql="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det AS a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items AS b "+
									" ON ( a.SalesOrderNo = b.SalesOrderNo ) "+
									" WHERE  a.SOCancelled =0 AND "+condition+" "+condition3+"";
			 			}
						else{sql="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det AS a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items AS b "+
								" ON ( a.SalesOrderNo = b.SalesOrderNo ) WHERE "+
								" a.SOCancelled =0 AND "+condition+" AND "+condition1+" "+condition3+"";

								}
			 }
			else{
						if(emp.equals("All"))
	 					{  
								sql="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det AS a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items AS b "+
								" ON ( a.SalesOrderNo = b.SalesOrderNo ) WHERE "+
								" a.SOCancelled =0 AND "+condition+" AND "+condition2+" "+condition3+"";
	 			}
								else{sql="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det AS a LEFT OUTER JOIN "+session.getAttribute("CompanyMasterID").toString()+"salesorder_items AS b "+
								" ON ( a.SalesOrderNo = b.SalesOrderNo ) WHERE "+
								" a.SOCancelled =0 AND "+condition+" AND "+condition1+" AND "+condition2+" "+condition3+"";

						}
				
					}
							
		
		System.out.println(sql);			
		ResultSet rs=st.executeQuery(sql);
		int i=1;
		while(rs.next())
		{ totalAmount=totalAmount+rs.getInt("Total");
		try{         
			if(rs.getInt("InvoiceGenerated")==1)
			{status="Invoiced";
			}
			else
			{	if(rs.getInt("SOCancelled")==0)
			     	 status="Open";
			    
					else{status="Closed";}
			}//else end
			}
			catch(Exception e1) {
			System.out.println("Exception is :"+e1);
			e1.printStackTrace();
		}
          
		//   **************** Find the Group Name *************
		    sqlGroup="SELECT TheGroupName FROM "+session.getAttribute("CompanyMasterID").toString()+"tbl_groupmaster where TheGroupCode='"+rs.getString("TheGroup")+"' ";
			ResultSet rsGroup=st1.executeQuery(sqlGroup);
			while(rsGroup.next())
			{
		%>
			<tr>
			<td><%=i++ %></td>
			<td><div align="right"><a href="#" onclick="openOrder('viewOrder.jsp','<%= rs.getString("SalesOrderNo")%>','<%=id%>')"> <%=rs.getString("SalesorderRefNo")%></a></div></td>
			<td><div align="right"><%=new SimpleDateFormat(
							"dd-MMM-yyyy")
							.format(new SimpleDateFormat(
									"yyyy-MM-dd")
									.parse(rs.getString("SalesOrderDate")))+" "+rs.getString("SalesOrderTime")%></div></td>
			<td><div align="left"><%=rs.getString("currType")%></div></td>
			<td><div align="left"><%=rsGroup.getString("TheGroupName")%></div></td><%} %>
			<td><div align="right"><%=status%></div></td>
			<td><div align="left"><%=rs.getString("companyName")%></div></td>
			<td><div align="left"><%=rs.getString("TWEmpName")%></div></td>
			<td><div align="right"><%=rs.getString("Total")%></div></td>
			</tr>
	<%
		}
	//}
} catch (Exception e) {
	e.printStackTrace();
}
%>
 <tr>
			<td colspan="8" ><div align="right"> <b>Total Amount</b></td>
			<td><div align="right"><%=formatter.format(totalAmount)+".00"%></td>
	</tr>   

	</table>
	</div>
</form>
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