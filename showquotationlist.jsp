<%@page import="com.sun.corba.se.spi.orbutil.fsm.State"%>

<%@ page language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="moreservlets.listeners.*" errorPage="" %>
<link href="css/ERP.css" rel="stylesheet" type="text/css"></link>
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style type="text/css">@import url(jscalendar-1.0/calendar-blue.css);</style>
<%@ page import = "java.io.FileNotFoundException"%>
<%@ page import = "java.io.FileOutputStream"%>
<%@ page import = " java.io.IOException"%>
<%@ page import="javax.activation.*" %>


<html> 
<head>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-166064963-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-166064963-1');
</script>
<style>

</style>

<%@ include file="header.jsp"%>

<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page"> 
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<script type="text/javascript"  src="https://code.jquery.com/jquery-1.12.4.js"></script> 
<script type="text/javascript"  src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script> 


  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Export Options Links of DataTables -->

<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css">
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script> 
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script> 
<script src=" https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script>







 
<script type="text/javascript">
 $(document).ready(function() {
	    $('#example').DataTable( {
	    	"pagingType": "full_numbers",
	    	
	        dom: 'Blfrtip',
	        
	        buttons: [
	        	
	        	{
	        		extend: 'collection',
	        		
	        		text: 'Export',
	        		buttons: [
	        			{
	                        extend: 'excel',
	                        title: 'View Sales Quotation '+$("#fromdate").val()+'-'+$("#todate").val(), 
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title: 'View Sales Quotation '+$("#fromdate").val()+'-'+$("#todate").val(), 
	                    },
	                    {
	                        extend: 'csv',
	                        title: 'View Sales Quotation '+$("#fromdate").val()+'-'+$("#todate").val(),
	                    },
	                    {
	                        extend: 'print',
	                        title: 'View Sales Quotation '+$("#fromdate").val()+'-'+$("#todate").val(),
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'View Sales Quotation '+$("#fromdate").val()+'-'+$("#todate").val(),
	                    },
	                    
	            				/* 'copy', 'csv', 'excel', 'pdf', 'print' */
	            			]
	        	}
	        ],
	        lengthMenu: [[-1, 10, 25, 50, 100], ["All", 10, 25, 50, 100 ]],
	        
	     
	    
	    
	    
	    	
	    } );
	} );

</script>









 <script>
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
//          else if(date1 > currentDate)
//          {
//              alert("From Date should be less than current date");
//              return false; 
//          }
//          else if(date2 > currentDate) 
//          {
//              alert("To Date should be less than current date");
//              return false; 
//          }

         return true;
 	
 }
 
</script>


 
<script language="JavaScript1.2">

function showVisitingCardDetails(companyName,customerCode){
	document.data.companyNames.value=companyName;
	document.getElementById("companyList").style.display='none';
	document.data.isCheckedAll.checked=false;
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
	}
	catch(e)
		{
			//alert(e);
		}
		
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

	}//end if else
}

function gotoExcel (elemId, frmFldId)  
{  
	//alert("*********** ");

         var obj = document.getElementById(elemId);  

         var oFld = document.getElementById(frmFldId); 

          oFld.value = obj.innerHTML;  

          document.quotation.action ="excel.jsp";     // CHANGE FORM NAME HERE

          document.forms["quotation"].submit();       // CHANGE FORM NAME HERE

} 

function closeQuotation(Address,salesQuotation,condition)
{
	//alert("HHHH    IKILL>");
	//alert(Address);
	//alert(salesQuotation);
	//alert(condition);
	window.open(Address+'?salesQuotation='+salesQuotation+'&condition='+condition);
}

</script>
   </head>                              	                                                                                                              
<%
	erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
String comid=session.getAttribute("CompanyMasterID").toString();


%>
<%
	Connection conn = null;
	Statement st = null, st1 = null, st3 = null, st4 = null,st5=null;
	Statement st2 = null; long  totalAmount=0;
    String selectedName;
	String FollowUpType="",status="",emp="",companyName="";
	Format format=new SimpleDateFormat("dd-MMM-yyyy");
	Format parse=new SimpleDateFormat("yyyy-MM-dd");
	String fromDate="",toDate="",fromDateCal="",toDateCal="";
	String id=request.getParameter("id");
	System.out.println("ID CMING IS   ++++++++++++++          "+id);
	 NumberFormat formatter = NumberFormat.getInstance();
     
%>
<%

