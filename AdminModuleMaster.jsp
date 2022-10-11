<%@ page language="java" import="java.sql.*" import="java.util.*" import="java.text.*" errorPage=""
    pageEncoding="ISO-8859-1"%>
    <%@ include file="header.jsp" %>
   <jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Admin Module Master</title>
<link href="css/style.css" rel="stylesheet" type="text/css"  />
<script src="js/sorttable.js" type="text/javascript"></script>
<script type="text/javascript">
function gotoExcel (elemId, frmFldId)  
{  
//alert("*********** ");

         var obj = document.getElementById(elemId);  

         var oFld = document.getElementById(frmFldId); 

          oFld.value = obj.innerHTML;  

          document.categoryform.action ="excel.jsp";     // CHANGE FORM NAME HERE

          document.forms["categoryform"].submit();       // CHANGE FORM NAME HERE

} 
function DeleteConfirm()
{
	var agree=confirm("Do You Want To Delete User?");
		if (agree)
			return true ;
		else
			return false ;
}
function InsertConfirm()
{
	var agree=confirm("Do You Want To Edit User?");
	if (agree)
		return true ;
	else
		return false ;	
}
</script>
</head>
<body>

<% erp.getConnection(DB_Driver,DB_NAME,DB_USERNAME,DB_PASSWORD); %>
<%!
Connection conn=null;
%>

<%
//////////



conn=erp.ReturnConnection();
Statement st=conn.createStatement();
Statement st1=conn.createStatement();
%>

<%
	String fromDate = "", toDate = "",fromDate1="";
	String data2="",data1="";

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
	
	
	Format df1= new SimpleDateFormat("dd-MMM-yyyy");
	String dtoday=df1.format(d);
	
	DateFormat df= new SimpleDateFormat("dd-MMM-yyyy");
	DateFormat d1= new SimpleDateFormat("yyyy-MM-dd"); %>
	 

<div align="center"><table  align="center" style="width: 70%;"><tr><td align="center" colspan="4"><a align="center" style="font-size:1.6em"><b>Admin Module Master</b></a></td></tr></table></div>

<div><table width ="100%" border="0"><tr align="left"><td><a href="AddNewUser.jsp"><b>Add New</b></a></td>	</tr></table></div>
<table width ="100%" border="0">	
<tr align="left">

<td align="right">
								<font size="1">&nbsp;&nbsp;&nbsp;<%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date())%></font>
				<a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('dept','tableHTML');"/>

	           <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img>
	
					<a href="#" onclick="window.print();return false;" title="Print"><img src="images/print.jpg" width="15px" height="15px"></img></a>
			 
				</td>					
		</tr></table>


<form  name="categoryform"id="categoryform" action="" method="post" name="">		
<%
String exportFileName="AdminModuleMaster.xls"; 
%>

<div id='dept' align="center" style="height: 400px;">
			
			<input type="hidden" id="tableHTML" name="tableHTML" value="" />   

	<input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" /> 
				
<table align="center" id="reporttbl" class="sortable" border="3" style=" color: black;border-collapse:collapse; width: 100%;" >
<thead>
	<tr>
		<th><b>Edit</b></th>
		<th><b>Sr No.</b></th>
		
		<th><b>User Name</b></th>
		<th><b>User Level</b></th>
		<th><b>Department</b></th>
		<th><b>Employee Code</b></th>
		<th><b>Employee Name</b></th>
		<th><b>TA Level</b></th>
		<th><b>Mobile No.</b></th>
		<th><b>Email</b></th>
		<th><b>Active Status</b></th>
		<th><b>HOD</b></th>
	</tr>
</thead>
<%
String sql="";
if((session.getAttribute("userLevel").toString().equalsIgnoreCase("level6")))
{
	sql="Select * from UserMaster";	
}
else
{
	sql="select * from "+session.getAttribute("CompanyMasterID").toString()+"security";
}

System.out.println("Sql->"+sql); 
 ResultSet rs = st1.executeQuery(sql);
 String name="",color="";
 int i=0;
 while(rs.next())
 {  
 %>
 <tr style="background:<%=color%>;">
<td  width="" align="right"><a href="editNewUser.jsp?UserName=<%=rs.getString("UserName")%>"><img src="images/edit.JPG" width ="18px" height="18px" onclick="return InsertConfirm();"></a></td>
<td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;">		
			<%= ++i%></td>	
<td style="text-align: left;font:normal 13px Arial,Helvtica,sans-serif;">		
			<%= rs.getString("UserName")%></td>
<td style="text-align: left;font:normal 13px Arial,Helvtica,sans-serif;">		
			<%= rs.getString("UserLevel")%></td>				
<td style="text-align: left;font:normal 13px Arial,Helvtica,sans-serif;">		
			<%= rs.getString("Dept")%></td>	
<td style="text-align: left;font:normal 13px Arial,Helvtica,sans-serif;">		
			<%= rs.getString("EmpCode")%></td>	
 <td style="text-align: left;font:normal 13px Arial,Helvtica,sans-serif;">		
			<%= rs.getString("EmpName")%></td>
 <td style="text-align: left;font:normal 13px Arial,Helvtica,sans-serif;">		
			<%= rs.getString("TALevel")%></td>
 <td style="text-align: left;font:normal 13px Arial,Helvtica,sans-serif;">		
			<%= rs.getString("mobileno")%></td>
 <td style="text-align: left;font:normal 13px Arial,Helvtica,sans-serif;">		
			<%= rs.getString("email")%></td>
<td style="text-align: left;font:normal 13px Arial,Helvtica,sans-serif;">		
			<%= rs.getString("ActiveStatus")%></td>
<td style="text-align: left;font:normal 13px Arial,Helvtica,sans-serif;">		
			<%= rs.getString("HodReport")%></td>
 </tr>
<% }conn.close();%>
</table></div></form>
<div id="footer">
	<p><a href="http://www.myfleetview.com"> Copyright &copy; 2009
	by Transworld Compressor Technologies Ltd. All Rights Reserved.</a></p>
	</div>
</body>
</html>
</jsp:useBean>