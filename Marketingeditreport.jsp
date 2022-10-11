<html>
<%@ include file="header.jsp"%>
<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">
	<script src="dropdown.js" type="text/javascript"></script>
	<script src="ledgerDetails.js" type="text/javascript"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<link rel="stylesheet"
		href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<!-- Export Options Links of DataTables -->

	<link rel="stylesheet"
		href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css ">

	<script type="text/javascript" src="datatablejs/bootstrap.js"></script>

	<script
		src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js "></script>
	<script
		src=" https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js "></script>
	<script
		src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js "></script>
	<script
		src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js "></script>
	<script
		src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js "></script>
	<script
		src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script>

	<script type="text/javascript" src="datatablejs/buttons.colVis.min.js"></script>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$('#example')
									.DataTable(
											{
												//	"pagingType": "full_numbers",

												dom : 'Blfrtip',
												"bLengthChange" : false,
												buttons : [

														{
															extend : 'collection',

															text : 'Export',
															buttons : [
																	{
																		extend : 'excel',
																		title : 'Marketingedit Report '
																				+ $(
																						"#data")
																						.val()
																				+ '-'
																				+ $(
																						"#data1")
																						.val(),
																	},
																	{
																		extend : 'pdf',
																		orientation : 'landscape',
																		pageSize : 'LEGAL',
																		title : 'Marketingedit  Report '
																				+ $(
																						"#data")
																						.val()
																				+ '-'
																				+ $(
																						"#data1")
																						.val(),
																	},
																	{
																		extend : 'csv',
																		title : 'Marketingedit Report '
																				+ $(
																						"#data")
																						.val()
																				+ '-'
																				+ $(
																						"#data1")
																						.val(),
																	},
																	{
																		extend : 'print',
																		title : 'Marketingedit Report '
																				+ $(
																						"#data")
																						.val()
																				+ '-'
																				+ $(
																						"#data1")
																						.val(),
																	},
																	{
																		extend : 'copy',
																		title : 'Marketingedit Report '
																				+ $(
																						"#data")
																						.val()
																				+ '-'
																				+ $(
																						"#data1")
																						.val(),
																	},

															/* 'copy', 'csv', 'excel', 'pdf', 'print' */

															]
														},

														'colvis', 'pageLength' ],

												"oLanguage" : {
													"sSearch" : "Search"
												},

												lengthMenu : [
														[ 10, 25, 50, -1 ],
														[ '10 Rows', '25 Rows',
																'50 Rows',
																'Show all' ],

												],

												"aoColumns" : [ null, null,
														null, null, null, null,
														null

												]
											});
						});
	</script>


	<script language="JavaScript1.2">
		
function popup(repname)
{
	window.open("addNewMarketingRep.jsp?type=edit&repname="+repname,'jav');
}

function popup2(repname)
{

	  var agree=confirm("Do You Really Want To Deactivate This User ?");
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
			ajaxRequest.onreadystatechange = function()
			{
				if(ajaxRequest.readyState == 4)
				{
					var reslt=ajaxRequest.responseText;
					if(reslt="Yes")
					{
				alert("User Deactivated Sussessfully.");
					}
					else if(reslt="No")
					{ 
						 alert("User is Not Deactivated.Pls Try Again !! ");
								
					}
							reload();
				} 
			}
			var queryString = "?repname="+repname;
			try
			{
				ajaxRequest.open("GET", "deactivateuser.jsp" + queryString, true);
				ajaxRequest.send(null);
			} 
			catch (e) 
			{
				alert(e);
			} 
	  }
	   else
	   {
		   return false;
	   }
	
}

