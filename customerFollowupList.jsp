<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ include file="header.jsp"%>
<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">

<style>

SPAN.searchword {
	background-color: cyan;
}

SPAN.super {
	text-decoration: blink;
	text-align: center;
}

.popup {
	background-color: #98AFC7;
	position: absolute;
	visibility: hidden; . popupnew { background-color : #98AFC7;
	position: absolute;
	visibility: visible; . popupx { background-color : #98AFC7;
	position: absolute;
	visibility: hidden;
}

BODY {
	bgcolor="#FFE4E1";
}

</style>

	<script type="text/javascript" >
	function  ledegrdetails()
	{
		
	}

	
	function toggleDetails(customer,show,row) 
	{
	//	alert(customer);
	//	alert(show);
	//	alert(row);
		var popupx = document.getElementById("popup"+row);
		//alert(popupx+" +++++    "+row);
		if(show=="true") 
		{
			popupx.style.visibility = "visible";
			popupx.setfocus();
		} 
		else 
		{
			popupx.style.visibility = "hidden";
		}
	}
	
	function showentryform(customer)
	{
	//	alert(customer);
		document.getElementById("maincustomer").value=customer;
		document.getElementById("followUpTable").style.visibility="visible";
	}
	/*function showentryform(customer)
	{
	
		window.open('followupEntryForm.jsp'+'?Company='+customer,'jav','width=450,height=800,top=30,left=300,resizable=no');
	}*/
	function cancelentryform()
	{
		document.getElementById("followUpTable").style.visibility="hidden";
	}

	function gotoExcel (elemId, frmFldId)  
	{  
		//alert("*********** ");

	         var obj = document.getElementById(elemId);  
	         var oFld = document.getElementById(frmFldId); 
	          oFld.value = obj.innerHTML;  

	          document.addfollowup2.action ="excel.jsp";     // CHANGE FORM NAME HERE

	          document.forms["addfollowup2"].submit();       // CHANGE FORM NAME HERE

	}  

	function followupPopup(webadd,companyName,companyPerson,companyPhone,companyEmail,companyCity,companyProduct)     
	{  
		
		window.location=webadd+'?companyName='+companyName+'&companyPerson='+companyPerson+'&companyPhone='+companyPhone+'&companyEmail='+companyEmail+'&companyCity='+companyCity+'&companyProduct='+companyProduct;
			
	}


	function followupDet(webadd,companyName,date1,date2)
	{
		//alert("IN DET FUNCTION   ");
		window.location=webadd+'?companyName='+companyName+'&date1='+date1+'&date2='+date2;
		
	}
	</script>
<%
	erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
%>
<%
    Connection conn = null;
    Statement st = null, st1 = null,st2=null,st3=null,st4=null,st5=null,stDATE=null,stMaster=null,stweek=null,stweek1=null;
    try {
		conn = erp.ReturnConnection();
		st = conn.createStatement();
		st2 = conn.createStatement();
		st1 = conn.createStatement();
		st3 = conn.createStatement();
		st4 = conn.createStatement();
		st5 = conn.createStatement();
		stDATE=conn.createStatement();
		stMaster=conn.createStatement();
		stweek=conn.createStatement();
		stweek1=conn.createStatement();
		} catch (Exception e) {
		};
	Date today = new Date();
	Date tomorrow=new Date();
	Calendar cal = Calendar.getInstance();
	Calendar now = Calendar.getInstance();
	cal.setTime(today);
	String todaysDate=new SimpleDateFormat("yyyy-MM-dd").format(today);
	String todaysDateInMMM=new SimpleDateFormat("dd-MMM-yyyy").format(today);
	  String todaysTime = new SimpleDateFormat(" HH:mm:ss").format(new java.util.Date());
	cal.add(Calendar.DAY_OF_MONTH, -1);
	
	Date YesterdaysDateAsDate = cal.getTime();
	String yesterdaysDate=new SimpleDateFormat("yyyy-MM-dd").format(YesterdaysDateAsDate);
	
	cal.setTime(today);
	cal.add(Calendar.DAY_OF_MONTH, +1);
	Date  tomorowAsDate=cal.getTime();
	String tomoDate=new SimpleDateFormat("yyyy-MM-dd").format(tomorowAsDate);
	String tomoDateInMMM=new SimpleDateFormat("dd-MMM-yyyy").format(tomorowAsDate);
	System.out.println(tomoDateInMMM+"())))))))))))))))))))))  ");
	
	cal.setTime(today);
	Date sevendaysbefore=new Date();
	cal.add(Calendar.DAY_OF_MONTH, -7);
	sevendaysbefore=cal.getTime();
	String sevenbefore=new SimpleDateFormat("yyyy-MM-dd").format(sevendaysbefore);
	String sevenbeforeInMMM=new SimpleDateFormat("dd-MMM-yyyy").format(sevendaysbefore);
	System.out.println(sevenbeforeInMMM+"())))))))))))))))))))))  ");
	
	cal.setTime(today);
	cal.add(Calendar.DAY_OF_MONTH,-30);
	Date MonthAsDate=cal.getTime();
	String monthbefore=new SimpleDateFormat("yyyy-MM-dd").format(MonthAsDate);
	String monthbeforeInMMM=new SimpleDateFormat("dd-MMM-yyyy").format(MonthAsDate);
	System.out.println(monthbeforeInMMM+"())))))))))))))))))))))  ");
	
	cal.setTime(today);
	cal.add(Calendar.DAY_OF_MONTH,-60);
	Date twoMonthAsDate=cal.getTime();
	String twomonthbefore=new SimpleDateFormat("yyyy-MM-dd").format(twoMonthAsDate);
	String twomonthbeforeInMMM=new SimpleDateFormat("dd-MMM-yyyy").format(twoMonthAsDate);
	System.out.println(twomonthbeforeInMMM+"++++++++++++++++++= ");
	
	cal.setTime(today);
	cal.add(Calendar.DAY_OF_MONTH,-90);
	Date threeMonthAsDate=cal.getTime();
	String threemonthbefore=new SimpleDateFormat("yyyy-MM-dd").format(threeMonthAsDate);
	String threemonthbeforeInMMM=new SimpleDateFormat("dd-MMM-yyyy").format(threeMonthAsDate);
	System.out.println(threemonthbeforeInMMM+"++++++++++++++++++= ");
	
	cal.setTime(today);
	cal.add(Calendar.DAY_OF_MONTH,-180);
	Date sixMonthAsDate=cal.getTime();
	String sixmonthbefore=new SimpleDateFormat("yyyy-MM-dd").format(sixMonthAsDate);
	String sixmonthbeforeInMMM=new SimpleDateFormat("dd-MMM-yyyy").format(sixMonthAsDate);
	System.out.println(sixmonthbeforeInMMM+"++++++++++++++++++= ");
	
	cal.setTime(today);
	now.setTime(today);
		
	/* String sqlDate="SELECT DAYOFWEEK('"+todaysDate+"')";
	System.out.println(sqlDate);
	ResultSet rsDate=stDATE.executeQuery(sqlDate);
	int dayOfWeek=1,weekCount=1;
	rsDate.next();
	
	dayOfWeek=rsDate.getInt(1);
	
	if(dayOfWeek==2)
		sqlDate="SELECT DATE_SUB( curdate( ) , INTERVAL 7 DAY )  ";
	else
	{
		weekCount=rsDate.getInt(1)-2;
		sqlDate="SELECT DATE_SUB( curdate( ) , INTERVAL "+weekCount+" DAY ) ";
	}
	System.out.println(sqlDate);
	rsDate=stDATE.executeQuery(sqlDate);
	rsDate.next();
	
	String MondayOfThisWeek=rsDate.getString(1);
	System.out.println("+*+*+*+*+*+*+*+*   "+MondayOfThisWeek);*/

	String yesterdaysDateInMMMFromat=new SimpleDateFormat("dd-MMM-yyyy").format(YesterdaysDateAsDate);
	String usermail="";
	String repr="";
	StringBuffer htmlString = new StringBuffer ("");
	StringBuffer followUpData = new StringBuffer ("");
	String headerstring;
	StringBuffer tempData=new StringBuffer("");
	int k;
	int h=1;
	int masterCounter=1;
	String sqlFollowup="";		
	String fromDateCal = "", toDateCal = "", sql = "",mainCustomer="";
	fromDateCal = toDateCal = new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
	String code=request.getParameter("Code1");
	System.out.println("<><><><><><>      "+code);
	
	String Custcount=request.getParameter("count1");
	System.out.println("***********      "+Custcount);
	
	String number=request.getParameter("number");
	System.out.println("**&&&**&*&**&*&*    "+number);
	
	
	
	String mrktName="";
	String sqlMarktRep="Select MarketingRepName  from "+session.getAttribute("CompanyMasterID").toString()+"marketingrepmaster where MarketingRepCode='"+code+"'";
	
	ResultSet rsMrktRep=stMaster.executeQuery(sqlMarktRep);
	System.out.println(sqlMarktRep);

	while(rsMrktRep.next())
	{
		
		mrktName=rsMrktRep.getString("MarketingRepName");
	}
	
%>

<%
				Date d=new Date();
				Format df1= new SimpleDateFormat("yyyy-MM-dd");
				String dtoday=df1.format(d);
				DateFormat df= new SimpleDateFormat("dd-MMM-yyyy");
				DateFormat d1= new SimpleDateFormat("yyyy-MM-dd");
				
				Format d2= new SimpleDateFormat("HH:mm:ss");
				String incdReg=d2.format(d);
				String hrTime=incdReg.substring(0,2);
				String minTime=incdReg.substring(3,5);
				System.out.println(">>>>>>>>>>>>dtoday:"+dtoday);
			//========================================================
 %>
	 </a>
	<form name="addfollowup" method="post" action="addFollowupForDashboard.jsp" enctype="multipart/form-data">	  	

	<%
	String exportFileName="Customer_det.xls";  // GIVE YOUR REPORT NAME
	%>



<script>document.getElementById("followUpTable").style.visibility="hidden";</script>
</form>
	
<%
	if(number.contains("1"))
	{
		System.out.println("IN IF*********88");
%>
<div id="dashboard">
<form name="addfollowup2" method="post" action="" ">	  	

<input type="hidden" id="tableHTML" name="tableHTML" value="" />   

	<input type="hidden" id="fileName" name="fileName" value="<%=exportFileName%>" />

	<div align="center" style="font-size: 1.8em; margin-top: 0.5em;margin-bottom: 0.5em;"><a><%= mrktName %> Customers</a>
	<table align="right"><tr>	
				<td align="right">
								<font size="1">&nbsp;&nbsp;&nbsp;<%= new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date())%></font>
				<a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('dashboard','tableHTML');">

	     <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img>
	
					<a href="#" onclick="window.print();return false;" title="Print"><img src="images/print.jpg" width="15px" height="15px"></img></a>
			 
				</td>
	</tr></table>
	</div>
	<br>
	
	<table align="center" border=1 class='sortable'>	
				<tr>
				  <th>Sr No</th>
				  <th>Company</th>
				  <th>Contact Person</th>
				  <th>Phone</th>
				  
				  <th>Mobile</th>
				 
				  <th>City</th>
				</tr>
			 <% 	    
			 int j=1;String Customer="";
			 String sqlList="select ProspCustName,ContactPerson,Address,City from "+session.getAttribute("CompanyMasterID").toString()+"followup where MarketingRepcode='"+code+"' AND ProspCustName <> '-'  Group By ProspCustName";
			System.out.println(sqlList);	
			 ResultSet rsList=st1.executeQuery(sqlList);
			 System.out.println(sqlList);
			 while(rsList.next())
			 {
			  Customer=rsList.getString("ProspCustName");	
			  System.out.println("CUSTOMER IOS    **********   "+Customer);
			  String phone="",email="",mobile="",type= "",salescode = "";
			  String sqldata="Select Phone,EMail,MobileNo,SalesCustomerCode from "+session.getAttribute("CompanyMasterID").toString()+"prospectivecustmaster "+ 
			 					 "where CompanyName='"+Customer.trim()+"'";
			System.out.println(sqldata);	
			  ResultSet rsdata=st.executeQuery(sqldata);
			  if(rsdata.next())
			  {
				 phone=rsdata.getString("Phone");	 
				 email=rsdata.getString("EMail"); 
				 mobile=rsdata.getString("MobileNo");
				 salescode=rsdata.getString("SalesCustomerCode");
				 
				 if(salescode == "0" || salescode.equals("0"))
					 type = "Prospect";
				 else
					 type = "Customer";
			  }
			  
			 %>	
			<tr>
				<td align="right"><div style="text-align: right"><%=j%></div></td>
				<td align="right"><div style="text-align: left"><%=Customer%></div>
				</td>
				<td align="left"><div style="text-align: left"><%=rsList.getString("ContactPerson")%></div></td>
				<td align="right"><div style="text-align: right"><%=phone%></div></td>
				
				<td align="right"><div style="text-align: right"><%=mobile%></div></td>
				
				<td align="left"><div style="text-align: left"><%=rsList.getString("City")%></div></td>
			</tr>
				<%
				j++;
				}
				
				%>
		</table>
	 <%} %>

<%if(number.contains("2")){ %>
<div align="center" style="font-size: 1.8em; margin-top: 0.5em;margin-bottom: 0.5em;"><a><%= mrktName %> Customers</a></div>
<br>
		<table align="center" border=1 class='sortable' >	
				<tr>
				  <th>Sr No</th>
				  <th>Company</th>
				  <th>Contact Person</th>
				  <th>Phone</th>
				 
				  <th>Mobile</th>
				 
				  <th>City</th>
				  <th>FollowUps(This Month)</th>
				</tr>
			<%
			int l=1;String Customer="";
			String sqllistformonth="select ProspCustName,ContactPerson,Address,City from "+session.getAttribute("CompanyMasterID").toString()+"followup where MarketingRepcode='"+code+"' AND ProspCustName <> '-' AND FollowUpDate < '"+todaysDate+"' and FollowUpDate > '"+monthbefore+"' Group By ProspCustName";
			ResultSet rsListformonth=st2.executeQuery(sqllistformonth);
			System.out.println(sqllistformonth);
			while(rsListformonth.next())
			{
				
				  Customer=rsListformonth.getString("ProspCustName");
				  int count=0;
				  String sqlCount="Select count(*) from "+session.getAttribute("CompanyMasterID").toString()+"followup where ProspCustName='"+Customer+"' AND FollowUpDate < '"+todaysDate+"' and FollowUpDate > '"+monthbefore+"'";
				  ResultSet rsCount=st.executeQuery(sqlCount);
				  System.out.println("*********************************      "+sqlCount);
				  rsCount.next();
				  count=rsCount.getInt(1); 
				
				  
				  
				  String phone="",email="",mobile="",City="",Product="",salescode = "",type = "";
				  String sqldata="Select * from "+session.getAttribute("CompanyMasterID").toString()+"prospectivecustmaster where CompanyName='"+Customer+"'";
				  ResultSet rsdata=st.executeQuery(sqldata);
				  if(rsdata.next())
				  {
					 phone=rsdata.getString("Phone");	 
					 email=rsdata.getString("EMail"); 
					 mobile=rsdata.getString("MobileNo");
					 City=rsdata.getString("City");
					 Product=rsdata.getString("IntrestedProduct");
					 salescode=rsdata.getString("SalesCustomerCode");
					 
					 if(salescode == "0" || salescode.equals("0"))
						 type = "Prospect";
					 else
						 type = "Customer";
					  
				  }
				  
				  
			%>
			<tr>
				<td align="right"> <div style="text-align: right"><%=l%></div></td>
				<td align="left"><div style="text-align: left"><%=Customer%></td>
				<td align="left"><div style="text-align: left"><%=rsListformonth.getString("ContactPerson")%></div></td>
				<td align="right"><div style="text-align: right"><%=phone%></div></td>
				
				<td align="right"><div style="text-align: right"><%=mobile%></div></td>
			
				<td align="left"><div style="text-align: left"><%=rsListformonth.getString("City")%></div></td>
				<td align="right"><div style="text-align: right"><a href="#" onclick="followupPopup('customerWiseFollowUpReport.jsp','<%=Customer %>','<%=rsListformonth.getString("ContactPerson") %>','<%=phone %>','<%=email %>','<%=City %>','<%=Product %>')"><%=count%></a></div></td>
				
				
				
			</tr>
				<%
				l++;
				}%>
		</table>
<%} %>


<%if(number.contains("3")){ %>
<div align="center" style="font-size: 1.8em; margin-top: 0.5em;margin-bottom: 0.5em;"><a>Your Customers Between last 30 To 60 Days </a></div>
<br>
		<table align="center" border=1 class='sortable'>	
			<tr>
			  <th>Sr No</th>
			  <th>Company</th>
			  <th>Contact Person</th>
			  <th>Phone</th>
			  
			  <th>Mobile</th>
			 
			  <th>City</th>
			  <th>FollowUps(30-60 Days )</th>
			</tr>
		    <% 	       
			int p=1;String Customer="";
			String sqllistfor2month="select ProspCustName,ContactPerson,Address,City from "+session.getAttribute("CompanyMasterID").toString()+"followup where MarketingRepcode='"+code+"' AND ProspCustName <> '-'AND  FollowUpDate < '"+monthbefore+"' AND FollowUpDate > '"+twomonthbefore+"' Group By ProspCustName";
			ResultSet rsListfor2month=st3.executeQuery(sqllistfor2month);
			System.out.println("&*&*&*   "+sqllistfor2month);
			while(rsListfor2month.next())
			{
				  Customer=rsListfor2month.getString("ProspCustName");
				  
				  
				  int count=0;
				  String sqlCount="Select count(*) from "+session.getAttribute("CompanyMasterID").toString()+"followup where ProspCustName='"+Customer+"' AND FollowUpDate < '"+monthbefore+"' and FollowUpDate > '"+twomonthbefore+"'";
				  ResultSet rsCount=st.executeQuery(sqlCount);
				  System.out.println("*********************************      "+sqlCount);
				  rsCount.next();
				  count=rsCount.getInt(1); 
				  
				  
				  
				  
				  
				  
				  String phone="",email="",mobile="",city="",product="",salescode = "",type ="";
				  String sqldata="Select * from "+session.getAttribute("CompanyMasterID").toString()+"prospectivecustmaster where CompanyName='"+Customer+"'";
				  ResultSet rsdata=st.executeQuery(sqldata);
				  if(rsdata.next())
				  {
					 phone=rsdata.getString("Phone");	 
					 email=rsdata.getString("EMail"); 
					 mobile=rsdata.getString("MobileNo");
					 city=rsdata.getString("City");
					 product=rsdata.getString("IntrestedProduct");
					 salescode=rsdata.getString("SalesCustomerCode");
					 
					 if(salescode == "0" || salescode.equals("0"))
						 type = "Prospect";
					 else
						 type = "Customer";
				  }
				
				
			//	out.println(rsList.getString("ProspCustName"));
	        %>		
	        <tr>
				<td align = "right"><div style="text-align: right"><%=p%></div></td>
				<td align = "left"><div style="text-align: left"><a href="#"  onclick=""><a href="javascript:toggleDetails('<%=Customer %>','true','<%=p%>')" /><%=Customer%>
				
				<div align="right" class="popup" id="popup<%=p %>">
			    <table width="70%" align="right" border="1"  bgcolor="#C6DEFF" cellpadding="0" cellspacing="0" style="position: absolute;">
				    <tr><td><div align="center"><a href="javascript:showentryform('<%=Customer%>')"/>Enter Followup</a></div></td></tr>
				   <tr><td><div align="center"><a href="ledgerdetails.jsp?companyName=<%=Customer %>&companyPerson=<%=rsListfor2month.getString("ContactPerson") %>&companyPhone=<%=phone %>&companyEmail=<%=email %>&companyCity=<%= rsListfor2month.getString("City")%>"/>View Ledger Details</a></div></td></tr>
				   <tr><td><div align="center"><a href="customerDetails.jsp?companyName=<%=Customer%>&type=<%=type%>"/>Show Details</a></div></td></tr>
				   <tr><td><div align="center"><a href="javascript:toggleDetails('<%=Customer%>','false','<%=p %>')" />close</a></div></td></tr>
				</table>
				</div>
				</a>
				</div>
				</td>
				<td align = "left"><div style="text-align: left"><%=rsListfor2month.getString("ContactPerson")%></div></td>
				<td align = "right"><div style="text-align: right"><%=phone%></div></td>
				
				<td align = "right"><div style="text-align: right"><%=mobile%></div></td>
			
				<td align = "left"><div style="text-align: left"><%=rsListfor2month.getString("City")%></div></td>
					<td align = "right"><div style="text-align: right"><a href="#" onclick="followupDet('followUpDet.jsp','<%=Customer %>','<%=monthbefore %>','<%= twomonthbefore%>')"><%=count%></a></div></td>
			
			</tr>
			<%
			p++;
			}
			%>
		</table>
	<%} %>
	

<%if(number.contains("4")){ %>
<div align="center" style="font-size: 1.8em; margin-top: 0.5em;margin-bottom: 0.&Company=test&companycode=432&customerName=&companyCity=Select City&companyContactPerson=-&customerCity=&customerContactPerson=5em;"><a>Your Customers between last 60 To 90 Days</a></div>
<br>
		<table align="center" border=1 class='sortable'>	
			<tr>
			  <th>Sr No</th>
			  <th>Company</th>
			  <th>Contact Person</th>
			  <th>Phone</th>
			
			  <th>Mobile</th>
			 
			  <th>City</th>
			  <th>FollowUps(60-90 Days )</th>
			</tr>
		    <%
		    int o=1;String Customer="";
			String sqlListin60to90="select ProspCustName,ContactPerson,Address,City from "+session.getAttribute("CompanyMasterID").toString()+"followup where MarketingRepcode='"+code+"' AND ProspCustName <> '-' AND FollowUpDate < '"+twomonthbefore+"' AND FollowUpDate > '"+threemonthbefore+"' Group By ProspCustName";
			ResultSet rsList60to90=st4.executeQuery(sqlListin60to90);
			System.out.println(sqlListin60to90);
			while(rsList60to90.next())
			{
				
				  Customer=rsList60to90.getString("ProspCustName");
				  
				  int count=0;
				  String sqlCount="Select count(*) from "+session.getAttribute("CompanyMasterID").toString()+"followup where ProspCustName='"+Customer+"' AND FollowUpDate < '"+twomonthbefore+"' and FollowUpDate > '"+threemonthbefore+"'";
				  ResultSet rsCount=st.executeQuery(sqlCount);
				  System.out.println("*********************************      "+sqlCount);
				  rsCount.next();
				  count=rsCount.getInt(1); 
				  
				  
				  String phone="",email="",mobile="",city="",product="",salescode = "",type = "";
				  String sqldata="Select * from "+session.getAttribute("CompanyMasterID").toString()+"prospectivecustmaster where CompanyName='"+Customer+"'";
				  ResultSet rsdata=st.executeQuery(sqldata);
				  if(rsdata.next())
				  {
					 phone=rsdata.getString("Phone");	 
					 email=rsdata.getString("EMail"); 
					 mobile=rsdata.getString("MobileNo");
					 city=rsdata.getString("City");
					 product=rsdata.getString("IntrestedProduct");
					 salescode=rsdata.getString("SalesCustomerCode");
					 
					 if(salescode == "0" || salescode.equals("0"))
						 type = "Prospect";
					 else
						 type = "Customer";
				  }
				
				
			//	out.println(rsList.getString("ProspCustName"));
         	%>		
	        <tr>
				<td align = "right"><div style="text-align: right"><%=o%></div></td>
				<td align = "left"><div style="text-align: left"><a href="#"  onclick=""><a href="javascript:toggleDetails('<%=Customer %>','true','<%=o %>')" /><%=Customer%>
				
				<div align="right" class="popup" id="popup<%=o %>">
			    <table width="70%" align="right" border=1 bgcolor="#C6DEFF" cellpadding="0" cellspacing="0" style="position: absolute;margin-left: 5%;">
				    <tr><td><div align="center"><a href="javascript:showentryform('<%=Customer%>')"/>Enter Followup</a></div></td></tr>
				   <tr><td><div align="center"><a href="ledgerdetails.jsp?companyName=<%=Customer %>&companyPerson=<%=rsList60to90.getString("ContactPerson") %>&companyPhone=<%=phone %>&companyEmail=<%=email %>&companyCity=<%= rsList60to90.getString("City")%>"/>View Ledger Details</a></div></td></tr>
					  <tr><td><div align="center"><a href="customerDetails.jsp?companyName=<%=Customer%>&type=<%=type%>"/>Show Details</a></div></td></tr>
				   <tr><td><div align="center"><a href="javascript:toggleDetails('<%=Customer%>','false','<%=o %>')" />close</a></div></td></tr>
				</table>
				</div>
				</a>
				</div>
				</td>
				<td align = "left"><div style="text-align: left"><%=rsList60to90.getString("ContactPerson")%></div></td>
				<td align = "right"><div style="text-align: right"><%=phone%></div></td>
				
				<td align = "right"><div style="text-align: right"><%=mobile%></div></td>
				
				<td align = "left"><div style="text-align: left"><%=rsList60to90.getString("City")%></div></td>
				<td align = "right"><div style="text-align: right"><a href="#" onclick="followupDet('followUpDet.jsp','<%=Customer %>','<%=twomonthbefore %>','<%= threemonthbefore%>')"><%=count%></a></div></td>
			
			</tr>
			<%
			o++;
			}
			%>
	</table>
	<%} %>
	
	
	
<% if(number.contains("5")){ %>
<div align="center" style="font-size: 1.8em; margin-top: 0.5em;margin-bottom: 0.5em;"><a>Your Customers Between last 90 To 180 Days</a></div>
<br>
		<table align="center" border=1 class='sortable'>	
		    <tr>
			  <th>Sr No</th>
			  <th>Company</th>
			  <th>Contact Person</th>
			  <th>Phone</th>
			 
			  <th>Mobile</th>
			
			  <th>City</th>
			  <th>FollowUps(90-180 Days )</th>
			</tr>
			<%	
			int t=1;String Customer="";
			String sqlListfor90to180="select ProspCustName,ContactPerson,Address,City from "+session.getAttribute("CompanyMasterID").toString()+"followup where MarketingRepcode='"+code+"' AND ProspCustName <> '-' AND  FollowUpDate < '"+threemonthbefore+"' AND FollowUpDate > '"+sixmonthbefore+"' Group By ProspCustName";
			ResultSet rsList90to180=st5.executeQuery(sqlListfor90to180);
			System.out.println(sqlListfor90to180);
			while(rsList90to180.next())	
			{
				  Customer=rsList90to180.getString("ProspCustName");
				  
				  
				  int count=0;
				  String sqlCount="Select count(*) from "+session.getAttribute("CompanyMasterID").toString()+"followup where ProspCustName='"+Customer+"' AND FollowUpDate < '"+threemonthbefore+"' and FollowUpDate > '"+sixmonthbefore+"'";
				  ResultSet rsCount=st.executeQuery(sqlCount);
				  System.out.println("*********************************      "+sqlCount);
				  rsCount.next();
				  count=rsCount.getInt(1); 
				  
				  String phone="",email="",mobile="",city="",product="",salescode = "",type = "";
				  String sqldata="Select * from "+session.getAttribute("CompanyMasterID").toString()+"prospectivecustmaster where CompanyName='"+Customer+"'";
				  ResultSet rsdata=st.executeQuery(sqldata);
				  if(rsdata.next())
				  {
					 phone=rsdata.getString("Phone");	 
					 email=rsdata.getString("EMail"); 
					 mobile=rsdata.getString("MobileNo");
					 city=rsdata.getString("City");
					 product=rsdata.getString("IntrestedProduct");
					 salescode=rsdata.getString("SalesCustomerCode");
					 
					 if(salescode == "0" || salescode.equals("0"))
						 type = "Prospect";
					 else
						 type = "Customer";
					 
				  }
				
			%>		
			<tr>
			  <td align= "right"><div style="text-align: right"><%=t%></div></td>
			 <td align= "left"><div style="text-align: left"><a href="#"  onclick=""><a href="javascript:toggleDetails('<%=Customer %>','true','<%=t %>')" /><%=Customer%>
				
				<div align="right" class="popup" id="popup<%=t %>">
			    <table width="70%" align="right" border=1 bgcolor="#C6DEFF" cellpadding="0" cellspacing="0" style="position: absolute;">
				    <tr><td><div align="center"><a href="javascript:showentryform('<%=Customer%>')"/>Enter Followup</a></div></td></tr>
 <tr><td><div align="center"><a href="ledgerdetails.jsp?companyName=<%=Customer %>&companyPerson=<%=rsList90to180.getString("ContactPerson") %>&companyPhone=<%=phone %>&companyEmail=<%=email %>&companyCity=<%= rsList90to180.getString("City")%>"/>View Ledger Details</a></div></td></tr>
										    <tr><td><div align="center"><a href="customerDetails.jsp?companyName=<%=Customer%>&type=<%=type%>"/>Show Details</a></div></td></tr>		
  <tr><td><div align="center"><a href="javascript:toggleDetails('<%=Customer%>','false','<%=t %>')" />close</a></div></td></tr>
				</table>
				</div>
				</a>
				</div>
				</td>
			  <td align= "left"><div style="text-align: left"><%=rsList90to180.getString("ContactPerson")%></div></td>
			  <td align= "right"><div style="text-align: right"><%=phone%></div></td>
			 
			  <td align= "right"><div style="text-align: right"><%=mobile%></div></td>
			  
			  <td align= "left"><div style="text-align: left"><%=rsList90to180.getString("City")%></div></td>
			  <td align= "right"><div style="text-align: right"><a href="#" onclick="followupDet('followUpDet.jsp','<%=Customer %>','<%=threemonthbefore %>','<%= sixmonthbefore%>')"><%=count%></a></div></td>
			  
			</tr>
			<%
			t++;
			}
			%>
			 </table>
		<%} %> 
	
		 
<%if(number.contains("6")){ %>	 
	 	<div align="center" style="font-size: 1.8em; margin-top: 0.5em;margin-bottom: 0.5em;"><a>Your Customers < 180 Days</a></div>
	 	<br>
	<table align="center" border=1 class='sortable' >
		 <tr>
			<th>Sr No</th>
			<th>Company</th>
			<th>Contact Person</th>
			<th>Phone</th>
		
			<th>Mobile</th>
			
			<th>City</th>
			<th>FollowUps(> 180 Days )</th>
		 </tr>
		 <%
		 int n=1;String Customer="";
		 String sqlListGrtr180="select ProspCustName,ContactPerson,Address,City from "+session.getAttribute("CompanyMasterID").toString()+"followup where MarketingRepcode='"+code+"' AND ProspCustName <> '-' AND   FollowUpDate < '"+sixmonthbefore+"'  Group By ProspCustName";
		 ResultSet rsListGrt180=st5.executeQuery(sqlListGrtr180);
		 System.out.println(sqlListGrtr180);
		 while(rsListGrt180.next())	
		 {
			  Customer=rsListGrt180.getString("ProspCustName");
			  
			  int count=0;
			  String sqlCount="Select count(*) from "+session.getAttribute("CompanyMasterID").toString()+"followup where ProspCustName='"+Customer+"' AND FollowUpDate < '"+sixmonthbefore+"'";
			  ResultSet rsCount=st.executeQuery(sqlCount);
			  System.out.println("*********************************      "+sqlCount);
			  rsCount.next();
			  count=rsCount.getInt(1); 
			  
			  
			  
			  
			  
			  String phone="",email="",mobile="",city="",product="",salescode = "",type="";
			  String sqldata="Select * from "+session.getAttribute("CompanyMasterID").toString()+"prospectivecustmaster where CompanyName='"+Customer+"'";
			  ResultSet rsdata=st.executeQuery(sqldata);
			  if(rsdata.next())
			  {
				 phone=rsdata.getString("Phone");	 
				 email=rsdata.getString("EMail"); 
				 mobile=rsdata.getString("MobileNo");
				 city=rsdata.getString("City");
				 product=rsdata.getString("IntrestedProduct");
				salescode=rsdata.getString("SalesCustomerCode");
				 
				 if(salescode == "0" || salescode.equals("0"))
					 type = "Prospect";
				 else
					 type = "Customer";
			  }
			 
		 %>		
		 <tr>
		   <td align= "right"><div style="text-align: right"><%=n%></div></td>
		   <td align= "left"><div style="text-align: left"><a href="#"  onclick=""><a href="javascript:toggleDetails('<%=Customer %>','true','<%=n %>')" /><%=Customer%>
				
				<div align="right" class="popup" id="popup<%=n %>">
			    <table width="70%" align="right" border=1 bgcolor="#C6DEFF" cellpadding="0" cellspacing="0" style="position: absolute;">
				    <tr><td><div align="center"><a href="javascript:showentryform('<%=Customer%>')"/>Enter Followup</a></div></td></tr>
				<tr><td><div align="center"><a href="ledgerdetails.jsp?companyName=<%=Customer %>&companyPerson=<%=rsListGrt180.getString("ContactPerson") %>&companyPhone=<%=phone %>&companyEmail=<%=email %>&companyCity=<%= rsListGrt180.getString("City")%>"/>View Ledger Details</a></div></td></tr>
								    <tr><td><div align="center"><a href="customerDetails.jsp?companyName=<%=Customer%>&type=<%=type%>"/>Show Details</a></div></td></tr>
				   <tr><td><div align="center"><a href="javascript:toggleDetails('<%=Customer%>','false','<%=n %>')" />close</a></div></td></tr>
				</table>
				</div>
				</a>
				</div>
				</td>
		   <td align= "left"><div style="text-align: left"><%=rsListGrt180.getString("ContactPerson")%></div></td>
		   <td align= "right"><div style="text-align: right"><%=phone%></div></td>
		  
		   <td align= "right"><div style="text-align: right"><%=mobile%></div></td>
		  
		   <td align= "left"><div style="text-align: left"><%=rsListGrt180.getString("City")%></div></td>
		    <td align= "right"><div style="text-align: right"><a href="#" onclick="followupDet('followUpDet.jsp','<%=Customer %>','<%=sixmonthbefore %>','0000-00-00')"><%=count%></a></div></td>
			 
		 </tr>
		 <%
		 n++;
		 }
		 %>
	</table>
	
<%} %>		
<%if(number.contains("7")){ %>
<div align="center" style="font-size: 1.8em; margin-top: 0.5em;margin-bottom: 0.5em;"><a>Your Missed Customers Between last 7 Days </a></div>
<br>
		<table align="center" border=1 class='sortable'>	
			<tr>
			  <th>Sr No</th>
			  <th>Company</th>
			  <th>Contact Person</th>
			  <th>Phone</th>
			  
			  <th>Mobile</th>
			 
			  <th>City</th>
			</tr>
		    <% 
		    int i=1;
		    String lastweekDate1="",lastweekDate2="";
		     String lastweek="SELECT DATE_SUB( curdate( ) , INTERVAL 7 DAY )";	
			 ResultSet rsweek=stweek.executeQuery(lastweek);
			 if(rsweek.next())
			 {
				 lastweekDate1=rsweek.getString(1);
				 System.out.println(">>>>>>>>>>lastweekDate1:"+lastweekDate1);
			 }
			 String lastweek1="SELECT DATE_SUB( curdate( ) , INTERVAL 1 DAY )";	
			 ResultSet rsweek1=stweek1.executeQuery(lastweek1);
			 if(rsweek1.next())
			 {
				 lastweekDate2=rsweek1.getString(1);
				 System.out.println(">>>>>>>>>>lastweekDate2:"+lastweekDate2);
			 }
			 int MissedCount=0;
			 String missed="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"followup WHERE MarketingRepcode = '"+code+"' AND NextFollowUpDate Between '"+lastweekDate1+"' AND '"+lastweekDate2+"' AND FollowUpType <> 'Assigned'";
			 System.out.println(">>>>>>>>>>missed:"+missed);

			 ResultSet rsMissed=st.executeQuery(missed);
			 while(rsMissed.next())
			 {
				 String followupdate=rsMissed.getString("NextFollowUpDate");
				 System.out.println(">>>>>>>>>>followupdate:"+followupdate);
				 String custcode=rsMissed.getString("ProspCustCode");
				 System.out.println(">>>>>>>>>>custcode:"+custcode);
				 
				 String missed1="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"followup WHERE MarketingRepcode = '"+code+"' AND ProspCustCode='"+custcode+"' AND FollowUpDate Between '"+lastweekDate1+"' AND '"+lastweekDate2+"' AND FollowUpType <> 'Assigned' ";
				 System.out.println(">>>>>>>>>>missed1:"+missed1);
				 ResultSet rsmissed1=st1.executeQuery(missed1);
				 if(rsmissed1.next())
				 {
					 
						 MissedCount +=1;
						 System.out.println(">>>>>>>>>>MissedCount:"+MissedCount);
					 
				 }
				 else
				 {
					    int p=1;String Customer="",salescode = "",type = "";
						String sqllistfor2month="select CompanyName,ContactPerson,Address,City,Phone,EMail,MobileNo,SalesCustomerCode  from "+session.getAttribute("CompanyMasterID").toString()+"prospectivecustmaster where  CustomerCode ='"+custcode+"'";
						ResultSet rsListfor2month=st3.executeQuery(sqllistfor2month);
						System.out.println("&*&*&*   "+sqllistfor2month);
						while(rsListfor2month.next())
						{
							  Customer=rsListfor2month.getString("CompanyName");
							  String phone="",email="",mobile="";
							 
								 phone=rsListfor2month.getString("Phone");	 
								 email=rsListfor2month.getString("EMail"); 
								 mobile=rsListfor2month.getString("MobileNo");
								 salescode=rsListfor2month.getString("SalesCustomerCode");
								 
								 if(salescode == "0" || salescode.equals("0"))
									 type = "Prospect";
								 else
									 type = "Customer";
							 
							
							
						//	out.println(rsList.getString("ProspCustName"));
				        %>		
				        <tr>
							<td align="right"><div style="text-align: right"><%=i++%></div></td>
							<td align="left"><div style="text-align: left"><%=Customer%></td>
							<td align="left"><div style="text-align: left"><%=rsListfor2month.getString("ContactPerson")%></div></td>
							<td align="right"><div style="text-align: right"><%=phone%></div></td>
							
							<td align="right"><div style="text-align: right"><%=mobile%></div></td>
							
							<td align="left"><div style="text-align: left"><%=rsListfor2month.getString("City")%></div></td>
						</tr>
						<%
						
						}
						%>
					
			<%		 
				 }
				 
			 }
			
	} %>
	
	<div id="footer" style="float:left;width:100%">
	<p><a href="http://www.myfleetview.com"> Copyright &copy; 2009
	by Transworld Compressor Technologies Ltd. All Rights Reserved.</a></p>
	</div>
	</table>
	
	</form>
	
</div>
<br><br><br><br><br>
<br><br><br><br><br><br><br><br>        
	<br><br><br>
	
	<!-- end #footer -->
	</body>
	</html>
</jsp:useBean>