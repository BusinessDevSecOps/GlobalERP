<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="header.jsp"%>
<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">
<%@page import="java.util.Date"%>
	<script src="dropdown.js" type="text/javascript"></script>
		<script src="ledgerDetails.js" type="text/javascript"></script>

<script >
function showSelectedSuppliers(customerCode,companyName){
	document.data.companyNames.value=companyName;
	//alert(document.data.customerCode.value=customerCode);
	document.getElementById("companyList").style.display='none';
	document.data.isCheckedAll.checked=false;
}

function hideCompanyName(){
	document.data.companyNames.value='';
}

function getCompanies()
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
	var queryString = "?company=" +company;
	ajaxRequest.open("GET", "AjaxGetSupplierForEnquiry.jsp" + queryString, true);
	ajaxRequest.send(null); 
	
}
function popUp(Address,supplierCode,PONo,GRNNo)
{ 
    window.open(Address+'?supplierCode='+supplierCode+'&PONo='+PONo+'&GRNNo='+GRNNo);
}

function gotoExcel (elemId, frmFldId)  
{  
//	alert("*********** ");

         var obj = document.getElementById(elemId);  

         var oFld = document.getElementById(frmFldId); 

          oFld.value = obj.innerHTML;  

          document.purchaseenq.action ="excel.jsp";     // CHANGE FORM NAME HERE

          document.forms["purchaseenq"].submit();       // CHANGE FORM NAME HERE

} 	
</script>


                                 	                                                                                                              
<%
	erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
%>
<%
	Connection conn = null;
	Statement st = null, st1 = null, st3 = null, st4 = null,st5=null;
	Statement st2 = null;

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
 		
