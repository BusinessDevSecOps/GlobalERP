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
<style>

</style>

<%@ include file="header.jsp"%>

<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page"> 
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<script type="text/javascript"  src="https://code.jquery.com/jquery-1.12.4.js"></script> 
<script type="text/javascript"  src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script> 



<!-- Export Options Links of DataTables -->

<!-- <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css"> -->
<!-- <script src=" https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script> -->
<!-- <script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script> -->
<!-- <script src=" https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script> -->
<!-- <script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script> -->
<!-- <script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script> -->
<!-- <script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script> -->
<!-- <script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script> -->
<!-- <script src=" https://cdn.datatables.net/select/1.2.5/js/dataTables.select.min.js "></script> -->


<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css">
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script> 
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script> 
<script src=" https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script>
<script src=" https://cdn.datatables.net/select/1.2.5/js/dataTables.select.min.js "></script>





 
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
	                        title: 'Customer Master ', 
	                       
	                     },
	                    {
	                        extend: 'pdfHtml5',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title: 'Customer Master',
	                        
	                        
	                    },
	                    {
	                        extend: 'csv',
	                        title: 'Customer Master ', 
	                    },
	                    {
	                        extend: 'print',
	                        title: 'Customer Master ', 
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Customer Master ', 
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
 function popup123(webadd)
 { 
	 alert("hhh");
 	var companyName = document.custreport.cod.value;
 		alert("companyName"+companyName);
 	window.open(webadd+'?Company='+companyName+'','','width=565,height=320,top=200,left=300,resizable=no');
 	
 }
 



 function checkAll()
 {

 	//alert("ok");
 	var field = document.getElementById("checkedNumber").value;
 //alert(field);
// 	var field=document.getElementsByName("chkbx");
// 	alert("ok"+field);
 	var i, chk=0;
 	try{
 	for (i = 0; i < field; i++)
 	{
 		 if(document.getElementById("check"+chk).checked == false)
 		 {
 			// alert("inn");
 			 document.getElementById("check"+chk).checked = true;
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
 var kj=0,i;
 try{
 for (i = 0; i < field; i++)
 {
 	
 	 if(document.getElementById("check"+kj).checked == true )
 	 {
 		 document.getElementById("check"+kj).checked = false;
 	 }
 	 kj++;
 }
 }catch(e){alert(e);}
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


<script type="text/javascript">

function check()
{
var v=document.getElemetbyId("Status").value;
alert(v);
}


</script>

<!-- <body onload="resetAll();"> -->
	<form name="custreport" id="custreport" method="get">

<div class="form" align="center" style="font-size: 13px;  ">
<br></br><br>
<font face="san-serif" color="black" size="4"><b>Customer Master</b></font><br></br>



	<table border="0" width=600 align="center">
		
	
	
		<tr align="center">
		
		<td align="center"  style="margin:left">
		<font face="Arial" color="black" size="2"><b>Representative&nbsp;&nbsp;
		
		</b></font>
		
		<select class="element select medium"  id="Representative" name="Representative" 
		onblur="check()"  style="width: 150px;  
		font-size: 12px; color:black;Arial; height: 25px;"  >
		<option value="Select"  >Select</option>
		<%
		
		String allocate="select distinct(EmpName),EmpCode from db_GlobalERP.UserMaster where EmpCode in (select distinct(Allocatedto) from db_GlobalERP.100000prospectivecustmaster) order by EmpName";
		ResultSet rsallocate=st1.executeQuery(allocate);
		while(rsallocate.next())
		{
			%>
			
			<option value='<%=rsallocate.getString("EmpCode")%>'><%=rsallocate.getString("EmpName")%></option>
			<% 
		}
		
		
		%>
							 								
									
		</select>&nbsp;&nbsp;
							
							
	
					 
					 </td>
					 
		<td align="center"  style="margin:left">
		<font face="Arial" color="black" size="2"><b>Type&nbsp;&nbsp;
		
		</b></font>
							<select class="element select medium"  id="Status" name="status" onblur="check()"  style="width: 120px;  font-size: 12px; color:black;Arial; height: 25px;"  required="required"> 								
									<!-- <option value="null" selected style="visibility: hidden;"></option> -->
									
									<option value="Prospect" >Prospect</option>
						
										<option value="Customer" >Customer</option>
										
									
							</select>&nbsp;&nbsp;
							<input type="submit" style="font-size: 12px;  height: 27px; face:san-serif; color:black" name="button" id="button" value="Submit">
	
					 
					 </td>
					 
					 
					 
		
		
		
		</tr>
		</table>
		</div>
		
		</form>
		
		
		<form name="indexReport11" method="post"  onsubmit="return getcheckedrow()" action="ReAllocation.jsp">
	
	
	
	<table align="right" style="width:100%">
<tr><td><input type="submit" name="Approve"  value="ReAssign" onclick="" />
</td>

			
				
</tr> 


</table>
















<div class="t1" style="width:100%">
<table id="example"  class="display"  a style="width:100%"  cellspacing="0" border="1"> 


<% 
ResultSet rs=null;
ResultSet rs1=null;
Statement stmt=null;
Statement st=null;
Statement stmt1=null;
int ck=0;

stmt=con1.createStatement();
stmt1=con1.createStatement();
st=con1.createStatement();
String compcode="";
String type=request.getParameter("status");
String Representative=request.getParameter("Representative");
System.out.println("-------->"+type);
String bt=request.getParameter("button");

System.out.println("Representative -------->"+Representative);

%>
<% 
if(type==null)
{%>
	<script>
	document.getElementById("Status").value = 'Customer';
	
	</script>
<%	type="Customer";
 }

else
{
	
	%>
<script>
document.getElementById("Status").value = '<% out.print(type); %>';
</script>
<% 
}

 
if(Representative==null)
{%>
	<script>
	document.getElementById("Representative").value = 'Select';
	
	</script>
<%	Representative="Select";
 }

else
{
	
	%>
<script>
document.getElementById("Representative").value = '<% out.print(Representative); %>';
</script>
<% 
}


String query="";
String EmpName="",dt="";
if(bt!=null)
{
if(type!=null)
{ %> 
	<%  
if(type.equals("Prospect"))
{
	
%>

<thead>
<tr>
<th style="font-size:11px ; background: #1582AB;  color:white;face:san-serif;">SrNo</th>
<th style="font-size:11px ; background: #1582AB; color:white;face:san-serif;">
	<a href="#" onclick="checkAll()"><input type="hidden" name="check" id="check" value="">
	<font color="white">Chk &nbsp;&nbsp;/&nbsp;&nbsp;</font></a> 
	<a href="#" onclick="unCheckAll()"> <font color="white">UnChk</font></a>
	</th><th style="font-size: 11px ;background: #1582AB;  color:white;face:san-serif;">Customer</th>
<th style="font-size: 11px ; background: #1582AB;  color:white;face:san-serif;">Contact</th>
<th style="font-size: 11px ;background: #1582AB;  color:white; face:san-serif;">Mobile</th>
<th style="font-size: 11px ;background: #1582AB;  color:white; face:san-serif;">Email</th>
<th style="font-size: 11px ;background: #1582AB;  color:white; face:san-serif;">EnteredOn</th>
 <th style="font-size: 11px ;background: #1582AB;  color:white; face:san-serif;">AllocatedTo</th>
<th style="font-size: 11px ;background: #1582AB;  color:white; face:san-serif;">Country</th>
<th style="font-size: 11px ;background: #1582AB;  color:white; face:san-serif;">State</th>
<th style="font-size: 11px ;background: #1582AB;  color:white; face:san-serif;">City</th>
<th style="font-size: 11px ;background: #1582AB;  color:white; face:san-serif;">Type</th>
 <th style="font-size: 11px ;background: #1582AB;  color:white; face:san-serif;">Status </th> 
</tr>
</thead>
<tbody>
<% 
 query="select distinct(CustomerCode),Allocatedto,SalesCustomerCode,AddedOnDate,CompanyName,ContactPerson,MobileNo,EMail,Country,State,City,IsDataValid from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"prospectivecustmaster where Allocatedto='"+Representative+"' and SalesCustomerCode=0 ";
 System.out.println("---"+query);
 rs=stmt.executeQuery(query);
 
 
 
 int i=1;
 while(rs.next())
 {
	 int allocatedto=rs.getInt("Allocatedto");
	 String Status=rs.getString("IsDataValid");
	 

	 
	
	
	 //Date date=rs.getDate("AddedOnDate");
	 
	// dt1=rs.getString("AddedOnDate");
	 
	 
		 dt=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("AddedOnDate")));
	String query1="select distinct(EmpName) from db_GlobalERP.UserMaster where EmpCode='"+allocatedto+"'";
	
	
	rs1=stmt1.executeQuery(query1);
	if(rs1.next())
	{
	EmpName=rs1.getString("EmpName");
	}
	 
	 if(Status.equals("0"))
	 {
		 Status="DeActive";
	 }
	 else
	 {
		 Status="Active";
	 }
	 
	 
	
	%>
	
	
	 <tr>
		<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=i%></td>
		
<td><input type="checkbox"  name="check<%=ck %>"   id="check<%=ck %>"  />
	    <div align="right"><input type="text" id="net_id1<%=ck %>" name="net_id1<%=ck %>" style="width:70px;padding: 4px 5px 2px 5px;
			border:none; text-align:right;		font: normal 11px Arial, Helvetica, sans-serif;
			 " value="<%=rs.getString("CustomerCode")%>" readonly/></div></td>

			 	
			 	
<%-- <td style="width: 85px;">
	    <div align="right"><input type="" id="net_id2<%=ck %>" name="net_id2<%=ck %>" style="width:200px;padding: 4px 5px 2px 5px;
			border:none; text-align:right;		font: normal 11px Arial, Helvetica, sans-serif;
			 " value="<%=rs.getString("CompanyName")%>" readonly/></div></td>	 --%>

<td style="font-size: 11px; face:san-serif; color:black" align="left"><%=rs.getString("CompanyName")%></td>

		<td style="font-size: 11px; face:san-serif; color:black" align="left"><%=rs.getString("ContactPerson")%></td>
		<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=rs.getString("MobileNo")%></td>
		<td style="font-size: 11px; face:san-serif; color:black" align="left"><%=rs.getString("EMail")%></td>
		<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=dt%></td>
		 <td style="font-size: 11px; face:san-serif; color:black" align="left"><%=EmpName%></td> 
		<td style="font-size: 11px; face:san-serif; color:black" align="left"><%=rs.getString("Country")%></td>
		<td style="font-size: 11px; face:san-serif; color:black" align="left"><%=rs.getString("State")%></td>
		<td style="font-size: 11px; face:san-serif; color:black" align="left"><%=rs.getString("City")%></td>
		<td style="font-size: 11px; face:san-serif; color:black" align="left">Prospect</td>
		<td style="font-size: 11px; face:san-serif; color:black" align="left"><%=Status%></td>
		
	 </tr>
	 <% 
	 i++;
		ck++; 

 
 }
 
 
 
 
}




else if(type.equals("Customer") )
{
	
	%>

	<thead>
	<tr>
	<th style="font-size:11px ; background: #1582AB;  color:white;face:san-serif;">SrNo</th>
<th style="font-size:11px ; background: #1582AB; color:white;face:san-serif;">
	<a href="#" onclick="checkAll()"><input type="hidden" name="check" id="check" value="">
	<font color="white">Chk &nbsp;&nbsp;/&nbsp;&nbsp;</font></a> 
	<a href="#" onclick="unCheckAll()"> <font color="white">UnChk</font></a>
	</th>	<th style="font-size: 11px ;background: #1582AB;  color:white;face:san-serif;">Customer</th>
	<th style="font-size: 11px ;background: #1582AB;  color:white;face:san-serif;">Branch</th>
	<th style="font-size: 11px ;background: #1582AB;  color:white;face:san-serif;">BillingGSTIN</th>
	<th style="font-size: 11px ;background: #1582AB;  color:white;face:san-serif;">ShippingGSTIN</th>
	<th style="font-size: 11px ; background: #1582AB;  color:white;face:san-serif;">Contact</th>
	<th style="font-size: 11px ;background: #1582AB;  color:white; face:san-serif;">Mobile</th>
	<th style="font-size: 11px ;background: #1582AB;  color:white; face:san-serif;">Email</th>
	<th style="font-size: 11px ;background: #1582AB;  color:white; face:san-serif;">EnteredOn</th>
	 <th style="font-size: 11px ;background: #1582AB;  color:white; face:san-serif;">AllocatedTo</th>
	<th style="font-size: 11px ;background: #1582AB;  color:white; face:san-serif;">Country</th>
	<th style="font-size: 11px ;background: #1582AB;  color:white; face:san-serif;">State</th>
	<th style="font-size: 11px ;background: #1582AB;  color:white; face:san-serif;">City</th>
	<th style="font-size: 11px ;background: #1582AB;  color:white; face:san-serif;">Type</th>
	 <th style="font-size: 11px ;background: #1582AB;  color:white; face:san-serif;">Status </th> 
	</tr>
	</thead>
	<tbody>
	<%
	query="select distinct(SalesCustomerCode),Allocatedto,SalesCustomerCode,AddedOnDate,CompanyName,ContactPerson,MobileNo,EMail,Country,State,City,IsDataValid from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"prospectivecustmaster where Allocatedto='"+Representative+"' and SalesCustomerCode!=0 and customercode!=0 " ;
	System.out.println("---"+query);
	
	
	
	rs=stmt.executeQuery(query);
	int i=1;
	
	 while(rs.next())
	 {
		 String Status=rs.getString("IsDataValid");
		 int allocatedto=rs.getInt("Allocatedto");
		 compcode=rs.getString("CompanyName");
		 //Date date=rs.getDate("AddedOnDate");
		 
		// dt1=rs.getString("AddedOnDate");
		 String BillingGSTN="",ShippingGSTN="",BranchName="";
		 
		 String GSTIN="select BillingGSTN,ShippingGSTN,BranchName from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"customerdet where customercode='"+rs.getString("SalesCustomerCode")+"'";
		 ResultSet rsGSTIN=st.executeQuery(GSTIN);
		 if(rsGSTIN.next())
		{
			 BillingGSTN=rsGSTIN.getString("BillingGSTN");
			 ShippingGSTN=rsGSTIN.getString("ShippingGSTN");
			 BranchName=rsGSTIN.getString("BranchName");
		}
		else
		{
			BillingGSTN="-";
			ShippingGSTN="-";
			BranchName="-";	 
		}
		 
			 dt=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("AddedOnDate")));
		 
		 
		 String query1="select distinct(EmpName) from db_GlobalERP.UserMaster where EmpCode='"+allocatedto+"'";
			
			
			rs1=stmt1.executeQuery(query1);
			if(rs1.next())
			{
			EmpName=rs1.getString("EmpName");
			}
		 
		 
		 
		 if(Status.equals("0"))
		 {
			 Status="DeActive";
		 }
		 else
		 {
			 Status="Active";
		 }
		%>
		 <tr>
			<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=i%></td>
<td><input type="checkbox"  name="check<%=ck %>"   id="check<%=ck %>"  />
	    <div align="right"><input type="text" id="net_id1<%=ck %>" name="net_id1<%=ck %>" style="width:70px;padding: 4px 5px 2px 5px;
			border:none; text-align:right;		font: normal 11px Arial, Helvetica, sans-serif;
			 " value="<%=rs.getString("SalesCustomerCode")%>" readonly/></div></td>		
			 	
			 	
<%-- <td style="width: 85px;">
	    <div align="right"><input type="text" id="net_id2<%=ck %>" name="net_id2<%=ck %>" style="width:70px;padding: 4px 5px 2px 5px;
			border:none; text-align:right;		font: normal 11px Arial, Helvetica, sans-serif;
			 " value="<%=rs.getString("CompanyName")%>" readonly/></div></td> --%>			 	
			 	
			<td style="font-size: 11px; face:san-serif; color:black" align="left"><%=rs.getString("CompanyName")%></td>
			<td style="font-size: 11px; face:san-serif; color:black" align="left"><%=BranchName%></td>
			<td style="font-size: 11px; face:san-serif; color:black" align="left"><%=BillingGSTN%></td>
			<td style="font-size: 11px; face:san-serif; color:black" align="left"><%=ShippingGSTN%></td>
			
			<td style="font-size: 11px; face:san-serif; color:black" align="left"><%=rs.getString("ContactPerson")%></td>
			<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=rs.getString("MobileNo")%></td>
			<td style="font-size: 11px; face:san-serif; color:black" align="left"><%=rs.getString("EMail")%></td>
			<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=dt %></td>
			<td style="font-size: 11px; face:san-serif; color:black" align="left"><%=EmpName%></td>
			<td style="font-size: 11px; face:san-serif; color:black" align="left"><%=rs.getString("Country")%></td>
			<td style="font-size: 11px; face:san-serif; color:black" align="left"><%=rs.getString("State")%></td>
			<td style="font-size: 11px; face:san-serif; color:black" align="left"><%=rs.getString("City")%></td>
			<td style="font-size: 11px; face:san-serif; color:black" align="left">Customer</td>
			<td style="font-size: 11px; face:san-serif; color:black" align="left"><%=Status%></td>
			
		 </tr>
		 
		 		<input type="hidden" name="compcode" id="compcode" value="<%=compcode %>"/>
		 
		 <% 
		 i++;
		ck++; 
		
		
		
	 }
}

}

}



%>













</tbody>
</table>

<div align="center" style="margin-top: 3em;">
		
		<input type="hidden" name="checkedNumber" id="checkedNumber" value="<%=ck %>"/>
		<%System.out.println("-filenal------->"+type);
 %>
				<input type="hidden" name="Type" id="Type" value="<%=type %>"/>
<%-- 						<input type="hidden" name="Company" id="Company" value="<%=compcode%>"/>
 --%>		
		</div>
</div>


</form>
<%@ include file="footer_new.jsp"%>

</jsp:useBean>


</body>
</html>