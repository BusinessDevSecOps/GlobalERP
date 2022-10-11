<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="header.jsp"%>
<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">



	<script src="dropdown.js" type="text/javascript"></script>
		<script src="ledgerDetails.js" type="text/javascript"></script>


	<script language="JavaScript1.2">

function showHideAll()
{
	if(document.ledgerDetails.checkAll.checked==true)
	{
		document.ledgerDetails.companyName.value="";
		document.ledgerDetails.companyPerson.value="";
		document.ledgerDetails.companyEmail.value="";
		document.ledgerDetails.companyCity.value="";
		document.ledgerDetails.companyProduct.value="";
		document.ledgerDetails.companyPhone.value="";
		document.getElementById('companyList').style.height = '10px'; 
		document.getElementById('companyList').style.visibility = 'hidden';
	}
	
}
	function getCompanies()
	{
		document.ledgerDetails.checkAll.checked=false;
		document.getElementById('companyList').style.visibility = 'visible';
			var company=document.ledgerDetails.companyNames.value;
			var ajaxRequest;  // The variable that makes Ajax possible!

			try{
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
					document.getElementById("companyList").innerHTML=reslt;
				} 
			}
			var queryString = "?company=" +company;
			ajaxRequest.open("GET", "AjaxGetLedgerCompanies.jsp" + queryString, true);
			ajaxRequest.send(null); 
		
	}
	
function sendSMS(){

	var ajaxRequest;  // The variable that makes Ajax possible!
	var company=document.ledgerDetails.companyName.value;
	var contact=document.ledgerDetails.companyPerson.value;
	var phone=document.ledgerDetails.companyPhone.value;
	var email=document.ledgerDetails.companyEmail.value;
	var product=document.ledgerDetails.companyProduct.value;
	var city=document.ledgerDetails.companyCity.value;
	try{
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
			alert(reslt);
		}
	}
	var queryString = "?company=" +company+"&contact="+contact+"&phone="+phone+"&email="+email+"&city="+city+"&product="+product;
	ajaxRequest.open("GET", "AjaxSendSMS.jsp" + queryString, true);
	ajaxRequest.send(null); 
}
	
	function showVisitingCardDetails(companyName) {
		document.getElementById('visitingCard').style.visibility='visible';
		document.ledgerDetails.companyNames.value='';
		document.getElementById('companyList').style.height = '10px'; 
		document.getElementById('companyList').style.visibility = 'hidden';

		try{
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

				var data=reslt.split("#");
				document.ledgerDetails.companyName.value=data[1];
				document.ledgerDetails.companyPerson.value=data[2];
				document.ledgerDetails.companyEmail.value=data[3];
				document.ledgerDetails.companyCity.value=data[4];
				document.ledgerDetails.companyProduct.value=data[5];
				document.ledgerDetails.companyPhone.value=data[6];
			}
		}
		var queryString = "?companyName=" +companyName;
		ajaxRequest.open("GET", "AjaxShowVisitingCard.jsp" + queryString, true);
		ajaxRequest.send(null); 

		 document.getElementById('tabS').style.visibility='hidden';
	}

	function gotoExcel (elemId, frmFldId)  
	{  
		//alert("*********** ");

	         var obj = document.getElementById(elemId);  

	         var oFld = document.getElementById(frmFldId); 

	          oFld.value = obj.innerHTML;  

	          document.Enquiry.action ="excel.jsp";     // CHANGE FORM NAME HERE

	          document.forms["Enquiry"].submit();       // CHANGE FORM NAME HERE

	} 
	function newwindow(webadd)
	{ 
		if(document.ledgerDetails.companyName.value=="" || document.ledgerDetails.companyName.value==null)
			alert("Please select a company ");
		else
			window.open(webadd+'?email='+document.ledgerDetails.companyEmail.value+'&toDate='+document.ledgerDetails.todate.value+'&fromDate='+document.ledgerDetails.fromdate.value+'&company='+document.ledgerDetails.companyName.value,'jav','width=470,height=500,top=250,left=600,resizable=no');
		
	}
	
	function popUp(webadd,trancactionId,condition)
	{ 
		var company=document.ledgerDetails.companyName.value;
			window.open(webadd+'?company='+company+'&transactionId='+trancactionId+'&condition='+condition,'jav','width=870,height=500,top=150,left=250,resizable=no');
		
	}

	function newSMSwindow(weba)
	{ 
		if(document.ledgerDetails.companyName.value=='' || document.ledgerDetails.companyName.value==null)
			alert("Please select a company ");
		else
		window.open(weba+'?companyName='+document.ledgerDetails.companyName.value+'&email='+document.ledgerDetails.companyEmail.value+'&contactPerson='+document.ledgerDetails.companyPerson.value+'&companyPhone='+document.ledgerDetails.companyPhone.value+'&companyProduct='+document.ledgerDetails.companyProduct.value+'&companyCity='+document.ledgerDetails.companyCity.value,'jav','width=470,height=350,top=250,left=600,resizable=no');
	}

	function gotoPaymentEntry(webadd)
	{ 
 		
		var company=document.ledgerDetails.companyName.value;
		var companyPerson=document.ledgerDetails.companyPerson.value;
		var companyPhone=document.ledgerDetails.companyPhone.value;
		var companyEmail=document.ledgerDetails.companyEmail.value;
		var companyCity=document.ledgerDetails.companyCity.value;
		var companyProduct=document.ledgerDetails.companyProduct.value;
		
		window.location=webadd+'?companyName='+company+'&companyPerson='+companyPerson+'&companyPhone='+companyPhone+'&companyEmail='+companyEmail+'&companyCity='+companyCity+'&companyProduct='+companyProduct;
	}
	
	 
	if (document.all || document.getElementById)
		document.body.style.background = "url('images/bg.jpg')  white top no-repeat "
