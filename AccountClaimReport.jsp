<%@  page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="header.jsp"%>
<%@page import="java.util.Date"%>
<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">
<html>

<!-- http://www.codemiles.com/scripting-language/how-to-create-a-mouse-over-drop-down-in-html-t3635.html -->
<style type="text/css">

/* set the menu style */
.menuHead { font-weight: bold; font-size:13px; background-color: #C6DEFF;}
.menuChoices { background-color: #C6DEFF; font-size:13px; width: 100px;}
.menu a {color: #000000; text-decoration: none;}
.menu a:hover 
{
text-decoration: underline;
}
/* position your menus */
#menu1 
{
  position: absolute;width: 100px;
}

</style>

<script language="JavaScript1.2">

function Reload(action)
{	alert("Claim is Rejected");
	window.location="claimReport.jsp?action="+action+"";
}
function gotoExcel (elemId, frmFldId)  
{  
//alert("*********** ");

         var obj = document.getElementById(elemId);  

         var oFld = document.getElementById(frmFldId); 

          oFld.value = obj.innerHTML;  

          document.claimReport1.action ="excel.jsp";     // CHANGE FORM NAME HERE

          document.forms["claimReport1"].submit();       // CHANGE FORM NAME HERE

} 
function dateValidate1(dt,today)
{//alert("date validate");
	var d=new Date().getMonth();
	//alert(todate);
	dy1=dt.substring(7,11);
	dy2=today.substring(0,4);
	//alert(todate);
	dm1=d;
	//alert(dm1);
	dm2=today.substring(5,7);
	//alert(dm2);
	
	dd1=dt.substring(0,2);
	dd2=today.substring(8,10);

	//alert(dy1+"=="+dy2+"=="+dm1+"=="+dm2+"=="+dd1+"=="+dd2);

	if((dm1>dm2) ||  (dy1>dy2) )
	{
		alert("Please Select Valid Date Year");
		return false;
	}
	
	return true;
}
function dateValidate(dt,today) 
{
	var d=new Date().getMonth();
	//alert(d);
	dy1=dt.substring(7,11);
	dy2=today.substring(0,4);
	
	dm1=d+1;
	dm2=today.substring(5,7);
	
	dd1=dt.substring(0,2);
	dd2=today.substring(8,10);

	//alert(dy1+"=="+dy2+"=="+dm1+"=="+dm2+"=="+dd1+"=="+dd2);

	if( (dd1>dd2 && dm1>=dm2) || (dm1>dm2 && dy1>=dy2) || (dy1>dy2) )
	{
		alert("Please Select Valid Date");
		return false;
	}
	
	return true;
}
function popUp(webadd,claimrefno,action)
{ 
 window.open(webadd+'?action='+action+'&claimrefno='+claimrefno,'jav','width=900,height=400,top=150,left=250,resizable=no,scrollbars=yes');
}
function popUpWindow(webadd,id)
{ 	
		window.open(webadd+'?id='+id,'jav','width=870,height=500,top=150,left=250,resizable=no,scrollbars=yes');
}
function checkAll()
{
var field=document.getElementsByName('chk');
var i;
try{
for (i = 0; i < field.length; i++)
field[i].checked = true ;
}catch(e){alert(e);}
}

//@@@@@@@@@@@@@@@@@@@@@@ All field hide if checkbox checked @@@@@@@@@@@@@@@@@@@@

function alCheck()
{ 
	
	var txtBox = document.getElementById("nameCon");
try
{
	if(document.claimReport.checkAll.checked){
		document.claimReport.nameCon.disabled=true;
		document.claimReport.nameCon.value="";
		
		}	
	else
	{  
		document.claimReport.nameCon.disabled=false;
		
			}	
}
catch(e)
	{
		alert(e);
	}
}
function validate()
{
	
	if(document.claimReport.checkAll.checked)
	{
	}
	else
	{
		var str=document.getElementById("hod").value;
		if(str=="")
		{
		  			alert('Blank Box Not Allowed as Contractor Name');        
					return false;
		}
			var letters = /^[A-Za-z ]+$/;  
			var letters=letters.test(document.getElementById("hod").value);
    		if(letters==false)
     		{     
       				alert('Special Characters or Numbers Not Allowed as Contractor Name ');        
       				return false;  
     		}
    		
    		var str2=str.trim();
    		if(str2=="")
    			{
  			  			alert('Space Not Allowed as Contractor Name');        
   						return false;
    			}
	}
	var status=document.getElementById("chkStatus").value;
	if(status=="Select" || status=="" || status==null)
	{
		alert('Select Status First');        
		return false;
	}
    
}
function unCheckAll()
{
	var field=document.getElementsByName('chk');
	var i;
	try
	{
		for (i = 0; i < field.length; i++)
				field[i].checked = false ;
	}
	catch(e)
	{
		alert(e);
	}
}
function getUserHod()
{
	 //alert(" in fun");
	 
	 //alert("1");
	 var username=document.getElementById("hod").value;

	
		 if(username.length=="")
			{
			 document.getElementById("userlist").style.visibility="hidden";
			 document.getElementById("hod").value="";
			}
		 else
		 {
			 document.getElementById("userlist").style.visibility='visible';
		 
	 		//alert(username);
	 		var ajaxRequest;  // The variable that makes Ajax possible!
	    try
	    {
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

		// Create a function that will receive data sent from the server
		ajaxRequest.onreadystatechange = function()
		{
			if(ajaxRequest.readyState == 4)
			{
				var reslt=ajaxRequest.responseText;
				//alert(">>>    "+reslt);
				
				//alert(reslt);
				document.getElementById("userlist").innerHTML=reslt;
			} 
		}
		
		var queryString = "?action=hod&name="+username;
		//alert(queryString);
		
		ajaxRequest.open("GET", "AjaxEditUser1.jsp" + queryString, true);
		ajaxRequest.send(null); 

		 }//end of else
	 
}

function showVisitingCardDetailsHod(username)
{
	 //alert("in fun");
	 document.claimReport.nameCon.value=username;
	 //Changing(username);
	 document.getElementById("userlist").style.visibility='hidden';
	 
}


function DeleteRow(id)
{
	    var agree=confirm("Do You Want to Delete This Record ?");
	    //alert(agree);
	    if(agree)
	    {
		 var ajaxRequest;  // The variable that makes Ajax possible!
		    try
		    {
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
//alert("ttftftfcft");
			// Create a function that will receive data sent from the server
			ajaxRequest.onreadystatechange = function()
			{
				//alert("ddddddddddddddddddddddd");
				if(ajaxRequest.readyState == 4)
				{
					var reslt=ajaxRequest.responseText;
					//alert(">>>    "+reslt);
					var data=reslt.split("#");
					//alert("<*****  "+data);
					if(data[1].indexOf('Yes')!=-1)
					{					
                        alert("Data Deleted Successfully.");
				    	window.location.reload();
						
					}
	      	} 
			}
			
			var queryString = "?action=delete&id="+id;
			ajaxRequest.open("GET", "AjaxClaimMaster.jsp" + queryString, true);
			ajaxRequest.send(null); 
	    }
	    else
	    {return false;
	    }
		
}
</script>
           		
<%
erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
%>
<%
Connection conn = null;
int count=0;
Statement st = null, st1 = null, st3 = null, st4 = null,st5=null;
Statement st2 = null;
String selectedName;
String FollowUpType="",status="-";
Format format=new SimpleDateFormat("dd-MMM-yyyy");
Format parse=new SimpleDateFormat("yyyy-MM-dd");
String fromDate="",toDate="",fromDateCal="",toDateCal="",Dept="",status1="",chkall="";
Date curdate=new Date();
String date1=new SimpleDateFormat("dd-MMM-yyyy hh:mm").format(curdate);	  
%>
<%
Date today = new Date();
Calendar cal = Calendar.getInstance();
cal.setTime(today);
cal.add(Calendar.DAY_OF_MONTH, -30);
Date today30 = cal.getTime();
fromDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(today30);
toDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
toDate=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
fromDate=new SimpleDateFormat("yyyy-MM-dd").format(today30);
String action=request.getParameter("action");

if(action.equals("view"))
	status1 = "Open";
else if(action.equals("check"))
	status1 = "Pending";
else
	status1 = "Authorized";

if (!(null == request.getParameter("fromdate"))) 
{
fromDate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("fromdate")));
fromDateCal=request.getParameter("fromdate");
}
if (!(null == request.getParameter("todate")))
{
toDate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("todate")));
toDateCal=request.getParameter("todate");
}
if(!(null == request.getParameter("chkStatus")))
{
	status1=request.getParameter("chkStatus");
}

if (null == request.getParameter("repName"))
selectedName = "All";
else
selectedName = request.getParameter("repName");
		
try
{
conn = erp.ReturnConnection();
st = conn.createStatement();
st1 = conn.createStatement();
st2 = conn.createStatement();
st3 = conn.createStatement();
if (null == request.getParameter("repName"))
selectedName = "All";
else
selectedName = request.getParameter("repName");
	

System.out.println("ACTION IS ) >??????????????????????????  >>>>>>>>>>>> .  "+action);	
System.out.println("Start  Status   "+status); 
%>
<body  ONKEYDOWN="if (event.keyCode == 27){document.getElementById('userlist').style.display = 'none';}" >
 
<table style="width:100%;">	
        <tr>
        <td valign="bottom" style="width:70px;">
        <div align="left" style="font-size: 1.6em;">
            <a href="javascript:history.back(-1);" style="font-weight: bold; color: black; " >
            <img src="images/arrow_left.png" width="30px" height="30px" style="border-style: none">Back
   
            </a>
	       </div>
	    </td>
	    <td style="width:1100px;">
		 <div align="center" style="font-size: 1.6em;">
			<font face="Arial" size="3" color="black"><% String heading="";
			    if(request.getParameter("action").equals("view"))
			    	heading="View";
			    else if(request.getParameter("action").equals("check"))
			    	heading="Authorize";
			    else if(request.getParameter("action").equals("approve"))
			    	heading="Approve";
			    else
			    	heading="Sanction";
				%>
			<%=heading%> Claim Report&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
			</div>
			</td>
			</tr>
</table>        

<form action="" method="post" name="claimReport" onsubmit="return validate();">

<div align="center">
<table  style="width:100%;">
<tr >


<%
			//====Get Syst Crnt Time==================================
				Date d=new Date();
					
				Format df1= new SimpleDateFormat("yyyy-MM-dd");
				String dtoday=df1.format(d);
				
				DateFormat df= new SimpleDateFormat("dd-MMM-yyyy");
				DateFormat d1= new SimpleDateFormat("yyyy-MM-dd");
				
				Format d2= new SimpleDateFormat("HH:mm:ss");
				String incdReg=d2.format(d);
				String hrTime=incdReg.substring(0,2);
				String minTime=incdReg.substring(3,5);
				System.out.println(">>>>>>>>>>>>dtoday:"+dtoday);
			//========================================================
%>
<td align="left" style="width:350px;">
		<%if(action.contains("view"))
   		{
	   	%><a href="NewClaim.jsp?id=- &status=-&action=-" style="font-weight: bold; color: blue; "><img src="images/add5.jpeg" width="25px" height="25px" title="Open Claim Entry Form" /></a>[Click here for Claim Entry]
	   <%}%>
	</td>
<td  align="right" valign="top" width="100px">

<input onclick="javascript : try { alCheck();}catch(e){alert(e);}" type="checkbox" name="checkAll" id="checkAll" ><font face="Arial" size="2"><b>All &nbsp;</b></font></td>

<td align="right"><b>Name:</b></td>
		<td><input type="text" name="nameCon" id="hod" style="width:150px;" autocomplete="off"  value="<%if(request.getParameter("nameCon")==null)
			{
			%><%="" %><%
			}
			else
			{
				%><%=request.getParameter("nameCon") %><%
			}%>"  onkeyup="if (event.keyCode == 27){document.getElementById('userlist').style.display = 'none';} else { getUserHod(); }" />
			<div style="position: absolute;">
	  <table>
		<tr>
		<td>
				<div id='userlist'></div>
 		</td>
		</tr>
	  </table>
	</div>
</td>
	

<td id="col" align="left" valign="top" style="width:700px;">
<b> </b>
<input type="text" id="fromdate"
name="fromdate"  value="<%=fromDateCal %>" onchange="dateValidate1(this.value,'<%=dtoday %>');" size="15" readonly
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
			                                                                       
<font face="Arial" size="2"><b>To </b></font>
<input type="text" id="todate"
name="todate" value="<%=toDateCal %>" onchange="dateValidate(this.value,'<%=dtoday %>');" size="15" readonly
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

		<label><font face="Arial" size="2"><b>Status :</b></font> </label>&nbsp;	
        <select  name="chkStatus" id="chkStatus" style="width: 100px; height: 20px; border: 1px solid black; font: small Arial, Helvetica, sans-serif; color: #000000; "> 
      	    <option value="Select" selected><% if(request.getParameter("chkStatus")==null)
      	    {
      	    	%>Select<%
      	    }
      	    else
      	    {
      	    	%><%=request.getParameter("chkStatus")%><%
      	    }%></option>
      	    		    <option value="ALL" >ALL</option>
		    <%if(request.getParameter("action").equals("view"))
      		{%>
      		<option value='Open'>OPEN</option>
      		<%}
      		if(request.getParameter("action").equals("view") || request.getParameter("action").equals("check"))
      		{%>
			<option value='Pending'>PENDING</option><%} 
      		if(request.getParameter("action").equals("view") || request.getParameter("action").equals("check") || request.getParameter("action").equals("approve"))
            {%>
            <option value='Open'>OPEN</option>
		    <option value='Pending'>PENDING</option>
      		
			<option value='Authorized' >AUTHORIZED</option><%} %>
			<%if(request.getParameter("action").equals("approve") || request.getParameter("action").equals("view"))
	      	{ %>
			<option value='Approved' >APPROVED</option>
			<%} %>
			<option value='Rejected' >REJECTED</option>
			<option value='Paid'>PAID</option>
			<%// }%>	
		</select>&nbsp;&nbsp;
<input type="submit" name="submit" id="submit" style="border: outset;"value="Submit" />
<input type="hidden" name="action" value="<%=request.getParameter("action")%>" />
</td>
</tr>
</td><td></td><td></td><td></td><td></td><td></td><td>
<td align="right"style="width:300px;"><a href="#" onclick="window.print();return true;" title="Print"><img src="images/print.jpg" width="15px" height="15px"><%=date1%></img></a>&nbsp;<a href="#" title="Export to Excel"  onclick="gotoExcel('claim','tableHTML');"><img src="images/excel.jpg" width="15px" height="15px"></a></td>
</tr>	
<!--1st table end  -->  	
</table>
</form>

<form action="" method="post" name="claimReport1">
<%String sesname=session.getAttribute("EmpName").toString();
String exportFileName="";
						if(request.getParameter("action").equals("view"))
							{ 
							    sesname=sesname.replaceAll(" ","");
						        exportFileName=""+sesname+"_claimReport.xls"; 
							}
						if(request.getParameter("action").equals("check"))
							{ 
							    sesname=sesname.replaceAll(" ","");
							     exportFileName="Team_claimReport.xls"; 
							}
						if(request.getParameter("action").equals("approve"))
							{ 
							    sesname=sesname.replaceAll(" ","");
							     exportFileName="Account_claimReport.xls"; 
							}

// GIVE YOUR REPORT NAME
%>
<div id='claim' align="center" style="height: 370px;overflow:scroll;">

<input type="hidden" id="tableHTML" name="tableHTML" value="" />   

	<input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" /> 
<table align="center"  border=1 class="sortable" style="font: Arial, Helvetica, sans-serif; color: #ffffff;" > 
<tr>
<% if(action.equals("view"))
 {
%>
<th width="2%">Delete</th>
<th width="2%">Edit</th>
<%} %>
<th width="5%">Ref ID</th>
<th style="width:50px;">Name</th>
<th width="8%">Origin</th>
<th width="8%">Destination</th>
<th width="6%">Departure</th>
<th width="6%">Arrival</th>
<th width="8%">Purpose</th>
<th width="6%">Submitted On</th>
<th width="5%">Status</th>
<th width="5%">Approved By</th>

<th width="6%">ClaimAmount</th>
<th width="6%">Advance </th>

<% if(action.equals("view"))
 {
%>
<th width="8%">Comments By HOD</th>
<th width="8%">Comments Approved By</th>
<th width="8%">Comments By ACCount</th>
<th width="6%">Claim Bills</th>
<%} %>
</tr><% 
System.out.println("@@@@@@");
chkall=request.getParameter("checkAll");
String chkst=request.getParameter("chkStatus");
String SqlDept="";
String deparetureDateTime="",arrivalDateTime="",claimSubmittedOn="",sqlClaim="",Status="",condition1="",condition2="";

status=(action.equals("check") ? "Pending" : (action.equals("approve") ? "Authorized" : "Approved" ) );	
System.out.println("\n>>>Status is:>>>>>>>>"+status);
String condition="", condition3="";
String EMPName=session.getAttribute("EmpName").toString();
System.out.println("DATE FROM   "+fromDate);
condition="  ClaimSubmittedOn >= '"+fromDate+" 00:00:00' and ClaimSubmittedOn <='"+toDate+" 23:59:59'  and Cancel='1'";
condition1="  ClaimSubmittedOn >= '"+fromDate+" 00:00:00' and ClaimSubmittedOn <='"+toDate+" 23:59:59' and status='"+status1+"' and Cancel='1'";
condition3="  ClaimSubmittedOn >= '"+fromDate+" 00:00:00' and ClaimSubmittedOn <='"+toDate+" 23:59:59'";

System.out.println("condition:"+condition+">>>>>>>>condition1:"+condition1);
System.out.println("Check Status = " + chkst);
	sqlClaim="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"claim_master where" +  condition;  
	System.out.println("Below Query");
	System.out.println("Count == " + count);
	
	if(chkst != null)
	{
		if(chkall != null)
		{
			if(chkst.equals("ALL"))
			{
					sqlClaim="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"claim_master where "+ condition3;
			}
			if(chkst.equals("Open"))
			{
					sqlClaim="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"claim_master where status='Open'  and"+ condition3;
			}

			if(chkst.equals("Pending"))
			{
					sqlClaim="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"claim_master where status='Pending'  and"+ condition3;
			}
			if(chkst.equals("Approved"))
			{
					sqlClaim="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"claim_master where status='Approved'  and"+ condition3;
			}
			if(chkst.equals("Rejected"))
			{
					sqlClaim="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"claim_master where status='Rejected'  and"+ condition3;
			}
			if(chkst.equals("Authorized"))
			{
					sqlClaim="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"claim_master where status='Authorized'  and"+ condition3;
			}
			if(chkst.equals("Paid"))
			{
					sqlClaim="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"claim_master where status='Paid'  and"+ condition3;
			}

		}
		else
		{
			if(chkst.equals("ALL"))
			{
					sqlClaim="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"claim_master where ClaimantName='"+ request.getParameter("nameCon") +"' and"+ condition3;
			}
			if(chkst.equals("Open"))
			{
					sqlClaim="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"claim_master where ClaimantName='"+ request.getParameter("nameCon") +"' and status='Open'  and"+ condition3;
			}

			if(chkst.equals("Pending"))
			{
					sqlClaim="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"claim_master where ClaimantName='"+ request.getParameter("nameCon") +"' and status='Pending'  and"+ condition3;
			}
			if(chkst.equals("Approved"))
			{
					sqlClaim="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"claim_master where ClaimantName='"+ request.getParameter("nameCon") +"' and status='Approved'  and"+ condition3;
			}
			if(chkst.equals("Rejected"))
			{
					sqlClaim="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"claim_master where ClaimantName='"+ request.getParameter("nameCon") +"' and status='Rejected'  and"+ condition3;
			}
			if(chkst.equals("Authorized"))
			{
					sqlClaim="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"claim_master where ClaimantName='"+ request.getParameter("nameCon") +"' and status='Authorized'  and"+ condition3;
			}
			if(chkst.equals("Paid"))
			{
					sqlClaim="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"claim_master where ClaimantName='"+ request.getParameter("nameCon") +"' and status='Paid'  and"+ condition3;
			}

		}
	}
	count++;
		System.out.println("Below Query 123");
		System.out.println(">>>>>>>sqlClaim:====="+sqlClaim);
		try
		{	
			int i=0;		
			ResultSet rsClaim=st.executeQuery(sqlClaim);
			while(rsClaim.next())
			{
    			try
    			{ 
     					if(rsClaim.getString("DepartureDateTime").contains("0000-00-00 00:00:00"))
     					{
    	 						deparetureDateTime="NA";
    	 						System.out.println("In If Loop");
     					}
     					else
     					{
	  							deparetureDateTime=new SimpleDateFormat("dd-MMM-yyyy ").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rsClaim.getString("DepartureDateTime"))); 
     					}
    			}
    			catch(Exception e)
    			{
    					deparetureDateTime="NA";
    					System.out.println(e);
    			}
    			try
    			{ 
    					if(rsClaim.getString("ArrivalDateTime").contains("0000-00-00 00:00:00"))
        				{
    							arrivalDateTime="NA";
    							System.out.println("In If Loop");
        				}
        				else
        				{	
     arrivalDateTime=new SimpleDateFormat("dd-MMM-yyyy ").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rsClaim.getString("ArrivalDateTime"))); 
        }
    }catch(Exception e){ arrivalDateTime="NA"; }
    try
    { 
     claimSubmittedOn=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsClaim.getString("ClaimSubmittedOn"))); 
    }
    catch(Exception e)
    { 
    	claimSubmittedOn="NA";
    }
    
