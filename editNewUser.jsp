<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="header.jsp"%><%@page import="java.util.Date"%>
<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">

	<html>
<head>


<script type="text/javascript">
	function viewSign(webadd) {

		var user = document.getElementById("UserName").value;
		/* alert(webadd+"--"+user); */
		window.open(webadd + '?UserName=' + user, 'View Signature',
				'left=200,top=200,width=500,height=300,toolbar=0,resizable=0');
		return false;
	}
	function Changing(name) {
		// alert("in fun");
		//var name=document.getElementById("Selectuser").options[document.getElementById("Selectuser").selectedIndex].value;
		//alert(name);	 
		var ajaxRequest; // The variable that makes Ajax possible!
		try {
			// Opera 8.0+, Firefox, Safari
			ajaxRequest = new XMLHttpRequest();
		} catch (e) {
			// Internet Explorer Browsers
			try {
				ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
					// Something went wrong
					alert("Your browser broke!");
					return false;
				}
			}
		}

		// Create a function that will receive data sent from the server
		ajaxRequest.onreadystatechange = function() {
			if (ajaxRequest.readyState == 4) {
				var reslt = ajaxRequest.responseText;
				///alert(">>>    "+reslt);
				var data = reslt.split("ZZ");
				//alert("<*****  "+data);
				//alert(data[0]);
				if (data[0].indexOf("Yes") != -1) {
					///window.location.reload();
					//alert("data fetch successfully");
					document.getElementById("UserName").value = data[1];
					document.getElementById("UserLevel").value = data[2];
					document.getElementById("Department").value = data[3];
					document.getElementById("UserLevelAccess").value = data[4];
					document.getElementById("EmpCode").value = data[5];
					document.getElementById("TALevel").value = data[6];
					document.getElementById("mobileno").value = data[7];
					document.getElementById("email").value = data[8];
					//alert(data[9]);
					document.getElementById("ActiveStatus").value = data[9];
					document.getElementById("hod").value = data[10];
					//	data[9]=document.editNewUser.ActiveStatus.value;

					//alert(data[9]);
					//alert(">>>    "+document.editNewUser.ActiveStatus.value);

				} else {
					//alert("data not fetch successfully");

				}
			}
		}

		var queryString = "?action=display&name=" + name;
		//alert(queryString);

		ajaxRequest.open("GET", "AjaxEditUser.jsp" + queryString, true);
		ajaxRequest.send(null);
	}

	function showVisitingCardDetails(username) {
		//alert("in fun");
		document.getElementById("Selectuser").value = username;
		Changing(username);
		document.getElementById("userlist").style.visibility = 'hidden';

	}
	function showVisitingCardDetailsHod(username) {
		//alert("in fun");
		document.getElementById("hod").value = username;
		//Changing(username);
		document.getElementById("userlist").style.visibility = 'hidden';

	}
	function getUser() {
		//alert(" in fun");

		//alert("1");
		var username = document.getElementById("Selectuser").value;

		if (username.length == "") {
			document.getElementById("userlist").style.visibility = "hidden";
			document.getElementById("UserName").value = "";
			document.getElementById("UserLevel").value = "";
			document.getElementById("Department").value = "";
			document.getElementById("UserLevelAccess").value = "";
			document.getElementById("EmpCode").value = "";
			document.getElementById("TALevel").value = "";
			document.getElementById("mobileno").value = "";
			document.getElementById("email").value = "";
			//alert(data[9]);
			document.getElementById("ActiveStatus").value = "";
			document.getElementById("hod").value = "";
		} else {
			document.getElementById("userlist").style.visibility = 'visible';

			//alert(username);
			var ajaxRequest; // The variable that makes Ajax possible!
			try {
				// Opera 8.0+, Firefox, Safari
				ajaxRequest = new XMLHttpRequest();
			} catch (e) {
				// Internet Explorer Browsers
				try {
					ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
				} catch (e) {
					try {
						ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
					} catch (e) {
						// Something went wrong
						alert("Your browser broke!");
						return false;
					}
				}
			}

			// Create a function that will receive data sent from the server
			ajaxRequest.onreadystatechange = function() {
				if (ajaxRequest.readyState == 4) {
					var reslt = ajaxRequest.responseText;
					//alert(">>>    "+reslt);

					//alert(reslt);
					document.getElementById("userlist").innerHTML = reslt;
				}
			}

			var queryString = "?action=search&name=" + username;
			//alert(queryString);

			ajaxRequest.open("GET", "AjaxEditUser.jsp" + queryString, true);
			ajaxRequest.send(null);

		}//end of else

	}

	function getUserHod() {
		// alert(" in fun");

		//alert("1");
		var username = document.getElementById("hod").value;

		if (username.length == "") {
			document.getElementById("userlist").style.visibility = "hidden";
			document.getElementById("hod").value = "";
		} else {
			document.getElementById("userlist").style.visibility = 'visible';

			//alert(username);
			var ajaxRequest; // The variable that makes Ajax possible!
			try {
				// Opera 8.0+, Firefox, Safari
				ajaxRequest = new XMLHttpRequest();
			} catch (e) {
				// Internet Explorer Browsers
				try {
					ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
				} catch (e) {
					try {
						ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
					} catch (e) {
						// Something went wrong
						alert("Your browser broke!");
						return false;
					}
				}
			}

			// Create a function that will receive data sent from the server
			ajaxRequest.onreadystatechange = function() {
				if (ajaxRequest.readyState == 4) {
					var reslt = ajaxRequest.responseText;
					//alert(">>>    "+reslt);

					//alert(reslt);
					document.getElementById("userlist").innerHTML = reslt;
				}
			}

			var queryString = "?action=hod&name=" + username;
			//alert(queryString);

			ajaxRequest.open("GET", "AjaxEditUser.jsp" + queryString, true);
			ajaxRequest.send(null);

		}//end of else

	}

	function validate() {
		//alert("in fun");
		var username = document.editNewUser.UserName.value;
		if (username == "") {
			alert("Please Enter the User Name");
			return false;
		}

		var ulaccess = document.editNewUser.UserLevelAccess.value;
		if (ulaccess == "") {
			alert("Please Enter the Company User Level Access");
			return false;
		}

		if (document.editNewUser.rolenew.value == "") {
			alert("Please Enter Role");
			return false;
		}

		if (document.editNewUser.Department.value == "Select") {
			alert("Please Select Department");
			//document.AddNewUser.emailid.focus();
			return false;
		}

		var empcode = document.editNewUser.EmpCode.value;
		if (empcode == "") {
			alert("Please Enter Employee Code");
			return false;
		}

		/* if(empcode)
		{
		alert("Employee code should be valid digits only...");
		//document.AddNewUser.Mobno.focus();
		return false;
		} */

		var mob = document.editNewUser.mobileno.value;
		if (mob == "") {
			alert("Please Enter the Mobile Number");
			//documnet.AddNewUser.Mobno.focus();
			return false;
		}
		if (isNaN(mob)) {
			alert("Enter the Valid Mobile Number(10 Digit Number)");
			//document.AddNewUser.Mobno.focus();
			return false;
		}
		if ((mob.length < 10) || (mob.length > 10)) {
			alert("Your Mobile Number Should be Valid 10 Digit Number");
			document.editNewUser.mobileno.select();
			return false;
		}

		var emailfilter = /^\w+[\+\.\w-]*@([\w-]+\.)*\w+[\w-]*\.([a-z]{2,4}|\d+)$/i;
		var email = emailfilter.test(document.editNewUser.email.value);
		if (email == false) {
			alert("Please Enter valid E-Mail ID");
			//document.AddNewUser.emailid.focus();
			return false;
		}

		var status = /^[YesNoyesno]+$/;
		var status = status.test(document.editNewUser.ActiveStatus.value);
		if (status == false) {
			alert('Status must be(Yes/No)');
			return false;
		}

		if (document.editNewUser.hod.value == "") {
			alert("Please Enter Hod Name");
			//document.AddNewUser.emailid.focus();
			return false;
		}

	}