</script>

	<%
		erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
	%>
	<%
		Connection conn = null;
			Statement st = null, st1 = null, st3 = null, st4 = null ,s5=null;
			Statement st2 = null;
			String selectedName,emp="";
			String FollowUpType="";
			Format format=new SimpleDateFormat("dd-MMM-yyyy");
			Format parse=new SimpleDateFormat("yyyy-MM-dd");
			String fromDate="",toDate="",fromDateCal="",toDateCal="";
			String companyName="",phone="",contact="",email="",product="",city="",status="";
			String id=request.getParameter("id");
			System.out.println("ID CMING IS   ++++++++++++++          "+id);
	%>
	<%
	Date today = new Date();
	Calendar cal = Calendar.getInstance();
	cal.setTime(today);
	cal.add(Calendar.DAY_OF_MONTH, -30);
	Date today30 = cal.getTime();
	fromDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(today30);
	toDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
	fromDate=new SimpleDateFormat("yyyy-MM-dd").format(today30);
	toDate=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	if (!(null == request.getParameter("fromdate"))) {
	fromDate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("fromdate")));
	fromDateCal=request.getParameter("fromdate");
	}
	if (!(null == request.getParameter("todate"))){
		toDate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("todate")));
		toDateCal=request.getParameter("todate");
	}
	if (!(null == request.getParameter("SrByEmp")))
	{  emp= request.getParameter("SrByEmp");	}
	
	System.out.println(request.getParameter(emp));
	System.out.println(request.getParameter("checkAll"));
	System.out.println(request.getParameter("checkAll"));
	System.out.println(request.getParameter("checkAll"));
	if (null == request.getParameter("checkAll") && null != request.getParameter("companyName"))
	{
		companyName=request.getParameter("companyName");
		phone=request.getParameter("companyPhone");
		email=request.getParameter("companyEmail");
		contact=request.getParameter("companyPerson");
		city=request.getParameter("companyCity");
		product=request.getParameter("companyProduct"); 
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
			
	%>
 
	<div
		style="font-size: 1.7em; text-align: center;">
		<a><%=id %> Sales Enquiry Details </a>
 </div>
<form name='ledgerDetails' action="" method="get" >
<input type="hidden" name="id" value="<%=id %>">
<table width="100%" border="0">
<tr>
<td style="width: 20px">

<div id="visitingCard" style="visibility: visible;">
			<table  bgcolor="#C6DEFF">
				<tr>
					<td align="left" ><div id="Company"><b>Company</b></div></td>
					<td align="left">
					<div id="companyName"><input type="text" name="companyName" 
						id="search-text" value="<%=companyName %>"
						style='border-style: none; width: 200px; height: 12px; background-color: #C6DEFF;'' readonly="readonly" /></div>
					</td>
					<td align="center" style="width: 25%"><div id="Contact"><b>Contact </b></div></td>
					<td valign="top" align="right">
					<div id="companyPerson"><input type="text"
						name="companyPerson" id="search-text" value="<%=contact %>" readonly="readonly"
						style='border-style: none; width: 200px; background-color: #C6DEFF;'' /></div>
					</td>

								<td valign="top" style="width: 30px;">
				<a href="#" style="font-weight: bold; color: black; " onclick="newSMSwindow('smsvc.jsp');">
				<img src="images/sms.png" width="25px" height="22px" style="border-style: none"></img>
			</a> 
			</td>

				</tr>
								<tr>
					<td align="left"><div id="Phone"><b>Phone</b></div></td>
					<td align="left">
					<div id="companyPhone"><input type="text" name="companyPhone"
						id="search-text" value="<%=phone %>"
						style='border-style: none; width: 200px; height: 12px; background-color: #C6DEFF;'' readonly="readonly"/></div>
					</td>
					<td align="center" style="width: 25%" valign="middle"><div id="Email"><b>E-Mail </b></div></td>
					<td valign="top" align="right" style="">
					<div id="companyEmail">
					<textarea
										name="companyEmail" rows="1" id="search-text"   readonly="readonly"
										style='border-style: none; width: 200px; height: 30px; background-color: #C6DEFF;''><%=email %></textarea>
		 </div>
					</td>
					<td>
					</td>
					</tr>
								<tr>
					<td align="left"><div id="Product"><b>Product</b></div></td>
					<td align="left">
					<div id="companyProduct"><input type="text" name="companyProduct"
						id="search-text" value="<%=product %>"
						style='border-style: none; width: 200px; height: 12px; background-color: #C6DEFF;'' readonly="readonly"/></div>
					</td>
					<td align="center" style="width: 25%"><div id=City"><b>City </b></div></td>
					<td valign="top" align="right">
					<div id="companyCity"><input type="text" readonly="readonly"
						name="companyCity" id="search-text" value="<%=city %>"
						style='border-style: none; width: 200px; background-color: #C6DEFF;'' /></div>
					</td>
<td></td>
				</tr>
				</table>
</div>

</td><td align="left" valign="top"> 
			<table width="100%" border="0">
			<tr>
			<td valign="top" style="width: 70px;" rowspan="4" >
				<a href="#" style="font-weight: bold; color: black; " onclick="newwindow('emailTransactions.jsp');" >
<!-- <img src="images/email.png" width="25px" height="22px" style="border-style: none"></img>  -->
</a>  
			</td>
			</tr>
 
 
			</table>
			</td>
<td>
</td>
</tr>
</table>

<table width="100%" border="0">
		<tr>
									<td align="right" valign="bottom">
									<input type="checkbox" id="checkAll" name="checkAll" checked="checked" onchange="showHideAll();" value="checkAll"/></td>
									<td valign="bottom">All &nbsp;&nbsp;&nbsp;</td>
		 							<td valign="bottom">
									<div id="companyNames">Company Name: &nbsp;
									<input type="text" name="companyNames" id="search-text" value='' onkeyup="getCompanies()" /></div>
									 <div style="position: absolute;"  >
									 <table><tr><td>
						 			 </td></tr>
									 <tr><td valign="top">
	 								<div id='companyList'>
	 								</div>
	 								</td></tr>
	 								</table>
	 								</div></td>
           						<%  String sql ="select EmpName from  "+session.getAttribute("CompanyMasterID").toString()+"security order By EmpName";
								ResultSet rsEmpdet= st.executeQuery(sql);
								%>
				
    								<td valign="bottom"><b>Or Select Employee:</b></td>
	                				<td align="left" valign="bottom"><select  name="SrByEmp" id="SrByEmp"> 
										   <option value='All'>All</option>
				                          <%while (rsEmpdet.next()) {
				              				 %>
										   <option value="<%=rsEmpdet.getString("EmpName") %>"><%=rsEmpdet.getString("EmpName") %></option>
									        <%} %>
									        </select>
								 </td>
			<td align="left" valign="bottom" >&nbsp;&nbsp;&nbsp;&nbsp;
			 <input type="text" id="fromdate"
						name="fromdate" value="<%=fromDateCal %>" size="15" readonly
						style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF" />
					
			<!--<input type="button" name="From Date" value="From Date" id="trigger">-->
			<script type="text/javascript">
			  Calendar.setup(
			    {
			      inputField  : "fromdate",         // ID of the input field
			      ifFormat    : "%d-%b-%Y",     // the date format
			      button      : "fromdate"       // ID of the button
			    }
			  );
			</script>
 			</td>
 			<td align="left" valign="bottom" style="width: 40px;">
					&nbsp;<b>To </b> </td><td align="left" valign="bottom" style="width: 80px;">
			 <input type="text" id="todate"
						name="todate" value="<%=toDateCal %>" size="15" readonly
						style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF" />
					
			<script type="text/javascript">
			  Calendar.setup(
			    {
			      inputField  : "todate",         // ID of the input field
			      ifFormat    : "%d-%b-%Y",    // the date format
			      button      : "todate"       // ID of the button
			    }
			  );
			</script>
			 </td>
			 <td align="left" valign="bottom">&nbsp;&nbsp;
					 <input type="submit" name="submit" id="submit" style="border: outset;" value="GO"></input></td>
			<td align="right" valign="bottom">
					 <font size="1">&nbsp;&nbsp;&nbsp;<%=toDateCal%></font>
			</td>
			<td align="right" valign="bottom">
				      <a href="#" onclick="gotoExcel('table','tableHTML');"  title="Export To Excel"><img src="images/excel.jpg" width="15px" height="15px"></a>

			</td>
			<td align="right" valign="bottom">
			 <a href="#" onclick="window.print();return false;" title="Print"><img src="images/print.jpg" width="15px" height="15px"></img></a>
			</td>
		</tr>
	</table>

</form>

<br></br>

<%
if(request.getParameter("companyName")!=null )
{
%> 
<%	
boolean isCheckedAll=false;
isCheckedAll=(request.getParameter("checkAll")!=null ? true : false);
String sqlDetails="",companyCode="",openingBalance=null;

companyCode=(request.getParameter("companyName")!=null ? request.getParameter("companyName") : "-");
 
 
 
%>

<form name="Enquiry" method="post" >
<%
String exportFileName="Enquiry_det.xls";   // GIVE YOUR REPORT NAME
%>	
<div  id="table">
<input type="hidden" id="tableHTML" name="tableHTML" value="" />   
<input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" /> 
<div id="tabS" style="visibility: visible;">
 	<table border="1px"  class="sortable">
	<tr>
		<th>Sr.No</th>
		<th>SE No</th>
		<th>ID</th>
		<th>Enq Date</th>
		<th>Cust Name</th>
		<th>Ref No</th>
		<th>Contact</th>
		<th>Phone</th>
		<th>Due Date/time</th>
		<th>Status</th>
		<th>Reason For Closing</th>
		<th>Sign</th>
	</tr>
	<%
	int i=1;boolean exist=false;
	String condition="",condition1="",condition2="";
	 condition="SalesQuoDate BETWEEN '"+fromDate+"' and '"+toDate+"'";
     condition1="TWEmpname='"+emp+"'";
     condition2=" CompanyName in ('"+request.getParameter("companyNames")+"')";
    		     
	 				
					if(!isCheckedAll)
							    sqlDetails ="SELECT * FROM  "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det  where CompanyName ='"
								+ request.getParameter("companyName") + "' and SalesEnqDate between '"+fromDate+"' and '"+toDate+"'";
					else
						if(emp.equals("All"))
							{sqlDetails ="SELECT * FROM  "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det  where SalesEnqDate between '"+fromDate+"' and '"+toDate+"'   ";
							}
						else{
							sqlDetails ="SELECT * FROM  "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det  where SalesEnqDate between '"+fromDate+"' and '"+toDate+"'  and TWEmpName ='"+emp+"'";
								}
					
					
					System.out.println(sqlDetails);
					ResultSet rsDetails = st.executeQuery(sqlDetails);
					System.out.println(sqlDetails);
					while (rsDetails.next()) {
						try{           
						String sqlStatus="select  e.SalesEnqNo  from "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det e,"+session.getAttribute("CompanyMasterID").toString()+"salesquo_det q where e.SalesEnqNo='"+rsDetails.getInt("SalesEnqNo")+"' and e.SalesEnqNo=q.SalesEnqNo";
						//System.out.println(sqlStatus);
						ResultSet rsStatus = s5.executeQuery(sqlStatus);
						if(rsStatus.next())
						{
							status="Quoted";
						}
						else
						{		if(rsDetails.getInt("SalesEnqClosed")==0)
						     	{ status="Open";
						     	}
								else{status="Closed";
								}
						}//else end
						}
						catch(Exception e1) {
						System.out.println("Exception is :"+e1);
						e1.printStackTrace();
					}
                       		
						//System.out.println("@@@@@@@@@@@ Status @@@@@@@@@@@@@"+status);
						String dueDate="NA";
						try{
						  dueDate=new SimpleDateFormat(
							"dd-MMM-yyyy HH:mm:ss")
							.format(new SimpleDateFormat(
									"yyyy-MM-dd HH:mm:ss")
									.parse(rsDetails.getString("SalesEnqDueDate")));
						}catch(Exception e){}
	%>
	<tr>
		<td align="right">
		<div align="right"> <%=i++ %></div>
		</td>
				<td>
		<div align="right"><%=rsDetails.getString("SalesEnqNo")%></div>
		</td>
						<td>
		<div align="right">
		<a href="#" style="font-weight: bold;" onclick="popUp('SEDetails.jsp','<%=rsDetails.getString("SalesEnqRefNo")%>','<%=id %>')">
			<%=rsDetails.getString("SalesEnqRefNo")%></a>
		 </div>
		</td>
		<td>
		<div align="right"><%=new SimpleDateFormat(
												"dd-MMM-yyyy")
												.format(new SimpleDateFormat(
														"yyyy-MM-dd")
														.parse(rsDetails
																.getString("SalesEnqDate")))+" "+rsDetails
																.getString("SalesEnqTime")%></div>
		</td>
				<td>
		<div align="left"><%=rsDetails.getString("CompanyName")%></div>
		</td>
				<td>
		<div align="left"><%=rsDetails.getString("CustRefNo")%></div>
		</td>
				<td>
		<div align="left"><%=rsDetails.getString("ContactPerson")%></div>
		</td>
						<td>
		<div align="left"><%=rsDetails.getString("Phone")%></div>
		</td>
				<td>
		<div align="right"><%=dueDate %> </div>
		</td>
 
		<td>
		<div align="left"><%=status%></div>
		</td>
	 	<td>
		<div align="left"><%=rsDetails.getString("ReasonForClosing")%></div>
		</td>
				<td>
		<div align="left"><%=rsDetails.getString("TWEmpName")%></div>
		</td>

	</tr>
	<%
		}
}
%>
</table>
</div>
</div>
</form>
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