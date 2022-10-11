<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.util.*" import=" java.text.*" %>
     <%@ include file="header.jsp"%>
     <%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Total Task</title>
<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
<script src="sorttable.js" type="text/javascript"></script>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<script type="text/javascript">
function chk()
{

	var dept=document.getElementById("companyName1").value;
	if(dept=="Select")
		{
		
		alert("Please Select Department");
		return false;
		}
	
	var chkf="";
	var chkt="";
	var objFromDate = document.getElementById("data").value;
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
    var objToDate = document.getElementById("data1").value;
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
//         else if(date1 > currentDate)
//         {
//             alert("From Date should be less than current date");
//             return false; 
//         }
//         else if(date2 > currentDate) 
//         {
//             alert("To Date should be less than current date");
//             return false; 
//         }

        return true;
	
}
function gotoExcel(elemId, frmFldId)  
{  
	      
          var obj = document.getElementById(elemId);
          var oFld = document.getElementById(frmFldId);
          oFld.value = obj.innerHTML;
          document.index_total_cat.action ="excel.jsp";
          document.forms["index_total_cat"].submit();
}
function checkAll()
{

	//alert("ok");
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

	//alert("ok");
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

function getcheckedrow()
{
	//alert("hiiiii");
	var cnt1=0,cnt2=0,k=1,flag="t",flag1="t",l=1;
	var id="";
	var chklength=document.getElementsByName("chkbx");
	//var chklength = document.getElementById("checkedNumber").value;
	//alert("hiiiii"+chklength);
	for(cnt1=0;cnt1<chklength.length;cnt1++)
	{
		if( document.getElementById("chkbx"+k).checked == true )
		{
			flag="success";
		//	alert("flag"+flag);
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
		//alert("hiiiii1");
		
		
	//	var chklengthnew = document.getElementById("checkedNumber").value;
		for(cnt=0;cnt<chklength.length;cnt++)
		{
			//alert("for Length of for==>"+chklengthnew.length);
			
			if(document.getElementById("chkbx"+i).checked)
			{
				//alert("if");
				id=id+","+document.getElementById("net_id1"+i).innerHTML;
			//	approvalComment=approvalComment+"/"+document.getElementById("approvalcomment"+i).value;
			}
			i++;
		}
	//	alert("check"+id);
	//	DeleteRow(id,approvalComment);
		DeleteRow(id);
	}
	else
	{
		alert("Please Check Task Id ");
	}
	
}

function DeleteRow(id)
{
	//alert("Control inside deldte function"+id);

	var agree=confirm("Do You Want To Approve Task ?");
	    //alert(agree);
	    if(agree)
	    {
	    	 
	    	//window.location="ApprovedTask.jsp?action=approve&id="+id+"";
	    	
	    	window.location="ActionApprovedTask.jsp?action=approve&id="+id+"";
			
	    }
	    else
	    {
	    	return false;
	    }
 }


function getcheckedrow1()
{
	//alert("hiiiii");
	var cnt1=0,cnt2=0,k=1,flag="t",flag1="t",l=1;
	var id="";
	var chklength=document.getElementsByName("chkbx");
	//var chklength = document.getElementById("checkedNumber").value;
	//alert("hiiiii"+chklength);
	for(cnt1=0;cnt1<chklength.length;cnt1++)
	{
		if( document.getElementById("chkbx"+k).checked == true )
		{
			flag="success";
		//	alert("flag"+flag);
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
		//alert("hiiiii1");
		
		
	//	var chklengthnew = document.getElementById("checkedNumber").value;
		for(cnt=0;cnt<chklength.length;cnt++)
		{
			//alert("for Length of for==>"+chklengthnew.length);
			
			if(document.getElementById("chkbx"+i).checked)
			{
				//alert("if");
				id=id+","+document.getElementById("net_id1"+i).innerHTML;
			//	approvalComment=approvalComment+"/"+document.getElementById("approvalcomment"+i).value;
			}
			i++;
		}
		//alert("check count"+cnt);
	//	DeleteRow(id,approvalComment);
		DeleteRow1(id,cnt);
	}
	else
	{
		alert("Please Check Task Id ");
	}
	
}

function DeleteRow1(id,cnt)
{
	//alert("Control inside deldte function"+id);
//alert(id);
var userName=document.getElementById("userName").value;
//alert(p);
	var agree=confirm("Do You Want To Reject Task ?");
	    //alert(agree);
	    if(agree)
	    {
	    	 
	    	//window.location="ApprovedTask.jsp?action=reject&id="+id+"&cnt="+cnt+"";
	    	//alert(id);
	    	
	    	window.location="ApprovedTask.jsp?action=reject&id="+id+"&cnt="+cnt+"&userName="+userName+"";
			
	    }
	    else
	    {
	    	return false;
	    }
 }	
 
 
 
</script>
</head>
<body>
<%!Connection conn = null;
   Statement st = null,st1 = null,st11=null;
%>
<%
String datenew1="";
String datenew2="";
String date1 = "";
String date2 = "";
String dept = "";
String user_id1 = "";
String tDate1 = "";
String tDate2 = "";
datenew1 = request.getParameter("from_date1");
datenew2 = request.getParameter("to_date1");
String totalTask = request.getParameter("totalTask");
String frmDate = request.getParameter("frmDate");
String toTime = request.getParameter("toTime");
String user_id = request.getParameter("user_id");
String user_name = request.getParameter("user_name");
String detp123="";


String department="";

Class.forName("org.gjt.mm.mysql.Driver");
//conn = DriverManager.getConnection("jdbc:mysql://115.112.36.134/dotproject","fleetview","1@flv");
conn = DriverManager.getConnection("jdbc:mysql://164.68.105.216/dotproject","fleetview","1@flv");
//conn = DriverManager.getConnection("jdbc:mysql://192.168.2.55/dotprojectfortesting","fleetview","1@flv");
//conn = DriverManager.getConnection("jdbc:mysql://192.168.2.55/dotproject","fleetview","1@flv");

st=conn.createStatement();
st1=conn.createStatement();
st11=conn.createStatement();

String daydata="select DATE_FORMAT(DATE(NOW() - INTERVAL 1 Month),'%Y-%m-01') as First,LAST_DAY(NOW() - INTERVAL 1 Month) as Last,NOW() As Today";
ResultSet rsdaydata=st1.executeQuery(daydata);
String FirstDay="",LastDay="";
String Curr="",Prev1="",Prev2="",today="";
if(rsdaydata.next())
{
	  FirstDay=rsdaydata.getString("First");
	  LastDay=rsdaydata.getString("Last");
	  today=rsdaydata.getString("Today");
}
System.out.println("The total Tasks is :"+totalTask);
System.out.println("The frmDate is :"+frmDate);
System.out.println("The toTime is :"+toTime);
System.out.println("The user_id is :"+user_id);
System.out.println("The username is :"+user_name);

if(datenew1==null){
	
	System.out.println("==in if==");
	//datenew1 = new SimpleDateFormat("dd-MMM-yyyy").format(FirstDay);
	//datenew2 = new SimpleDateFormat("dd-MMM-yyyy").format(LastDay);
	
	datenew1 = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(FirstDay));
	datenew2 = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(LastDay));
	
	tDate1 = datenew1;
	tDate2 = datenew2;
	detp123=request.getParameter("companyName1");
	System.out.println("Dept 123 :- "+detp123);
	if(detp123==null || detp123.equals(null) || detp123.equals("null"))
	{
		System.out.println("Dept 123 In Null :- ");
		
	}
	else
	{
		System.out.println("Dept 123 In Not Null:- ");
	}
}
else{
System.out.println("==in else==");

 
 date1 = datenew1;
 date2 = datenew2;
 
 	tDate1 = date1;
	tDate2 = date2;
}
System.out.println("Date1 :-"+tDate1);
System.out.println("Date2 :-"+tDate2);

DateFormat df123= new SimpleDateFormat("dd-MMM-yyyy");
DateFormat df1234= new SimpleDateFormat("yyyy-MM-dd");
String dataDate1=df1234.format(df123.parse(datenew1));
String dataDate2=df1234.format(df123.parse(datenew2));

String Sesrole1=session.getAttribute("role").toString();
System.out.println("Ses role :- "+Sesrole1);
String name=session.getAttribute("EmpName").toString();
String sql1="";

%>


	
		
	
	<%
       //  final String exportFileName="Total_Task_Report_of_"+user_name+"_Between_"+new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(frmDate))+"_And_"+new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(toTime));  
	%>
	<%-- <table align="center" width="100%">
			<tr align="center">
				<td align="center">
					<font size="3"><b>Task Report of <%= user_name %> Between <%= new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(frmDate)) %> And <%= new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(toTime)) %></b></font>
					<font size="3"><b>Task Report</b></font>
				</td>
			</tr>
		</table> --%>
		
		<form name="indexReport" method="get"  onsubmit="return confirmSubmit()" action="">
