<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="conn.jsp"%>
<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">
	<html xmlns="http://www.w3.org/1999/xhtml">
	<head>

	<style type="text/css">
@import url(jscalendar-1.0/calendar-win2k-1.css);
</style>
	<style>
</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>

	<script src="sorttable.js" type="text/javascript"></script>

	<script src="dropdown.js" type="text/javascript"></script>
	<script src="ledgerDetails.js" type="text/javascript"></script>

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

	<link rel="stylesheet" type="text/css" href="css/chromestyle2.css" />

	<script type="text/javascript" src="css/chrome.js">
	
</script>
	</head>
	<body>
	<%
		erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
	%>
	<%
		Connection conn = null;
		ResultSet rs=null;
			Statement st = null, st1 = null, st2 = null;
			String rejectedEntries="ProspCustAddedOn,AddedOnDate,SalesCustomerCode,VendorCode";
			try {
				conn = erp.ReturnConnection();
				st = conn.createStatement();
				st2 = conn.createStatement();
				st1 = conn.createStatement();
					String sql="SELECT * FROM  "+session.getAttribute("CompanyMasterID").toString()+"prospectivecustmaster "+
					"  WHERE CompanyName='"+request.getParameter("companyName")+"'";
					System.out.print(sql);
					rs=st.executeQuery(sql);
 
	  if(rs.next()){
	%> 
				   	
	<div align="center"
		style="font-size: 1.5em; margin-top: 0.4em; margin-bottom: 0.4em; height: 4px; background-color: #339CCB">
	</div>

	<div align="center" style="font-size: 1.5em;">Current Details for : <a>
	<%=((rs.getString("companyName")!=null) ? rs.getString("companyName") : "-") %> 
	</a>
	</div>

	<div align="center"
		style="font-size: 1.5em; margin-top: 0.4em; margin-bottom: 1em; height: 4px; background-color: #339CCB">
	</div>

	<table bgcolor="#C6DEFF" width="100%" cellpadding="3" cellspacing="3">
		<tr>
			<td valign="top"><b>Customer Code </b></td>
			<td valign="top"><label><%=((rs.getString("CustomerCode")!=null) ? rs.getString("CustomerCode") : "-") %>
			</label></td>

			<td valign="top" >
			<table>
			<tr>
			<td><b>Address</b></td></tr>
			<tr><td><b>City</b></td></tr>
			<tr><td><b>State</b></td></tr>
			<tr><td><b>Country</b></td></tr>
			<tr><td><b>Zip</b></td>
			</tr>
			</table>
			</td>
			<td valign="top">
			<table>
			<tr>
			<td><%=((rs.getString("Address")!=null) ? rs.getString("Address") : "-")%></td></tr>
			<tr><td><%=((rs.getString("city")!=null) ? rs.getString("city") : "-")%></td></tr>
			<tr><td><%=((rs.getString("State")!=null) ? rs.getString("State") : "-")%></td></tr>
			<tr><td><%=((rs.getString("Country")!=null) ? rs.getString("Country") :"-" )%></td></tr>
			<tr><td><%=((rs.getString("Zip")!=null) ? rs.getString("Zip") :"-" ) %></td>
			</tr>
			</table>
			
			</td>
			
			<td valign="top"><b>Entered On</b></td>
			<td valign="top"><label><%=((rs.getString("ProspCustAddedOn")!=null) ? rs.getString("ProspCustAddedOn") : "-") %>
			</label></td>
		</tr>
		<tr>
			<td valign="top"><b>Contact Person</b></td>
			<td valign="top"><label><%=((rs.getString("ContactPerson")!=null) ? rs.getString("ContactPerson") : "-") %>
			</label></td>

			<td valign="top"><b>Entered By</b></td>
			<td valign="top"><%=((rs.getString("CustEnteredByRep")!=null) ? rs.getString("CustEnteredByRep") : "-") %><label>

			</label></td>
						
			<td valign="top"><b>Category</b></td>
			<td valign="top"><label><%=((rs.getString("Category")!=null) ? rs.getString("Category") : "-") %>
			</label></td>
		</tr>

		<tr>
			<td><b>Email</b></td>
			<td><label> <%=((rs.getString("Email")!=null) ? rs.getString("Email") : "-") %></label>
			</td>

			<td><b>STD,Phone,Mobile & Fax</b></td>
			<td><label><%=((rs.getString("STDCode")!=null) ? rs.getString("STDCode") : "-")+"  "+((rs.getString("Phone")!=null) ? rs.getString("Phone") : "-")+ " , "+
			 		((rs.getString("MobileNo")!=null) ? rs.getString("MobileNo") : "-")+ " ,  "+
			 		((rs.getString("Fax")!=null) ? rs.getString("Fax") : "-")
			
			 			 	 	
			 		%> </label></td>
			 											
			<td valign="top"><b>Residency No, Alternate No</b></td>
			<td valign="top"><label><%=((rs.getString("ResiNo")!=null) ? rs.getString("ResiNo") : "-")+" , "+
	 		((rs.getString("TelephoneNo2")!=null) ? rs.getString("TelephoneNo2") : "-") %>
			</label></td>

		</tr>
		<tr>
			<td><b>WebSite</b></td>
			<td><label><%=((rs.getString("WebSite")!=null) ? rs.getString("WebSite") : "-") %>
			</label></td>

			<td><b> Intrested Product:</b></td>
			<td><label> <%=((rs.getString("IntrestedProduct")!=null) ? rs.getString("IntrestedProduct") : "-") %></label>
			</td>
						
						<td valign="top"><b>Sales Customer Code</b></td>
			<td valign="top"><label><%=((rs.getString("SalesCustomerCode")!=null) ? rs.getString("SalesCustomerCode") : "-") %>
			</label></td>
		</tr>
		<tr>
			<td><b> Added On </b></td>
			<td><label><%=((rs.getString("AddedOnDate")!=null) ? rs.getString("AddedOnDate") : "-") %></label>
			</td>

			<td><b>Weekly Off on</b></td>
			<td><label> <%=((rs.getString("WeeklyOffon")!=null) ? rs.getString("WeeklyOffon") : "-") %></label>
			</td>
						
			<td valign="top"><b>Comments</b></td>
			<td valign="top"><label><%=((rs.getString("Comments")!=null) ? rs.getString("Comments") : "-") %>
			</label></td>
		</tr>
				<tr>
			<td><b> Potential Value </b></td>
			<td><label><%=((rs.getString("PotentialValue")!=null) ? rs.getString("PotentialValue") : "-") %></label>
			</td>

			<td><b>Assighned by</b></td>
			<td><label> <%=((rs.getString("Assighnedby")!=null) ? rs.getString("Assighnedby") : "-") %></label>
			</td>
						
			<td valign="top"><b>Lead Ref</b></td>
			<td valign="top"><label><%=((rs.getString("leadRef")!=null) ? rs.getString("leadRef") : "-") %>
			</label></td>
		</tr>
	</table>

	<%
	  }
} catch (Exception e) {
	e.printStackTrace();
}
		

