<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.util.*" import=" java.text.*" %>
     <%@page import="java.util.*" %>
     
     
  <html> 
<head>
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
	                        title: 'Task Status Report '+$("#data").val()+'-'+$("#data1").val(), 
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title: 'Task Status Report '+$("#data").val()+'-'+$("#data1").val(), 
	                    },
	                    {
	                        extend: 'csv',
	                        title: 'Task Status Report '+$("#data").val()+'-'+$("#data1").val(),
	                    },
	                    {
	                        extend: 'print',
	                        title: 'Task Status Report '+$("#data").val()+'-'+$("#data1").val(),
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Task Status Report '+$("#data").val()+'-'+$("#data1").val(),
	                    },
	                    
	            				/* 'copy', 'csv', 'excel', 'pdf', 'print' */
	            			]
	        	}
	        ],
	        lengthMenu: [[-1, 10, 25, 50, 100], ["All", 10, 25, 50, 100 ]],
	        
	     
	    
	    
	    
	    	
	    } );
	} );

</script>


 
<script type="text/javascript">




function consig()
{
	var dept=document.getElementById("companyName1").value;
	
		
	//alert("Customer---------"+customername);
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
	//alert("eeeeeeeeeeeeeeeeeeeeeeeeee");
	// Create a function that will receive data sent from the server
	ajaxRequest.onreadystatechange = function()
	{
		if(ajaxRequest.readyState == 4)
		{//alert("######################### ");
			
		   var reselt=ajaxRequest.responseText;
		   //alert("Original result"+reselt);
			var finalres=reselt.split("#");
			document.getElementById("EmpName").innerHTML=finalres[0];
			//alert("After trim"+finalres[0]);
			
			  
		 
		}
	
	}
	
	var queryString = "?dept="+dept;
     //alert("Query String ---"+queryString);
	ajaxRequest.open("GET", "EmpAjax.jsp"+queryString, true);
	ajaxRequest.send(null); 
   
	
	//re(1);
	}
