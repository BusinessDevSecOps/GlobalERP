<%@page import="com.sun.corba.se.spi.orbutil.fsm.State"%>

<%@ page language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="moreservlets.listeners.*" errorPage="" %>
<link href="css/ERP.css" rel="stylesheet" type="text/css"></link>
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style type="text/css">@import url(jscalendar-1.0/calendar-blue.css);</style>
<%@ page import = "java.io.FileNotFoundException"%>
<%@ page import = "java.io.FileOutputStream"%>
<%@ page import = " java.io.IOException"%>
<%@ page import="javax.activation.*" %>

<!DOCTYPE html>

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
<script src="dropdown.js" type="text/javascript"></script>
<body>


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
	                        title: 'Marketing Report '+$("#data").val()+'-'+$("#data1").val(), 
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title: 'Marketing Report '+$("#data").val()+'-'+$("#data1").val(), 
	                    },
	                    {
	                        extend: 'csv',
	                        title: 'Marketing Report '+$("#data").val()+'-'+$("#data1").val(),
	                    },
	                    {
	                        extend: 'print',
	                        title: 'Marketing Report '+$("#data").val()+'-'+$("#data1").val(),
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Marketing Report '+$("#data").val()+'-'+$("#data1").val(),
	                    },
	                    
	            				/* 'copy', 'csv', 'excel', 'pdf', 'print' */
	            			]
	        	}
	        ],
	        lengthMenu: [[-1, 10, 25, 50, 100], ["All", 10, 25, 50, 100 ]],
	        
	     
	    
	    
	    
	    	
	    } );
	} );

</script>

<script language="JavaScript1.2">
   
     function gotoExcel(elemId, frmFldId)  
	{  
    	/* alert("Div Id=="+elemId+"===Form Element---"+frmFldId); */  
	    var obj = document.getElementById(elemId);  
	    var oFld = document.getElementById(frmFldId); 
	    oFld.value = obj.innerHTML; 
	    /* alert("ok"); */  
	     document.marketingreport.action ="excel.jsp";
	    document.forms["marketingreport"].submit(); 
	    /* alert("zale"); */
	 } 
    
	
//	if (document.all || document.getElementById)
//		document.body.style.background = "url('images/bg.jpg')  white top no-repeat "




function hideField(){
	/* alert("1111"); */
	try{
		/* alert("22222"); */
		/* if(document.marketing.marketingRep.checked){
			
			document.marketing.customer.checked=false;
			document.marketing.salesper.checked=false;		
    		document.getElementById('col2').style.display="";
    		document.getElementById('col3').style.display='none';
		}	
		else if(document.marketing.customer.checked)
		{
			document.marketing.salesper.checked=false;
			document.marketing.marketingRep.checked=false;
			document.getElementById('col2').style.display='none';
			document.getElementById('col3').style.display="";
		//	document.getElementById('marketingreportdiv').style.display='none';
			document.marketing.custName.value="";
		}else
		{
			document.marketing.marketingRep.checked=false;
			document.marketing.customer.checked=false;
		} */
	}
	catch(e){/*alert(e);*/}
}

 function checksel(){
	var market=document.getElementById("marketingReport").value;
	var customer=document.getElementById("customerName").value;
	var collector=document.getElementById("collectReport").value;
	
	/* alert("selected Option is 1"+market);
	alert("selected Option is 2"+customer);
	alert("selected Option is 3"+collector); */
	
	
	}

function showField(){
	/* alert("====Showing field===="); */
	try{
		//alert("cust checked");
		if(document.getElementById("salesper").checked){
			/* alert("Collection report"); */
			document.marketing.collectReport.value="collectSelect";
			document.marketing.customerName.value="";
			document.marketing.marketingReport.value="";
			document.getElementById("salespersondiv").style.display="block";
			document.getElementById('marketingreportdiv').style.display="none";
			document.getElementById('CustFoll').style.display=="none";
			document.getElementById('col1').style.display='none';
			document.getElementById('col2').style.display='none';
			document.getElementById('col3').style.display='none';
			document.marketing.custName.value="";
			
			
		}else if(document.getElementById("customer").checked){
			/* alert("Customer report"); */
			
			document.marketing.customerName.value="custselect";
			document.marketing.marketingReport.value="";
			document.marketing.collectReport.value="";
			document.getElementById('col2').style.display='none';
			document.getElementById('col3').style.display="";
			document.getElementById('marketingreportdiv').style.display='none';
			document.getElementById('CustFoll').style.display=='block';
			document.getElementById("salespersondiv").style.display='none';
			document.marketing.custName.value="";
		}	
		else
		{
			/* alert("Marketing report"); */
			document.marketing.marketingReport.value="markselect";
			document.marketing.customerName.value="";
			document.marketing.collectReport.value="";
			document.getElementById('marketingreportdiv').style.display="block";
			document.getElementById("salespersondiv").style.display="none";
			document.getElementById('CustFoll').style.display=="none";
			document.getElementById('col1').style.display='none';
			document.getElementById('col2').style.display='none';
			document.getElementById('col3').style.display='none';
			document.marketing.custName.value="";
			
			
		}	
	}
	catch(e)
		{/*alert(e);*/}
}


function validate()
{
	if(document.marketing.customer.checked){

	var  a=document.marketing.companyNames.value;
	
	document.marketing.custName.value="a";
	return true;

	}else if(document.marketing.marketingRep.checked)
	{
		document.marketing.custName.value="select";
		return true;
	}else if(document.marketing.salesper.checked)
	{
		document.marketing.salesper.value="select";
		return true;
	}else
	{
		alert("Please Select  Checkbox For Report");
		return false;
	}
	
}



function getCompanies(type)
{
	document.getElementById("companyList").style.display='block';
	var company=document.marketing.companyNames.value;

//alert("COMPPPP"+company);

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
	ajaxRequest.open("GET", "ajaxCustomerFollow.jsp" + queryString, true);
	ajaxRequest.send(null); 

	}//end if else
}

