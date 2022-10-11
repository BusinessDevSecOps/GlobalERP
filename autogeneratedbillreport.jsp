<%@page import="java.util.Date"%>

<%@ include file="header.jsp"%>

 <style>

SPAN.searchword {
	background-color: cyan;
}

SPAN.super {
	text-decoration: blink;
	text-align: center;
}

.popup {
	background-color: #98AFC7;
	position: absolute;
	visibility: hidden; . popupnew { background-color : #98AFC7;
	position: absolute;
	visibility: visible; . popupx { background-color : #98AFC7;
	position: absolute;
	visibility: hidden;
}

BODY {
	bgcolor="#FFE4E1";
}

</style>
	<script src="dropdown.js" type="text/javascript"></script>
	<script src="dynamic.js" type="text/javascript"></script>

	
<script type="text/javascript">
function validate()
{
//alert("fun ");
var month1=document.getElementById("month").value;
var year=document.getElementById("year").value;


//alert(month1);
//alert(year);


if(month1=="Select")
{
	alert("Please Select Month");
	return false;
}

if(year=="Select")
{
	alert("Please Select Year ");
	return false;
}

}


function gotoExcel (elemId, frmFldId)  
{  
	//alert("*********** ");

         var obj = document.getElementById(elemId);  

         var oFld = document.getElementById(frmFldId); 

          oFld.value = obj.innerHTML;  

          document.data.action ="excel.jsp";     // CHANGE FORM NAME HERE

          document.forms["data"].submit();       // CHANGE FORM NAME HERE

} 	


function toggleDetails(refno,show,row) 
{
	//alert("11111");
	//alert(show);
//	alert("id   "+id);
	//alert("row  no  "+row);
	var popupx = document.getElementById("popup"+row);
	//alert(popupx+" +++++    "+row);
	if(show=="true") 
	{
		popupx.style.visibility = "visible";
		popupx.setfocus();
	} 
	else 
	{
		 
		popupx.style.visibility = "hidden";
	}
}

</script>



<script language="JavaScript1.2">


function checkAll()
{

//	alert("ok");
	var field = document.getElementById("checkedNumber").value;

//	var field=document.getElementsByName("chkbx");
//	alert("ok"+field);
	var i, chk=1;
	try{
	for (i = 0; i < field; i++)
	{
		 if(document.getElementById("chkbx"+chk).checked == false)
		 {
			 document.getElementById("chkbx"+chk).checked = true;
		 }

		 chk++;
		
	}
}catch(e){alert(e);}
}

function unCheckAll()
{

//	alert("ok");
var field = document.getElementById("checkedNumber").value;

//var field=document.getElementsByName("chkbx");
//alert("ok"+field);
var kj=1,i;
try{
for (i = 0; i < field; i++)
{
	
	 if(document.getElementById("chkbx"+kj).checked == true )
	 {
		 document.getElementById("chkbx"+kj).checked = false;
	 }
	 kj++;
}
}catch(e){alert(e);}
}
	

function DeleteRow(id,id1)
{
	    	//alert("Control inside deldte function :- "+id);
	//alert("Control inside commmmments function :- "+id1);
	
	var year = document.getElementById("billYear").value;
	var month = document.getElementById("billMonth").value;

//	alert("year"+year+"month"+month);
	var agree=confirm("Do You Want To Create Invoice ?");
	    //alert(agree);
	    if(agree)
	    {
		 var ajaxRequest;  // The variable that makes Ajax possible!
		    try
		    {	// Opera 8.0+, Firefox, Safari
				ajaxRequest = new XMLHttpRequest();
		    }  
			catch (e)
			{	// Internet Explorer Browsers
				try
				{	ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
				} 
				catch (e)
				{	try
					{
						ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
					} 
					catch (e)
					{	// Something went wrong
						alert("Your browser broke!");
						return false;
					}
				}
			}
			// Create a function that will receive data sent from the server
			ajaxRequest.onreadystatechange = function()
			{	//alert("ddddddddddddddddddddddd");
				if(ajaxRequest.readyState == 4 )
				{	var reslt=ajaxRequest.responseText;
			//	alert(">>>    "+reslt);
				  var data=reslt;
				  data=data.replace(/^\s+|\s+$/g,"");
				//  alert("datttt"+data);
				  var z=data.split("#");
				 


					if(data=="Yes")
					{					
                        alert("Invoice Created Successfully.");
				    	window.location.reload();
					}
					if(data=="NO")
					{					
                       alert("Error In Creating Invoice .");
				    	window.location.reload();
					}
	           } 
			}
		//	var queryString = "?action=approve&id="+id+"&coments="+coments;
			var queryString = "?action=approve&id="+id+"&id1="+id1+"&year="+year+"&month="+month;
			ajaxRequest.open("GET", "AjaxGeneratePdf.jsp" + queryString, true);
			ajaxRequest.send(null); 
	    }
	    else
	    {return false;
	    }
 }	

	
	
	
function getcheckedrow()
{
	//alert("hiiiii");
	var cnt1=0,cnt2=0,k=1,flag="t",flag1="t",l=1;
	var id="";
	var id1="";
	var b="";
	var c="";
	var d="";
	var a="";
	var chklength=document.getElementsByName("chkbx");
	//var chklength = document.getElementById("checkedNumber").value;
	//alert("hiiiii"+chklength);
	for(cnt1=0;cnt1<chklength.length;cnt1++)
	{
		if( document.getElementById("chkbx"+k).checked == true )
		{
			flag="success";
			//alert("flag"+flag);
		}
	k++;	
	}


	
	//alert("flg"+flag+"flg1"+flag1);
	if(flag == "success")
	{
		//alert("Inside Success");
		var i=1,j,cnt=0;
		id="";
		var approvalComment="";
		
		
		
	//	var chklengthnew = document.getElementById("checkedNumber").value;
	
	 
				
				c=document.getElementById("CreateInvoice").value;
				
				//alert("CCCC "+c);
				
		for(cnt=0;cnt<chklength.length;cnt++)
		{
			//alert("for Length of for==>"+chklengthnew.length);
			
			
				
			if(document.getElementById("chkbx"+i).checked)
			{
				
				
				a=document.getElementById("net_id3"+i).innerHTML;
				
				//alert("hiiiii1 AAAAAAA : "+a);
				
				if(a=="-" || a==" " || a==null || a=="")
				{
					b="-";
				}else{
					b="Invoice"
				}
				
				//alert("BBBB "+b);
				
				
				
				
				if(b=="Invoice" && c=="Create Invoice")
					{
					alert("Please UnCheck AlReady Created Invoices");
					return false;
					
					}
					
				else{
				id=id+","+document.getElementById("net_id1"+i).innerHTML;
				id1=id1+","+document.getElementById("net_id2"+i).innerHTML;
				}
			//	approvalComment=approvalComment+"/"+document.getElementById("approvalcomment"+i).value;
			}
			i++;
		}
		//alert(id);
		//alert(id1);
		//DeleteRow(id,approvalComment);
		DeleteRow(id,id1);
	}
	else
	{
		alert("Please Select Customer for select generating PDF");
	}	
}


function DeleteRow1(id,id1)
{
	    	//alert("Control inside deldte function :- "+id);
	//alert("Control inside commmmments function :- "+id1);
	
	var year = document.getElementById("billYear").value;
	var month = document.getElementById("billMonth").value;

//	alert("year"+year+"month"+month);
	var agree=confirm("Do You Want To Send Mail ?");
	    //alert(agree);
	    if(agree)
	    {
		 var ajaxRequest;  // The variable that makes Ajax possible!
		    try
		    {	// Opera 8.0+, Firefox, Safari
				ajaxRequest = new XMLHttpRequest();
		    }  
			catch (e)
			{	// Internet Explorer Browsers
				try
				{	ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
				} 
				catch (e)
				{	try
					{
						ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
					} 
					catch (e)
					{	// Something went wrong
						alert("Your browser broke!");
						return false;
					}
				}
			}
			// Create a function that will receive data sent from the server
			ajaxRequest.onreadystatechange = function()
			{	//alert("ddddddddddddddddddddddd");
				if(ajaxRequest.readyState == 4 )
				{	var reslt=ajaxRequest.responseText;
			 	//alert(">>>    "+reslt);
				  var data=reslt;
				  data=data.replace(/^\s+|\s+$/g,"");
				 // alert("datttt"+data);
				  var z=data.split("#");
				 


					if(data=="Yes")
					{					
                        alert("Mail Data Inserted Successfully.");
				    	window.location.reload();
					}
					if(data=="NO")
					{					
                       alert("Error In Mail Data Insertion");
				    	window.location.reload();
					}
	           } 
			}
		//	var queryString = "?action=approve&id="+id+"&coments="+coments;
			var queryString = "?action=approve&id="+id+"&id1="+id1+"&year="+year+"&month="+month;
			

			ajaxRequest.open("GET", "AutoInvoiceSendMail.jsp" + queryString, true);
			

			if(data=="Yes")
			{					
                alert("Mail Data Inserted Successfully.");
		    	window.location.reload();
			}
			ajaxRequest.send(null); 
	    }
	    else
	    {return false;
	    }
 }
 
function getcheckedrow1()
{
	//alert("hiiiii");
	var cnt1=0,cnt2=0,k=1,flag="t",flag1="t",l=1;
	var id="";
	var id1="";
	var chklength=document.getElementsByName("chkbx");
	//var chklength = document.getElementById("checkedNumber").value;
	//alert("hiiiii"+chklength);
	for(cnt1=0;cnt1<chklength.length;cnt1++)
	{
		if( document.getElementById("chkbx"+k).checked == true )
		{
			flag="success";
			//alert("flag"+flag);
		}
	k++;	
	}


	
	//alert("flg"+flag+"flg1"+flag1);
	if(flag == "success")
	{
		//alert("Inside Success");
		var i=1,j,cnt=0;
		id="";
		var approvalComment="";
		id1="";
		
		
	//	var chklengthnew = document.getElementById("checkedNumber").value;
	
	var b="";
				var c="";
				var d="";
				var a="";
			
				
				
				//alert("BBBB "+b);
				
				c=document.getElementById("SendMail").value;
				
				//alert("CCCC "+c);
		for(cnt=0;cnt<chklength.length;cnt++)
		{
			//alert("for Length of for==>"+chklengthnew.length);
			
			
			if(document.getElementById("chkbx"+i).checked)
			{
				
				
				 a=document.getElementById("net_id3"+i).innerHTML;
				
				
				//	 alert("hiiiii1 :- "+a);
					if(a=="-")
					{
						b="-";
					}else{
						b="Invoice"
					}
				
					
					
				if(b=="-" && c=="Send Mail")
					{
					alert("Please UnCheck Non-Created Invoices");
					return false;
					
					}
					
				else{
				id=id+","+document.getElementById("net_id1"+i).innerHTML;
				id1=id1+","+document.getElementById("net_id5"+i).value;
				//alert(id1);
				}
			//	approvalComment=approvalComment+"/"+document.getElementById("approvalcomment"+i).value;
			}
			i++;
		}
		//alert(id);
		//alert(id1);
		//DeleteRow(id,approvalComment);
	/* 	if(id1=="-")
			{
			
			} */
		DeleteRow1(id,id1);
	}
	else
	{
		alert("Please Select Customer for select generating PDF");
	}
}
</script>

 <script type="text/javascript">
function fun(){
	validate();
	document.getElementById("purchase").style.visibility="hidden";
	var year=document.getElementById("year").value;
	var month=document.getElementById("month").value;
	//alert(year);
	//alert(month);
	var xmlhttp;    
	
	if (window.XMLHttpRequest)
	  {// code for IE7+, Firefox, Chrome, Opera, Safari
	  xmlhttp=new XMLHttpRequest();
	  }
	else
	  {// code for IE6, IE5
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }
	xmlhttp.onreadystatechange=function()
	  {
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
	    {
		  //alert(xmlhttp.responseText);
		 
	    document.getElementById("result").innerHTML=xmlhttp.responseText;
	    //document.getElementById("demodata").value=xmlhttp.responseText;
	    
	    }
	  }
	xmlhttp.open("GET","ListOfMonthlyInvoices.jsp?month="+month+"&year="+year,true);
	xmlhttp.send();
}

/* function fun1(){
	var dat=document.getElementById("demodata").value;
	//alert(dat)
	document.getElementById("result").innerHTML=dat;
} */
</script> 

<body onload="fun1()">
	 
 <%
 Connection conn = null,conn1=null;
 Class.forName(DB_Driver);
 
  DB_NAME="jdbc:mysql://173.234.153.82/db_GlobalERP";
	 DB_NAME1="jdbc:mysql://173.234.153.82/newblankerp";
	
	 DB_USERNAME="erp";
	 DB_PASSWORD="1@erp";
 //String DB_USERNAME="java";
 //String DB_PASSWORD="transjava!1";
	/*String DB_NAMEPAY="jdbc:mysql://164.68.105.216:3306/db_leaveapplication";*/
	 //String DB_NAMEPAY="jdbc:mysql://202.65.131.44:3306/db_leaveapplication";
	 DB_NAMEPAY="jdbc:mysql://173.234.153.82/db_leaveapplication";
 //conn=DriverManager.getConnection("jdbc:mysql://203.199.134.131/db_GlobalERP","fleetview","1@flv");
 /*conn=DriverManager.getConnection("jdbc:mysql://203.199.134.131:3306/db_GlobalERP","fleetview","1@flv");*/
 //conn1=DriverManager.getConnection("jdbc:mysql://203.199.134.131/db_gps","fleetview","1@flv");
 conn1=DriverManager.getConnection("jdbc:mysql://173.234.153.82:3306/db_gps","fleetview","1@flv");
conn=DriverManager.getConnection("jdbc:mysql://173.234.153.82:3306/db_GlobalERP","fleetview","1@flv");
//conn=DriverManager.getConnection(DB_NAME,DB_USERNAME,DB_PASSWORD);
//conn1=DriverManager.getConnection(DB_NAME,DB_USERNAME,DB_PASSWORD);
//conn1=DriverManager.getConnection("jdbc:mysql://182.18.129.62/db_gps","fleetview","1@flv");
 %>
 <%
 	
 	Statement sterp = null, sterp1 = null, stgps = null, stgps1 = null,stgps2=null;
 	Statement sterp2 = null;
 	Statement sterp3=null,sterp4=null,sterp5=null,sterp6=null,sterp7=null,stchk=null, stqr=null;
 	String selectedName,fpreviousmonth="";
 	String FollowUpType = "",Group="", strcustomer = "", strgroupname = "";
%>
<%
DecimalFormat twoDForm = new DecimalFormat("#.##");
 	String fromDateCal = "", toDateCal = "", sql1 = "",sql2="",sql3="";
 	String todaysTime = new SimpleDateFormat(" HH:mm:ss").format(new java.util.Date());
	int i=1,ck=0;
	int vehid=0;
	int k=2000;
 	Date tdy = new Date();
 	Date tomorrow = new Date();
 	Calendar cal = Calendar.getInstance();
 	Calendar now = Calendar.getInstance();
 	cal.setTime(tdy);
 	String todaysDate1 = new SimpleDateFormat("yyyy-MM-dd").format(tdy);
 	String todaysDate = new SimpleDateFormat("dd-MMM-yyyy").format(tdy);
 	cal.add(Calendar.DAY_OF_MONTH, -1);
 	Date YesterdaysDateAsDate = cal.getTime();
 	String yesterdaysDate = new SimpleDateFormat("dd-MMM-yyyy").format(YesterdaysDateAsDate);

 	fromDateCal = toDateCal = new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
 	try {
 			sterp = conn.createStatement();
 			sterp1 = conn.createStatement();
 			sterp2 = conn.createStatement();
 			sterp3 = conn.createStatement();
 			sterp4 = conn.createStatement();
 			sterp5 = conn.createStatement();
 			sterp6 = conn.createStatement();
 			sterp7 = conn.createStatement();
 			stchk = conn.createStatement();
 			stqr = conn.createStatement();
 		}  
 		catch (Exception e) 
 		{
 			
 		} 
%>
<%
String month="",month1="",year1="";

if(null==request.getQueryString())
{
String MonthYear="select MONTHNAME(LAST_DAY(NOW() - INTERVAL 1 Month)) as MonthName,Year(LAST_DAY(NOW() - INTERVAL 1 Month)) as Year,MONTH(LAST_DAY(NOW() - INTERVAL 1 Month)) as Month";
ResultSet rsyear=sterp4.executeQuery(MonthYear);
if(rsyear.next())
{
	 month1=rsyear.getString("MonthName");
	 month=rsyear.getString("Month");
	 if(Integer.parseInt(month) <10)
	 {
		 month="0"+month;
	 }
	 else
	 {
		 month=""+month;
	 }
	 year1=rsyear.getString("Year");
}

}
else{
	year1=request.getParameter("year");
	 month=request.getParameter("month");
	 if(month.equals("01"))
	 {
		 month1="JAN";
	 }else if(month.equals("02"))
	 {
		 month1="FEB";
	 }else if(month.equals("03"))
	 {
		 month1="MAR";
		 
	 }else if(month.equals("04"))
	 {
		 month1="APR";
	 }else if(month.equals("05"))
	 {
		 month1="MAY";
	 }else if(month.equals("06"))
	 {
		 month1="JUN";
	 }else if(month.equals("07"))
	 {
		 month1="JUL";
	 }else if(month.equals("08"))
	 {
		 month1="AUG";
	 }else if(month.equals("09"))
	 {
		 month1="SEP";
	 }else if(month.equals("10"))
	 {
		 month1="OCT";
	 }else if(month.equals("11"))
	 {
		 month1="NOV";
	 }else if(month.equals("12"))
	 {
		 month1="DEC";
	 }
}


%>
<div style="font-size: 1.8em; text-align: center; margin-top: 0.5em; margin-bottom: 0.4em;"><a><b>Vehicle Bill Summary</b></a> </div>

<form name="data1"  method="get" onsubmit="return validate();"> 
<table align="center">
<tr>
<td>Month : </td>
<td><select name="month" id="month" style="width:85px;padding: 4px 5px 2px 5px;
			border: 1px solid black; text-align:left;	background: #FFFFFF;	font: normal 11px Arial, Helvetica, sans-serif;
			color: #000000;" >
			<option value=<%=month %>><%=month1 %></option>
<!-- <option value="Select">Select</option> -->
<option value="01">JAN</option>
<option value="02">FEB</option>
<option value="03">MAR</option>
<option value="04">APR</option>
<option value="05">MAY</option>
<option value="06">JUN</option>
<option value="07">JUL</option>
<option value="08">AUG</option>
<option value="09">SEPT</option>
<option value="10">OCT</option>
<option value="11">NOV</option>
<option value="12">DEC</option>
</select></td>
<td>Year : </td>
<td><select name="year" id="year" style="width:85px;padding: 4px 5px 2px 5px;
			border: 1px solid black; text-align:left;	background: #FFFFFF;	font: normal 11px Arial, Helvetica, sans-serif;
			color: #000000;" >
			<option value="<%=year1 %>"><%=year1 %></option>
<%for(k=2015;k<=2050;k++)
{
%>
<option value="<%=k %>"><%=k %></option>
<%} %>
</select></td>

</tr>

</table>
<table align="center">
<tr align="center">
<td align="right"><input type="submit" name="view" value="View Data"></td>
<td align="right"><input type="button" value="Download Invoices" onclick="fun()"></td>

	
</tr>
</table>
<table align="right" style="width:100%">
<tr><td><input type="button" name="CreateInvoice" id="CreateInvoice"  value="Create Invoice" onclick="getcheckedrow()" /> </td> <td></td><td><td></td>
			<table align="right"><tr>	
				<td align="right">
								<font size="1">&nbsp;&nbsp;&nbsp;<%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date())%></font>
				<a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('purchase','tableHTML');">

	     <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img>
	
					<a href="#" onclick="window.print();return false;" title="Print"><img src="images/print.jpg" width="15px" height="15px"></img></a>
			 
				</td>
		</tr></table>
		<tr><td><input type="button" name="SendMail"  id="SendMail" value="Send Mail" onclick="getcheckedrow1()" /> </td> <td></td><td><td></td>
		</tr>
	</td></tr>

</table>
<br>
<br>
</form>
<!-- <div align="center" id="result" style="width: 50%;"></div> -->
<br>
<%
if(null!=request.getQueryString())
{
	

	 year1=request.getParameter("year");
	 month=request.getParameter("month");
	
System.out.println(year1+"  "+month);
int monthdays=0;
if(month.equals("01") || month.equals("03") || month.equals("05") ||month.equals("07") || month.equals("08") || month.equals("10") || month.equals("12") )
	{monthdays=31;}

if(month.equals("04") || month.equals("06") || month.equals("09") ||month.equals("11"))
{monthdays=30;}

if(month.equals("02"))
{monthdays=28;}

 int smonth = Integer.parseInt(month);
 System.out.println("Selected month in int is "+smonth);
 int syear = Integer.parseInt(year1);
 System.out.println("Selected year in int is "+syear);
 int spreviousyear, spreviousmonth;
 if(smonth==1)
 {
  System.out.println("Selected month is 1"); 	 
  spreviousyear=syear-1;
  spreviousmonth=12;
  System.out.println("Selected previous year "+spreviousyear+"Selected previous month"+spreviousmonth);
// 	currentmonthcount=12;
 }
 else 
 {
	 spreviousyear=syear;
     System.out.println("selected month  is "+smonth);
     spreviousmonth = smonth-1;
     System.out.println("Selected previous year is "+spreviousyear+"selected previous month is "+spreviousmonth);
 }

/*String sql="SELECT DAYOFMONTH('2012-"+request.getParameter("month")+"-01','2012-"+request.getParameter("month")+"-31')";
System.out.println(sql);
ResultSet rssql=sterp1.executeQuery(sql);
rssql.next();
int days=rssql.getInt(1);
System.out.println("NO OF DAYS  "+days);*/


int currentmonthcount=0,currentyearcount=0;
int previousmonth=0, ppreviousmonth=0;
int previousyear=0, ppreviousyear=0;
String finalmonth="";
String currentyear="", fppreviousmonth = "";

String currentmonth="select MONTH('"+todaysDate1+"')";
System.out.println(currentmonth);
ResultSet rsMonth=sterp1.executeQuery(currentmonth);
rsMonth.next();
currentmonthcount=rsMonth.getInt(1);
System.out.println("current month "+currentmonthcount);

if(currentmonthcount==1 || currentmonthcount==2 || currentmonthcount==3 || currentmonthcount==4 || currentmonthcount==5 || currentmonthcount==6 || currentmonthcount==7 || currentmonthcount==8 || currentmonthcount==9 )
//if(currentmonthcount==1)
{
finalmonth="0"+currentmonthcount;
}
else if(currentmonthcount==10 || currentmonthcount==11 || currentmonthcount==12)
{
finalmonth=Integer.toString(currentmonthcount);
}		

System.out.println("a    a "+finalmonth);

currentyear="select YEAR('"+todaysDate1+"')";
System.out.println(currentyear);
ResultSet rsYear=sterp2.executeQuery(currentyear);
rsYear.next();
currentyearcount=rsYear.getInt(1);

System.out.println(currentyearcount);  

if(currentmonthcount==1)
{
previousyear=currentyearcount-1;
previousmonth=12;

//	currentmonthcount=12;
}
else 
{
previousyear=currentyearcount;
System.out.println("abcd  "+finalmonth);
previousmonth=Integer.parseInt(finalmonth)-1;
System.out.println("abcd  "+previousmonth);
}
if(previousmonth==1 || previousmonth==2 || previousmonth==3 || previousmonth==4 || previousmonth==5 || previousmonth==6 || previousmonth==7 || previousmonth==8 || previousmonth==9 )
	//if(previousmonth==1)
	{
		fpreviousmonth="0"+Integer.toString(previousmonth);
	}
	else if(previousmonth==10 || previousmonth==11 || previousmonth==12)
	{
		fpreviousmonth=Integer.toString(previousmonth);
	}

/************************************************************************/
if(previousmonth==1)
{
	ppreviousyear=previousyear-1;
	ppreviousmonth=12;
    
	//	currentmonthcount=12;
}
else 
{
	ppreviousyear=previousyear;
	System.out.println("final previous month is  "+fpreviousmonth);
	ppreviousmonth=Integer.parseInt(fpreviousmonth)-1;
	System.out.println("pprevious month is  "+ppreviousmonth);
}
if(ppreviousmonth==1 || ppreviousmonth==2 || ppreviousmonth==3 || ppreviousmonth==4 || ppreviousmonth==5 || ppreviousmonth==6 || ppreviousmonth==7 || ppreviousmonth==8 || ppreviousmonth==9 )
	//if(previousmonth==1)
	{
		fppreviousmonth="0"+Integer.toString(ppreviousmonth);
	}
	else if(ppreviousmonth==10 || ppreviousmonth==11 || ppreviousmonth==12)
	{
		fppreviousmonth=Integer.toString(ppreviousmonth);
	}
/************************************************************************/











	




/*else 
{
currentyearcount=currentyearcount;
currentmonthcount=currentmonthcount-1;
}


System.out.println(currentmonthcount);
System.out.println(currentyearcount); */ 

//int newmonth=currentmonthcount-1;

String checktb = "show tables like '"+session.getAttribute("CompanyMasterID").toString()+"billingdetails"+year1+"_"+month+"'";
System.out.println("Query is"+checktb);
ResultSet rschk=stchk.executeQuery(checktb);
//System.out.println("Resultset"+rschk.toString());
//System.out.println("Resultset is"+rschk.next());
System.out.println("After rschk");
if(rschk.next())
{
	
       
       String sqldata="Select ERPCustName as Customer,ERPCode as CustomerCode,SLAPer,Rate,Rate/"+monthdays+" as ChargeperDay,"+
			   "count(distinct("+session.getAttribute("CompanyMasterID").toString()+"billingdetails"+year1+"_"+month+".vehID)) as NoofVehicles,sum(VehAddedThisMonth) as VehcileAdded,"+
			   "sum(vehRemovedThisMonth) as VehcileRemoved,sum(TotalYes) as CapturedDays,Sum(TotalYesStar) as DisconnectedDays,"+
			   "sum(TotalNo) as NotCaptured,sum(TotalDays) as TotalDays,Sum(TotalYesStar)+sum(TotalYes) as TotalBilledDays ,"+
			   "GroupName,BillType,sum(jrm) as jrmvehcount,InvoiceRefNo from "+session.getAttribute("CompanyMasterID").toString()+"fv_erp_relation"+year1+"_"+month+" ,"+session.getAttribute("CompanyMasterID").toString()+"billingdetails"+year1+"_"+month+" "+
			   "where month1='"+year1+"-"+month+"-01' and  "+session.getAttribute("CompanyMasterID").toString()+"fv_erp_relation"+year1+"_"+month+".vehID = "+session.getAttribute("CompanyMasterID").toString()+"billingdetails"+year1+"_"+month+".VehID  and "+
			   ""+session.getAttribute("CompanyMasterID").toString()+"fv_erp_relation"+year1+"_"+month+".BillTransporter='Yes' and ERPCode in (select distinct(ERPCode) from db_gps.t_transporter where OperationalStatus='Active') group by   "+session.getAttribute("CompanyMasterID").toString()+"fv_erp_relation"+year1+"_"+month+".ERPCustName,"+session.getAttribute("CompanyMasterID").toString()+"fv_erp_relation"+year1+"_"+month+".groupcode,GroupName";
               System.out.println(sqldata);
               ResultSet rsData=sterp.executeQuery(sqldata);
               //System.out.println(rsData.next());
%>
               <table align="center">
           	<tr> 
           	<td> <b> <% out.println("Month - "+month); %> </b> </td> <td> <b> <% out.println("Year - "+year1); %> </b> </td> 
           	
           	</table>

           <form name="data" action="" method="post" autocomplete="off">
           <%
           String exportFileName="VehicleBill_Report.xls";   // GIVE YOUR REPORT NAME
           %>
           <div align="center" id="result" ></div>
           <div id='purchase'>
           <%-- <b> <% out.println("Selected Year:"+year); %> </b> </td> <td> <b> <% out.println("Selected Month:"+month); %> </b> --%>
           <input type="hidden" id="tableHTML" name="tableHTML" value="" />   
           <input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" /> 
           <table id="companyList" width="100%" class="sortable">
           <tr>
           <th>Sr.No.</th>
           <th style="width: 125px;">
	<!-- <a href="#" onclick="checkAll()"> -->
	<input type="hidden" name="check" id="check" value="">
	<font color="white">Check &nbsp;&nbsp;/&nbsp;&nbsp;</font></a> 
	<!-- <a href="#" onclick="unCheckAll()"> --> 
	<font color="white">UnCheck </font></a>
	</th>
			
           <th>Customer</th>
           <th>CustomerCode</th>
           <th>InvoiceRefNo</th>
           <th>SLA</th>
           <th>Rate</th>
           <th>Charges Per Day </th>
           <th>No of Vehicles</th>
           <th>Vehicle Added</th>
           <th>Vehicle Removed</th>
           <th>Captured Days</th>
           <th>Disconnected Days</th>
           <th>NotCaptured</th>
           <th>Total Days</th>
           <th>Total BilledDays</th>
           <th>GroupName</th>
           <th>BillType</th>
           <th>Jrm Veh count</th>
           </tr>
<%

int srno=1;
int vehadded=0,vehremoved=0;

   while(rsData.next())
   {	
	   
   String addedveh="SELECT count(VehAddedThisMonth) as VehAddedThisMonth FROM db_gps.t_billingdetails WHERE month1 = '"+year1+"-"+month+"-01' AND transporter='"+rsData.getString("Customer")+"' and VehAddedThisMonth!='No'";
   
   //System.out.println("Sql ---> "+addedveh);
   ResultSet rsaddedveh=sterp6.executeQuery(addedveh);
   
   if(rsaddedveh.next())
   {
	   vehadded=rsaddedveh.getInt("VehAddedThisMonth");
   }else
   {
	   vehadded=0;
   }
   
String removedveh="SELECT count(vehRemovedThisMonth) as vehRemovedThisMonth FROM db_gps.t_billingdetails WHERE month1 = '"+year1+"-"+month+"-01' AND transporter='"+rsData.getString("Customer")+"' and vehRemovedThisMonth!='No'";
   
   //System.out.println("Sql removedveh ---> "+removedveh);
   ResultSet rsremovedveh=sterp5.executeQuery(removedveh);
   
   if(rsremovedveh.next())
   {
	   vehremoved=rsremovedveh.getInt("vehRemovedThisMonth");
   }else
   {
	   vehremoved=0;
   }

	   ck++;
	   
	   strcustomer = rsData.getString("Customer");
	//   System.out.println("Customer before conversion is"+strcustomer);
	   /*trptr = trptr.replace("&","^");*/
	   strcustomer = strcustomer.replace("&","^");
	//   System.out.println("Customer after conversion is"+strcustomer);
	   strgroupname = rsData.getString("GroupName");
	//   System.out.println("groupname before conversion is"+strgroupname);
	   strgroupname = strgroupname.replace("&","^");
	//   System.out.println("groupname after conversion is"+strgroupname);
	
	String InvoiceRefNo="",invoiceno="";
	
	InvoiceRefNo=rsData.getString("InvoiceRefNo");
%>
<tr>
<td><div align="right"><%=srno%></div></td>

<%if(InvoiceRefNo.equals("-"))
	{%>
	
<td><input type="checkbox"  name="chkbx"   id="chkbx<%=ck %>"  /></td>

<td><div align="left"><font size="2" color="black"><%=rsData.getString("Customer") %></font></div></td>

<td><div align="right" id="net_id1<%=ck %>"><%=rsData.getString("CustomerCode") %></div></td>
<%}else{ 
String invoice="select distinct(invoiceRefNo),invoiceno from db_GlobalERP.100000performainvoicedet where  invoiceRefNo='"+InvoiceRefNo+"' and TWEmpName='Autogenerated' and InvoiceCancelled='0' limit 1";
//System.out.println("Invoice Query :- "+invoice);
ResultSet rsinvoice=sterp2.executeQuery(invoice);



if(rsinvoice.next())
{
	InvoiceRefNo=""+InvoiceRefNo;
	invoiceno=rsinvoice.getString("invoiceno");
}else
{
	InvoiceRefNo="-";
}

%>
<td><input type="checkbox"  name="chkbx"   id="chkbx<%=ck %>"  /></td>
<td><div align="left"><font size="2" color="black"><%=rsData.getString("Customer") %></font></div></td>
<td><div align="right" id="net_id1<%=ck %>"><%=rsData.getString("CustomerCode") %></div></td>


<%} %>
<%if(InvoiceRefNo.equals("-"))
	{%>
<td>	<input type="hidden" name="net_id5" id="net_id5<%=ck %>" value="<%=InvoiceRefNo %>">

<div align="left" id="net_id3<%=ck %>"><%=InvoiceRefNo %></div></td>	
	<%} else{
	
	%>
	<td>
	<input type="hidden" name="net_id5" id="net_id5<%=ck %>" value="<%=InvoiceRefNo %>">
	<div align="left" id="net_id3<%=ck %>"><b></b><a href="detailForProInvoice.jsp?InvoiceRefNo=<%=InvoiceRefNo%>&Invoiceno=<%=invoiceno%>&condition=View"target="_blank"><%=InvoiceRefNo%></b></a></div></td>
	<%} %>


<td><div align="right"><%=rsData.getString("SLAPer") %></div></td>
<td><div align="right"><%=rsData.getString("Rate") %></div></td>
<td><div align="right"><%=twoDForm.format(rsData.getDouble("ChargeperDay"))  %></div></td>
<td><div align="right"><%=rsData.getString("NoofVehicles") %></div></td>
<td><div align="right"><%=vehadded %></div></td>
<td><div align="right"><%=vehremoved %></div></td>
<td><div align="right"><%=rsData.getString("CapturedDays") %></div></td>
<td><div align="right"><%=rsData.getString("DisconnectedDays") %></div></td>
<td><div align="right"><%=rsData.getString("NotCaptured") %></div></td>
<td><div align="right"><%=rsData.getString("TotalDays") %></div></td>
<td><div align="right"><%=rsData.getString("TotalBilledDays") %></div></td>
<td><div align="left" id="net_id2<%=ck %>"><%=rsData.getString("GroupName") %></div></td>
<td><div align="left"><%=rsData.getString("BillType") %></div></td>
<td><div align="right"><%=rsData.getString("jrmvehcount") %></div></td>

</tr>
<%
     i++;


srno++;
    }//while
   }//if
  else
  {
	  
     System.out.println("In else");
     //HttpServletResponse resp;
     %>
     <script type="text/javascript">
     //response.sendRedirect(""); is not working
     window.location="alertGoTo.jsp?msg=There are no records to display.&goto=autogeneratedbillreport.jsp";
     </script>
     
     <%
     //response.sendRedirect("AllSalesModule.jsp");
     //response.sendRedirect("AllSalesModule.jsp");
	 //response.sendRedirect("alertGoTo.jsp?msg=There are no records to display.&goto=vehiclebillreportnew.jsp");
  }


%>
</table>



<input type="hidden" name="checkedNumber" id="checkedNumber" value="<%=ck %>"/>
<input type="hidden" name="billYear" id="billYear" value="<%=year1%>"/>
<input type="hidden" name="billMonth" id="billMonth" value="<%=month%>"/>
</div>
</form>
<%
}
%>
<!-- <input type="hidden" id="demodata"> -->
</body>


<%@include file="footer_new.jsp"%>