<table border="0" align="center" width="100%">
<tr><td align="center"><font color="black" size="3"><b>Task Approval Report Between <%= tDate1%> And <%=tDate2 %></b></font></td></tr>
<tr></tr>
<tr>
<td>
<br>
<table border="0" width="60%" align="center">
<tr>

<td bgcolor="#f5f5f5" align="center"><font size="2"><b>IndexType</b></font></td>
           <td bgcolor="#f5f5f5" align="center"><select name="Index" id="Index" style="width: 70px; height:20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;">
         <%String Index=request.getParameter("Index");
         String Index1="";
    		System.out.println("Selected Index :- "+Index); 
    		if(Index==null)
    		{
    			Index="PI";
    		%>
    		<option value="<%=Index%>"><%=Index%></option>
    		<option value="KRA">KRA</option>
    		<%} else{
    			if(Index.equals("PI"))
    			{
    				Index1="KRA";	
    			}else
    			{
    				Index1="PI";
    			}
    			
    			
    		%>
    		<option value="<%=Index%>"><%=Index%></option>
            <option value="<%=Index1%>"><%=Index1%></option> 
            
            <%} %>
            
            
                      </select>
           </td>


<td>
         <td bgcolor="#f5f5f5" align="center"><font size="2"><b>Department</b></font></td>
           <td bgcolor="#f5f5f5" align="center"><select name="companyName1" id="companyName1" style="width: 70px; height:20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;">
         <%--   <option ><%=cmp %></option>  --%>
           <!-- <option value="Select">Select</option> -->
           <%if(!(detp123==null || detp123.equals(null) || detp123.equals("null")))
        	   
        	   
        	   {
        	   System.out.println("***IN IF****"+detp123);
        	   System.out.println("***IN IF****");
        	   String dept1=request.getParameter("companyName1");
       		System.out.println("Selected Dept :- "+dept1);
       		%>
     	   
            <option value="<%=dept1%>"><%=dept1%></option>
            <%
       		if(Sesrole1.equals("AllAdmin") || Sesrole1.equals("HOD"))
            	
        	{
            	//sql1 = "select distinct(department) from dotproject.active_users where active_status='Yes' and department='"+session.getAttribute("department").toString()+"' order by department";
            	if(!(dept1==null || dept1.equals(null) || dept1.equals("null")))
            	{
            		
            		
            		
            		sql1="select distinct(dept) as department  from db_GlobalERP.UserMaster where HODReport='"+session.getAttribute("EmpName").toString()+"' and companymasterid="+session.getAttribute("CompanyMasterID").toString()+"  and dept!='"+dept1+"' and ActiveStatus='Yes' order by dept";
            	}
            	else
            	{
            		sql1="select distinct(dept) as department  from db_GlobalERP.UserMaster where HODReport='"+session.getAttribute("EmpName").toString()+"' and companymasterid="+session.getAttribute("CompanyMasterID").toString()+"   and ActiveStatus='Yes' order by dept";
            				
            	}
            	System.out.println("*******"+sql1);
                ResultSet rsregno = st.executeQuery(sql1);
        		while(rsregno.next())
        		{
        			 
        			department=rsregno.getString("department");
        			// customer=customer.replaceAll("&", "*");
        			 //customer=customer.replaceAll("&", "*");
        			 
        			 System.out.println("department-->"+department);
        			%>
        			<option value="<%=department%>"><%=department%></option>
        	         <%
        	        // customer=customer.replaceAll("&", "..");
              }
        	}
       		
        	   %>
        	   
          
          <% }else
          {
        	   
        	  System.out.println("***IN ELSE****");
            
            
             if(Sesrole1.equals("AllAdmin") || Sesrole1.equals("HOD"))
        	
        	{
            	//sql1 = "select distinct(department) from dotproject.active_users where active_status='Yes' and department='"+session.getAttribute("department").toString()+"' order by department";
            	if(!(detp123==null || detp123.equals(null) || detp123.equals("null")))
            	{
            		
            		sql1="select distinct(dept) as department  from db_GlobalERP.UserMaster where HODReport='"+session.getAttribute("EmpName").toString()+"' and companymasterid="+session.getAttribute("CompanyMasterID").toString()+"  and dept!='"+detp123+"' and ActiveStatus='Yes' order by dept";
            	}
            	else
            	{
            		
            		sql1="select distinct(dept) as department  from db_GlobalERP.UserMaster where HODReport='"+session.getAttribute("EmpName").toString()+"' and companymasterid="+session.getAttribute("CompanyMasterID").toString()+"   and ActiveStatus='Yes' order by dept";	
            	}
        	}
            	
		System.out.println("*******"+sql1);
        ResultSet rsregno = st.executeQuery(sql1);
		while(rsregno.next())
		{
			 
			department=rsregno.getString("department");
			// customer=customer.replaceAll("&", "*");
			 //customer=customer.replaceAll("&", "*");
			 
			 System.out.println("department-->"+department);
			%>
			<option value="<%=department%>"><%=department%></option>
	         <%
	        // customer=customer.replaceAll("&", "..");
      }
          }	%>
           </select>
           </td>