function showCompany(companyName,customerCode){

	//document.getElementById("companyNames").value=companyName;
	document.marketing.companyNames.value=companyName;
	document.marketing.custName.value=companyName;
	
	document.marketing.custCode.value=customerCode;
	
	document.getElementById("companyList").style.display='none';
	document.marketing.isCheckedAll.checked=false;
}
</script>


	<!-- end #header --> <!-- end #page --> 
	<%
		erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
	%>
	<%
	
		Connection conn = null;
			Statement st = null, st1 = null ;
			Statement st2 = null,st3=null ,st4=null,st5=null, st6 = null;
			String selectedName;
			String FollowUpType="";
			Format format=new SimpleDateFormat("dd-MMM-yyyy");
			Format parse=new SimpleDateFormat("yyyy-MM-dd");
			String fromDate="",toDate="",fromDateCal="",toDateCal="",fromdatevdTime="",todatevdTime="";
			String sqlDetails="";
			String visits="0",phoneCalls="0",letters="0",meetings="0",email="0",actionPoint="0",assigned="0",numberOfprospects="0",numberOfSQ="0",numberOfSO="0",sumOfSO="0",ActionPoints="0", Assign="0";
			String newfromdate="",newtodate="";
			double Grandindex=0,P_Grandindex=0,Grandindex1=0,P_Grandindex1=0,Month_index_total=0,Month_Grandindex=0;
			DecimalFormat df2 = new DecimalFormat("0.00");
			String MarktngCode="";
			StringBuffer htmlstring= new StringBuffer();
			long	SQValueMonthly=0,SQValueWeekly=0;
			String SQValue="";
			String abc="";
			int visitcounter=0,no=0,finalvisits=0;
			
			String customercode=null;
		       String custName=null;
		       
		       
		       String divFlag="T";

			
	%>
	<%
	String exportFileName="FollowUpDetails.xls";
	Date today = new Date();
	Calendar cal = Calendar.getInstance();
	cal.setTime(today);
	cal.add(Calendar.DAY_OF_MONTH, -30);
	Date today30 = cal.getTime();
	fromDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(today30);
	
	String todaysDate=new SimpleDateFormat("yyyy-MM-dd").format(today);
	//cal.set(cal.get(cal.YEAR),cal.get(cal.MONTH),1);
	//Date monthsDateAsDate = cal.getTime();
	 Calendar date = Calendar.getInstance();
           date.set(Calendar.DAY_OF_MONTH, 1);
      DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
       String startDate=df.format(date.getTime());


           // out.println("this is start date"+startDate);
	toDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
	//fromDate=toDate=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	toDate=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	
	if (!(null == request.getParameter("fromdate"))) {
	fromDate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("fromdate")));
	System.out.println(">>>>>>>>>fromDate:"+fromDate);
	newfromdate=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("fromdate")));
	fromdatevdTime=new SimpleDateFormat("yyyy-MM-dd ").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("fromdate")));
	fromDateCal=request.getParameter("fromdate");
	}
	else
	{
		fromDate=new SimpleDateFormat("yyyy-MM-dd").format(date.getTime());
		fromDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(date.getTime());
		System.out.println("======>"+fromDateCal);
	}
	if (!(null == request.getParameter("todate"))){
		toDate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("todate")));
		System.out.println(">>>>>>>>>toDate:"+toDate);
		newtodate=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("todate")));	
		todatevdTime=new SimpleDateFormat("yyyy-MM-dd ").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("todate")));
		toDateCal=request.getParameter("todate");
	}
	DateFormat formatter1 ; 
	Date from1,to1 ; 
	 formatter1 = new SimpleDateFormat("yyyy-MM-dd");
	 from1 = (Date)formatter1.parse(fromDate);  
	 to1 = (Date)formatter1.parse(toDate);
	 System.out.println(">>>>>>>>>>>>>>>from1 :"+from1 ); 
	 System.out.println(">>>>>>>>>>>>>>>to1 :"+to1);
	  double diff= (to1.getTime() - from1.getTime()) / (1000 * 60 * 60 * 24)+1;
	  System.out.println(">>>>>>>>>>>>>>>>>>diff:"+diff);
	
	
	if(!(session.getAttribute("userLevel").toString().equalsIgnoreCase("level5")))
		selectedName = session.getAttribute("EmpName").toString();
		
	if (!(null == request.getParameter("custCode"))){
		customercode=request.getParameter("custCode");
	}
	
	if (null == request.getParameter("custName"))
	{
		custName="Select";
	}else
	{
		custName=request.getParameter("custName");
	}
	System.out.println("Customer Name==&*&*&*&*&*&&*&**&==>"+custName);
			try 
				{
					conn = erp.ReturnConnection();
					st = conn.createStatement();
					st1 = conn.createStatement();
					st2 = conn.createStatement();
					st3 = conn.createStatement();
					st4 = conn.createStatement();
					st5 = conn.createStatement();
					st6 = conn.createStatement();
//++++++++++++++++++Ravi+++++++++++++++++++++++++++++++++
boolean flag_day = false;
String f_day =  fromDate.substring(fromDate.lastIndexOf("-")+1).trim();
String l_day =  toDate.substring(toDate.lastIndexOf("-")+1).trim();

System.out.println("The fromdate day =====================>"+fromDate+"  First Day of Month ==>"+f_day);
System.out.println("The todate day   =====================>"+toDate+"    Last Day of Month  ==>"+l_day);

int days_of_month = 0;
int d1 = 0;
if(f_day.equals("01")){
	
	Date d = new SimpleDateFormat("yyyy-MM-dd").parse(fromDate);
	Calendar cal1 = Calendar.getInstance();
	cal1.setTime(d);
	 d1 = cal1.getActualMaximum(Calendar.DAY_OF_MONTH);	

	String sql = "select DATEDIFF('"+toDate+"', '"+fromDate+"') as daydiff";
	ResultSet rs = st6.executeQuery(sql);
	if(rs.next()){
		days_of_month = rs.getInt("daydiff") + 1;
	}
	
	if((Integer.parseInt(l_day) == d1) && (d1 == days_of_month))
	{
		//For Monthly index
		flag_day = true;
	}			
}
System.out.println("The d1 in month ===================>"+d1);
System.out.println("The days in month ===================>"+days_of_month);
System.out.println("The flag day   =====================>"+flag_day);
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
if(custName!=null)
	{
	divFlag="cust";
    }
String queryString="";
if(request.getQueryString()==null)
{
	queryString="All";
}else
{
	queryString=request.getQueryString();
}
System.out.println("11111111111");

String salesperrad="";
String customerrad="";
String markrad="";
if(request.getParameter("customerName")==null)
{
	customerrad="NS";
}else
{
	customerrad=request.getParameter("customerName");
}

if(null==request.getParameter("collectReport"))
{
	salesperrad="NS";
}else
{
	salesperrad=request.getParameter("collectReport");
}

if(null==request.getParameter("marketingReport"))
{
	markrad="NS";
}else
{
	markrad=request.getParameter("marketingReport");
}

System.out.println("222222222222");
%> 
	
<div style="font-size: 1.6em; text-align: center; margin-top: 0.2em; margin-bottom: 0.2em;">
<a><font face ="Arial" size = 3 color="black" ><b>Follow Up Report From <%=fromDateCal %> To <%=toDateCal %> </b> </font></a>
</div>

<%-- <form name="followupreport" id="followupreport" method="post">
<div class="form" align="center" style="font-size: 13px;">
<br></br><br>
<a><font face="san-serif" color="black" size="5"><b>Follow Up Report From <%=fromDateCal %> To <%=toDateCal %></b></font></a><br></br>
</div> --%>
	
<form  name="marketing" action="" method="get" onsubmit="return validate();" >
<table border="0" width="100%">
<tr><td valign="top" align="right" width="50%">Marketing Rep. Wise:
<%
if( queryString=="All" || customerrad=="NS" || salesperrad=="NS" ||markrad.equalsIgnoreCase("markselect"))
{%>
<input type="radio" name="followup" id="marketingRep"  checked="checked" onclick=" showField();" />	 
<%}else{
%>
<input type="radio" name="followup" id="marketingRep"  onclick="showField();" />
<%} %>
<input type="hidden" id="marketingReport" name="marketingReport" value="" />
</td>
<td id ="col1" style="display:none"  align="right" valign="top">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  <b>Enter Company :</b>
<input type="text" name="companyNames" id="companyNames" style="width:230px;" autocomplete="off"  value=""  onkeyup="if (event.keyCode == 27){document.getElementById('companyList').style.display = 'none';} else { getCompanies('quotation'); }" /> 
&nbsp;&nbsp;&nbsp;<br></td>

<td align="center" width="20%">From&nbsp;&nbsp;
<input type="text" id="fromdate" name="fromdate" value="<%=fromDateCal %>" size="15" readonly style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF" />
<script type="text/javascript">
Calendar.setup(
{
	inputField  : "fromdate",         // ID of the input field
	ifFormat    : "%d-%b-%Y",     // the date format
	button      : "fromdate"       // ID of the button
 });
</script>
				
To &nbsp;&nbsp;
<input type="text" id="todate" name="todate" value="<%=toDateCal %>" size="15" readonly style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF" />
<script type="text/javascript">
Calendar.setup(
{
	inputField  : "todate",         // ID of the input field
    ifFormat    : "%d-%b-%Y",    // the date format
    button      : "todate"       // ID of the button
});
</script>
				
<input type="submit" name="Marketingsbmt" id="Marketingsbmt" autocomplete="off" style="border: outset;" value="Go" onclick="return checksel();" />
</td>			
</tr>
<tr>
<td align="right">Customer Wise Follow Up Report:
<%if(queryString!="All" && (!salesperrad.equalsIgnoreCase("collectSelect")) && (!markrad.equalsIgnoreCase("markselect"))){ %>
<input type="radio" name="followup" id="customer" checked="checked"   onclick="showField();" />	 
<% }else{%>
<input type="radio" name="followup" id="customer"  onclick="showField();" />
<%} %>
<input type="hidden" id="customerName" name="customerName" value="" />
</td>
<td></td><td align="right"><div style="position: absolute;" >
<table><tr><td>
</td></tr><tr><td><div id='companyList'></div></td></tr></table>
</div></td><td><input type="hidden" id="custCode" name="custCode" autocomplete="off" value="<%=customercode%>" />
<input type="hidden" id="custName" name="custName" autocomplete="off" value="" /></td>
<td></td></tr>
<tr>
<td align="right">Sales Person Wise Follow Up Report:
<%if(salesperrad.equalsIgnoreCase("collectSelect")&&null != queryString && (!markrad.equalsIgnoreCase("markselect"))){ %>
<input type="radio" name="followup" id="salesper"  checked="checked"  onclick="showField();" />	 
<%}else{ %>
<input type="radio" name="followup" id="salesper"   onclick="showField();" />
<% }%>
<input type="hidden" id="collectReport" name="collectReport" value="" />
</td>
</tr>
</table>

</form>
<% //if(divFlag.equalsIgnoreCase("T"))
if(custName.equalsIgnoreCase("select")||( queryString=="All" || (customerrad=="NS" && salesperrad=="NS")))
{
	System.out.println("222222222222");
%>
<br></br>
<div id="marketingreportdiv" name="marketingreportdiv"   >
<form id="marketingreport" name="marketingreport" method="post">	
<div align="right">
<font size="2" face = "Arial">&nbsp;&nbsp;&nbsp;<%= new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date())%>
<!-- <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('a','tableHTML');">
<img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img><a href="#" onclick="window.print();return false;" title="Print"><img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img></a>
</a></div>
 --></form>
<br>
<div id="a">
<input type="hidden" id="tableHTML" name="tableHTML" value="" />
<input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" />
<%
//if(true)
{
%>
<!-- <div class="form" style="margin-center: 24%;">
	<table border="0" width=800 align="center"> -->

<!-- <table id="data"  class="display"  a style="width:100%"  cellspacing="1" border="1">  
 --><thead>
 <table id="example" border="1px" width="100%"  class="sortable">
 		<tr>
		<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">Sr.No</th>
		<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">Representative</th>
		<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">Status</th>
		<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">Visits</th>
		<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">Calls</th>
		<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">Letters</th>
		<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">E-mails</th>
		<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">Meetings</th>
		
		</tr>
		</thead>
		
	<%	
	  int frommonthdays=0,tomonthdays=0,TargetForFromMonth=0,TargetForToMonth=0,diffdate=0,DateDiffToday=0;
	  String Sqlfrom=" SELECT day( last_day( '"+fromDate+"' ) )  ";
	  System.out.println("Sqlfrom:"+Sqlfrom);
	  ResultSet rsfrom=st.executeQuery(Sqlfrom);
	  if(rsfrom.next())
	  {
		  frommonthdays=rsfrom.getInt(1);
	  }
	  System.out.println("frommonthdays:"+frommonthdays);
	  String Sqlto=" SELECT day( last_day( '"+toDate+"' ) )  ";
	  System.out.println("Sqlto:"+Sqlto);
	  ResultSet rsto=st1.executeQuery(Sqlto);
	  if(rsto.next())
	  {
		  tomonthdays=rsto.getInt(1);
	  }
	  System.out.println("tomonthdays:"+tomonthdays);
	  
	  String SqlDateDiff1="Select DATEDIFF('"+toDate+"','"+fromDate+"')";
	  ResultSet rsDate1=st.executeQuery(SqlDateDiff1);
	  rsDate1.next();
	  DateDiffToday=rsDate1.getInt(1)+1;
	  System.out.println(">>>>>>>>>>>DateDiffToday:"+DateDiffToday);
	  /*************************Calulation for month target beetween these date range****************************************/
		 sqlDetails="Select *  from "+session.getAttribute("CompanyMasterID").toString()+"marketingrepmaster as tm,"+session.getAttribute("CompanyMasterID").toString()+"security as ts WHERE  tm.username<>'' and tm.password<>'' and (tm.Compressor=1 or tm.DigitalEquipment=1 or tm.DGSet=1 or tm.Endoscope=1 or tm.OtherGroups=1) and tm.username = ts.username  group by  tm.MarketingRepNAme";
		 System.out.println(">>>>>>>>sqlDetails:"+sqlDetails+"FROM DATEEEEEE"+fromDate+" TO DATEEEEE"+toDate);
		 
	int i=1;
		ResultSet rsDetails=st1.executeQuery(sqlDetails);
		while(rsDetails.next()){
			
			 String sqlCount="SELECT    count(*) , 'PhoneCall'  from "+session.getAttribute("CompanyMasterID").toString()+"followup where			 FollowUpType   "+
				                         "       in('phoneCall','Ph Call') and MarketingRepcode			 "+
				                         "       ="+rsDetails.getString("MarketingRepCode")+" and FollowUpDate  between			 "+
				                         "       '"+fromDate+"' and '"+toDate+"'			 "+
				                         "        union			 "+
				                         "       SELECT    count(*) , 'Visit'  from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType			 "+
				                         "       in('Visit') and MarketingRepcode 			 "+
				                         "       ="+rsDetails.getString("MarketingRepCode")+" and FollowUpDate  between			 "+
				                         "       '"+fromDate+"' and '"+toDate+"'			 "+
				                         "       union			 "+
				                         "       SELECT    count(*) , 'Letter'  from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType			 "+
				                         "       in('Letter') and MarketingRepcode 			 "+
				                         "       ="+rsDetails.getString("MarketingRepCode")+" and FollowUpDate  between			 "+
				                         "       '"+fromDate+"' and '"+toDate+"'			 "+
				                         "       union			 "+
				                         "       SELECT count(*) , 'Meeting' from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType			 "+
				                         "       in('Meeting') and MarketingRepcode"+
				                         "       ="+rsDetails.getString("MarketingRepCode")+" and FollowUpDate between			 "+
				                         "       '"+fromDate+"' and '"+toDate+"'			 "+
				                         "       union			 "+
				                         "       SELECT count(*) , 'Email' from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType			 "+
				                         "       in('E-mail','E mail','Mail','Email') and MarketingRepcode 			 "+
				                         "       ="+rsDetails.getString("MarketingRepCode")+" and FollowUpDate between			 "+
				                         "       '"+fromDate+"' and '"+toDate+"'			 "+
				                         "       union			 "+
				                         "       SELECT    count(*) , 'NoOfProspects'  from "+session.getAttribute("CompanyMasterID").toString()+"prospectivecustmaster where			 "+
				                         "       CustEnteredByRep ='"+rsDetails.getString("MarketingRepName")+"' and	Assighnedby ='"+rsDetails.getString("MarketingRepName")+"' and 		 "+
				                         "       ProspCustAddedOn  >= '"+fromdatevdTime+" 00:00:00' and  ProspCustAddedOn <= '"+todatevdTime+" 23:59:59' "+
				                         "		 UNION "+
				                         "		 SELECT count(*) ,'NoOfSO' FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det where TWEmpName='"+rsDetails.getString("MarketingRepName")+"' "+
				                         "		 and SalesOrderDate between '"+fromDate+"' and '"+toDate+"' and SOCancelled=0"+
				                         "    		 UNION "+
				                         "		 SELECT count(*) ,'NoOfSQ' FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det where TWEmpName='"+rsDetails.getString("MarketingRepName")+"' "+
				                         "		 and SalesQuoDate between '"+fromDate+" 00:00:00  	' and '"+toDate+" 00:00:00  	' and SalesQuoCancelled=0"+
				                         "		 UNION "+
				                         "		 SELECT SUM(Total) ,'SumOfSO' FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det where TWEmpName='"+rsDetails.getString("MarketingRepName")+"' "+
				                         "		 and SalesOrderDate between '"+fromDate+"' and '"+toDate+"' and SOCancelled=0"+
				                          "       UNION "+
				                 		"		SELECT Sum(Total),'TotalSO' FROM `"+session.getAttribute("CompanyMasterID").toString()+"salesquo_det` WHERE TWEmpName='"+rsDetails.getString("MarketingRepName")+"' and SalesQuoCancelled='0' and SalesQuoDate between '"+fromDate+" 00:00:00' and '"+toDate+" 00:00:00'";
			 			ResultSet rsCount=st2.executeQuery(sqlCount);
			 			System.out.println(">>>  "+sqlCount);
			 			phoneCalls=(rsCount.next()?rsCount.getString(1):"0");
			 			visits=(rsCount.next()?rsCount.getString(1):"0");
			 			letters=(rsCount.next()?rsCount.getString(1):"0");
			 			meetings=(rsCount.next()?rsCount.getString(1):"0");
			 			email=(rsCount.next()?rsCount.getString(1):"0");
			 			numberOfprospects=(rsCount.next()?rsCount.getString(1):"0");
			 			numberOfSO=(rsCount.next()?rsCount.getString(1):"0");
			 			numberOfSQ=(rsCount.next()?rsCount.getString(1):"0");
			 			sumOfSO=(rsCount.next()?rsCount.getString(1):"0");
			 			sumOfSO=(sumOfSO==null?"0":sumOfSO);
			 		    SQValue=(rsCount.next()?rsCount.getString(1):"0");
			 		    if(SQValue==""||SQValue==null)
			 		    {
			 		    	SQValue="0";
			 		    }
			 			System.out.println(">>>>>>>>>>SQValue:"+SQValue);
	%>
			<tr>
			<td align="right"><div align ="right"><%=i++ %></div></td>
			
			
				<td align="left"><div align ="left">
				<a  style="font-weight: bold; color: blue;" href="marketingReportLevel2.jsp?repName=<%=rsDetails.getString("MarketingRepName")%>&repDetails&fromDate=<%=fromDate %>&toDate=<%=toDate %>" target="_blank">
				<%=rsDetails.getString("MarketingRepName") %></a></div></td>
				
				<%
				String Status=rsDetails.getString("ActiveStatus");
				String sts="-";
				
				if(Status.equalsIgnoreCase("Yes"))
				{
					sts="Active";
				}else
				{
					sts="Deactive";
				}
				System.out.println("STATTTTTTUSSS"+sts);
					%>
			<td align="left"><div align ="left"> <%=sts %></div>
			
			<%-- <td align="left"><div align ="right"><a href="#" style="font-weight: bold;" onclick="detailReport(marketingDetReport.jsp,<%=rsDetails.getString("MarketingRepCode")%>,<%=fromDate %>,<%=toDate %>,<%=1%>)"><%=visits %></a></div></td>
			<td><div align ="right"><a href="#" style="font-weight: bold;" onclick="detailReport('marketingDetReport.jsp','<%=rsDetails.getString("MarketingRepCode")%>','<%=fromDate %>','<%=toDate %>','<%=2%>')"><%=phoneCalls %></a></div></td>
			<td><div align ="right"><a href="#" style="font-weight: bold;" onclick="detailReport('marketingDetReport.jsp','<%=rsDetails.getString("MarketingRepCode")%>','<%=fromDate %>','<%=toDate %>','<%=3%>')"><%=letters%></a></div></td>
			<td><div align ="right"><a href="#" style="font-weight: bold;" onclick="detailReport('marketingDetReport.jsp','<%=rsDetails.getString("MarketingRepCode")%>','<%=fromDate %>','<%=toDate %>','<%=4%>')"><%=email%></a></div></td>
			<td><div align ="right"><a href="#" style="font-weight: bold;" onclick="detailReport('marketingDetReport.jsp','<%=rsDetails.getString("MarketingRepCode")%>','<%=fromDate %>','<%=toDate %>','<%=5%>')"><%=meetings %></a></div></td> --%>
			
			<td align="left"><div align ="right"><a style="font-weight: bold; color: blue;" href="marketingDetReport.jsp?repCode=<%=rsDetails.getString("MarketingRepCode")%>&fromDate=<%=fromDate %>&toDate=<%=toDate %>&Number=<%=1%>" target="_blank"><%=visits %></a></div></td>
			<td><div align ="right"><a style="font-weight: bold; color: blue; " href="marketingDetReport.jsp?repCode=<%=rsDetails.getString("MarketingRepCode")%>&fromDate=<%=fromDate %>&toDate=<%=toDate %>&Number=<%=2%>" target="_blank" ><%=phoneCalls %></a></div></td>
			<td><div align ="right"><a style="font-weight: bold; color: blue;" href="marketingDetReport.jsp?repCode=<%=rsDetails.getString("MarketingRepCode")%>&fromDate=<%=fromDate %>&toDate=<%=toDate %>&Number=<%=3%>" target="_blank"><%=letters%></a></div></td>
			<td><div align ="right"><a style="font-weight: bold; color: blue;" href="marketingDetReport.jsp?repCode=<%=rsDetails.getString("MarketingRepCode")%>&fromDate=<%=fromDate %>&toDate=<%=toDate %>&Number=<%=4%>" target="_blank"><%=email%></a></div></td>
			<td><div align ="right"><a style="font-weight: bold; color: blue;" href="marketingDetReport.jsp?repCode=<%=rsDetails.getString("MarketingRepCode")%>&fromDate=<%=fromDate %>&toDate=<%=toDate %>&Number=<%=5%>" target="_blank" ><%=meetings %></a></div></td>
			
			<%
			MarktngCode=rsDetails.getString("MarketingRepCode");
			System.out.println(">>>>>>>>>>>MarktngCode:"+MarktngCode);
			String sqlCount1="SELECT    count(*) , 'PhoneCall'  from "+session.getAttribute("CompanyMasterID").toString()+"followup where			 FollowUpType   "+
			"       in('phoneCall','Ph Call') and MarketingRepcode='"+MarktngCode+"' and FollowUpDate  between			 "+
			"       '"+fromDate+"' and '"+toDate+"'			 "+
			"        union			 "+
			"       SELECT    count(*) , 'Visit'  from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType			 "+
			"       in('Visit') and MarketingRepcode='"+MarktngCode+"' and FollowUpDate  between			 "+
			"       '"+fromDate+"' and '"+toDate+"'			 "+
			"       union			 "+
			"       SELECT    count(*) , 'Letter'  from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType			 "+
			"       in('Letter') and MarketingRepcode='"+MarktngCode+"' and FollowUpDate  between			 "+
			"       '"+fromDate+"' and '"+toDate+"'			 "+
			"       union			 "+
			"       SELECT count(*) , 'Meeting' from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType	"+
			"       in('Meeting') and MarketingRepcode='"+MarktngCode+"' and FollowUpDate  between			 "+
			"       '"+fromDate+"' and '"+toDate+"'			 "+
			"       union			 "+
			"       SELECT count(*) , 'Email' from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType			 "+
			"       in('E-mail','E mail','Mail','Email') and MarketingRepcode='"+MarktngCode+"' and FollowUpDate  between			 "+
			"       '"+fromDate+"' and '"+toDate+"'			 "+
			"       union			 "+
			"       SELECT    count(*) , 'NoOfProspects'  from "+session.getAttribute("CompanyMasterID").toString()+"prospectivecustmaster where			 "+
			"       CustEnteredByRep ='"+rsDetails.getString("MarketingRepName")+"' and			 "+
			"       ProspCustAddedOn  >= '"+fromDate+" 00:00:00' and  ProspCustAddedOn <= '"+toDate+" 23:59:59' "+
			"		 UNION "+
			"		 SELECT count(*) ,'NoOfSO' FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det where TWEmpName='"+rsDetails.getString("MarketingRepName")+"' "+
			"		 and SalesOrderDate between '"+fromDate+"' and '"+toDate+"' and SOCancelled=0"+
			"    		 UNION "+
			"		 SELECT count(*) ,'NoOfSQ' FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det where TWEmpName='"+rsDetails.getString("MarketingRepName")+"' "+
			"		 and SalesQuoDate between '"+fromDate+" 00:00:00  	' and '"+toDate+" 00:00:00  	' and SalesQuoCancelled=0"+
			"		 UNION "+
			"		 SELECT SUM(Total) ,'SumOfSO' FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det where TWEmpName='"+rsDetails.getString("MarketingRepName")+"' "+
			"		 and SalesOrderDate between '"+fromDate+"' and '"+toDate+"' and SOCancelled=0"+
			 " UNION "+
			 "SELECT Sum(Total),'TotalSQ' FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det WHERE TWEmpName='"+rsDetails.getString("MarketingRepName")+"' and SalesQuoDate between '"+fromDate+" 00:00:00' and '"+toDate+" 00:00:00'  AND SalesQuoCancelled =0 ";
			 ResultSet rsCount1=st2.executeQuery(sqlCount1);
			 System.out.println(">>>  "+sqlCount1);
			 String phoneCalls1=(rsCount1.next()?rsCount1.getString(1):"0");
			 String visits1=(rsCount1.next()?rsCount1.getString(1):"0");
			 System.out.println(">>>visits1:  "+visits1);
			 String letters1=(rsCount1.next()?rsCount1.getString(1):"0");
			 String meetings1=(rsCount1.next()?rsCount1.getString(1):"0");
			 System.out.println(">>>meetings1:  "+meetings1);
			 String email1=(rsCount1.next()?rsCount1.getString(1):"0");
			 String numberOfprospects1=(rsCount1.next()?rsCount1.getString(1):"0");
			 String numberOfSO1=(rsCount1.next()?rsCount1.getString(1):"0");
			 String numberOfSQ1=(rsCount1.next()?rsCount1.getString(1):"0");
			 String sumOfSO1=(rsCount1.next()?rsCount1.getString(1):"0");
			 sumOfSO1=(sumOfSO1==null?"0":sumOfSO1);	
			 String SqAchieved=(rsCount1.next()?rsCount1.getString(1):"0");
			 
			 
			 System.out.println("&&&&&&&&&&&&&&&&&&&&&  ");
			 String sqlvis="select ProspCustCode from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType "+
				"   in('Visit') and MarketingRepcode='"+MarktngCode+"' and FollowUpDate  between '"+fromDate+"' and '"+toDate+"' ";
			
			 System.out.println(sqlvis);
			 ResultSet rstt=st5.executeQuery(sqlvis);
			 System.out.println(sqlvis);
			 while(rstt.next())
			 {
				 abc=rstt.getString(1);
				 System.out.println("in while  ");
				 String sql55="select OEM from  "+session.getAttribute("CompanyMasterID").toString()+"prospectivecustmaster where CustomerCode='"+abc+"'";
				 ResultSet rs55=st2.executeQuery(sql55);
				 System.out.println(sql55);
				 if(rs55.next())
				 no=rs55.getInt("OEM");
				 System.out.println(no);
				 if(no == 0)
				 {
					 System.out.println("===inside if ===");
					 visitcounter=1;
				 }
				 else
				 {
					 System.out.println("===inside else ===");
					 visitcounter=2;
				 }
				 finalvisits=finalvisits+visitcounter;
				 
			 }
			 System.out.println("OUT OF WHILE  [finalvisits]"+finalvisits);
			 
			 System.out.println("22222222222222222222 "+finalvisits);
			 
			 double target_visit = 0.0;//+++++++++++++++++=
			 double Month_indexofvisits=0,month_P_indexofvisits=0,Month_index_total12=0,Month_Grandindex12=0;
				try{
					System.out.println("11111111  "+rsDetails.getInt("VisitsTarget"));
					if(rsDetails.getInt("VisitsTarget")==0) 
					{
						System.out.println("IN IFF  ");
						Month_index_total +=Month_indexofvisits;
						Month_Grandindex +=month_P_indexofvisits;
					}
					else
					{
						//++++++++++++++++++
						if(flag_day == true) 
						{
							target_visit = (double)Math.round(((double)rsDetails.getInt("VisitsTarget")*4));
							
						}else
						{
							
							target_visit = (double)Math.round(((double)rsDetails.getInt("VisitsTarget")/(double)7)*diff);
						}
						
						System.out.println("%%IN LESE   %%%%%%%%%");
						//Month_indexofvisits=((double)(Integer.parseInt(visits1)+Integer.parseInt(meetings1))/(double)Math.round(((double)rsRep.getInt("VisitsTarget")/(double)7)*Datediff))*35;
						Month_indexofvisits=((double)(finalvisits+Integer.parseInt(meetings1))/target_visit)*80;
						Month_index_total12 +=Month_indexofvisits;
						month_P_indexofvisits=((double)(finalvisits+Integer.parseInt(meetings1))/target_visit)*80;
			            Month_Grandindex12 +=month_P_indexofvisits;
					}
					
				}catch(Exception e){System.out.println(e);}
				
				double Month_indexofnewprospect=0,Month_P_indexofnewprospect=0;
				double target_prospect = 0.0;
				
				try{
					if(rsDetails.getInt("NewProspectTarget")==0)
					{
						Month_index_total12 +=Month_indexofnewprospect;
						Month_Grandindex12 +=Month_P_indexofnewprospect;	
					}
					else
					{
						if(flag_day == true) 
						{
							target_prospect = (double)Math.round(((double)rsDetails.getInt("NewProspectTarget")*4));						
						}else
						{						
							target_prospect = (double)Math.round(((double)rsDetails.getInt("NewProspectTarget")/(double)7)*diff);
						}
						
						Month_indexofnewprospect=((double)(Integer.parseInt(numberOfprospects1))/target_prospect)*20;
						Month_index_total12 +=Month_indexofnewprospect;
						Month_P_indexofnewprospect=((double)(Integer.parseInt(numberOfprospects1))/target_prospect)*20;
						Month_Grandindex12 +=Month_P_indexofnewprospect;
					}
				}catch(Exception e){System.out.println(e);}
				
			
			%>
<!--		 	<td align ="right"><div align ="right"><input type="text" value="-" id="indextop"  name="indextop" style="border: none;" /></div></td>	-->
			</tr>
			
			<%
			
		}
		if(i==1){
			%>
			<tr><td colspan="11" align="center"><b></b></td></tr>
			<tr><td colspan="11" align="center"><b>--- NO DATA ---</b></td></tr>
			<%
		}	
	}
	
	%>
	</table>
	<br>
</div>
</div>
<%} else  if(null != request.getQueryString() && (!request.getParameter("collectReport").equalsIgnoreCase("collectSelect")) && (!request.getParameter("marketingReport").equalsIgnoreCase("markselect"))) //if(divFlag.equalsIgnoreCase("cust"))
{%>
<div  id="CustFoll">
<form id="marketingreport" name="marketingreport" method="post">	
<div align="right">
<font size="2" face = "Arial">&nbsp;&nbsp;&nbsp;<%= new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date())%>
<!-- <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('b','tableHTML');">
<img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img></a>
<a href="#" onclick="window.print();return false;" title="Print">
<img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img></a>
 --></div>
