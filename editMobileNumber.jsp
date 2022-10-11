<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="conn.jsp"%>

<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">
	<html xmlns="http://www.w3.org/1999/xhtml">
	<head>

	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>Transworld Compressor-Technologies LTD, ERP</title>
	<link href="css/style.css" rel="stylesheet" type="text/css"
		media="screen" />
	<link href="css/table.css" rel="stylesheet" type="text/css"
		media="screen" />
	<style type="text/css">
</style>

	<script language="JavaScript1.2">

	function validate()
	{
		if(document.sendSMS.mobileNumberEntered.value.length !=12)
		{
			alert("Please check mobile no.  \n   It should be a 12 digits Number starting with 91 ");
			return false;
		}
		if(document.sendSMS.mobileNumberEntered.value.charAt(0) !=9)
		{
			alert("Mobile number should start with 91 ");
			return false;
		}
		if(document.sendSMS.mobileNumberEntered.value.charAt(1) !=1)
		{
			alert("Mobile number should start with 91 ");
			return false;
		}
		if(document.sendSMS.mobileNumberEntered.value=="")
		{
			alert("Please Enter Mobile Numbers");
			return false;
		}
		return true;
	}
</script>
	</head>
	<body>

	<%
		erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
	%>
	<%
		Connection conn = null;
			Statement st = null;
try{
			Class.forName(DB_Driver);
				conn = DriverManager.getConnection(DB_NAME, DB_USERNAME,
						DB_PASSWORD);
				  st = conn.createStatement();
			 
	%>
	<div align="center"
		style="font-size: 1.5em; margin-top: 1.0em; margin-bottom: 1.0em; background-color: #339CCB">.
	</div>


	<div align="center"
		style="font-size: 1.5em; margin-top: 1.0em; margin-bottom: 1.0em;">
	Edit Mobile number</div>
 <%  if(request.getParameter("mobileNumberEntered")==null) { %>
 <form name="sendSMS" action="" method="get" onSubmit="return validate();">
	
	<table>
<tr>
<td></td>
<td>	 
</td>
</tr>
		<tr>
			<td>
 <tr> 
					<td valign="middle" > 
					<%=session.getAttribute("EmpName") %></td>
					<td ><textarea name="userMob" rows="1" id="search-text" readonly="readonly"
						style='border-style: none; width: 200px; height: auto;'>(<%=session.getAttribute("EmpMobileNumber")%>)</textarea>
					</td>
		</tr>
 
		<tr>
			<td><br>
			</td>
		</tr>
		<tr>
			<td><b>Enter Mobile number</b> <br>(no should start with  91)<br> 
			</td>
			<td><input type="text" id="search-text" name="mobileNumberEntered" /></td>
		</tr>
 
		<tr>

		</tr>
		<tr>
			<td align="right"></td>
			<td align="left"><input type="submit" value="Save" /> &nbsp;&nbsp;&nbsp;
			<input type="reset" value="Clear" />&nbsp;&nbsp;&nbsp;
			<input type="button" value="Cancel" onclick="window.close()"/>
			</td>
			
		</tr>
	</table>

	</form>
	
	<% 
 }
	if(request.getParameter("mobileNumberEntered")!=null){
		
 
			String sql="UPDATE "+session.getAttribute("CompanyMasterID").toString()+"security set mobileno='"+request.getParameter("mobileNumberEntered").toString()+"'"+
			"  where UserName='"+session.getAttribute("user").toString()+"'";
			st.executeUpdate(sql);
			session.setAttribute("EmpMobileNumber",request.getParameter("mobileNumberEntered").toString());
 
		out.println("   Mobile number "+request.getParameter("mobileNumberEntered").toString()+ " added successfully");
		
	}
} catch (Exception e) {
out.print("!!!Connection Lost!!!");
}
finally{
	conn.close();
}
%>
	<div align="center"
		style="font-size: 1.5em; margin-top: 1.0em; margin-bottom: 1.0em; background-color: #339CCB">.
	</div>
	<br></br>

	<br><br> <br><br> <br><br> <br><br>
	<br><br> <br><br> <br><br> <br><br>
	<br><br> <br><br> <br><br> <br><br>
	<div id="footer">
	<p><a href="http://www.myfleetview.com"> Copyright &copy; 2009
	by Transworld Compressor Technologies Ltd. All Rights Reserved.</a></p>
	</div>
	<!-- end #footer -->
	</body>
	</html>
</jsp:useBean>