<td bgcolor="#f5f5f5" align="center"><font size="2"><b>From Date</b></font></td>
<td bgcolor="#f5f5f5" align="center"><font size="2">

			<input type="text" id="data" name="from_date1" size="12" value="<%=datenew1%>" 
			style="width: 90px; height: 20px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"readonly />
			<script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "data"       // ID of the button
					    }
					  );
				</script>

		</font>
</td>
<td bgcolor="#f5f5f5" align="center"><font size="2"><b>To Date</b></font></td>
<td bgcolor="#f5f5f5" align="center"><font size="2">
		
			<input type="text" id="data1" name="to_date1" size="12" value="<%=datenew2%>"
			style="width: 90px; height: 20px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;" readonly />
				<script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data1",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "trigger1"       // ID of the button
					    }
					  );
				</script>
		
		</font>
</td>
<td bgcolor="#f5f5f5" align="center"><font size="2"><input type="submit" name ="sub" id ="sub" value="submit" onclick=" return chk()" style="background-color:#f5f5f5; "></input></font></td>
</tr>
</table>
</table>
</form>
		
		
	<table width="100%" border="0" align="center">
			<tr>
				
			</tr>
			
	</table>	
	
	
	<table align="right" style="width:100%">
<tr><td><input type="button" name="Create Invoice"  value="Approve" onclick="getcheckedrow()" /> </td> <td></td><td><td></td>
			
				
 </tr>