String sort="SrNo";
try{
	 sort=request.getParameter("sort");
	 if(sort==null)
			sort="SrNo";
}catch(Exception e){
	sort="SrNo";
}
	Date today = new Date();
	Calendar cal = Calendar.getInstance();
	cal.setTime(today);
	cal.add(Calendar.DAY_OF_MONTH, -30);
	Date today30 = cal.getTime();
	fromDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(today30);
	toDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
	toDate=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	fromDate=new SimpleDateFormat("yyyy-MM-dd").format(today30);
	if (!(null == request.getParameter("fromdate"))) {
		fromDate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("fromdate")));
		fromDateCal=request.getParameter("fromdate");
	}
	if (!(null == request.getParameter("todate"))){
		toDate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("todate")));
		toDateCal=request.getParameter("todate");
	}
	if (!(null == request.getParameter("SrByEmp")))
	{  emp= request.getParameter("SrByEmp");	}
	
	if (!(null == request.getParameter("companyNames")))
	{  companyName= request.getParameter("companyNames");	}
	
	if (null == request.getParameter("customer"))
	selectedName = "All";
	else 
	selectedName = request.getParameter("customer");
 		
	try {
	conn = erp.ReturnConnection();
	st = conn.createStatement();
	st1 = conn.createStatement();
	st2 = conn.createStatement();
	if (null == request.getParameter("customer"))
	selectedName = "All";
	else
	selectedName = request.getParameter("customer");
	
	
	//    Get Employee Names
	 String sql ="select EmpName from  "+session.getAttribute("CompanyMasterID").toString()+"security order By EmpName";
	 ResultSet rsEmp= st.executeQuery(sql);
			
	%>
	
 <body ONKEYDOWN="if (event.keyCode == 27){document.getElementById('companyList').style.display = 'none';}" >
	<div align="center">
	<font size="3">View Sales Quotation</font>&nbsp; 
	

	</div>
	<br>
	<form name="data" action="" method="get">
	<input type="hidden" name="id" value="<%=id %>"/>
	<%System.out.println(" ************* id***********"+id); %>
	<div class="form" style="margin-left: 24%;">
	<table border="0" width=1100 align="center">
		<tr align="left">
	
	<td align="center"><font face="Arial" color="black" size="2">Check All&nbsp; </font>
	
	</td>
	<td>
	<input type="checkbox" name="isCheckedAll" id="isCheckedAll" value="checkedAll"  onclick="hideField();" />
	<input type="hidden" name="isdisplay" value="true"/>
 	</td>
	<td align="center" id ="col1"><font face="Arial" color="black" size="2">&nbsp;Enter Company:&nbsp;</font>
	<%
	String str="";
	if(request.getParameter("companyNames")==null)
	{
		str="";
	}else{
		str=request.getParameter("companyNames");
	}
	
		%>
	<input type="text" name="companyNames" value="<%=str %>" id="companyNames" style="width:220px;" autocomplete="off"  value=""  onkeyup="if (event.keyCode == 27){document.getElementById('companyList').style.display = 'none';} else { getCompanies('quotation'); }" /> 
	<br>
	 <div style="position: absolute;"  >
	 <table><tr><td>
	 			</td></tr>
	 <tr><td >
	 <div id='companyList'>
	 </div>
	 </td></tr>
	 </table>
	 </div>
     </td>
	  
	  <td align="center" id="col2" ><font face="Arial" color="black" size="2">&nbsp;Select Employee Name:</font>
	 <select style="width: 150px; height: 29px; font-size: 12px;color: black; " name="SrByEmp" id="SrByEmp"> 
				<option value='All'>All</option>
				<%while (rsEmp.next()) {
				if(emp.equalsIgnoreCase(rsEmp.getString("EmpName")))
				{
				%>
				<option value="<%=rsEmp.getString("EmpName") %>" selected><%=rsEmp.getString("EmpName") %></option>
				 <%}else{
					 %>
					 <option value="<%=rsEmp.getString("EmpName") %>" ><%=rsEmp.getString("EmpName") %></option>
					 <%}}%>
				 
				</select>
		</td>
	  
	  		
			
			
			<td align="left"><font face="Arial" color="black" size="2">&nbsp;&nbsp;From&nbsp;&nbsp;
			</font></td>
			<td> <input type="text" id="fromdate" height="10px" name="fromdate" value="<%=fromDateCal%>" size="13px" readonly  class="element text medium" style="width: 105px; text-align:center; font-size: 12px; height: 29px; color:black"  /> <script
				type="text/javascript">
			  Calendar.setup(
			    {
			      inputField  : "fromdate",         // ID of the input field
			      ifFormat    : "%d-%b-%Y",     // the date format
			      button      : "fromdate"       // ID of the button
			    }
			  );
			</script></td>
			<td></td>
			<td></td>
			<td></td>

			<td></td>
			<td></td>
			<td></td>
			
			<td></td>
			<td></td>
			<td></td>

			<td></td>
			<td></td>
			<td></td>
	
	
	<td align="left"><font face="Arial" color="black" size="2">&nbsp;&nbsp;To&nbsp;&nbsp;</font></td>
	<td> <input type="text" id="todate" name="todate" value="<%=toDateCal%>" size="13px" readonly   class="element text medium" style="width: 105px; text-align:center; font-size: 12px; height: 29px; color:black"  /> 
			<script	type="text/javascript">
			  Calendar.setup(
			    {
			      inputField  : "todate",         // ID of the input field
			      ifFormat    : "%d-%b-%Y",    // the date format
			      button      : "todate"       // ID of the button
			    }
			  );
			</script></td>
			
			<td></td>
			<td></td>
			<td></td>

			<td></td>
			<td></td>
			<td></td>
			
			<td></td>
			<td></td>
			<td></td>

			<td></td>
			<td></td>
			<td></td>
			
						
	
	
			<td style="font-size: 11px; face:san-serif; color:black" ><input type="submit" name="submit" value="Submit" onclick="return chk()" style="width: 80px;font-size: 12px; height: 29px; color:black"></td>

	
	</table></div>
	</form>
	<br>
<%   
//	if(null != request.getParameter("isdisplay"))
	//{
%> 


<form name="quotation" method="post" >
<%
%>	
<div  id="table">
<br>
<br>
<input type="hidden" id="tableHTML" name="tableHTML" value="" />   
<table id="example"  class="display"  a style="width:100%"  cellspacing="0" border="1">  
<thead>
	<tr>
	<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">SrNo</th>
<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">Sales Quo Ref no</th>
<th style="font-size: 12px ;background: #1582AB;  color:white; face:san-serif;">SQ Date</th>
<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">Company</th>
<th style="font-size: 12px ; background: #1582AB;  color:white; face:san-serif;">Status</th>
<th style="font-size: 12px ;background: #1582AB;  color:white; face:san-serif;">Group</th>
<th style="font-size: 12px ;background: #1582AB;  color:white; face:san-serif;">Sign</th>
<th style="font-size: 12px ;background: #1582AB;  color:white; face:san-serif;">Amount</th>
	
	</tr>
		</thead>
		
	
<tbody>	
<%	
			String sqlEnq="",sqlGroup="", condition="",condition1="",condition2="",condition3="";
     condition="SalesQuoDate BETWEEN '"+fromDate+"' and '"+toDate+"'";
     condition1="TWEmpname='"+emp+"'";
     int i=1;
     String SalesquoRefNo="",SalesQuoNo="",SalesQuoDate="",CompanyName="",Quotationtype="",TheGroup="",Total="",TWEmpName="";

     condition2=" CompanyName in ('"+request.getParameter("companyNames")+"')";
    // System.out.println("company name#########"+request.getParameter("companyName"));
	if(null != request.getParameter("isCheckedAll")){
		
		System.out.println("INNNN111");
		String test="SalesQuoCancelled=0 AND ThisisSalesOrder=0 AND "+condition;
		sqlEnq="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det  WHERE SalesQuoCancelled=0 AND ThisisSalesOrder=0 AND "+test+" ORDER BY SalesQuoNo DESC  ";
		System.out.println("IN IFF:"+sqlEnq);

		
	}
	
	else
	{   if(companyName.equals(""))
		 {
					if(emp.equals("All"))
		 			{  
					//sqlEnq="SELECT DISTINCT SalesquoRefNo,SalesQuoDate,SalesQuoCancelled,CompanyName,TheGroup, ThisIsSalesOrder,Total,TWEmpname,Quotationtype,SalesQuoNo FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det WHERE  "+condition+" ORDER BY SalesQuoNo DESC";
						System.out.println("INNNN222");
					sqlEnq="SELECT DISTINCT SalesquoRefNo,SalesQuoDate,SalesQuoCancelled,CompanyName,TheGroup, ThisIsSalesOrder,Total,TWEmpname,Quotationtype,SalesQuoNo FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det WHERE  "+condition+" ORDER BY SalesQuoNo DESC";

					}
					else
					{ 
						String krn=condition+" AND "+condition1;
						System.out.println("INNNN333");

						//sqlEnq="SELECT DISTINCT SalesquoRefNo,SalesQuoDate,CompanyName,TheGroup,SalesQuoCancelled,ThisIsSalesOrder,Total,TWEmpname,Quotationtype,SalesQuoNo FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det WHERE  "+condition+" AND "+condition1+" ORDER BY SalesQuoNo DESC";
					sqlEnq="SELECT DISTINCT SalesquoRefNo,SalesQuoDate,CompanyName,TheGroup,SalesQuoCancelled,ThisIsSalesOrder,Total,TWEmpname,Quotationtype,SalesQuoNo FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det WHERE  "+condition+" AND "+condition1+" ORDER BY SalesQuoNo DESC";

					}
		 }
		else
		{			if(emp.equals("All"))
					{  
					//sqlEnq="SELECT DISTINCT SalesquoRefNo,SalesQuoDate,CompanyName,SalesQuoCancelled,TheGroup,ThisIsSalesOrder,Total,TWEmpname,Quotationtype,SalesQuoNo FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det WHERE  "+condition+" AND"+condition2+" ORDER BY SalesQuoNo DESC";
					String krn=condition+" AND"+condition2;
					System.out.println("INNNN444");
					sqlEnq="SELECT DISTINCT SalesquoRefNo,SalesQuoDate,CompanyName,SalesQuoCancelled,TheGroup,ThisIsSalesOrder,Total,TWEmpname,Quotationtype,SalesQuoNo FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det WHERE  "+condition+" AND"+condition2+" ORDER BY SalesQuoNo DESC";
					System.out.println("IN IFF:"+sqlEnq);

					
				
					
					}
					else
					{ 
						//sqlEnq="SELECT DISTINCT SalesquoRefNo,SalesQuoDate,CompanyName,SalesQuoCancelled,TheGroup,ThisIsSalesOrder,Total,TWEmpname,Quotationtype,SalesQuoNo FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det WHERE  "+condition+" AND "+condition1+"AND "+condition2+" ORDER BY SalesQuoNo DESC";
						String krn=condition+" AND "+condition1+"AND "+condition2;
						System.out.println("INNNN555");
						sqlEnq="SELECT DISTINCT SalesquoRefNo,SalesQuoDate,CompanyName,SalesQuoCancelled,TheGroup,ThisIsSalesOrder,Total,TWEmpname,Quotationtype,SalesQuoNo FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det WHERE  "+condition+" AND "+condition1+"AND "+condition2+" ORDER BY SalesQuoNo DESC";
						System.out.println("IN IFF:"+sqlEnq);

					
					}
			
		}
	}
	ResultSet rs12=st1.executeQuery(sqlEnq);
	while(rs12.next())
	{
		SalesquoRefNo=rs12.getString("SalesquoRefNo");
		SalesQuoNo=rs12.getString("SalesQuoNo");

		SalesQuoDate=rs12.getString("SalesQuoDate");
		SalesQuoDate =new SimpleDateFormat("dd-MMM-yyyy")
				.format(new SimpleDateFormat("yyyy-MM-dd")
				.parse(SalesQuoDate));
				
		CompanyName=rs12.getString("CompanyName");
		Quotationtype=rs12.getString("Quotationtype");
		TheGroup=rs12.getString("TheGroup");
		TWEmpName=rs12.getString("TWEmpName");
		Total=rs12.getString("Total");
%>
<tr>

<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=i%></td>


<td style="font-size: 11px; face:san-serif; color:black" align="right"> <a href="viewQuotation.jsp?condition=View&salesQuotation=<%=SalesQuoNo%>"><%=rs12.getString("SalesquoRefNo")%></a></td>

<td style="font-size: 11px; face:san-serif; color:black" align="left"><%=SalesQuoDate%></td>
<td style="font-size: 11px; face:san-serif; color:black" align="left"><%=CompanyName%></td>
<td style="font-size: 11px; face:san-serif; color:black" align="left"><%=Quotationtype%></td>
<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=TheGroup%></td>
<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=TWEmpName%></td>
<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=Total%></td>
</tr>
<%
i++;	}

	
	
	%>
	
	<%
	} catch (Exception e) {
	e.printStackTrace();
	}
%>
</tbody>
</table>
</div>
</form>
</jsp:useBean>

</body>
</html>


<%-- <%@include file="footer_new.jsp" %> --%>