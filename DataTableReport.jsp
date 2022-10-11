<%@page import="com.sun.corba.se.spi.orbutil.fsm.State"%>

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



<%@ include file="header.jsp"%>
<title>DataTable Report Format</title>


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




<style></style>


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
																	title : 'Vehicle FTRP Report '
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
																	title : 'Vehicle FTRP  Report '
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
																	title : 'Vehicle FTRP Report '
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
																	title : 'Vehicle FTRP Report '
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
																	title : 'Vehicle FTRP Report '
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


											"aoColumns" : [null,null,null,null,null,null]
										});
					});
	jQuery.extend(jQuery.fn.dataTableExt.oSort, {
		"date-uk-pre" : function(a) {
			var ukDatea = a.split('/');
			return (ukDatea[2] + ukDatea[1] + ukDatea[0]) * 1;
		},

		"date-uk-asc" : function(a, b) {
			return ((a < b) ? -1 : ((a > b) ? 1 : 0));
		},

		"date-uk-desc" : function(a, b) {
			return ((a < b) ? 1 : ((a > b) ? -1 : 0));
		}
	});
</script>



</head>
<script>
function checkAll()
{

	alert("ok checked");
	var field = document.getElementById("checkedNumber").value;
	alert(field);
//	var field=document.getElementsByName("chkbx");
//	alert("ok"+field);
	var i, chk=0;
	
	for (i = 0; i < field; i++)
	{
		 if(document.getElementById("check"+chk).checked == false)
		 {
			 alert("inn");
			 document.getElementById("check"+chk).checked = true;
		 }

		 chk++;
		
	}
}

function unCheckAll()
{

	alert("ok uncheck");
var field = document.getElementById("checkedNumber").value;

//var field=document.getElementsByName("chkbx");
  alert("ok"+field);
var kj=0,i;

for (i = 0; i < field; i++)
{
	
	 if(document.getElementById("check"+kj).checked == true )
	 {
		 document.getElementById("check"+kj).checked = false;
	 }
	 kj++;
}

}
</script>
<body>
<% 
int ck=0;
final String DB_URL = "jdbc:mysql://localhost:3306/test1";
final String DB_USER = "ashish";
final String DB_PASS = "Ashish@1992";

Connection conn;
Statement stmt;
ResultSet result;
try{
	Class.forName("com.mysql.cj.jdbc.Driver");   //  com.mysql.cj.jdbc.Driver
	}catch(ClassNotFoundException ex){
	ex.printStackTrace();
}
try{
conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
stmt = conn.createStatement();

String sql = "select * from emp order by srno";
System.out.println("sqlQuery==>" + sql);
%>
<br>
<br>
<div align="center">
<font face="san-serif" color="black" size="4"><b>DataTable Standard Report</b></font><br></br>

					
</div>
<br>
<br>
<table id="example" class="display" style="width: 100%; background:#1582AB; ">
		<thead>
			<tr>
			<th width="10%" style="font-size:11px ; background: #1582AB; color:white;face:san-serif;">
	<a href="#" onclick="checkAll()"><input type="hidden" name="check" id="check" value="">
	<font color="white">Chk &nbsp;&nbsp;/&nbsp;&nbsp;</font></a> 
	<a href="#" onclick="unCheckAll()"> <font color="white">UnChk</font></a>
	</th>
                <th width="4%" style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">Sr No</th>
				<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">Name</th>
				<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">City</th>
				<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">ID</th>
				<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">VehNo</th>
			</tr>
		</thead>
		<%
		result = stmt.executeQuery(sql);

		int i=1;
		while(result.next()) {
 %>
		<tbody>
		<tr>
		<td><input type="checkbox"  name="check<%=ck %>"   id="check<%=ck %>"  />
	    <div align="right"><input type="text" id="net_id1<%=ck %>" name="net_id1<%=ck %>" style="width:70px;padding: 4px 5px 2px 5px;
			border:none; text-align:right;		font: normal 11px Arial, Helvetica, sans-serif;
			 " value="<%=result.getInt("ID")%>" readonly/></div></td>
		<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=i++%></td>
		<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=result.getString("name")%></td>
		<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=result.getString("city")%></td>
		<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=result.getInt("ID")%></td>
		<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=result.getString("vehno") %></td>
		</tr>
		</tbody>
		<%
		ck++;
		} %>
		<tfoot>
			<tr>
				<th style="font-size:11px ; background: #1582AB; color:white;face:san-serif;">Chk/UnChk</th>
				<th width="4%" style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">Sr No</th>
				<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">Name</th>
				<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">City</th>
				<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">ID</th>
				<th style="font-size:12px ; background: #1582AB;  color:white;    face:san-serif;">VehNo</th>
			</tr>
		</tfoot>
	</table>
	<%
	}catch(SQLException sqlex){
	sqlex.printStackTrace();
	}%>
	<br>
	<br>
<%@ include file="footer_new.jsp"%>
<input type="hidden" name="checkedNumber" id="checkedNumber" value="<%=ck %>"/>
</body>
</html>