<tr><td><input type="button" name="Create Invoice"  value="Reject" onclick="getcheckedrow1()" /> </td> <td></td><td><td></td>
			
				
</tr> 

</table>

	<br>
	<br>
	<br>
<br>
<br>
<br>
		
		<div align="center" style="width:100%;" id="table1">	
				
		<table width="100%" border="1"  align="center" class= "sortable">	

		
		<tr >
<th bgcolor="#1582AB"><font size="2" face="Arial" color="white">SrNo</font></th>
<th style="width: 125px;">
	<a href="#" onclick="checkAll()"><input type="hidden" name="check" id="check" value="">
	<font color="white">Chk &nbsp;&nbsp;/&nbsp;&nbsp;</font></a> 
	<a href="#" onclick="unCheckAll()"> <font color="white">UnChk</font></a>
	</th>
	<th bgcolor="#1582AB"><font size="2" face="Arial" color="white">User Id</font></th>
	<th bgcolor="#1582AB"><font size="2" face="Arial" color="white">Name</font></th>
<th bgcolor="#1582AB"><font size="2" face="Arial" color="white">ID</font></th>
<th bgcolor="#1582AB"><font size="2" face="Arial" color="white">Task Name</font></th>
<th bgcolor="#1582AB"><font size="2" face="Arial" color="white">Description</font></th>