</script>

</head>



<body>
	<%
		Class.forName(DB_Driver);
			sessionconn = DriverManager.getConnection(DB_NAME, DB_USERNAME, DB_PASSWORD);
			Statement strno = sessionconn.createStatement();
	%>



	<%
		erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
	%>
	<%!Connection conn = null;%>

	<%
		//////////

			String UserName = request.getParameter("UserName");
			System.out.println("User Name------------------------------------------------->" + UserName);
			conn = erp.ReturnConnection();
			Statement st = conn.createStatement();
			Statement st1 = conn.createStatement();
			Statement st21 = conn.createStatement();

			Statement st3 = conn.createStatement();
	%>

	<%
		String fromDate = "", toDate = "", fromDate1 = "";
			String data2 = "", data1 = "";
			String uname = "";
			String dd = request.getParameter("data");
			if (dd == null) {
				Calendar cal = Calendar.getInstance();
				String today_dt = new SimpleDateFormat("dd-MMM-yyyy").format(cal.getTime());
				data2 = today_dt;
				String temp = data2;
				toDate = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(temp));

				//cal.add(Calendar.DATE, -1);
				cal.set(Calendar.DAY_OF_MONTH, 1);
				String yesterday_dt = new SimpleDateFormat("dd-MMM-yyyy").format(cal.getTime());
				data1 = yesterday_dt;
				temp = data1;
				fromDate = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
				fromDate1 = new SimpleDateFormat("dd-MMM-yyyy").format(cal.getTime());

			} else {

				data1 = request.getParameter("data");
				System.out.println("Data 1-->" + data1);

				fromDate = new SimpleDateFormat("yyyy-MM-dd")
						.format(new SimpleDateFormat("dd-MMM-yyyy").parse(data1));
				fromDate1 = request.getParameter("data");
				data2 = request.getParameter("data1");
				System.out.println("Data 2-->" + data2);
				toDate = new SimpleDateFormat("yyyy-MM-dd")
						.format(new SimpleDateFormat("dd-MMM-yyyy").parse(data2));

			} //end of else
	%>
	<%
		Date d = new Date();

			Format df1 = new SimpleDateFormat("dd-MMM-yyyy");
			String dtoday = df1.format(d);

			DateFormat df = new SimpleDateFormat("dd-MMM-yyyy");
			DateFormat d1 = new SimpleDateFormat("yyyy-MM-dd");
	%>


	<div
		style="font-size: 1.6em; text-align: center; margin-top: 0.3em; margin-bottom: 0.1em;">
		<table>
			<tr>
				<td><a href="javascript:history.back(-1);"
					style="font-weight: bold; color: black;"> <img
						src="images/arrow_left.png" width="42px" height="42px"
						style="border-style: none"></img>
				</a></td>
				<td><b>Back</b></td>
			</tr>
		</table>
	</div>


	<form name="editNewUser" method="post" enctype="multipart/form-data"
		action="updateNewUser.jsp" onsubmit="return validate();">
		<!--<div id='userlist' style="width:160px;position:absolute; margin-top:5%; margin-left:47.5%; height:200px;overflow: auto; background:#94ECF6;border:thin solid black;" >-->
		<!--</div> -->
		<%
			String sql = "select * from UserMaster where UserName='" + UserName + "'";
				System.out.println("Sql->" + sql);
				ResultSet rs = st1.executeQuery(sql);
				while (rs.next()) {

					System.out.println("First While loopp.....11");
		%>
		<br />
		<div style="width: 40%; float: left; margin-left: 25%;">
			<table border="0" align="center"
				style="background-color: #C6DEFF; font-family: arial; font-size: 12; border-left: 120px">

				<tr>

					<td colspan="4">
						<center>
							<h1>
								<a><b >Edit User Details</b></a>
						
							</h1>
						</center>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<p style="color: red;">Note:(*)indicates mandatory fields..</p>
					</td>

				</tr>

				<tr>
					<td width="100px"><b>Employee
							Name:&nbsp;&nbsp;&nbsp;&nbsp;</b></td>
					<td><input type="text" name="Selectuser" id="Selectuser"
						value="<%=rs.getString("EmpName")%>"
						style="width: 150px; height: 15px; padding: 4px 5px 2px 5px; border-color: activeborder; text-align: left; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; color: #000000;" /></input>
					</td>

					<td><b>User Name:</b><font size="2">*</font></td>
					<%
						uname = rs.getString("UserName");
					%>
					<td><input type="text" name="UserName" id="UserName"
						value="<%=uname%>"
						style="width: 150px; padding: 4px 5px 2px 5px; border-color: activeborder; text-align: left; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; color: #000000;"
						"  readonly /></input></td>


				</tr>

				<tr>

					<!-- 	User Level -->

					<td><b>User Level:</b><font size="2">*</font></td>
					<td><select name="UserLevel" id="UserLevel"
						style="width: 80px; height: 20px; border: 1px solid black; font: small Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;">
							<option value="Level1"
								<%if (rs.getString("UserLevel").equalsIgnoreCase("Level1")) {%>
								Selected <%}%>>Level1</option>
							<option value="Level2"
								<%if (rs.getString("UserLevel").equalsIgnoreCase("Level2")) {%>
								Selected <%}%>>Level2</option>
							<option value="Level3"
								<%if (rs.getString("UserLevel").equalsIgnoreCase("Level3")) {%>
								Selected <%}%>>Level3</option>
							<option value="Level4"
								<%if (rs.getString("UserLevel").equalsIgnoreCase("Level4")) {%>
								Selected <%}%>>Level4</option>
							<option value="Level5"
								<%if (rs.getString("UserLevel").equalsIgnoreCase("Level5")) {%>
								Selected <%}%>>Level5</option>
					</select></td>

					<!-- Department -->


					<td><b>Department:</b><font size="2">*</font></td>
					<td><select name="Department"
						style="width: 80px; height: 20px; border: 1px solid black; font: small Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;">
							<option value="All"
								<%if (rs.getString("Dept").equalsIgnoreCase("All")) {%> Selected
								<%}%>>All</option>
							<option value="Purchase"
								<%if (rs.getString("Dept").equalsIgnoreCase("Purchase")) {%>
								Selected <%}%>>Purchase</option>
							<option value="Sales"
								<%if (rs.getString("Dept").equalsIgnoreCase("Sales")) {%>
								Selected <%}%>>Sales</option>
							<option value="Marketing"
								<%if (rs.getString("Dept").equalsIgnoreCase("Marketing")) {%>
								Selected <%}%>>Marketing</option>
							<option value="Accounts"
								<%if (rs.getString("Dept").equalsIgnoreCase("Accounts")) {%>
								Selected <%}%>>Accounts</option>
							<option value="Hr"
								<%if (rs.getString("Dept").equalsIgnoreCase("Hr")) {%> Selected
								<%}%>>HR</option>
							<option value="Finance"
								<%if (rs.getString("Dept").equalsIgnoreCase("Finance")) {%>
								Selected <%}%>>Finance</option>
							<option value="Software"
								<%if (rs.getString("Dept").equalsIgnoreCase("Software")) {%>
								Selected <%}%>>Software</option>
							<option value="Operations"
								<%if (rs.getString("Dept").equalsIgnoreCase("Operations")) {%>
								Selected <%}%>>Operations</option>
							<option value="RnD"
								<%if (rs.getString("Dept").equalsIgnoreCase("RnD")) {%> Selected
								<%}%>>RnD</option>
							<option value="Embedded"
								<%if (rs.getString("Dept").equalsIgnoreCase("Embedded")) {%>
								Selected <%}%>>Embedded</option>
							<option value="Operation"
								<%if (rs.getString("Dept").equalsIgnoreCase("Operation")) {%>
								Selected <%}%>>Operation</option>
							<option value="CSD"
								<%if (rs.getString("Dept").equalsIgnoreCase("CSD")) {%> Selected
								<%}%>>CSD</option>
							<option value="Other"
								<%if (rs.getString("Dept").equalsIgnoreCase("Other")) {%>
								Selected <%}%>>Other</option>

					</select></td>


				</tr>



				<tr>
					<td><b>Company UserLevel Access:</b><font size="2">*</font></td>
					<td><input type="text" name="UserLevelAccess"
						id="UserLevelAccess"
						style="width: 150px; padding: 4px 5px 2px 5px; border-color: activeborder; text-align: left; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; color: #000000;"
						value="1,2,3" /></input></td>

					<!-- Employee Code -->

					<td><b>Employee Code:</b><font size="2">*</font></td>
					<td><input type="text" name="EmpCode" id="EmpCode"
						value="<%=rs.getString("EmpCode")%>"
						style="width: 150px; padding: 4px 5px 2px 5px; border-color: activeborder; text-align: left; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; color: #000000;"
						"  readonly /></input></td>


				</tr>



				<%
					String TALEVEL = "";
							if (rs.getString("TALevel") == null) {
								TALEVEL = "-";
							} else {
								TALEVEL = rs.getString("TALevel");
							}
				%>
				<tr>
					<td><b>TA Level:</b><font size="2">*</font></td>
					<td><select name="TALevel" id="TALevel"
						style="width: 80px; height: 20px; border: 1px solid black; font: small Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;">
							<option value="M1" <%if (TALEVEL.equalsIgnoreCase("M1")) {%>
								Selected <%}%>>M1</option>
							<option value="M2" <%if (TALEVEL.equalsIgnoreCase("M2")) {%>
								Selected <%}%>>M2</option>
							<option value="M3" <%if (TALEVEL.equalsIgnoreCase("M3")) {%>
								Selected <%}%>>M3</option>
							<option value="M4" <%if (TALEVEL.equalsIgnoreCase("M4")) {%>
								Selected <%}%>>M4</option>
							<option value="M5" <%if (TALEVEL.equalsIgnoreCase("M5")) {%>
								Selected <%}%>>M5</option>
					</select></td>

					<!-- Mobile Number -->

					<td><b>Mobile Number:</b><font size="2">*</font></td>
					<td><input type="text" name="mobileno" id="mobileno"
						value="<%=rs.getString("mobileno")%>"
						style="width: 150px; padding: 4px 5px 2px 5px; border-color: activeborder; text-align: left; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; color: #000000;" " /></input></td>



				</tr>

				<tr>
					<td><b>Email-Id:</b><font size="2">*</font></td>
					<td><input type="text" name="email" id="email"
						value="<%=rs.getString("email")%>"
						style="width: 150px; padding: 4px 5px 2px 5px; border-color: activeborder; text-align: left; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; color: #000000;" " /></input></td>


					<!-- Active Status -->

					<td><b>Active Status:</b><font size="2">*</font></td>
					<td><select name="ActiveStatus" id="ActiveStatus"
						style="width: 80px; height: 20px; border: 1px solid black; font: small Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;">
							<option value="Yes"
								<%if (rs.getString("ActiveStatus").equalsIgnoreCase("Yes")) {%>
								Selected <%}%>>Yes</option>
							<option value="No"
								<%if (rs.getString("ActiveStatus").equalsIgnoreCase("No")) {%>
								Selected <%}%>>No</option>
					</select></td>


				</tr>

				<tr>
					<td><b>HOD:</b><font size="2">*</font></td>
					<td><input type="text" name="hod" id="hod"
						value="<%=rs.getString("HodReport")%>" onkeyup="getUserHod();"
						style="width: 150px; padding: 4px 5px 2px 5px; border-color: activeborder; text-align: left; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; color: #000000;" /></input></td>

					<!-- DotProjectId -->

					<td><b>DotProjectId:</b><font size="2">*</font></td>
					<td><input type="text" name="dotid" id="dotid"
						value="<%=rs.getString("dotprojectid")%>"
						style="width: 150px; padding: 4px 5px 2px 5px; border-color: activeborder; text-align: left; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; color: #000000;" /></input></td>


				</tr>


				<tr>
					<td><b>KRADotprojectid:</b><font size="2">*</font></td>
					<td><input type="text" name="kradotid" id="kradotid"
						value="<%=rs.getString("KRAdotprojectid")%>"
						style="width: 150px; padding: 4px 5px 2px 5px; border-color: activeborder; text-align: left; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; color: #000000;" /></input></td>
				
				
				<!-- Role -->
				
				
				<td><b>Role :</b><font size="2">*</font></td>
					<td>
						<%
							String role123 = "";
									String rolequery = "select distinct(Role) from UserMaster order by Role";
									ResultSet rsrole = st21.executeQuery(rolequery);
						%> <select name="rolenew"
						style="height: 20px; border: 1px solid black; font: small Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;">


							<%
								if (rs.getString("Role").equals("-")) {
							%>
							<option value="<%=rs.getString("Role")%>" selected>Contractor</option>
							<%
								}

										else {
							%>

							<option value="<%=rs.getString("Role")%>" selected><%=rs.getString("Role")%></option>

							<%
								}
										while (rsrole.next()) {
											role123 = rsrole.getString("Role");

											System.out.println("Role is:---------------------------------------->:" + role123);

											if (role123.equals("-")) {
												String role45 = "Contractor";
							%>
							<option value="<%=role123%>"><%=role45%></option>
							<%
								} else {
							%>
							<option value="<%=role123%>"><%=role123%></option>
							<%
								}
										}
							%>
					</select> <%
 	
 %>
					</td>
				
				
				</tr>
				<tr>
					<td><b>User Access:</b><font size="2">*</font></td>
					<td>
						<%
							String UTC = "", Usertype = "", UserTypecode = "";
						%> <%
 	if (rs.getString("UserTypeCode") == null) {
 				UTC = "-";
 			}

 			else {
 				String query123 = "select * from UserTypeMaster where UserTypeCode='"
 						+ rs.getString("UserTypeCode") + "'";
 				System.out.println("Query is----------->:" + query123);

 				UserTypecode = rs.getString("UserTypeCode");

 				System.out.println("UserTypecode is:" + UserTypecode);
 				ResultSet rs123 = st3.executeQuery(query123);
 				if (rs123.next()) {

 					Usertype = rs123.getString("UserType");
 				} else {
 					Usertype = "-";

 				}

 			}

 			String sqlDeatils1 = "Select * from db_GlobalERP.UserTypeMaster where UserType !='Super Admin' and UserType !='"
 					+ Usertype + "'";
 			System.out.println("*********((((((((((((    " + sqlDeatils1);
 			ResultSet rsDetails12 = strno.executeQuery(sqlDeatils1);
 %> <select name="UAL"
						style="height: 20px; border: 1px solid black; font: small Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;">

							<option value="<%=UserTypecode%>" selected><%=Usertype%></option>

							<%
								while (rsDetails12.next()) {
							%>


							<option value="<%=rsDetails12.getInt("UserTypeCode")%>"
								<%if (UTC.equalsIgnoreCase(rsDetails12.getString("UserTypeCode"))) {%>
								<%}%>><%=rsDetails12.getString("UserType")%></option>
							<%
								}
							%>
					</select>
					</td>
				</tr>
				
				
				<tr>
					<td><b>Signature :</b></td>
					<td><input type="file" name="sign" id="sign" accept="image/*"></input>
					</td>
				</tr>
				<tr>
					<td></td>
					<td><a href="#" onclick="viewSign('viewImage.jsp')">View
							Previous Signature </a></td>

				</tr>

				<tr>
					<!--<td align="center">-->
					<!--</td>-->
					
					
					<td colspan="4" width="400px" align="center"><br> <input
						type="submit" name="edit" value="Submit"
						style="border: outset; background-color: #FFFFFF" /></input></td>
						</div>
				</tr>

			</table>
		</div>
		<div style="width: 1%; float: left">
			<table border="0" align="center"
				style="font-family: arial; font-size: 12; border-left: 120px">
				<tr>
					<td></td>
				</tr>
				<tr>
					<td>
						<div id='userlist'
							style="width: 160px; position: relative; margin-top: 5%; margin-left: 3%; height: 200px; overflow: auto; background: #94ECF6; border: thin solid black;">
						</div>
					</td>
				</tr>
			</table>
		</div>
		<script type="text/javascript">
			document.getElementById("userlist").style.visibility = "hidden";
		</script>


		<%
		}
		%>

	</form>

</body>
	</html>
</jsp:useBean>

<%@ include file="footer_new.jsp"%>