try 
{
	conn = erp.ReturnConnection();
	st = conn.createStatement();
	st1 = conn.createStatement();
	ResultSet rsdata=null;
	String sql1="",sql2="",sql3="",filename="",accountType="",status="",color="";
	int pendingcount=0,Uploadedcount=0,cancelledcount=0;
	
%>

	<div
		style="font-size: 1.6em; text-align: center; margin-top: 0.5em; margin-bottom: 0.5em;">
	<a>Net Banking Report</a></div>

<form name="data" action="" method="get">

<table width="60%" border="0" align="center">
		<tr align="center">


			<td align="right">
			 &nbsp;<b>From</b>
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
 </td><td align="left"  style="width: 10px;">
			&nbsp;<b>To </b> </td><td align="left"  style="width: 80px;">
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
	
	<%
	String sqlCount="select sum(b.Amount) from "+session.getAttribute("CompanyMasterID").toString()+"netbankingfiles as a,"+session.getAttribute("CompanyMasterID").toString()+"netbankingrecords as b where a.FileName1=b.FileName1 and  b.CreationDate between '"+fromDate+" 00:00:00' and '"+toDate+" 23:59:59' and a.UploadStatus='Pending'"+
	"UNION "+
	"select sum(b.Amount) from "+session.getAttribute("CompanyMasterID").toString()+"netbankingfiles as a,"+session.getAttribute("CompanyMasterID").toString()+"netbankingrecords as b where a.FileName1=b.FileName1 and b.CreationDate between '"+fromDate+" 00:00:00' and '"+toDate+" 23:59:59' and a.UploadStatus='Uploaded'"+
	"UNION "+
	"select sum(b.Amount) from "+session.getAttribute("CompanyMasterID").toString()+"netbankingfiles as a,"+session.getAttribute("CompanyMasterID").toString()+"netbankingrecords as b where a.FileName1=b.FileName1 and b.CreationDate between '"+fromDate+" 00:00:00' and '"+toDate+" 23:59:59' and a.UploadStatus='Cancelled'";
	ResultSet rscount=st1.executeQuery(sqlCount);
	System.out.println(sqlCount);
	if(rscount.next())
	pendingcount=rscount.getInt(1);
	if(rscount.next())
	Uploadedcount=rscount.getInt(1);
	if(rscount.next())
	cancelledcount=rscount.getInt(1);
			
	%>


		<table width=55% align="center" border="1" style="border-color: #C6DEFF;" cellpadding="0" cellspacing="0">
                        <tr>
                       <td> <b><font size="2" color="black">Color Code Indication:</font></b></td>
                        <td bgcolor="#FAAFBE"><font size="2" color="black">Pending  -<%=pendingcount %>( Rs.)</font></td>
                        <td bgcolor="#AEF8B1"><font size="2" color="black">Uploaded - <%=Uploadedcount %> ( Rs.)</font></td>
                        <td bgcolor="#FFFF00"><font size="2" color="black">Cancelled - <%=cancelledcount %>( Rs.)</font></td>
                       
             
                        </tr>
                </table>
       
	</form>
	<br>
	</br>
	<div></div>
	<form name="purchaseenq" method="post">
	<%
String exportFileName="NetBank_det.xls";   // GIVE YOUR REPORT NAME
%>

<input type="hidden" id="tableHTML" name="tableHTML" value="" />   
	<input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" /> 
	
		<div id='purchase'>
	<table  width="100%" >
	<tr>
	<th style="background-color: #C6DEFF;">File Name</th>
	<th style="background-color: #C6DEFF;">Transaction Type</th>
	<th style="background-color: #C6DEFF;">Beneficiary Name</th>
	<th style="background-color: #C6DEFF;">Amount(In Rs.)</th>
	<th style="background-color: #C6DEFF;">Tally RefNo</th>
	<th style="background-color: #C6DEFF;">Created By</th>
	<th style="background-color: #C6DEFF;">Comments</th>
	<th style="background-color: #C6DEFF;">Status</th>
	</tr>
<%   
if(null!=request.getQueryString())
{


try
{
	sql1="Select * from "+session.getAttribute("CompanyMasterID").toString()+"netbankingrecords where CreationDate between '"+fromDate+" 00:00:00' and '"+toDate+" 23:59:59'";
	
}
catch(Exception e)
{
	sql1="Select * from "+session.getAttribute("CompanyMasterID").toString()+"netbankingrecords where CreationDate between '"+fromDate+" 00:00:00' and '"+toDate+" 23:59:59'";
}
System.out.println(sql1);
rsdata=st.executeQuery(sql1);
while(rsdata.next())
{
	filename=rsdata.getString("FileName1") ;
	sql2="Select AccoutType,UploadStatus from "+session.getAttribute("CompanyMasterID").toString()+"netbankingfiles where FileName1='"+filename+"'";
	ResultSet rs2=st1.executeQuery(sql2);
	if(rs2.next())
	{
		accountType=rs2.getString("AccoutType");
		status=rs2.getString("UploadStatus");
	}
	else 
	{
		accountType="-";
		status="Pending";
	}
	
	if(status.equals("Pending"))
	{
	color="bgcolor='#FAAFBE'";
	}else if(status.equals("Uploaded"))
	{
		color="bgcolor='#AEF8B1'";
	}
	else if(status.equals("Cancelled")) 
	{
		color="bgcolor='#FFFF00'";
	}
	System.out.println(color);
%>

<tr <%=color %>>
<td><div align="left"><font size="2" color="black"><%=rsdata.getString("FileName1") %></font></div> </td>
<td><div align="left"><font size="2" color="black"><%=accountType %> </font></div></td>
<td><div align="left"><font size="2" color="black"><%=rsdata.getString("BeneficiaryName") %></font></div> </td>
<td><div align="right"><font size="2" color="black"><%=rsdata.getString("Amount") %></font></div> </td>
<td><div align="right"><font size="2" color="black"><%=rsdata.getString("TallyRefNo") %></font></div></td>
<td><div align="left"><font size="2" color="black"><%=rsdata.getString("Createdby") %></font></div> </td>
<td><div align="left"><font size="2" color="black"><%=rsdata.getString("Comments") %> </font></div></td>
<td><div align="left"><font size="2" color="black"><%=status %></font> </div></td>
</tr>

<%

}   // end of while  
%>

</table>
</div>
</form>

<%	


}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>  		

	</form>
	
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