</script>
<script>
function chk()
{
//alert("IN");
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
</script>
<script>
function newsenddata()
{
	
	alert("Hi");
}
function senddata2(UserId,dt,dt1,HOD,Department,User,Status,Sesrole2)
{
	 //System.out.println("Inside senddata2");
	 alert("Hi");
	 //alert("Id :- "+id);
	 //alert("Name :- "+Name);
	 window.location="TaskDetailsReport.jsp?UserId="+UserId+"&fromdate="+dt"&todate="+dt1"&HOD="+HOD"&Dept="+Department"&User="+User"&Status="+Status"&Role="+Sesrole2"";
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
	    	 
	    	window.location="ApprovedTask.jsp?action=approve&id="+id+"";
			
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

	var agree=confirm("Do You Want To Reject Task ?");
	    //alert(agree);
	    if(agree)
	    {
	    	window.location="ApprovedTask.jsp?action=reject&id="+id+"&cnt="+cnt+"";
			
	    }
	    else
	    {
	    	return false;
	    }
 }	
function birt1()
{
	//alert("HI");
	
	//alert(Customer)
	
	
	var a=chk();
	//alert(a);
	if(a==true)
	{
	
		
		
		
		var date1= document.getElementById("data").value;
	//alert(date1);
		
		
		var date2= document.getElementById("data1").value;
		//alert(date2);
		
		
		var dept=document.getElementById("companyName1").value;
		//alert(dept);
		var comid=document.getElementById("comid").value;
		
		var name=document.getElementById("EmpName").value;
		//alert(name);
		var date = date1.split("-");
		var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun','Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
		for(var j=0;j<months.length;j++)
		{
		    if(date[1]==months[j])
		    {
		         date[1]=months.indexOf(months[j])+1;
		    }                      
		} 
		if(date[1]<10)
		{
		    date[1]='0'+date[1];
		}                        
		var formattedDate1 = date[2]+'-'+date[1]+'-'+date[0];
		
		
		
		
		var dat = date2.split("-");
		var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun','Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
		for(var j=0;j<months.length;j++){
		    if(dat[1]==months[j]){
		         dat[1]=months.indexOf(months[j])+1;
		     }                      
		} 
		if(dat[1]<10){
		    dat[1]='0'+dat[1];
		}                        
		var formattedDate2 = dat[2]+'-'+dat[1]+'-'+dat[0];
		
		
		
		formattedDate1=formattedDate1+" 00:00:00";
		formattedDate2=formattedDate2+" 23:59:59";
		//alert("status---"+status);
		
		var role=document.getElementById("role").value;
		var sesname=document.getElementById("sesname").value;
		
		
		
		document.getElementById("myIframe").src="http://164.68.105.216:8080/birt/frameset?__report=TaskApprovalReport.rptdesign&dept="+dept+"&fromdate="+formattedDate1+"&todate="+formattedDate2+"&dt="+date1+"&dt1="+date2+"&comid="+comid+"&name="+name+"&role="+role+"&sesname="+sesname+"&__showtitle=false";
//		document.getElementById('myIframe').src="http://103.8.126.138:8080/birt/frameset?__report=driverreport1.rptdesign&_title='My Viewer'&date1=2015-03-01&date2=2015-08-28&drivername="+driver+"";
		document.getElementById("reportData2").style.display="";
		document.getElementById("footer").style.display="none";
		
		return true;
		
	}

else
	{
		return false;
	}
		
	}
 
 
</script>
</head>

<%!
Connection con1;


%>
<%
Class.forName(DB_Driver);
con1 = DriverManager.getConnection(DB_NAME,DB_USERNAME,DB_PASSWORD);
Statement st1=con1.createStatement();


%>

<% 
String query12="";

ResultSet rs=null;
ResultSet rs1=null;
Statement stmt=null;
Statement stmt1=null;
stmt=con1.createStatement();
stmt1=con1.createStatement();
String type=request.getParameter("status");
//type="Customer";
System.out.println("-------->"+type);



%>
<%!Connection conn = null;
   Statement st = null;
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
String department="";

Class.forName("org.gjt.mm.mysql.Driver");
//conn = DriverManager.getConnection("jdbc:mysql://115.112.36.134/dotproject","fleetview","1@flv");
conn = DriverManager.getConnection("jdbc:mysql://164.68.105.216/dotproject","fleetview","1@flv");
//conn = DriverManager.getConnection("jdbc:mysql://192.168.2.55/dotprojectfortesting","fleetview","1@flv");
//conn = DriverManager.getConnection("jdbc:mysql://192.168.2.55/dotproject","fleetview","1@flv");

st=conn.createStatement();

System.out.println("The total Tasks is :"+totalTask);
System.out.println("The frmDate is :"+frmDate);
System.out.println("The toTime is :"+toTime);
System.out.println("The user_id is :"+user_id);
System.out.println("The username is :"+user_name);

String Sesrole1=session.getAttribute("role").toString();

%>
<input type="hidden" id="role" name="role" value="<%=Sesrole1%>" />
<%

System.out.println("Ses role :- "+Sesrole1);

if(datenew1==null){
	
	System.out.println("==in if==");
	
	Calendar cal = Calendar.getInstance();
	String today_dt = new SimpleDateFormat("dd-MMM-yyyy")
			.format(cal.getTime());
	String data2 = today_dt;
	String temp = data2;
	String toDate = new SimpleDateFormat("yyyy-MM-dd")
			.format(new SimpleDateFormat("dd-MMM-yyyy").parse(temp));

	//cal.add(Calendar.DATE, -1);
	cal.set(Calendar.DAY_OF_MONTH, 1);
	String yesterday_dt = new SimpleDateFormat("dd-MMM-yyyy")
			.format(cal.getTime());
	String data1 = yesterday_dt;
	temp = data1;
	String fromDate =new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
	String fromDate1 =new SimpleDateFormat("dd-MMM-yyyy").format(cal.getTime());
	
	datenew1 = new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
	datenew2 = new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
	
	if(Sesrole1.equals("HOD") || Sesrole1.equals("AllAdmin"))
	{
		datenew1 = fromDate1;
		datenew2 = ""+datenew2;
	}
	else
	{
	tDate1 = datenew1;
	tDate2 = datenew2;
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


String name=session.getAttribute("EmpName").toString();
String sessiondept=session.getAttribute("department").toString();
%>

<body>
	<input type="hidden" id="sesname" name="sesname" value="<%=name%>" />
		<form name="custreport" id="custreport" method="post">
		
<table border="0" align="center" width="100%">
<tr><td align="center"><font color="black" size="3"><b>KRA Task Status Report </b></font></td></tr><tr></tr>
<tr>
<td>
<br>
<table border="0" width="60%" align="center">
<tr>

<td>

         <td bgcolor="#f5f5f5" align="center"><font size="2"><b>Dept</b></font></td>
           <td bgcolor="#f5f5f5" align="center"><select name="companyName1" id="companyName1" onchange="consig();" style="width: 70px; height:20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;">
         <%--   <option ><%=cmp %></option>  --%>
           <!-- <option value="Select">Select</option> -->
          <%	String Bt1=request.getParameter("button2");
  		

          System.out.println("-INNNNNNNNNNNN-------------"+Bt1);
          if(Bt1==null || Bt1=="null" || Bt1.equals("null"))
        	  {%>

          
          <%if(Sesrole1.equals("AllAdmin")) {
           %>
           <option value="All">All</option>
          
            
            <%} 
            else
            {%>
            <option value="<%=sessiondept%>"><%=sessiondept%></option>
            <%} %>
            <%}
            else 
            {
            System.out.println("INNN Elseeeeeeeee");
            String seldept=request.getParameter("companyName1"); 
    	    System.out.println("******seldept*"+seldept);
    	    if(Sesrole1.equals("AllAdmin")) {
           %>
            
             <option value="<%=seldept%>"><%=seldept%></option>
                        <option value="All">All</option>
             
             <%} 
            else
            {%>
            <option value="<%=seldept%>"><%=seldept%></option>
            <%}  } %>
          
                        
            <%
           
            String sql1="";
            
            if(Sesrole1.equals("AllAdmin"))
       	
       	{
           	//sql1 = "select distinct(department) from dotproject.active_users where active_status='Yes' and department='"+session.getAttribute("department").toString()+"' order by department";
           	sql1="select distinct(dept) as department  from db_GlobalERP.UserMaster where  companymasterid="+session.getAttribute("CompanyMasterID").toString()+"  and ActiveStatus='Yes' and KRAdotprojectid!='-'order by dept";
       	}
            
           else if (Sesrole1.equals("HOD")){
           	sql1="select distinct(dept) as department  from db_GlobalERP.UserMaster where (HODReport='"+session.getAttribute("EmpName").toString()+"' OR EmpName='"+session.getAttribute("EmpName").toString()+"') and companymasterid="+session.getAttribute("CompanyMasterID").toString()+"  and ActiveStatus='Yes' and KRAdotprojectid!='-' order by dept";
            }
           else
           {
           	sql1="select distinct(dept) as department  from db_GlobalERP.UserMaster where EmpName='"+session.getAttribute("EmpName").toString()+"' and companymasterid="+session.getAttribute("CompanyMasterID").toString()+"  and ActiveStatus='Yes' and KRAdotprojectid!='-' order by dept";
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
		%>
           </select>
           </td>

<td>
         <td bgcolor="#f5f5f5" align="center"><font size="2"><b>Name</b></font></td>
           <td bgcolor="#f5f5f5" align="center"><select  id="EmpName" name="EmpName" style="width: 170px; height:20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;">
            <%	String Bt2=request.getParameter("button2");
  		

          System.out.println("-INNNNNNNNNNNN-------------"+Bt2);
          if(Bt2==null || Bt2=="null" || Bt2.equals("null"))
        	  {%>
          <%if(Sesrole1.equals("AllAdmin") || Sesrole1.equals("HOD")) {
           %>
           <option value="All">All</option>
           
           <%} else
           {%>
           <option value="<%=name%>"><%=name%></option>
           <%} }
            else 
            {
            System.out.println("INNN Elseeeeeeeee");
            String EmpName1=request.getParameter("EmpName"); 
    	    System.out.println("******EmpName*"+EmpName1);
    	    if(Sesrole1.equals("AllAdmin")) {
           %>
            
             <option value="<%=EmpName1%>"><%=EmpName1%></option>
                        <option value="All">All</option>
             
             <%} 
            else
            {%>
            <option value="<%=EmpName1%>"><%=EmpName1%></option>
            <%}  } %>
          
           
           
           
         
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
<td bgcolor="#f5f5f5" align="center"><font size="2">
<input type="submit" name="button2" id="button2" value="Submit" onclick="return chk()" style="background-color:#f5f5f5; ">
</input></font></td>
</tr>
</table>
<br>
<br>
</table>
		
<div class="t1" style="width:100%">
<table id="example"  class="display"  a style="width:100%"  cellspacing="0" border="1"> 

<thead>


<tr>
<th style="font-size:11px ; background: #1582AB;  color:white;face:san-serif;">SrNo</th>
<th style="font-size:11px ; background: #1582AB;  color:white;face:san-serif;">User</th>


<th style="font-size: 11px ;background: #1582AB;  color:white;face:san-serif;">UserID</th>
<th style="font-size: 11px ;background: #1582AB;  color:white;face:san-serif;">Assigned</th>
<th style="font-size: 11px ; background: #1582AB;  color:white;face:san-serif;">Submitted</th>
<th style="font-size: 11px ;background: #1582AB;  color:white; face:san-serif;">Missed</th>
<th style="font-size: 11px ;background: #1582AB;  color:white; face:san-serif;">Pending</th>
<th style="font-size: 11px ;background: #1582AB;  color:white; face:san-serif;">Approved</th>
 <th style="font-size:11px ;background:#1582AB;  color:white; face:san-serif;">Rejected</th>
<th style="font-size: 11px ;background: #1582AB;  color:white; face:san-serif;">Department</th>
<th style="font-size: 11px ;background: #1582AB;  color:white; face:san-serif;">HOD</th>

 
</tr>

</thead>

	<%
	String data11 = request.getParameter("data");
	System.out.println("data11::"+data11);
	String data12 = request.getParameter("data1");	
	System.out.println("data12"+data12);
	String Nam = request.getParameter("EmpName");
	System.out.println("Nam"+Nam);

	%>	

			
			
	
<tbody>
<%
	String fromDate = "", toDate = "",fromDate1="";
	String data2="",data1="";
	String CustomerCode="";
	String dotprojectid="";
	
	String stp="Pending";
	String comid=session.getAttribute("CompanyMasterID").toString();
	
	%>
	<input type="hidden" id="comid" name="comid" value="<%=comid%>" />
	<%
	
	
	//CompanyName ---->null
	String dd = request.getParameter("data");
	if (dd == null) {
		Calendar cal = Calendar.getInstance();
		String today_dt = new SimpleDateFormat("dd-MMM-yyyy")
				.format(cal.getTime());
		data2 = today_dt;
		String temp = data2;
		toDate = new SimpleDateFormat("yyyy-MM-dd")
				.format(new SimpleDateFormat("dd-MMM-yyyy").parse(temp));

		//cal.add(Calendar.DATE, -1);
		cal.set(Calendar.DAY_OF_MONTH, 1);
		String yesterday_dt = new SimpleDateFormat("dd-MMM-yyyy")
				.format(cal.getTime());
		data1 = yesterday_dt;
		temp = data1;
		fromDate =new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
		fromDate1 =new SimpleDateFormat("dd-MMM-yyyy").format(cal.getTime());

	} else {

		data1 = request.getParameter("data");
		System.out.println("Data 1-->"+data1);
		

		fromDate = new SimpleDateFormat("yyyy-MM-dd")
				.format(new SimpleDateFormat("dd-MMM-yyyy")
						.parse(data1));
		fromDate1 =request.getParameter("data");
		data2 = request.getParameter("data1");
		System.out.println("Data 2-->"+data2);
		toDate = new SimpleDateFormat("yyyy-MM-dd")
				.format(new SimpleDateFormat("dd-MMM-yyyy")
						.parse(data2));  

	} //end of else
%>
<%Date d=new Date();
	
String user="";
	Format df1= new SimpleDateFormat("dd-MMM-yyyy");
	String dtoday=df1.format(d);
	
	DateFormat df= new SimpleDateFormat("dd-MMM-yyyy");
	DateFormat d1= new SimpleDateFormat("yyyy-MM-dd"); 
	
	
	
	String name1=session.getAttribute("EmpName").toString();
	String department1=session.getAttribute("department").toString();

		
		
		
		String dt = new SimpleDateFormat("yyyy-MM-dd")
		.format(new SimpleDateFormat("dd-MMM-yyyy")
				.parse(datenew1));
		dt=dt+" 00:00:00";
		String dt1 = new SimpleDateFormat("yyyy-MM-dd")
		.format(new SimpleDateFormat("dd-MMM-yyyy")
				.parse(datenew2));
		dt1=dt1+" 23:59:59";
		
		System.out.println("dt:- "+dt);
		System.out.println("dt1:- "+dt1);
		System.out.println("fromDate1:- "+datenew1);
		System.out.println("dtoday:- "+datenew2);
		
		//cmp=cmp.replace("...","&");
		//cmp=cmp.replace("&","%26");
		
		
		String datef = new SimpleDateFormat("dd-MMM-yyyy")
		.format(new SimpleDateFormat("yyyy-MM-dd")
				.parse(dt));
		
		String datet = new SimpleDateFormat("dd-MMM-yyyy")
				.format(new SimpleDateFormat("yyyy-MM-dd")
						.parse(dt1));
				
		
		
		%>
		
		
<%
String name13="";
		String Bt=request.getParameter("button2");
		

System.out.println("----------In Button-------------"+Bt);
		if(Bt==null || Bt=="null" || Bt.equals("null"))
		{
			System.out.println("----------In Button-------------");

			String POStatus="Pending";
			String comid2=session.getAttribute("CompanyMasterID").toString();
			 name13=session.getAttribute("EmpName").toString();
			String Sesrole2=session.getAttribute("role").toString();
			
			System.out.println("Role :- "+Sesrole2);
			
			
			System.out.println("department-->"+department);
			
			String seldept=request.getParameter("companyName1"); 
        	System.out.println("******seldept*"+seldept);
        	
        	if(Sesrole2.equals("AllAdmin") || Sesrole2.equals("HOD"))
        	{
        		name13="All";	
        	}
        	else
        	{
        		name13=""+name13;
        	}
        	if(Sesrole2.equals("AllAdmin"))
			{
		          department="All";
			}
        	else
			{
				department=sessiondept;
			}
        	
        	System.out.println("Date :- "+datenew1);
        	
        	System.out.println("Date :- "+datenew2);
        	System.out.println("Name :- "+name13);
        	
        	if(name13=="All")
        	{
        		name13="";
        	}
        	if(department=="All")
        	{
        		department="";
        	}
        	

/* query12="select Empname as User,dotprojectid as UserID,empcode,HodReport as HOD ,Dept as Department,IFNULL((select sum(a.task_duration)  from dotproject.tasks a left join dotproject.user_tasks b on a.task_id=b.task_id  where task_end_date >='"+dt+"' and task_end_date <='"+dt1+"'  and user_id=c.dotprojectid ),0) as Assigned,IFNULL((select sum(d.AssignedDuration) from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"taskmaildata d where c.dotprojectid=d.userid and TaskEndDate >='"+dt+"' and TaskEndDate <='"+dt1+"' and d.TaskStatus!='Duplicate' ),0) as Submited,IFNULL((select sum(task_duration) from dotproject.user_tasks a left join dotproject.tasks b on  a.task_id=b.task_id where  a.user_id=c.dotprojectid and task_end_date >='"+dt+"' and task_end_date <='"+dt1+"' and b.task_id not in (select distinct(TaskID) from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"taskmaildata where TaskEndDate >='"+dt+"' and TaskEndDate <='"+dt1+"' and userid=c.dotprojectid ) ),0) as Missed ,IFNULL((select sum(d.AssignedDuration) from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"taskmaildata d where c.dotprojectid=d.userid and TaskEndDate >='"+dt+"' and TaskEndDate <='"+dt1+"'  and d.TaskStatus='Pending' ),0) as Pending,IFNULL(((select sum(d.AssignedDuration) from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"taskmaildata d where c.dotprojectid=d.userid and TaskStatus='Approved' and TaskEndDate >='"+dt+"' and TaskEndDate <='"+dt1+"' )),0) as Approved ,IFNULL(((select sum(d.AssignedDuration) from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"taskmaildata d where c.dotprojectid=d.userid and TaskStatus='Rejected' and TaskEndDate >='"+dt+"' and TaskEndDate <='"+dt1+"' )),0) as Rejected from db_GlobalERP.UserMaster c where c.activestatus='Yes' and c.companymasterid=100000 and c.dept like '%"+department+"%' and c.EmpName like '%"+name13+"%'  and (c.HODReport like '%"+name13+"%' OR c.EmpName like '%"+name13+"%' ) order by c.Empname";
 */

query12="select Empname as User,KRAdotprojectid as UserID,empcode,HodReport as HOD ,Dept as Department,IFNULL((select sum(a.task_duration)  from dotproject.tasks a left join dotproject.user_tasks b on a.task_id=b.task_id  where task_end_date >='"+dt+"' and task_end_date <='"+dt1+"' and user_id=c.KRAdotprojectid ),0) as Assigned,IFNULL((select sum(d.AssignedDuration) from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"taskmaildata d where c.KRAdotprojectid=d.userid and TaskEndDate >='"+dt+"' and TaskEndDate <='"+dt1+"' and d.TaskStatus!='Duplicate' ),0) as Submited,IFNULL((select sum(task_duration) from dotproject.user_tasks a left join dotproject.tasks b on  a.task_id=b.task_id where  a.user_id=c.KRAdotprojectid and task_end_date >='"+dt+"' and task_end_date <='"+dt1+"' and b.task_id not in (select distinct(TaskID) from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"taskmaildata where TaskEndDate >='"+dt+"' and TaskEndDate <='"+dt1+"' and userid=c.KRAdotprojectid ) ),0) as Missed ,IFNULL((select sum(d.AssignedDuration) from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"taskmaildata d where c.KRAdotprojectid=d.userid and TaskEndDate >='"+dt+"' and TaskEndDate <='"+dt1+"' and d.TaskStatus='Pending' ),0) as Pending,IFNULL(((select sum(d.AssignedDuration) from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"taskmaildata d where c.KRAdotprojectid=d.userid and TaskStatus='Approved' and TaskEndDate >='"+dt+"' and TaskEndDate <='"+dt1+"' )),0) as Approved ,IFNULL(((select sum(d.AssignedDuration) from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"taskmaildata d where c.KRAdotprojectid=d.userid and TaskStatus='Reject' and TaskEndDate >='"+dt+"' and TaskEndDate <='"+dt1+"' )),0) as Rejected from db_GlobalERP.UserMaster c where c.activestatus='Yes' and c.companymasterid=100000 and c.dept like '%"+department+"%' and c.EmpName like '%"+name13+"%'  and (c.HODReport like '%"+name13+"%' OR c.EmpName like '%"+name13+"%' ) and c.KRAdotprojectid !='-'  order by c.Empname";
System.out.println("query12---"+query12);
rs=stmt.executeQuery(query12);

int i=1;

while(rs.next())
{
	String User="",UserID="",empcode="",HOD="",Department="",Assigned="",Submitted="",Missed="",Pending="",Approved="",Rejected="";
	User=rs.getString("User");
	System.out.println("-User------->"+User);
	
	UserID=rs.getString("UserID");
	System.out.println("-UserID------->"+UserID);
	
	empcode=rs.getString("empcode");
	System.out.println("-empcode------->"+empcode);
	
	Assigned=rs.getString("Assigned");
	System.out.println("-Assigned------->"+Assigned);
	
	Submitted=rs.getString("Submited");
	System.out.println("-Submitted------->"+Submitted);
	
	Missed=rs.getString("Missed");
	System.out.println("-Missed------->"+Missed);
	
	Pending=rs.getString("Pending");
	System.out.println("-Pending------->"+Pending);
	
	Approved=rs.getString("Approved");
	System.out.println("-Approved------->"+Approved);
	
	Rejected=rs.getString("Rejected");
	System.out.println("-Rejected------->"+Rejected);
	
	HOD=rs.getString("HOD");
	System.out.println("-HOD------->"+HOD);
	
	Department=rs.getString("Department");
	System.out.println("-Department------->"+Department);
	
	
	
	
%>
   <tr>
			<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=i%></td>
			<td style="font-size: 11px; face:san-serif; color:black" align="left"><%=rs.getString("User")%></td>
			<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=rs.getString("UserID")%></td>
<td style="font-size: 11px;" align="right"><a href="TaskDetailsReport.jsp?userId=<%=UserID%>&fromdate=<%=datef%>&todate=<%=datet%>&HOD=<%=HOD%>&Dept=<%=Department%>&User=<%=User%>&Status=Assigned&role=<%=Sesrole2%>"><%=rs.getString("Assigned")%></a></td>
<td style="font-size: 11px;" align="right"><a href="TaskDetailsReport.jsp?userId=<%=UserID%>&fromdate=<%=datef%>&todate=<%=datet%>&HOD=<%=HOD%>&Dept=<%=Department%>&User=<%=User%>&Status=Submited&role=<%=Sesrole2%>"><%=rs.getString("Submited")%></a></td>
<td style="font-size: 11px;" align="right"><a href="TaskDetailsReport.jsp?userId=<%=UserID%>&fromdate=<%=datef%>&todate=<%=datet%>&HOD=<%=HOD%>&Dept=<%=Department%>&User=<%=User%>&Status=Missed&role=<%=Sesrole2%>"><%=rs.getString("Missed")%></a></td>
		
<td style="font-size: 11px;" align="right"><a href="TaskDetailsReport.jsp?userId=<%=UserID%>&fromdate=<%=datef%>&todate=<%=datet%>&HOD=<%=HOD%>&Dept=<%=Department%>&User=<%=User%>&Status=Pending&role=<%=Sesrole2%>"><%=rs.getString("Pending")%></a></td>
		
		
		
<td style="font-size: 11px;" align="right"><a href="TaskDetailsReport.jsp?userId=<%=UserID%>&fromdate=<%=datef%>&todate=<%=datet%>&HOD=<%=HOD%>&Dept=<%=Department%>&User=<%=User%>&Status=Approved&role=<%=Sesrole2%>"><%=rs.getString("Approved")%></a></td>
<td style="font-size: 11px;" align="right"><a href="TaskDetailsReport.jsp?userId=<%=UserID%>&fromdate=<%=datef%>&todate=<%=datet%>&HOD=<%=HOD%>&Dept=<%=Department%>&User=<%=User%>&Status=Rejected&role=<%=Sesrole2%>"><%=rs.getString("Rejected")%></a></td>
			
			<td style="font-size: 11px; face:san-serif; color:black" align="left"><%=rs.getString("Department")%></td>
			<td style="font-size: 11px; face:san-serif; color:black" align="left"><%=rs.getString("HOD")%></td>
	
  </tr>

<%
i++;
}
      
		}
		else
		{
			System.out.println("----------In Button-------------Else");
			String POStatus="Pending";
			String comid2=session.getAttribute("CompanyMasterID").toString();
			 name13=session.getAttribute("EmpName").toString();
			String Sesrole2=session.getAttribute("role").toString();
			
			System.out.println("Role :- "+Sesrole2);
			
			
			System.out.println("department-->"+department);
			
			String seldept=request.getParameter("companyName1"); 
        	System.out.println("******seldept*"+seldept);
        	
        	if(Sesrole2.equals("AllAdmin") || Sesrole2.equals("HOD"))
        	{
        		name13=Nam;	
        	}
        	else
        	{
        		name13=""+name13;
        	}
        	if(Sesrole2.equals("AllAdmin"))
        			{
        		department=seldept;
        			}else
        			{
        				department=seldept;
        			}
        	
        	System.out.println("Date :- "+datenew1);
        	
        	System.out.println("Date :- "+datenew2);
        	System.out.println("Name :- "+name13);
        	
        	if(name13.equals("All"))
        	{
        		name13="";
        	}
        	
			data11=tDate1;
			data12=tDate2;
			System.out.println("data11::"+data11);
			System.out.println("data12"+data12);
 
			
			data11 = new SimpleDateFormat("yyyy-MM-dd")
					.format(new SimpleDateFormat("dd-MMM-yyyy")
							.parse(datenew1));
			data11=data11+" 00:00:00";
	     	data12 = new SimpleDateFormat("yyyy-MM-dd")
					.format(new SimpleDateFormat("dd-MMM-yyyy")
							.parse(datenew2));
	     	data12=data12+" 23:59:59";
					
					System.out.println("data11::"+data11);
					System.out.println("data12"+data12);
		 
			
			 seldept=request.getParameter("companyName1"); 
        	System.out.println("******seldept*"+seldept);

/* query12="select Empname as User,dotprojectid as UserID,empcode,HodReport as HOD ,Dept as Department,IFNULL((select sum(a.task_duration)  from dotproject.tasks a left join dotproject.user_tasks b on a.task_id=b.task_id  where task_end_date >='"+data11+"' and task_end_date <='"+data12+"'  and user_id=c.dotprojectid ),0) as Assigned,IFNULL((select sum(d.AssignedDuration) from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"taskmaildata d where c.dotprojectid=d.userid and TaskEndDate >='"+data11+"' and TaskEndDate <='"+data12+"' and d.TaskStatus!='Duplicate' ),0) as Submited,IFNULL((select sum(task_duration) from dotproject.user_tasks a left join dotproject.tasks b on  a.task_id=b.task_id where  a.user_id=c.dotprojectid and task_end_date >='"+data11+"' and task_end_date <='"+data12+"' and b.task_id not in (select distinct(TaskID) from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"taskmaildata where TaskEndDate >='"+data11+"' and TaskEndDate <='"+data12+"' and userid=c.dotprojectid ) ),0) as Missed ,IFNULL((select sum(d.AssignedDuration) from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"taskmaildata d where c.dotprojectid=d.userid and TaskEndDate >='"+data11+"' and TaskEndDate <='"+data12+"'  and d.TaskStatus='Pending' ),0) as Pending,IFNULL(((select sum(d.AssignedDuration) from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"taskmaildata d where c.dotprojectid=d.userid and TaskStatus='Approved' and TaskEndDate >='"+data11+"' and TaskEndDate <='"+data12+"' )),0) as Approved ,IFNULL(((select sum(d.AssignedDuration) from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"taskmaildata d where c.dotprojectid=d.userid and TaskStatus='Rejected' and TaskEndDate >='"+data11+"' and TaskEndDate <='"+data12+"' )),0) as Rejected from db_GlobalERP.UserMaster c where c.activestatus='Yes' and c.companymasterid=100000 and c.dept like '%"+department+"%' and c.EmpName like '%"+name13+"%'  and (c.HODReport like '%"+name13+"%' OR c.EmpName like '%"+name13+"%' ) order by c.Empname";
 */
 
 
query12="select Empname as User,KRAdotprojectid as UserID,empcode,HodReport as HOD ,Dept as Department,IFNULL((select sum(a.task_duration)  from dotproject.tasks a left join dotproject.user_tasks b on a.task_id=b.task_id  where task_end_date >='"+data11+"' and task_end_date <='"+data12+"'  and user_id=c.KRAdotprojectid ),0) as Assigned,IFNULL((select sum(d.AssignedDuration) from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"taskmaildata d where c.KRAdotprojectid=d.userid and TaskEndDate >='"+data11+"' and TaskEndDate <='"+data12+"' and d.TaskStatus!='Duplicate' ),0) as Submited,IFNULL((select sum(task_duration) from dotproject.user_tasks a left join dotproject.tasks b on  a.task_id=b.task_id where  a.user_id=c.KRAdotprojectid and task_end_date >='"+data11+"' and task_end_date <='"+data12+"' and b.task_id not in (select distinct(TaskID) from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"taskmaildata where TaskEndDate >='"+data11+"' and TaskEndDate <='"+data12+"' and userid=c.KRAdotprojectid ) ),0) as Missed ,IFNULL((select sum(d.AssignedDuration) from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"taskmaildata d where c.KRAdotprojectid=d.userid and TaskEndDate >='"+data11+"' and TaskEndDate <='"+data12+"'  and d.TaskStatus='Pending' ),0) as Pending,IFNULL(((select sum(d.AssignedDuration) from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"taskmaildata d where c.KRAdotprojectid=d.userid and TaskStatus='Approved' and TaskEndDate >='"+data11+"' and TaskEndDate <='"+data12+"' )),0) as Approved ,IFNULL(((select sum(d.AssignedDuration) from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"taskmaildata d where c.KRAdotprojectid=d.userid and TaskStatus='Rejected' and TaskEndDate >='"+data11+"' and TaskEndDate <='"+data12+"' )),0) as Rejected from db_GlobalERP.UserMaster c where c.activestatus='Yes' and c.companymasterid=100000 and c.dept like '%"+department+"%' and c.EmpName like '%"+name13+"%'  and (c.HODReport like '%"+name13+"%' OR c.EmpName like '%"+name13+"%' ) order by c.Empname";

System.out.println("query12---"+query12);
rs=stmt.executeQuery(query12);

int i=1;

while(rs.next())
{
	String User="",UserID="",empcode="",HOD="",Department="",Assigned="",Submitted="",Missed="",Pending="",Approved="",Rejected="";
	User=rs.getString("User");
	System.out.println("-User------->"+User);
	
	UserID=rs.getString("UserID");
	System.out.println("-UserID------->"+UserID);
	
	empcode=rs.getString("empcode");
	System.out.println("-empcode------->"+empcode);
	
	Assigned=rs.getString("Assigned");
	System.out.println("-Assigned------->"+Assigned);
	
	Submitted=rs.getString("Submited");
	System.out.println("-Submitted------->"+Submitted);
	
	Missed=rs.getString("Missed");
	System.out.println("-Missed------->"+Missed);
	
	Pending=rs.getString("Pending");
	System.out.println("-Pending------->"+Pending);
	
	Approved=rs.getString("Approved");
	System.out.println("-Approved------->"+Approved);
	
	Rejected=rs.getString("Rejected");
	System.out.println("-Rejected------->"+Rejected);
	
	HOD=rs.getString("HOD");
	System.out.println("-HOD------->"+HOD);
	
	Department=rs.getString("Department");
	System.out.println("-Department------->"+Department);
	
	
	
	
%>
<tr>
			<tr>
			<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=i%></td>
			<td style="font-size: 11px; face:san-serif; color:black" align="left"><%=rs.getString("User")%></td>
			<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=rs.getString("UserID")%></td>
<td style="font-size: 11px;" align="right"><a href="TaskDetailsReport.jsp?userId=<%=UserID%>&fromdate=<%=datenew1%>&todate=<%=datenew2%>&HOD=<%=HOD%>&Dept=<%=Department%>&User=<%=User%>&Status=Assigned&role=<%=Sesrole2%>"><%=rs.getString("Assigned")%></a></td>
<td style="font-size: 11px;" align="right"><a href="TaskDetailsReport.jsp?userId=<%=UserID%>&fromdate=<%=datenew1%>&todate=<%=datenew2%>&HOD=<%=HOD%>&Dept=<%=Department%>&User=<%=User%>&Status=Submited&role=<%=Sesrole2%>"><%=rs.getString("Submited")%></a></td>
<td style="font-size: 11px;" align="right"><a href="TaskDetailsReport.jsp?userId=<%=UserID%>&fromdate=<%=datenew1%>&todate=<%=datenew2%>&HOD=<%=HOD%>&Dept=<%=Department%>&User=<%=User%>&Status=Missed&role=<%=Sesrole2%>"><%=rs.getString("Missed")%></a></td>
		
<td style="font-size: 11px;" align="right"><a href="TaskDetailsReport.jsp?userId=<%=UserID%>&fromdate=<%=datenew1%>&todate=<%=datenew2%>&HOD=<%=HOD%>&Dept=<%=Department%>&User=<%=User%>&Status=Pending&role=<%=Sesrole2%>"><%=rs.getString("Pending")%></a></td>
		
		
		
<td style="font-size: 11px;" align="right"><a href="TaskDetailsReport.jsp?userId=<%=UserID%>&fromdate=<%=datenew1%>&todate=<%=datenew2%>&HOD=<%=HOD%>&Dept=<%=Department%>&User=<%=User%>&Status=Approved&role=<%=Sesrole2%>"><%=rs.getString("Approved")%></a></td>
<td style="font-size: 11px;" align="right"><a href="TaskDetailsReport.jsp?userId=<%=UserID%>&fromdate=<%=datenew1%>&todate=<%=datenew2%>&HOD=<%=HOD%>&Dept=<%=Department%>&User=<%=User%>&Status=Rejected&role=<%=Sesrole2%>"><%=rs.getString("Rejected")%></a></td>
			
			<td style="font-size: 11px; face:san-serif; color:black" align="left"><%=rs.getString("Department")%></td>
			<td style="font-size: 11px; face:san-serif; color:black" align="left"><%=rs.getString("HOD")%></td>
	
  </tr>


		 </tr>

<%
i++;
}
               	
		%>
		 
			<%
		}
		
	
		

%>
</tbody>	
</table>
</form>
			
		
</div>		
	<%-- <%@ include file="footer_new.jsp" %> --%>		
	

<%@ include file="footer_new.jsp"%>


</jsp:useBean>



</body>
</html>