</form>
<br>
<div id="b">
<input type="hidden" id="tableHTML" name="tableHTML" value="" />
<input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" />
<%
//	if(true)
{%>
<!-- <div class="form" style="margin-center: 24%;">
	<table border="0" width=800 align="center"> -->

<!-- <table id="data"  class="display"  a style="width:100%"  cellspacing="1" border="1">  
 --><thead>
<table id="example" border="1px" width="100%"  class="sortable">
 		<tr>
		<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">Sr.No</th>
		<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">Company Name</th>
		<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">Visits</th>
		<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">Calls</th>
		<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">Letters</th>
		<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">E-mails</th>
		<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">Meetings</th>
		<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">Action Points</th>
		<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">Assigned</th>
		</tr>
		</thead>
		
		<%	
	  int frommonthdays=0,tomonthdays=0,TargetForFromMonth=0,TargetForToMonth=0,diffdate=0,DateDiffToday=0;
	  String Sqlfrom=" SELECT day( last_day( '"+fromDate+"' ) )  ";
	  System.out.println("Sqlfrom:"+Sqlfrom);
	  ResultSet rsfrom=st.executeQuery(Sqlfrom);
	  if(rsfrom.next())
	  {
		  frommonthdays=rsfrom.getInt(1);
	  }
	  System.out.println("frommonthdays:"+frommonthdays);
	  String Sqlto=" SELECT day( last_day( '"+toDate+"' ) )  ";
	  System.out.println("Sqlto:"+Sqlto);
	  ResultSet rsto=st1.executeQuery(Sqlto);
	  if(rsto.next())
	  {
		  tomonthdays=rsto.getInt(1);
	  }
	  System.out.println("tomonthdays:"+tomonthdays);
	  
	  String SqlDateDiff1="Select DATEDIFF('"+toDate+"','"+fromDate+"')";
	  ResultSet rsDate1=st.executeQuery(SqlDateDiff1);
	  rsDate1.next();
	  DateDiffToday=rsDate1.getInt(1)+1;
	  System.out.println(">>>>>>>>>>>DateDiffToday:"+DateDiffToday);
	  /*************************Calulation for month target beetween these date range****************************************/
		 sqlDetails="Select distinct(ProspCustCode), ProspCustName from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpDate between '"+fromDate+"' and '"+toDate+"'";
		 System.out.println(">>>>>>>>sqlDetails:"+sqlDetails+"FROM DATEEEEEE"+fromDate+" TO DATEEEEE"+toDate);
		 
	int i=1;
		ResultSet rsDetails=st1.executeQuery(sqlDetails);
		if(rsDetails.next()){
		while(rsDetails.next()){
			
			 String sqlCount="SELECT    count(*) , 'PhoneCall'  from "+session.getAttribute("CompanyMasterID").toString()+"followup where			 FollowUpType   "+
				                         "       in('phoneCall','Ph Call') and ProspCustCode			 "+
				                         "       ="+rsDetails.getString("ProspCustCode")+" and FollowUpDate  between			 "+
				                         "       '"+fromDate+"' and '"+toDate+"'			 "+
				                         "        union			 "+
				                         "       SELECT    count(*) , 'Visit'  from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType			 "+
				                         "       in('Visit') and ProspCustCode 			 "+
				                         "       ="+rsDetails.getString("ProspCustCode")+" and FollowUpDate  between			 "+
				                         "       '"+fromDate+"' and '"+toDate+"'			 "+
				                         "       union			 "+
				                         "       SELECT    count(*) , 'Letter'  from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType			 "+
				                         "       in('Letter') and ProspCustCode	"+
				                         "       ="+rsDetails.getString("ProspCustCode")+" and FollowUpDate  between			 "+
				                         "       '"+fromDate+"' and '"+toDate+"'			 "+
				                         "       union			 "+
				                         "       SELECT count(*) , 'Meeting' from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType			 "+
				                         "       in('Meeting') and ProspCustCode"+
				                         "       ="+rsDetails.getString("ProspCustCode")+" and FollowUpDate between			 "+
				                         "       '"+fromDate+"' and '"+toDate+"'			 "+
				                         "       union			 "+
				                         "       SELECT count(*) , 'Email' from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType			 "+
				                         "       in('E-mail','E mail','Mail','Email') and ProspCustCode 			 "+
				                         "       ="+rsDetails.getString("ProspCustCode")+" and FollowUpDate between			 "+
				                         "       '"+fromDate+"' and '"+toDate+"'"+
				                         "       union"+
				                         "       SELECT count(*) , 'ActionPoints' from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType			 "+
				                         "       in('ActionPoints') and ProspCustCode 			 "+
				                         "       ="+rsDetails.getString("ProspCustCode")+" and FollowUpDate between			 "+
				                         "       '"+fromDate+"' and '"+toDate+"'"+
				                         "       union"+		 
				                         "       SELECT count(*) , 'Assigned' from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType			 "+
					                     "       in('Assigned') and ProspCustCode ="+rsDetails.getString("ProspCustCode")+" and FollowUpDate between			 "+
					                     "       '"+fromDate+"' and '"+toDate+"'";
			 
			 
			 
						 ResultSet rsCount=st2.executeQuery(sqlCount);
						 			System.out.println(">>>  "+sqlCount);
						 			phoneCalls=(rsCount.next()?rsCount.getString(1):"0");
						 			visits=(rsCount.next()?rsCount.getString(1):"0");
						 			letters=(rsCount.next()?rsCount.getString(1):"0");
						 			meetings=(rsCount.next()?rsCount.getString(1):"0");
						 			email=(rsCount.next()?rsCount.getString(1):"0");
						 			actionPoint=(rsCount.next()?rsCount.getString(1):"0");
						 			assigned=(rsCount.next()?rsCount.getString(1):"0");
		
				 			
			%><tr>
			<td align="right"><div align ="right"><%=i++ %></div></td>
			
			
				<td align="left"><div align ="left"><%=rsDetails.getString("ProspCustName") %></div></td>
			
			<td align="left"><div align ="right"><a style="font-weight: bold; color: blue;" href="FilterizedFollowup.jsp?cmpName=<%=rsDetails.getString("ProspCustName")%>&from=<%=fromDate %>&to=<%=toDate %>&ftype=Visit" target="_blank"><%=visits %></a></div></td>
			<td><div align ="right"><a style="font-weight: bold; color: blue; " href="Followupmasterdet.jsp?cmpName=<%=rsDetails.getString("ProspCustName")%>&from=<%=fromDate %>&to=<%=toDate %>&ftype=phoneCall" target="_blank" ><%=phoneCalls %></a></div></td>
			<td><div align ="right"><a style="font-weight: bold; color: blue;" href="Followupmasterdet.jsp?cmpName=<%=rsDetails.getString("ProspCustName")%>&from=<%=fromDate %>&to=<%=toDate %>&ftype=Letter" target="_blank"><%=letters%></a></div></td>
			<td><div align ="right"><a style="font-weight: bold; color: blue;" href="Followupmasterdet.jsp?cmpName=<%=rsDetails.getString("ProspCustName")%>&from=<%=fromDate %>&to=<%=toDate %>&ftype=E-mail" target="_blank"><%=email%></a></div></td>
			<td><div align ="right"><a style="font-weight: bold; color: blue;" href="Followupmasterdet.jsp?cmpName=<%=rsDetails.getString("ProspCustName")%>from=<%=fromDate %>&to=<%=toDate %>&ftype=Meeting" target="_blank" ><%=meetings %></a></div></td>
			<td><div align ="right"><a style="font-weight: bold; color: blue;" href="Followupmasterdet.jsp?cmpName=<%=rsDetails.getString("ProspCustName")%>&from=<%=fromDate %>&to=<%=toDate %>&ftype=ActionPoints" target="_blank" ><%=actionPoint%></a></div></td>
			<td><div align ="right"><a style="font-weight: bold; color: blue;" href="Followupmasterdet.jsp?cmpName=<%=rsDetails.getString("ProspCustName")%>&from=<%=fromDate %>&to=<%=toDate %>&ftype=Assigned" target="_blank" ><%=assigned%></a></div></td>
			</tr>
		<%}	
 	 }else{%>
		<!-- <tr><td colspan="11" align="center"><b></b></td></tr> -->
		<tr><td colspan="11" align="center"><b>--- NO DATA ---</b></td></tr>
<% 	}
	
	}%>
	</table>