function reload()
{
	window.location.reload();
} 

	</script>


	<body>
		<%
			String sort = "SrNo";
				erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
				String comid = session.getAttribute("CompanyMasterID").toString();
				try {
					sort = request.getParameter("sort");
					if (sort == null)
						sort = "SrNo";
				} catch (Exception e) {
					sort = "SrNo";
				}
		%>
		<%
			Connection conn = null;
				Statement st = null, st1 = null, st3 = null, st4 = null, s5 = null;
				Statement st2 = null;
				String selectedName, emp = "";
				String FollowUpType = "";
				Format format = new SimpleDateFormat("dd-MMM-yyyy");
				Format parse = new SimpleDateFormat("yyyy-MM-dd");
				String fromDate = "", toDate = "", fromDateCal = "", toDateCal = "";
				String companyName = "", phone = "", contact = "", email = "", product = "", city = "", status = "";
				int i = 1;
		%>
		<%
			Date today = new Date();
				Calendar cal = Calendar.getInstance();
				cal.setTime(today);
				cal.add(Calendar.DAY_OF_MONTH, -30);
				Date today30 = cal.getTime();
				fromDateCal = new SimpleDateFormat("dd-MMM-yyyy").format(today30);
				toDateCal = new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
				fromDate = new SimpleDateFormat("yyyy-MM-dd").format(today30);
				toDate = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
				if (!(null == request.getParameter("fromdate"))) {
					fromDate = new SimpleDateFormat("yyyy-MM-dd")
							.format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("fromdate")));
					fromDateCal = request.getParameter("fromdate");
				}
				if (!(null == request.getParameter("todate"))) {
					toDate = new SimpleDateFormat("yyyy-MM-dd")
							.format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("todate")));
					toDateCal = request.getParameter("todate");
				}

				try {
					conn = erp.ReturnConnection();
					st = conn.createStatement();
					st1 = conn.createStatement();
					st2 = conn.createStatement();
					s5 = conn.createStatement();

				} catch (Exception e) {
				}
				if (null == request.getParameter("repName"))
					selectedName = "All";
				else
					selectedName = request.getParameter("repName");
				String group = "";
		%>

		<div style="font-size: 1.7em; text-align: center;">
			<a>Marketing Master Report. </a>
		</div>
		<br>
		<table id="example" class="sortable">
			<thead>
				<tr>
					<th>Sr No</th>
					<th>Name</th>
					<th>Email</th>
					<th>Phone</th>
					<th>Group</th>
					<th>Edit</th>
					<th>deactivate</th>
				</tr>
			</thead>
			<tbody>
				<%
					String sql = "SELECT * FROM " + session.getAttribute("CompanyMasterID").toString()
								+ "marketingrepmaster   WHERE username<>'' AND password<>''  AND ("
								+ " OtherGroups=1 OR Compressor=1 OR	DigitalEquipment=1 OR 	DGSet=1 OR 	Endoscope=1 OR 	OtherGroups=1) order by MarketingRepName";
						ResultSet rs = st.executeQuery(sql);
						while (rs.next()) {
							if (rs.getInt("Compressor") == 1) {
								group = "Compressor";
							}
							if (rs.getInt("DigitalEquipment") == 1) {
								group = "DigitalEquipment";
							}
							if (rs.getInt("DGSet") == 1) {
								group = "DGSet";
							}
							if (rs.getInt("Endoscope") == 1) {
								group = "Endoscope";
							}
							if (rs.getInt("OtherGroups") == 1) {
								group = "OtherGroups";
							}
				%>
				<tr>
					<td><div align="right"><%=i++%></div></td>
					<td><div align="left"><%=rs.getString("MarketingRepName")%></div></td>
					<td><div align="left"><%=rs.getString("MarketingRepEMail")%></div></td>
					<td><div align="right"><%=rs.getString("MarketingRepPhNo")%></div></td>
					<td><div align="left"><%=group%></div></td>
					<td><div align="center">
							<a href="#" style="font-weight: bold; color: black;"
								onclick="popup('<%=rs.getString("MarketingRepName")%>');"> <img
									src="images/edit1.jpeg" width="20px" height="18px"
									style="border-style: none"></img></a>
						</div></td>
					<td><div align="left">
							<a href="#"
								onclick="popup2('<%=rs.getString("MarketingRepName")%>');">Deactivate</a>
						</div></td>
				</tr>


				<%
					}
				%>
			</tbody>
		</table>
		<%-- 
<form action="" method="post">
<select name="sort">

<%String t="";
	 
 	 if(!sort.equalsIgnoreCase("SrNo")){
 		 if(sort.equalsIgnoreCase("MarketingRepName")){
 			 t="Name";
 		 }
 		 if(sort.equalsIgnoreCase("MarketingRepEMail")){
 			 t="Email";
 		 }
 		 if(sort.equalsIgnoreCase("MarketingRepPhNo")){
 			 t="Phone";
 		 }
		 
 		 if(sort.equalsIgnoreCase("Compressor")){
 			 t="Group";
 		 }
		 
 		 %> 
	<option value="<%=sort%>"><%=t %></option> 
}else{ 

	<option value="SrNo">SrNo</option> 
 	<%}%> 

<% if(sort.equalsIgnoreCase("SrNo")){
	%><option value="SrNo" selected="selected">SrNo</option><%
	}else{%>
	<option value="SrNo">SrNo</option>
	<%} if(sort.equalsIgnoreCase("MarketingRepName")){%><option value="MarketingRepName" selected>Name</option><%}else{ %>
	<option value="MarketingRepName">Name</option>
	<%}if(sort.equalsIgnoreCase("MarketingRepEMail")){%><option value="MarketingRepEMail" selected>Email</option><%}else{%>
	<option value="MarketingRepEMail">Email</option>
	<%}if(sort.equalsIgnoreCase("Compressor")){%><option value="Compressor" selected>Group</option><%}else{%>
	<option value="Compressor">Group</option>
	<%}%>
	
	<input type="submit" value="Go"/>
</form>  --%>
		<%
			String dt = "";
		%>
		<!-- <select>

<option value="SrNo">SrNo</option> 
<option value="MarketingRepName">Name</option>
 <option value="MarketingRepEMail">Email</option>
<option value="MarketingRepPhNo">Phone</option> 
<option value="Compressor">Group</option>
</select> -->

		<div align="right">
			<td align="right" bgcolor="#FFFFFF"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date())%></td>
		</div>
		<%-- <%
   //out.println(sort+"---"+t);

if(request.getParameter("companyNames")!=null && null != request.getParameter("isCheckedAll")){ %>
<div id="reportData">
<iframe id="myIframe" width="100%" height="850px" src="http://twtech.in:8080/birt/frameset?__report=MarketingEditReport.rptdesign&companyid=<%= comid %>&Sort=<%=sort %>&__showtitle=false">
</iframe> 
</div>
<%}else{
	%>
	<div id="reportData">
<iframe id="myIframe" width="100%" height="850px" src="http://twtech.in:8080/birt/frameset?__report=MarketingEditReport.rptdesign&companyid=<%= comid %>&Sort=<%=sort %>&__showtitle=false">
</iframe> 
</div>
	
	
	<%} %> --%>

		<!-- <br><br> <br><br> <br><br> <br><br> 
 	<br><br> <br><br> <br><br> <br><br> 
 		<br><br> <br><-br> <br><br> <br><br>  -->

		<!-- <p><a href="http://www.myfleetview.com"> Copyright &copy; 2009 
 	by Transworld  Technologies Ltd. All Rights Reserved.</a></p> 
 	</div> 
	 end #footer -->





	</body></html>
</jsp:useBean>
<%@include file="footer_new.jsp"%>