%>
<tr>    	 
<%
status=rsClaim.getString("Status");
//System.out.println("###### Status in rs loop ####"+status);
if(action.equals("view"))
 {
	
	 if(status.contains("Open") || status.contains("Pending"))
	 {
		 %>
		
	   <td style="width: 2%"><a href="#" style="font-weight: bold; color: black; " onclick="DeleteRow('<%=rsClaim.getString("CLMRefNumber")%>');"><img src="images/delete.jpeg" width="20px" height="18px" style="border-style: none" ></img></a></td>
       <td style="width: 2%"><a href="NewClaim.jsp?id=<%=rsClaim.getString("CLMRefNumber")%>&action=update&status=<%=status %>" style="font-weight: bold; color: black; "><img src="images/edit1.jpeg" width="20px" height="18px" style="border-style: none"></img></a></td>
		 <%
	 }
	 else
	 {
		 %>
		 <td></td>
         <td></td>
		 <%
	 }
		 
 }
 %> 

<td width="5%">
<div align="center">
 <%
 if(action.equals("view"))
 {	 
 %>                        	    	
<a href="NewClaim.jsp?id=<%=rsClaim.getString("CLMRefNumber")%>&action=display  &status=<%=status%>" style="font-weight: bold;" ><%=rsClaim.getString("CLMRefNumber")%>
</a>
<% 
}
else
 {
 %>
 <a href="#" style="font-weight: bold;" onclick="popUp('detailClaimReport.jsp','<%=rsClaim.getString("CLMRefNumber")%>','<%=action %>')"><%=rsClaim.getString("CLMRefNumber")%>
</a>
<%} %>
</div>
</td>				      	
<td width="8%" align="left"><div align="left"><font size=2 color="black"><%=rsClaim.getString("ClaimantName") %></font></div></td>
<td width="8%" align="left"><div align="left"><font size=2 color="black"><%=rsClaim.getString("Origin") %></font></div></td>
<td width="8%" align="left"><div align="left"><font size=2 color="black"><%=rsClaim.getString("Destination")%></font></div></td>
<td  width="5%" align="right"><div align="right"><font size=2 color="black"><%=deparetureDateTime %></font></div></td>
<td  width="5%" align="right"><div align="right"><font size=2 color="black"><%=arrivalDateTime %></font></div></td>
<td  width="10%" align="left"><div align="left"><font size=2 color="black"><%=rsClaim.getString("Purpose") %></font></div></td>
<td  width="5%" align="right"><div align="right"><font size=2 color="black"><%=claimSubmittedOn %></font></div></td>
<td width="5%" align="left"><div align="left"><font size=2 color="red"><%=rsClaim.getString("Status") %></font></div></td>
<td width="5%" align="left"><div align="left"><font size=2 color="black"><%=rsClaim.getString("ApprovedBy") %></font></div></td>

