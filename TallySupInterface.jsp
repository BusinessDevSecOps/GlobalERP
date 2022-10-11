<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="header.jsp"%>
<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">
	<%@page import="java.util.Date"%>


	<script language="JavaScript1.2">
	function validate()
	{
		
        var agree=confirm("continue with : "+document.updateErpFromTally.tallysupplier.value);
		if (agree)
			return true ;
		else
			return false ;
	}
	
	
</script>
	
	
	
	<%
		erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
	%>
	<%
		Connection conn = null;
			Statement st = null, st1 = null, st3 = null, st4 = null;
			Statement st2 = null;
	%>
	<%
		String fromDateCal = "", toDateCal = "", erpcustomer = "", tallycustomer = "", customercode = "",SupplierName="";
		fromDateCal = toDateCal = new SimpleDateFormat("dd-MMM-yyyy")
					.format(new java.util.Date());
		try {
				conn = erp.ReturnConnection();
				st = conn.createStatement();
				st1 = conn.createStatement();
				st2 = conn.createStatement();
				st3 = conn.createStatement();
				st4 = conn.createStatement();
			} catch (Exception e) {
			}

			String supplier = request.getParameter("SupplierName");
			System.out.println(request.getParameter("erpsupplier")+"*******>>>>   " + supplier);
	%>

	<div
		style="font-size: 1.8em; text-align: center; margin-top: 1.0em; margin-bottom: 1.0em;">
	<a>Tally Interface</a></div>

	<form name="updateErpFromTally" action="" onSubmit="return validate();">

	<table align="center" border="0">
		<tr>

			<th>SUPPLIER NAME</th>
			<th>TALLY SUPPLIER</th>

		</tr>

		<tr>
			<%
				if (request.getParameter("SupplierName") != null) {
			%>
			<td><%=supplier%>
			<input type="hidden" name="erpsupplier" value="<%=request.getParameter("erpsupplier") %>" />
			</td>
			<%
				} else {
			%>
			
			
			<td><select name="erpsupplier" id="erpsupplier"
				style="width: 250px; height: 30px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000;">
			
			
				<%
					String sql1 = "Select SupplierName,SupplierCode from "+session.getAttribute("CompanyMasterID").toString()+"supplierdet WHERE TallyName IS NULL and TransactionExisted='yes' ORDER BY SupplierName LIMIT 100";
							ResultSet rs1 = st.executeQuery(sql1);
				%>
				<option value="select">SELECT</option>
				<%
					while (rs1.next()) {
				%>
				<option style="width: 250px; height: 30px"
					value="<%=rs1.getString("SupplierCode")%>"><%=rs1.getString(1)%>&nbsp;&nbsp;
			
				</option>
				<%
					}
						} 
				%>
			
			</select></td>
			
			<td><select name="tallysupplier" id="tallysupplier"
				style="width: 250px; height: 30px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000;">
				<%
					String sql2 = "SELECT * from "+session.getAttribute("CompanyMasterID").toString()+"tallysupplier  ORDER BY Companyname ASC";
					ResultSet rs2 = st1.executeQuery(sql2);
				%>
				<option style="width: 250px; height: 30px" value="select">SELECT</option>
				<%
					while (rs2.next()) {
				%>
				<option value="<%=rs2.getString("Companyname")%>"><%=rs2.getString(1)%></option>
				<%
					}
				%>
			
			
			</select></td>
			
			<td>&nbsp;
			<input type="hidden" name="updateRecord" value="true" />
			</td>
			<td><input type="submit" id="search-submit"
				name="submitFollowUp" value="Go" /></td>
		
		</tr>
	
	</table>
	
	</form>
	
	<%
	System.out.println("<<<<<<<<<<<<       "+request.getParameter("tallysupplier"));
	if(request.getParameter("updateRecord")!=null)
	{
		String sqlUpdate = "UPDATE "+session.getAttribute("CompanyMasterID").toString()+"supplierdet SET TallyName='"+request.getParameter("tallysupplier")+"' WHERE SupplierCode='"+request.getParameter("erpsupplier")+"' ";
			System.out.println(sqlUpdate);
			st2.executeUpdate(sqlUpdate);
	}
	%>
<br>
<div align="center">
<input type="button" name="tallycustomer"
				style="border: outset;" value="View Updated Customers" onclick="window.open('TallySupList.jsp')"/></div>
	
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