try {
		String sql="SELECT * FROM  "+session.getAttribute("CompanyMasterID").toString()+"prospectHistory  "+
		"  WHERE CompanyName='"+request.getParameter("companyName")+"' order by UpdateDateTime desc";
		
		System.out.println(sql);System.out.println(sql);
		ResultSet rsHistory=st2.executeQuery(sql);
		ResultSet rsTmp=st1.executeQuery(sql);
		
		ResultSetMetaData rsMetaData=rs.getMetaData();
		System.out.println(" col cnt "+rsMetaData.getColumnCount());
	if(rsHistory.next()){
		rsTmp.next();
		System.out.println(rs.getString(3));
		int i=1;
		System.out.println("||||||||  "+rsHistory.getString("Address"));
		
		%>
				<br></br>
			<div align="center" style="font-size: 1.4em;">Prospect History : <a>
		</a>
		</div>
		<table width="100%" align="center" class="sortable" border="1">
	<tr>
		<th>Sr.No.</th>
		<th>Attribute Changed</th>
		<th>Changed To</th>
		<th>Changed From</th>
		<th>By</th>
		<th>On</th>
		<th>Reason</th>
	</tr>
		
		<%
		int srCount=1;
		 while(i<=rsMetaData.getColumnCount())
		 {
			 System.out.println(i+"   "+rs.getString(i)+"  "+rsHistory.getString(i));
			 if(!(null==rsHistory.getString(i) && null==rs.getString(i)))
				 if(!(null==rsHistory.getString(i) || null==rs.getString(i)))
				 {
					 if((!(rsHistory.getString(i).equalsIgnoreCase(rs.getString(i))) && !rejectedEntries.contains(rsMetaData.getColumnName(i)) ))
					 {
				 		System.out.println("*----------*"+rsHistory.getString(i));
					%><tr>
						<td align="right"><div align="right"><%=srCount++ %></div></td>
						<td align="left"><div align="left"><%=rsMetaData.getColumnName(i) %></div></td>
						<td align="left"><div align="left"><%=rs.getString(i) %></div></td>
						<td align="left"><div align="left"><%=rsHistory.getString(i) %></div></td>
						<td align="left"><div align="left"><%=rsHistory.getString("UpdatedBy") %></div></td>
						<td align="left"><div align="left"><%=new SimpleDateFormat(
						"dd-MMM-yyyy HH:mm:ss")
						.format(new SimpleDateFormat(
								"yyyy-MM-dd hh:mm:ss")
								.parse(rsHistory.getString("UpdateDateTime"))) %></div></td>
						<td align="left"><div align="left"><%=rsHistory.getString("reasonForUpdate") %></div></td>
					</tr>
					<%
					 }
				 }else if(! rejectedEntries.contains(rsMetaData.getColumnName(i))){
						System.out.println("*NULL*"+rsHistory.getString(i));
						%><tr>
						<td align="right"><div align="right"><%=srCount++ %></div></td>
						<td align="left"><div align="left"><%=rsMetaData.getColumnName(i) %></div></td>
						<td align="left"><div align="left"><%=rs.getString(i) %></div></td>
						<td align="left"><div align="left"><%=rsHistory.getString(i) %></div></td>
						<td align="left"><div align="left"><%=rsHistory.getString("UpdatedBy") %></div></td>
						<td align="left"><div align="left"><%=new SimpleDateFormat(
						"dd-MMM-yyyy HH:mm:ss")
						.format(new SimpleDateFormat(
								"yyyy-MM-dd hh:mm:ss")
								.parse(rsHistory.getString("UpdateDateTime"))) %></div></td>
						<td align="left"><div align="left"><%=rsHistory.getString("reasonForUpdate") %></div></td>
					</tr>
					<%
						
				 }
			 i++;
		 }
		System.out.println("-----------------------------------------");
		
		 while(rsTmp.next()){
			 i=1;
			 while(i<=rsMetaData.getColumnCount())
			 {
			 System.out.println(i+"   "+rsTmp.getString(i)+"  "+rsHistory.getString(i));
			 if(!(null==rsHistory.getString(i) && null==rsTmp.getString(i)))
				 if(!(null==rsHistory.getString(i) || null==rsTmp.getString(i)))
				 {
					 if((!(rsHistory.getString(i).equalsIgnoreCase(rsTmp.getString(i))) && !rejectedEntries.contains(rsMetaData.getColumnName(i)) ))
					 {
				 		System.out.println("**"+rsHistory.getString(i));
				 		%><tr>
						<td align="right"><div align="right"><%=srCount++ %></div></td>
						<td align="left"><div align="left"><%=rsMetaData.getColumnName(i) %></div></td>
						<td align="left"><div align="left"><%=rs.getString(i) %></div></td>
						<td align="left"><div align="left"><%=rsHistory.getString(i) %></div></td>
						<td align="left"><div align="left"><%=rsHistory.getString("UpdatedBy") %></div></td>
						<td align="left"><div align="left"><%=new SimpleDateFormat(
						"dd-MMM-yyyy HH:mm:ss")
						.format(new SimpleDateFormat(
								"yyyy-MM-dd hh:mm:ss")
								.parse(rsHistory.getString("UpdateDateTime"))) %></div></td>
						<td align="left"><div align="left"><%=rsHistory.getString("reasonForUpdate") %></div></td>
					</tr>
					<%
					 }
				 }else if(! rejectedEntries.contains(rsMetaData.getColumnName(i))){
						System.out.println("*NULL*"+rsHistory.getString(i));
						%><tr>
						<td align="right"><div align="right"><%=srCount++ %></div></td>
						<td align="left"><div align="left"><%=rsMetaData.getColumnName(i) %></div></td>
						<td align="left"><div align="left"><%=rs.getString(i) %></div></td>
						<td align="left"><div align="left"><%=rsHistory.getString(i) %></div></td>
						<td align="left"><div align="left"><%=rsHistory.getString("UpdatedBy") %></div></td>
						<td align="left"><div align="left"><%=new SimpleDateFormat(
						"dd-MMM-yyyy HH:mm:ss")
						.format(new SimpleDateFormat(
								"yyyy-MM-dd hh:mm:ss")
								.parse(rsHistory.getString("UpdateDateTime"))) %></div></td>
						<td align="left"><div align="left"><%=rsHistory.getString("reasonForUpdate") %></div></td>
					</tr>
					<%
				 }
			 i++;
			 }
			
			 rsHistory.next();
		 }
	%>
</table>
	<%
	
	
	
	
	
	
	}else{ %>
		<br></br>
			<div align="center" style="font-size: 1.3em;"> ---No Edit History--- <a>
		</a>
		</div>
	<%}
}catch(Exception e){
e.printStackTrace();
}
	%>
	<br><br> <br><br> <br><br> <br><br>

	<div id="footer">
	<p><a href="http://www.myfleetview.com"> Copyright &copy; 2009
	by Transworld Compressor Technologies Ltd. All Rights Reserved.</a></p>
	</div>
	<!-- end #footer -->
	</body>
	</html>
</jsp:useBean>