<th bgcolor="#1582AB"><font size="2" face="Arial" color="white">Comment</font></th>
<th bgcolor="#1582AB"><font size="2" face="Arial" color="white">Status</font></th>
<th bgcolor="#1582AB"><font size="2" face="Arial" color="white">Attachment</font></th>

<th bgcolor="#1582AB"><font size="2" face="Arial" color="white">Start</font></th>
<th bgcolor="#1582AB"><font size="2" face="Arial" color="white">End</font></th>
<th bgcolor="#1582AB"><font size="2" face="Arial" color="white">Duration</font></th>

<th bgcolor="#1582AB"><font size="2" face="Arial" color="white">Mail</font></th>

<th bgcolor="#1582AB"><font size="2" face="Arial" color="white">Dept.</font></th>

<th bgcolor="#1582AB"><font size="2" face="Arial" color="white">Approval</font></th>


</tr>
		<%
		String fromDate = request.getParameter("from_date1");
		String toDate = request.getParameter("to_date1");
			
			System.out.println("The from Date is :"+fromDate);
			System.out.println("The to Date is :"+toDate);
			
		if(fromDate !=null && toDate !=null) {
			
			fromDate = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(fromDate));
			toDate = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(toDate));
			
			System.out.println("The from Date is :"+fromDate);
			System.out.println("The to Date is :"+toDate);
			
			String fromDTime =fromDate+" 00:00:00";
			String toDTime =toDate+" 00:00:00";
			
			System.out.println("The from Date Time is :"+fromDTime);
			System.out.println("The to Date time is :"+toDTime);
		
		int cnt = 0;
		int ck=0;
		String  task_id = "",task_name = "",username="",task_owner = "",task_strtDateTime = "",Task_dur = "",taskEndDateTime = "",Task_per_com = "",task_project="";
		String maildatetime="",TaskStatus="",TaskComment="",TaskAttachment="";
		int taskpercent=0;
		String taskpercent1="";
		String taskperStatus="";
		double Task_dur1=0.00;
		//String sql_total ="select * from db_GlobalERP.100000taskmaildata where user_id='"+user_id+"' and date(task_end_date)>='"+frmDate+"' AND date(task_end_date)<='"+toTime+"' ";
		String dept1=request.getParameter("companyName1");
		System.out.println("Selected Dept :- "+dept1);
		
		
		
		if(dept1.equals("All"))
		{
			dept1="%%";
		}
		else
		{
			dept1=request.getParameter("companyName1");
		}
		
	String sql_total="";
	String IdexType=request.getParameter("Index");
	
	System.out.println("Index Type :- "+IdexType);
	String dotprojectid="";
	if(IdexType.equals("PI"))
	{
		dotprojectid="b.dotprojectid";
	}
	else if(IdexType.equals("KRA"))
	{
		dotprojectid="b.KRAdotprojectid";
	}
		
		if(dept1.equals("All"))
		{
			sql_total="select * from db_GlobalERP.100000taskmaildata a , db_GlobalERP.UserMaster b  where date(a.taskenddate) >='"+fromDTime+"' AND date(a.taskenddate) <='"+toDTime+"' and a.TaskStatus='Pending'  and b.dept='"+dept1+"'  and a.UserId="+dotprojectid+"  and b.HODReport='"+session.getAttribute("EmpName").toString()+"'  and b.ActiveStatus='Yes' order by UserId,TaskStartDate ";
		
		}
		else
		{
			sql_total="select * from db_GlobalERP.100000taskmaildata a , db_GlobalERP.UserMaster b  where date(a.taskenddate) >='"+fromDTime+"' AND date(a.taskenddate) <='"+toDTime+"' and a.TaskStatus='Pending'  and b.dept like '"+dept1+"'  and a.UserId="+dotprojectid+"  and b.HODReport='"+session.getAttribute("EmpName").toString()+"'  and b.ActiveStatus='Yes' order by UserId,TaskStartDate ";	
		}
		
		
		ResultSet rs = st.executeQuery(sql_total);
		System.out.println("The query is ==>>"+sql_total);
		DecimalFormat df = new DecimalFormat("0.00");
		while(rs.next()){
			++cnt;
			ck++;
			task_id = rs.getString("TaskID");
			String task_description="";

			
			String sqll="select * from dotproject.tasks where task_id='"+task_id+"'";	
			ResultSet rss = st11.executeQuery(sqll);
			System.out.println("The sqll is ==>>"+sqll);
			while(rss.next()){
				task_description = rss.getString("task_description");
			}			

			
			task_name = rs.getString("TaskName");
			task_owner = rs.getString("TaskCreater");
			TaskComment=rs.getString("a.TaskComment");

			task_strtDateTime = rs.getString("TaskStartDate");
			Task_dur1 = rs.getDouble("AssignedDuration");
			taskEndDateTime = rs.getString("TaskEndDate");
			maildatetime= rs.getString("MailDateTime");
			Task_per_com = rs.getString("UserDepartment");
			task_project=rs.getString("UserId");
			username=rs.getString("EmpName");
			
			TaskStatus=rs.getString("a.TaskStatus");
			TaskAttachment=rs.getString("TaskAttachment");
			System.out.println("TaskAttachment is ------->"+TaskAttachment);
			
			String[] TA=TaskAttachment.split(",");
			System.out.println("TA issssss------->"+TA[0]);
			//System.out.println("Arrays.toString(TA) issssss------->"+ Arrays.toString(TA).substring(1,(Arrays.toString(TA)).trim().length()-1));
			//System.out.println("TaskStatus"+TaskStatus);
			
			taskpercent1=rs.getString("TaskPercent");
			if(taskpercent1.equals("-"))
			{
				taskpercent=0;
			}else{
			taskpercent=rs.getInt("TaskPercent");
			}
				
			
			//System.out.println("User------->"+username);
			System.out.println("Task Percent------->"+taskpercent);
			 if(taskpercent==100)
			{
				taskperStatus="Completed";
			}
			if(taskpercent==75||taskpercent==50||taskpercent==25)
			{
				taskperStatus="In Progress";
			} 
		%>
		
		<tr>
		<td align="right"><div align="right"><%= cnt %></div></td>
		<td><input type="checkbox"  name="chkbx"   id="chkbx<%=ck %>"  /></td>
	    <td align="right"><div align="right"><%= task_project  %></div></td>
	    <td align="right"><div align="left"><%= username %></div></td>
	    <td><div align="right" id="net_id1<%=ck %>"><%=task_id %></div></td>
		<td align="left" ><div align="left"><%= task_name %></div></td>
				<td align="left" ><div align="left"><%= task_description %></div></td>
		
		<td align="right"><div align="left"><%=TaskComment   %></div></td>
		<td align="right"><div align="left"><%=taskperStatus   %></div></td>
		
		
		<td style="font-size: 11px; face:san-serif; color:black" align="left">
	 <%for (int k=0;k<TA.length;k++) {
	 
		 if(TA[k].equals("-"))
		 {
				%>
				-</td> 
				
				<%System.out.println("IN");

		 }
		 
		 else
		 {
	 
	 %>
	 <a href=Downloadtaskattachment.jsp?filename=<%=TA[k]%> target="_blank"><%=TA[k]%><% if(k<(TA.length-1)){%><%=","%><%} %></a>
				<%}} %></td> 
		<td align="right"><div align="right"><%= new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(task_strtDateTime)) %></div></td>
		<td align="right"><div align="right"><%= new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(taskEndDateTime))  %></div></td>
		<td align="right"><div align="right"><%= df.format(Task_dur1)%></div></td>
		<td align="right"><div align="right"><%= new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(maildatetime))  %></div></td>
		
		<td align="right"><div align="left"><%= Task_per_com  %></div></td>
		<td align="right"><div align="left"><%=TaskStatus   %></div></td>
				
		</tr>
<%} %>	
<input type="hidden" name="checkedNumber" id="checkedNumber" value="<%=ck %>"/>
 <input type="hidden" name="userName" id="userName" value="<%=username %>"/> 	

		</table>
</div>		
	<%@ include file="footer_new.jsp" %>		
	
	<%} %>	
</body></html>

		
	