<td width="5%" align="right"><div align="right"><font size=2 color="black"><%=rsClaim.getString("SumOfClaimAmount") %></font></div></td>
<td width="5%" align="right"><div align="right"><font size=2 color="black"><%=rsClaim.getString("AdvanceTaken") %></font></div></td>
<% if(action.equals("view"))
 {
%>
<td width="8%" align="left"><div align="left"><font size=2 color="black"><%=rsClaim.getString("CommentsByHOD") %></font></div></td>
<td width="8%" align="left"><div align="left"><font size=2 color="black"><%=rsClaim.getString("CommentsApprovedBy") %></font></div></td>
<td width="8%" align="left"><div align="left"><font size=2 color="black"><%=rsClaim.getString("CommentsByACDepa") %></font></div></td>
<td width="8%" >
	 <% if(rsClaim.getString("Uploadbill").equalsIgnoreCase("-"))
      	{
         %>
        				 <div align="left"  style="font-size: 1.1em;"><%=rsClaim.getString("Uploadbill") %></div>
         <%}
      	else{%>
      					<a href="DocumentsAttached.jsp?documentName=<%=rsClaim.getString("UploadBill")%>" target="/" onclick="window.open(this.href,'jav','width=600,height=600,top=150,left=260,location=0, menubar=0, scrollbars=yes, status=0, toolbar=0,resizable=0');return false;">
      				    <font size=2><div align="left"><%=rsClaim.getString("UploadBill") %></div></font>
      					</a>
      	<%} %>				
</td>
<%} %>
</tr>
<%i++;
}
if(i==0)
{%><div align="center"><b>No Data Found</b></div><%
}

}
catch (Exception e) 
{
 System.out.println("\n>>>>>>>>Exception:"+e);
}
System.out.println("Status in after  loop"+ status);
%>
</table>
</div>	
</form>
<%
System.out.println("Status in after rs loop"+ status);
  // if(action.contains("view"))
   //{
	   %>
<!-- 	   <table border="0"><tr><td><a href="#" style="font-weight: bold; color: blue; " onclick="javascript:window.open('NewClaim.jsp?id=-  &status=-')"><font size="3" >(+)</font></a> [Cleck Hear For Insert New Claim]</td></tr></table> -->
<%
	   //}
} 
catch (Exception e) 
{
	System.out.print("!!!Connection Lost!!!" + e);
}
finally{
	conn.close();
}
%>
<table width="100%"><tr><td>
<div id="footer">
<p><a href="http://www.192.168.2.133"> Copyright &copy; 2009
by Transworld Compressor Technologies Ltd. All Rights Reserved.</a></p>
</div></td></tr></table></body>
<!-- end #footer -->
</html>
</jsp:useBean>