</div>
</div>
</form>
<%} else if(request.getParameter("collectReport").equalsIgnoreCase("collectSelect")&&null != request.getQueryString()){%>



<div id="salespersondiv">
<form id="marketingreport" name="marketingreport" method="post">	
<div align="right">
<font size="2" face = "Arial">&nbsp;&nbsp;&nbsp;<%= new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date())%>
<!-- <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('c','tableHTML');">
<img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img></a>
<a href="#" onclick="window.print();return false;" title="Print">
<img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img></a>
 --></div>
</form>
<input type="hidden" id="tableHTML" name="tableHTML" value="" />
<input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" />
<br>
<div id="c">

<!-- <div class="form" style="margin-center: 24%;">
	<table border="0" width=800 align="center"> -->

<!-- <table id="data"  class="display"  a style="width:100%"  cellspacing="1" border="1">  
 --><thead>
  		<table id="example" border="1px" width="100%"  class="sortable">
  		<tr>
		<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">Sr.No</th>
		<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">Sales Person</th>
		<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">Status</th>
		<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">Visits</th>
		<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">Calls</th>
		<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">Letters</th>
		<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">E-mails</th>
		<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">Meetings</th>
		</tr>
		</thead>
	<%	
	  int frommonthdays=0,tomonthdays=0,TargetForFromMonth=0,TargetForToMonth=0,diffdate=0,DateDiffToday=0;
	  String Sqlfrom=" SELECT day( last_day( '"+fromDate+"' ) )  ";
	  System.out.println("Sqlfrom:"+Sqlfrom);
	  ResultSet rsfrom=st.executeQuery(Sqlfrom);
	  if(rsfrom.next())
	  {
		  frommonthdays=rsfrom.getInt(1);
	  }
	  System.out.println("frommonthdays:"+frommonthdays);
	  String Sqlto=" SELECT day( last_day( '"+toDate+"' ) )  ";
	  System.out.println("Sqlto:"+Sqlto);
	  ResultSet rsto=st1.executeQuery(Sqlto);
	  if(rsto.next())
	  {
		  tomonthdays=rsto.getInt(1);
	  }
	  System.out.println("tomonthdays:"+tomonthdays);
	  
	  String SqlDateDiff1="Select DATEDIFF('"+toDate+"','"+fromDate+"')";
	  ResultSet rsDate1=st.executeQuery(SqlDateDiff1);
	  rsDate1.next();
	  DateDiffToday=rsDate1.getInt(1)+1;
	  System.out.println(">>>>>>>>>>>DateDiffToday:"+DateDiffToday);
	  /*************************Calulation for month target beetween these date range****************************************/
	sqlDetails="Select *  from "+session.getAttribute("CompanyMasterID").toString()+"collectionStaffMaster as tc where status='Active'";
	System.out.println(">>>>>>>>sqlDetails:"+sqlDetails+"FROM DATEEEEEE"+fromDate+" TO DATEEEEE"+toDate);
		 
	int i=1;
		ResultSet rsDetails=st1.executeQuery(sqlDetails);
		while(rsDetails.next()){
			
			 String sqlCount="SELECT    count(*) , 'PhoneCall'  from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType "+
				                         "       in('phoneCall','Ph Call') and ColloectionStaffName='"+rsDetails.getString("name")+"' and FollowUpDate  between "+
				                         "'"+fromDate+"' and '"+toDate+"'"+
				                         "        union			 "+
				                         "       SELECT    count(*) , 'Visit'  from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType			 "+
				                         "       in('Visit') and ColloectionStaffName='"+rsDetails.getString("name")+"' and FollowUpDate  between			 "+
				                         "       '"+fromDate+"' and '"+toDate+"'			 "+
				                         "       union			 "+
				                         "       SELECT    count(*) , 'Letter'  from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType			 "+
				                         "       in('Letter') and ColloectionStaffName 			 "+
				                         "       ='"+rsDetails.getString("name")+"' and FollowUpDate  between			 "+
				                         "       '"+fromDate+"' and '"+toDate+"'			 "+
				                         "       union			 "+
				                         "       SELECT count(*) , 'Meeting' from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType			 "+
				                         "       in('Meeting') and ColloectionStaffName"+
				                         "       ='"+rsDetails.getString("name")+"' and FollowUpDate between			 "+
				                         "       '"+fromDate+"' and '"+toDate+"'			 "+
				                         "       union			 "+
				                         "       SELECT count(*) , 'Email' from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType			 "+
				                         "       in('E-mail','E mail','Mail','Email') and ColloectionStaffName 			 "+
				                         "       ='"+rsDetails.getString("name")+"' and FollowUpDate between			 "+
				                         "       '"+fromDate+"' and '"+toDate+"'";
			 			ResultSet rsCount=st2.executeQuery(sqlCount);
			 			System.out.println(">>>  "+sqlCount);
			 			phoneCalls=(rsCount.next()?rsCount.getString(1):"0");
			 			visits=(rsCount.next()?rsCount.getString(1):"0");
			 			letters=(rsCount.next()?rsCount.getString(1):"0");
			 			meetings=(rsCount.next()?rsCount.getString(1):"0");
			 			email=(rsCount.next()?rsCount.getString(1):"0");
			 			numberOfprospects=(rsCount.next()?rsCount.getString(1):"0");
			 			numberOfSO=(rsCount.next()?rsCount.getString(1):"0");
			 			numberOfSQ=(rsCount.next()?rsCount.getString(1):"0");
			 			sumOfSO=(rsCount.next()?rsCount.getString(1):"0");
			 			sumOfSO=(sumOfSO==null?"0":sumOfSO);
			 		    SQValue=(rsCount.next()?rsCount.getString(1):"0");
			 		    if(SQValue==""||SQValue==null)
			 		    {
			 		    	SQValue="0";
			 		    }
			 			System.out.println(">>>>>>>>>>SQValue:"+SQValue);
	%>
			<tr>
			<td align="right"><div align ="right"><%=i++ %></div></td>
<td align="left"><div align ="left" "><%=rsDetails.getString("name") %></div></td>
				
			<td align="left"><div align ="left"> <%=rsDetails.getString("status")%></div></td>
			<%-- <td align="left"><div align ="right"><a href="#" style="font-weight: bold;" onclick="detailReport('marketingDetReport.jsp','<%=rsDetails.getString("MarketingRepCode")%>','<%=fromDate %>','<%=toDate %>','<%=1%>')"><%=visits %></a></div></td>
			<td><div align ="right"><a href="#" style="font-weight: bold;" onclick="detailReport('marketingDetReport.jsp','<%=rsDetails.getString("MarketingRepCode")%>','<%=fromDate %>','<%=toDate %>','<%=2%>')"><%=phoneCalls %></a></div></td>
			<td><div align ="right"><a href="#" style="font-weight: bold;" onclick="detailReport('marketingDetReport.jsp','<%=rsDetails.getString("MarketingRepCode")%>','<%=fromDate %>','<%=toDate %>','<%=3%>')"><%=letters%></a></div></td>
			<td><div align ="right"><a href="#" style="font-weight: bold;" onclick="detailReport('marketingDetReport.jsp','<%=rsDetails.getString("MarketingRepCode")%>','<%=fromDate %>','<%=toDate %>','<%=4%>')"><%=email%></a></div></td>
			<td><div align ="right"><a href="#" style="font-weight: bold;" onclick="detailReport('marketingDetReport.jsp','<%=rsDetails.getString("MarketingRepCode")%>','<%=fromDate %>','<%=toDate %>','<%=5%>')"><%=meetings %></a></div></td> --%>
			
			<td ><div align ="right"><a style="font-weight: bold; color: blue;" href="Followupmasterdet.jsp?collect=<%=rsDetails.getString("name")%>&from=<%=fromDate %>&to=<%=toDate %>&ftype=Visit" style="font-weight: bold;" target="_blank"><%=visits%></a></div></td>
			<td><div align ="right"><a style="font-weight: bold; color: blue;" href="Followupmasterdet.jsp?collect=<%=rsDetails.getString("name")%>&from=<%=fromDate %>&to=<%=toDate %>&ftype=phoneCall" style="font-weight: bold;" target="_blank"><%=phoneCalls %></a></div></td>
			<td><div align ="right"><a style="font-weight: bold; color: blue;" href="Followupmasterdet.jsp?collect=<%=rsDetails.getString("name")%>&from=<%=fromDate %>&to=<%=toDate %>&ftype=Letter" style="font-weight: bold;" target="_blank"><%=letters%></a></div></td>
			<td><div align ="right"><a style="font-weight: bold; color: blue;" href="Followupmasterdet.jsp?collect=<%=rsDetails.getString("name")%>&from=<%=fromDate %>&to=<%=toDate %>&ftype=E-mail" style="font-weight: bold;" target="_blank"><%=email%></a></div></td>
			<td><div align ="right"><a style="font-weight: bold; color: blue;" href="Followupmasterdet.jsp?collect=<%=rsDetails.getString("name")%>&from=<%=fromDate %>&to=<%=toDate %>&ftype=Meeting" style="font-weight: bold;" target="_blank"><%=meetings %></a></div></td>
			
			
			<%
			String collectName=rsDetails.getString("name");
			/* System.out.println(">>>>>>>>>>>MarktngCode:"+MarktngCode); */
			String sqlCount1="SELECT    count(*) , 'PhoneCall'  from "+session.getAttribute("CompanyMasterID").toString()+"followup where			 FollowUpType   "+
			"       in('phoneCall','Ph Call') and ColloectionStaffName='"+collectName+"' and FollowUpDate  between			 "+
			"       '"+fromDate+"' and '"+toDate+"'			 "+
			"        union			 "+
			"       SELECT    count(*) , 'Visit'  from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType			 "+
			"       in('Visit') and ColloectionStaffName='"+collectName+"' and FollowUpDate  between			 "+
			"       '"+fromDate+"' and '"+toDate+"'			 "+
			"       union			 "+
			"       SELECT    count(*) , 'Letter'  from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType			 "+
			"       in('Letter') and ColloectionStaffName='"+collectName+"' and FollowUpDate  between			 "+
			"       '"+fromDate+"' and '"+toDate+"'			 "+
			"       union			 "+
			"       SELECT count(*) , 'Meeting' from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType	"+
			"       in('Meeting') and ColloectionStaffName='"+collectName+"' and FollowUpDate  between			 "+
			"       '"+fromDate+"' and '"+toDate+"'			 "+
			"       union			 "+
			"       SELECT count(*) , 'Email' from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType			 "+
			"       in('E-mail','E mail','Mail','Email') and ColloectionStaffName='"+collectName+"' and FollowUpDate  between			 "+
			"       '"+fromDate+"' and '"+toDate+"'";
			 ResultSet rsCount1=st2.executeQuery(sqlCount1);
			 System.out.println(">>>  "+sqlCount1);
			 String phoneCalls1=(rsCount1.next()?rsCount1.getString(1):"0");
			 String visits1=(rsCount1.next()?rsCount1.getString(1):"0");
			 System.out.println(">>>visits1:  "+visits1);
			 String letters1=(rsCount1.next()?rsCount1.getString(1):"0");
			 String meetings1=(rsCount1.next()?rsCount1.getString(1):"0");
			 System.out.println(">>>meetings1:  "+meetings1);
			 String email1=(rsCount1.next()?rsCount1.getString(1):"0");
			 String numberOfprospects1=(rsCount1.next()?rsCount1.getString(1):"0");
			 String numberOfSO1=(rsCount1.next()?rsCount1.getString(1):"0");
			 String numberOfSQ1=(rsCount1.next()?rsCount1.getString(1):"0");
			 String sumOfSO1=(rsCount1.next()?rsCount1.getString(1):"0");
			 sumOfSO1=(sumOfSO1==null?"0":sumOfSO1);	
			 String SqAchieved=(rsCount1.next()?rsCount1.getString(1):"0");
			 
			 
			 System.out.println("&&&&&&&&&&&&&&&&&&&&&  ");
			 String sqlvis="select ProspCustCode from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType "+
				"   in('Visit') and ColloectionStaffName='"+collectName+"' and FollowUpDate  between '"+fromDate+"' and '"+toDate+"' ";
			
			 System.out.println(sqlvis);
			 ResultSet rstt=st5.executeQuery(sqlvis);
			 System.out.println(sqlvis);
			 while(rstt.next())
			 {
				 abc=rstt.getString(1);
				 System.out.println("in while  ");
				 String sql55="select OEM from  "+session.getAttribute("CompanyMasterID").toString()+"prospectivecustmaster where CustomerCode='"+abc+"'";
				 ResultSet rs55=st2.executeQuery(sql55);
				 System.out.println(sql55);
				 if(rs55.next())
				 no=rs55.getInt("OEM");
				 System.out.println(no);
				 if(no == 0)
				 {
					 System.out.println("===inside if ===");
					 visitcounter=1;
				 }
				 else
				 {
					 System.out.println("===inside else ===");
					 visitcounter=2;
				 }
				 finalvisits=finalvisits+visitcounter;
				 
			 }
			 System.out.println("OUT OF WHILE  [finalvisits]"+finalvisits);
			 
			 System.out.println("22222222222222222222 "+finalvisits);
			 
			 double target_visit = 0.0;//+++++++++++++++++=
			 double Month_indexofvisits=0,month_P_indexofvisits=0,Month_index_total12=0,Month_Grandindex12=0;
				try{
					System.out.println("11111111  "+rsDetails.getInt("VisitsTarget"));
					if(rsDetails.getInt("VisitsTarget")==0) 
					{
						System.out.println("IN IFF  ");
						Month_index_total +=Month_indexofvisits;
						Month_Grandindex +=month_P_indexofvisits;
					}
					else
					{
						//++++++++++++++++++
						if(flag_day == true) 
						{
							target_visit = (double)Math.round(((double)rsDetails.getInt("VisitsTarget")*4));
							
						}else
						{
							
							target_visit = (double)Math.round(((double)rsDetails.getInt("VisitsTarget")/(double)7)*diff);
						}
						
						System.out.println("%%IN LESE   %%%%%%%%%");
						//Month_indexofvisits=((double)(Integer.parseInt(visits1)+Integer.parseInt(meetings1))/(double)Math.round(((double)rsRep.getInt("VisitsTarget")/(double)7)*Datediff))*35;
						Month_indexofvisits=((double)(finalvisits+Integer.parseInt(meetings1))/target_visit)*80;
						Month_index_total12 +=Month_indexofvisits;
						month_P_indexofvisits=((double)(finalvisits+Integer.parseInt(meetings1))/target_visit)*80;
			            Month_Grandindex12 +=month_P_indexofvisits;
					}
					
				}catch(Exception e){System.out.println(e);}
				
				double Month_indexofnewprospect=0,Month_P_indexofnewprospect=0;
				double target_prospect = 0.0;
				
				try{
					if(rsDetails.getInt("NewProspectTarget")==0)
					{
						Month_index_total12 +=Month_indexofnewprospect;
						Month_Grandindex12 +=Month_P_indexofnewprospect;	
					}
					else
					{
						if(flag_day == true) 
						{
							target_prospect = (double)Math.round(((double)rsDetails.getInt("NewProspectTarget")*4));						
						}else
						{						
							target_prospect = (double)Math.round(((double)rsDetails.getInt("NewProspectTarget")/(double)7)*diff);
						}
						
						Month_indexofnewprospect=((double)(Integer.parseInt(numberOfprospects1))/target_prospect)*20;
						Month_index_total12 +=Month_indexofnewprospect;
						Month_P_indexofnewprospect=((double)(Integer.parseInt(numberOfprospects1))/target_prospect)*20;
						Month_Grandindex12 +=Month_P_indexofnewprospect;
					}
				}catch(Exception e){System.out.println(e);}
				
			
			%>
<!--		 	<td align ="right"><div align ="right"><input type="text" value="-" id="indextop"  name="indextop" style="border: none;" /></div></td>	-->
			</tr>
			
			<%
			
		}
		if(i==1){
			%>
			<tr><td colspan="11" align="center"><b></b></td></tr>
			<tr><td colspan="11" align="center"><b>--- NO DATA ---</b></td></tr>
			<%
		}	
	}
	
	%>	
</table>
</div>

</form>
</div>

<%}
catch (Exception e)
{
	
	System.out.println("xxxxx"+e.toString());
	
	out.print("!!!Connection Lost!!!");
}
finally
{
	conn.close();
}

%>
<br><br> <br><br> <br><br> <br><br>
	<br><br> <br><br> <br><br> <br><br>
	<div id="footer">
	<p><a href="http://www.myfleetview.com"> Copyright &copy; 2009-15
	By Transworld Technologies Ltd. All Rights Reserved.</a></p>
	</div>
	
	</body>
	</html>
	
</jsp:useBean>