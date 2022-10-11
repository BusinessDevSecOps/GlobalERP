<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="header.jsp"%>
 <jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">
  
 
	<script src="dropdown.js" type="text/javascript"></script>

	</head>
	<body>

	<script language="JavaScript1.2">

	var arSelected = new Array(); 

	function conformAll() 
	{
		//alert("CONFRM");
		alert(document.getElementByName(repNameSel.options[1].value));/*
		while (ob.selectedIndex != -1) {
			if (ob.selectedIndex != 0)
				arSelected.push(ob.options[ob.selectedIndex].value);
			ob.options[ob.selectedIndex].selected = false;
		}*/
	}
	function popUp(webadd,repName,action,fromDate,toDate)
	{ 
		window.open(webadd+'?fromDate='+fromDate+'&toDate='+toDate+'&repName='+repName+'&action='+action,'jav');
		
	}
	function detailReport(webadd,repCode,fromDate,toDate,Number)
	{
		window.open(webadd+'?repCode='+repCode+'&fromDate='+fromDate+'&toDate='+toDate+'&Number='+Number,'jav');
	}

	function detailReport1(webadd,repName,fromDate,toDate,Number)
	{
		window.open(webadd+'?repName='+repName+'&fromDate='+fromDate+'&toDate='+toDate+'&Number='+Number,'jav');
	}
    function EmailSending()
    {
        //alert("in fun");
        var htmlstring=document.getElementById("mailstring").value;
        //alert(document.getElementById("mailstring").value);
        var mailid=document.getElementById("mail").value;
        //alert(mailid);
         if(mailid=="")
         {
          alert("Please Enter E-Mail Id ;");
          return false;
         }
         
      

       if(mailid!=null && htmlstring!=null)
       {
           //alert("In if");
           
           var subject="Marketing Activity Report ";
           var numericExpression = /^[0-9]+$/;
           var at="@";
   		   var dot=".";
   		   var lat=mailid.indexOf(at);
   		   var lstr=mailid.length;
   		   var ldot=mailid.indexOf(dot);
   		 if (mailid.indexOf(at)==-1 && mailid!="")
   	   	 {
   		   alert("Please Enter Valid E-Mail ID");
   		   return false;
   		 }
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

   		// Create a function that will receive data sent from the server
   		ajaxRequest.onreadystatechange = function()
   		{
   			if(ajaxRequest.readyState == 4)
   			{
   				var reslt=ajaxRequest.responseText;
   				//alert(">>>    "+reslt);
   				var data=reslt.split("#");
   				//alert("<*****  "+data);
   				if(data[1].indexOf('Yes')!=-1)
   				{					
   			    	//window.location.reload();
   					alert("Email Send Successfully");
   					document.getElementById("mail").value="";
   					
   				}
   				else
   				{
   					alert("Email Not Send Successfully!!!!!!!!!");
   					document.getElementById("mail").value="";
   				}
              
               
               
   			} 
   		}
   		//var fff="<br><h4 align=center> Performance Of D. M. Raut During '01-Apr-2012' To '14-May-2012' </h4><table><tr><th><b>Particulars</b></th><th><b>Weightage</b></th><th><b>Total</b></th><th><b>Target</b></th><th><b>Weighted Index()</b></th><th><b>Index UptoDate ()</b></th></tr></table>";
   		var queryString = "?htmlstring1="+htmlstring+"&mailid="+mailid+"&subject="+subject;

   		//alert(queryString);
   		
   		ajaxRequest.open("GET", "AjaxMailSending.jsp" +queryString, true);
   		ajaxRequest.send(null); 
           
       }
        
    }
    function gotoExcel(elemId, frmFldId)  
	{  
		//alert(">>");
	    var obj = document.getElementById(elemId);  
	   
	    var oFld = document.getElementById(frmFldId); 
	   
	    oFld.value = obj.innerHTML;
	    //alert("ok");  
	    document.marketingreport.action ="excel.jsp";
	    document.forms["marketingreport"].submit();
	    //alert("zale");
	 }
    
	
//	if (document.all || document.getElementById)
//		document.body.style.background = "url('images/bg.jpg')  white top no-repeat "
</script>


	<!-- end #header --> <!-- end #page --> 
	<%
		erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
	%>
	<%
	
		Connection conn = null;
			Statement st = null, st1 = null ;
			Statement st2 = null,st3=null ,st4=null,st5=null, st6 = null;
			String selectedName;
			String FollowUpType="";
			Format format=new SimpleDateFormat("dd-MMM-yyyy");
			Format parse=new SimpleDateFormat("yyyy-MM-dd");
			String fromDate="",toDate="",fromDateCal="",toDateCal="",fromdatevdTime="",todatevdTime="";
			String sqlDetails="";
			String visits="",phoneCalls="",letters="",meetings="",email="",numberOfprospects="",numberOfSQ="",numberOfSO="",sumOfSO="";
			String newfromdate="",newtodate="";
			double Grandindex=0,P_Grandindex=0,Grandindex1=0,P_Grandindex1=0,Month_index_total=0,Month_Grandindex=0;
			DecimalFormat df2 = new DecimalFormat("0.00");
			String MarktngCode="";
			StringBuffer htmlstring= new StringBuffer();
			long	SQValueMonthly=0,SQValueWeekly=0;
			String SQValue="";
			String abc="";
			int visitcounter=0,no=0,finalvisits=0;
	%>
	<%
	String exportFileName="MarketingReportDetails.xls";
	Date today = new Date();
	Calendar cal = Calendar.getInstance();
	cal.setTime(today);
	cal.add(Calendar.DAY_OF_MONTH, -30);
	Date today30 = cal.getTime();
	fromDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(today30);
	
	String todaysDate=new SimpleDateFormat("yyyy-MM-dd").format(today);
	//cal.set(cal.get(cal.YEAR),cal.get(cal.MONTH),1);
	//Date monthsDateAsDate = cal.getTime();
	
	toDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
	fromDate=toDate=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	if (!(null == request.getParameter("fromdate"))) {
	fromDate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("fromdate")));
	System.out.println(">>>>>>>>>fromDate:"+fromDate);
	newfromdate=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("fromdate")));
	fromdatevdTime=new SimpleDateFormat("yyyy-MM-dd ").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("fromdate")));
	fromDateCal=request.getParameter("fromdate");
	}
	if (!(null == request.getParameter("todate"))){
		toDate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("todate")));
		System.out.println(">>>>>>>>>toDate:"+toDate);
		newtodate=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("todate")));	
		todatevdTime=new SimpleDateFormat("yyyy-MM-dd ").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("todate")));
		toDateCal=request.getParameter("todate");
	}
	DateFormat formatter1 ; 
	Date from1,to1 ; 
	 formatter1 = new SimpleDateFormat("yyyy-MM-dd");
	 from1 = (Date)formatter1.parse(fromDate);  
	 to1 = (Date)formatter1.parse(toDate);
	 System.out.println(">>>>>>>>>>>>>>>from1 :"+from1 ); 
	 System.out.println(">>>>>>>>>>>>>>>to1 :"+to1);
	  double diff= (to1.getTime() - from1.getTime()) / (1000 * 60 * 60 * 24)+1;
	  System.out.println(">>>>>>>>>>>>>>>>>>diff:"+diff);
	
	if (null == request.getParameter("repName"))
		selectedName = "All";
	else
		selectedName = request.getParameter("repName");
	if(!(session.getAttribute("userLevel").toString().equalsIgnoreCase("level5")))
		selectedName = session.getAttribute("EmpName").toString();
		
	System.out.println(">>>>>>>>>selectedName:"+selectedName);
	
try 
{
					conn = erp.ReturnConnection();
					st = conn.createStatement();
					st1 = conn.createStatement();
					st2 = conn.createStatement();
					st3 = conn.createStatement();
					st4 = conn.createStatement();
					st5 = conn.createStatement();
					st6 = conn.createStatement();
		%>


<%
//++++++++++++++++++Ashutosh Bhardwaj+++++++++++++++++++++++++++++++++
boolean flag_day = false;
String f_day =  fromDate.substring(fromDate.lastIndexOf("-")+1).trim();
String l_day =  toDate.substring(toDate.lastIndexOf("-")+1).trim();

System.out.println("The fromdate day =====================>"+fromDate+"  First Day of Month ==>"+f_day);
System.out.println("The todate day   =====================>"+toDate+"    Last Day of Month  ==>"+l_day);

int days_of_month = 0;
int d1 = 0;
if(f_day.equals("01")){
	
	Date d = new SimpleDateFormat("yyyy-MM-dd").parse(fromDate);
	Calendar cal1 = Calendar.getInstance();
	cal1.setTime(d);
	 d1 = cal1.getActualMaximum(Calendar.DAY_OF_MONTH);	

	String sql = "select DATEDIFF('"+toDate+"', '"+fromDate+"') as daydiff";
	ResultSet rs = st6.executeQuery(sql);
	if(rs.next()){
		days_of_month = rs.getInt("daydiff") + 1;
	}
	
	if((Integer.parseInt(l_day) == d1) && (d1 == days_of_month))
	{
		//For Monthly index
		flag_day = true;
	}			
}
System.out.println("The d1 in month ===================>"+d1);
System.out.println("The days in month ===================>"+days_of_month);
System.out.println("The flag day   =====================>"+flag_day);
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%>	
		<div
			style="font-size: 1.6em; text-align: center; margin-top: 0.2em; margin-bottom: 0.2em;">
		<a><font face ="Arial" size = 3>Marketing Representatives Performance Report</font></a></div>
	
	
	<form  name="marketing" action="" method="get" >
	
	
	
	<table border="0" width="100%">
			<tr>
						<td valign="top" align="right" width="20%">
						<div id='repName'>
	<%if(!(session.getAttribute("userLevel").toString().equalsIgnoreCase("level5"))){ %>
	<b>Marketing Representative Name :</b>&nbsp; 
										<input type="text" name="customerEnteredBy" readonly="readonly" id="search-text"
											value='<%=session.getAttribute("EmpName") %>' style='width: 120px; height: 12px; border: none;' /> 
					 <%} else{%>
						
											 <b>Marketing Rep. Name :</b></td><td valign="top" align="left" width="25%"><select
							name="repNameSel" id="repNameSel"  multiple='multiple'   size="5" style="width: 220px;"
							 >
							<%
								String sql = "select MarketingRepName ,MarketingRepCode from "+session.getAttribute("CompanyMasterID").toString()+"marketingrepmaster "+
								" WHERE  username<>'' AND password<>''  AND ( OtherGroups=1 OR Compressor=1 OR	DigitalEquipment=1 OR 	DGSet=1 OR 	Endoscope=1 OR 	OtherGroups=1)  order by MarketingRepName";
									ResultSet rs = st.executeQuery(sql);
									%>
									<option value="All">All</option>
									<%
									while (rs.next()) {
							%>
							<option value="<%=rs.getString(2)%>" >
								<%=rs.getString(1)%></option>
							<%
								}
							%>
						</select>
						<%} %></div>
						</td>
	
	
				<td align="left">
				<b> From</b>&nbsp;&nbsp;
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
				
				<b>To </b>&nbsp;&nbsp;
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
				<input type="submit" name="submit" id="submit" style="border: outset;"
					value="Go" /></td>
<!--					<td align="right">-->
<!--					<font size="2" face = "Arial">&nbsp;&nbsp;&nbsp;< %= new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date())%>-->
<!--					</td>-->
			</tr>
			
		</table>
	
	
	</form>
	
	<br></br>
<form id="marketingreport" name="marketingreport" method="post">	
 <div align="right">
	 		
			<font size="2" face = "Arial">&nbsp;&nbsp;&nbsp;<%= new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date())%>
			 <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('a','tableHTML');">
			<img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img><a href="#" onclick="window.print();return false;" title="Print"><img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img></a>
			</a>
 </div>
 <br>
	<div id="a">
	<%
	if(null != request.getQueryString())
	{
	%>
		<table border="1px" width="80%"   class="sortable">
		<tr>
		<th>Sr.No</th>
		<%if((session.getAttribute("userLevel").toString().equalsIgnoreCase("level5"))){ %>
		<th>Representative</th><%} %>
		<th>Visits</th>
		<th>Calls</th>
		<th>Letters</th>
		<th>E-mails</th>
		<th>Meetings</th>
		<th>Sales Quotations(Rs.)</th>
		<th>New Prospects</th>
		<th>No of SO</th>
		<th>Total SO Value</th>
		<th>Index UptoDate(%)</th>
		</tr>
		
	<%	
	  int frommonthdays=0,tomonthdays=0,TargetForFromMonth=0,TargetForToMonth=0,diffdate=0,DateDiffToday=0;
	  String Sqlfrom=" SELECT day( last_day( '"+fromDate+"' ) )  ";
	  System.out.println("Sqlfrom:"+Sqlfrom);
	  ResultSet rsfrom=st.executeQuery(Sqlfrom);
	  if(rsfrom.next())
	  {
		  frommonthdays=rsfrom.getInt(1);
	  }
	  System.out.println("frommonthdays:"+frommonthdays);
	  String Sqlto=" SELECT day( last_day( '"+toDate+"' ) )  ";
	  System.out.println("Sqlto:"+Sqlto);
	  ResultSet rsto=st1.executeQuery(Sqlto);
	  if(rsto.next())
	  {
		  tomonthdays=rsto.getInt(1);
	  }
	  System.out.println("tomonthdays:"+tomonthdays);
	  
	  String SqlDateDiff1="Select DATEDIFF('"+toDate+"','"+fromDate+"')";
	  ResultSet rsDate1=st.executeQuery(SqlDateDiff1);
	  rsDate1.next();
	  DateDiffToday=rsDate1.getInt(1)+1;
	  System.out.println(">>>>>>>>>>>DateDiffToday:"+DateDiffToday);
	  /*************************Calulation for month target beetween these date range****************************************/
	  
	  
	String[] arr=null;
	if(!(request.getParameterValues("repNameSel")==null))
	{
		selectedName="";
		 arr=request.getParameterValues("repNameSel");
		if(arr[0].equalsIgnoreCase("All"))
			selectedName="All";		
		else
		{
			for(int i=0;i<arr.length;i++) 
				selectedName+="'"+arr[i]+"',";
	 
		 selectedName = selectedName.substring(0, selectedName.length() - 1);
		}
		for(int i=0;i<arr.length;i++)
		 	System.out.println("Sel name***********"+arr[i]);		
	}
	
	 
		 sqlDetails="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"marketingrepmaster  WHERE MarketingRepName='"+selectedName+"'  ";
		 System.out.println(">>>>>>>>sqlDetails:"+sqlDetails);
		 if ("All".equalsIgnoreCase(selectedName) && session.getAttribute("userLevel").toString().equalsIgnoreCase("level5"))
			 sqlDetails="   SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"marketingrepmaster   WHERE username<>'' AND password<>''  AND ("+
			 			" OtherGroups=1 OR Compressor=1 OR	DigitalEquipment=1 OR 	DGSet=1 OR 	Endoscope=1 OR 	OtherGroups=1) order by MarketingRepName";
		 
		 else if (session.getAttribute("userLevel").toString().equalsIgnoreCase("level5"))
			 sqlDetails="   SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"marketingrepmaster   WHERE "+
				"username<>'' AND  password<>''  AND ( OtherGroups=1 OR Compressor=1 OR	DigitalEquipment=1 OR 	DGSet=1 OR 	Endoscope=1 OR 	OtherGroups=1   )  and  MarketingRepCode in( "+selectedName.replaceAll("'","")+")   ORDER BY  MarketingRepName ";
		 
		 else
			 sqlDetails="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"marketingrepmaster  WHERE MarketingRepName='"+selectedName+"'  ";
	
		 System.out.println(sqlDetails);
	int i=1;
		ResultSet rsDetails=st1.executeQuery(sqlDetails);
		while(rsDetails.next()){
			
			 String sqlCount="SELECT    count(*) , 'PhoneCall'  from "+session.getAttribute("CompanyMasterID").toString()+"followup where			 FollowUpType   "+
				                         "       in('phoneCall','Ph Call') and MarketingRepcode			 "+
				                         "       ="+rsDetails.getString("MarketingRepCode")+" and FollowUpDate  between			 "+
				                         "       '"+fromDate+"' and '"+toDate+"'			 "+
				                         "        union			 "+
				                         "       SELECT    count(*) , 'Visit'  from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType			 "+
				                         "       in('Visit') and MarketingRepcode 			 "+
				                         "       ="+rsDetails.getString("MarketingRepCode")+" and FollowUpDate  between			 "+
				                         "       '"+fromDate+"' and '"+toDate+"'			 "+
				                         "       union			 "+
				                         "       SELECT    count(*) , 'Letter'  from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType			 "+
				                         "       in('Letter') and MarketingRepcode 			 "+
				                         "       ="+rsDetails.getString("MarketingRepCode")+" and FollowUpDate  between			 "+
				                         "       '"+fromDate+"' and '"+toDate+"'			 "+
				                         "       union			 "+
				                         "       SELECT count(*) , 'Meeting' from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType			 "+
				                         "       in('Meeting') and MarketingRepcode"+
				                         "       ="+rsDetails.getString("MarketingRepCode")+" and FollowUpDate between			 "+
				                         "       '"+fromDate+"' and '"+toDate+"'			 "+
				                         "       union			 "+
				                         "       SELECT count(*) , 'Email' from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType			 "+
				                         "       in('E-mail','E mail','Mail','Email') and MarketingRepcode 			 "+
				                         "       ="+rsDetails.getString("MarketingRepCode")+" and FollowUpDate between			 "+
				                         "       '"+fromDate+"' and '"+toDate+"'			 "+
				                         "       union			 "+
				                         "       SELECT    count(*) , 'NoOfProspects'  from "+session.getAttribute("CompanyMasterID").toString()+"prospectivecustmaster where			 "+
				                         "       CustEnteredByRep ='"+rsDetails.getString("MarketingRepName")+"' and	Assighnedby ='"+rsDetails.getString("MarketingRepName")+"' and 		 "+
				                         "       ProspCustAddedOn  >= '"+fromdatevdTime+" 00:00:00' and  ProspCustAddedOn <= '"+todatevdTime+" 23:59:59' "+
				                         "		 UNION "+
				                         "		 SELECT count(*) ,'NoOfSO' FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det where TWEmpName='"+rsDetails.getString("MarketingRepName")+"' "+
				                         "		 and SalesOrderDate between '"+fromDate+"' and '"+toDate+"' and SOCancelled=0"+
				                         "    		 UNION "+
				                         "		 SELECT count(*) ,'NoOfSQ' FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det where TWEmpName='"+rsDetails.getString("MarketingRepName")+"' "+
				                         "		 and SalesQuoDate between '"+fromDate+" 00:00:00  	' and '"+toDate+" 00:00:00  	' and SalesQuoCancelled=0"+
				                         "		 UNION "+
				                         "		 SELECT SUM(Total) ,'SumOfSO' FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det where TWEmpName='"+rsDetails.getString("MarketingRepName")+"' "+
				                         "		 and SalesOrderDate between '"+fromDate+"' and '"+toDate+"' and SOCancelled=0"+
				                          "       UNION "+
				                 		"		SELECT Sum(Total),'TotalSO' FROM `"+session.getAttribute("CompanyMasterID").toString()+"salesquo_det` WHERE TWEmpName='"+rsDetails.getString("MarketingRepName")+"' and SalesQuoCancelled='0' and SalesQuoDate between '"+fromDate+" 00:00:00' and '"+toDate+" 00:00:00'";
		
	
	//String sqlrt = "SELECT count(*) , 'NoOfProspects'  from "+session.getAttribute("CompanyMasterID").toString()+"prospectivecustmaster where CustEnteredByRep ='"+rsDetails.getString("MarketingRepName")+"' and ProspCustAddedOn  between '"+fromdatevdTime+"' and '"+todatevdTime+"'";
	               // System.out.println(">>>>>>>>>>>>>>>>>>"+sqlCount);
			 
			 			ResultSet rsCount=st2.executeQuery(sqlCount);
			 			System.out.println(">>>  "+sqlCount);
			 			phoneCalls=(rsCount.next()?rsCount.getString(1):"0");
			 			visits=(rsCount.next()?rsCount.getString(1):"0");
			 			letters=(rsCount.next()?rsCount.getString(1):"0");
			 			meetings=(rsCount.next()?rsCount.getString(1):"0");
			 			email=(rsCount.next()?rsCount.getString(1):"0");
			 			numberOfprospects=(rsCount.next()?rsCount.getString(1):"0");
			 			numberOfSO=(rsCount.next()?rsCount.getString(1):"0");
			 			numberOfSQ=(rsCount.next()?rsCount.getString(1):"0");
			 			sumOfSO=(rsCount.next()?rsCount.getString(1):"0");
			 			sumOfSO=(sumOfSO==null?"0":sumOfSO);
			 		    SQValue=(rsCount.next()?rsCount.getString(1):"0");
			 		    if(SQValue==""||SQValue==null)
			 		    {
			 		    	SQValue="0";
			 		    }
			 			System.out.println(">>>>>>>>>>SQValue:"+SQValue);
			 			
			 			
	%>
	
			<tr>
			<td align="right"><div align ="right"><%=i++ %></div></td>
			<%if((session.getAttribute("userLevel").toString().equalsIgnoreCase("level5"))){ %>
			
				<td align="left"><div align ="left">
				<a href="#" style="font-weight: bold;" onclick="popUp('marketingReportLevel2.jsp','<%=rsDetails.getString("MarketingRepName")%>','repDetails','<%=fromDate %>','<%=toDate %>')">
				<%=rsDetails.getString("MarketingRepName") %></a></div></td>
			<%} %>
			<td align="left"><div align ="right"><a href="#" style="font-weight: bold;" onclick="detailReport('marketingDetReport.jsp','<%=rsDetails.getString("MarketingRepCode")%>','<%=fromDate %>','<%=toDate %>','<%=1%>')"><%=visits %></a></div></td>
			<td><div align ="right"><a href="#" style="font-weight: bold;" onclick="detailReport('marketingDetReport.jsp','<%=rsDetails.getString("MarketingRepCode")%>','<%=fromDate %>','<%=toDate %>','<%=2%>')"><%=phoneCalls %></a></div></td>
			<td><div align ="right"><a href="#" style="font-weight: bold;" onclick="detailReport('marketingDetReport.jsp','<%=rsDetails.getString("MarketingRepCode")%>','<%=fromDate %>','<%=toDate %>','<%=3%>')"><%=letters%></a></div></td>
			<td><div align ="right"><a href="#" style="font-weight: bold;" onclick="detailReport('marketingDetReport.jsp','<%=rsDetails.getString("MarketingRepCode")%>','<%=fromDate %>','<%=toDate %>','<%=4%>')"><%=email%></a></div></td>
			<td><div align ="right"><a href="#" style="font-weight: bold;" onclick="detailReport('marketingDetReport.jsp','<%=rsDetails.getString("MarketingRepCode")%>','<%=fromDate %>','<%=toDate %>','<%=5%>')"><%=meetings %></a></div></td>
			<td><div align ="right"><%=SQValue %></div></td>
			<td><div align ="right"><a href="#" style="font-weight: bold;" onclick="detailReport('marketingDetReport.jsp','<%=rsDetails.getString("MarketingRepCode")%>','<%=fromDate %>','<%=toDate %>','<%=6%>')"><%=numberOfprospects%></a></div></td>
			<td><div align ="right"><%=numberOfSO %></div></td>
			<td><div align ="right"><%=sumOfSO %></div></td>
			<%
			MarktngCode=rsDetails.getString("MarketingRepCode");
			System.out.println(">>>>>>>>>>>MarktngCode:"+MarktngCode);
			String sqlCount1="SELECT    count(*) , 'PhoneCall'  from "+session.getAttribute("CompanyMasterID").toString()+"followup where			 FollowUpType   "+
			"       in('phoneCall','Ph Call') and MarketingRepcode='"+MarktngCode+"' and FollowUpDate  between			 "+
			"       '"+fromDate+"' and '"+toDate+"'			 "+
			"        union			 "+
			"       SELECT    count(*) , 'Visit'  from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType			 "+
			"       in('Visit') and MarketingRepcode='"+MarktngCode+"' and FollowUpDate  between			 "+
			"       '"+fromDate+"' and '"+toDate+"'			 "+
			"       union			 "+
			"       SELECT    count(*) , 'Letter'  from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType			 "+
			"       in('Letter') and MarketingRepcode='"+MarktngCode+"' and FollowUpDate  between			 "+
			"       '"+fromDate+"' and '"+toDate+"'			 "+
			"       union			 "+
			"       SELECT count(*) , 'Meeting' from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType	"+
			"       in('Meeting') and MarketingRepcode='"+MarktngCode+"' and FollowUpDate  between			 "+
			"       '"+fromDate+"' and '"+toDate+"'			 "+
			"       union			 "+
			"       SELECT count(*) , 'Email' from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType			 "+
			"       in('E-mail','E mail','Mail','Email') and MarketingRepcode='"+MarktngCode+"' and FollowUpDate  between			 "+
			"       '"+fromDate+"' and '"+toDate+"'			 "+
			"       union			 "+
			"       SELECT    count(*) , 'NoOfProspects'  from "+session.getAttribute("CompanyMasterID").toString()+"prospectivecustmaster where			 "+
			"       CustEnteredByRep ='"+rsDetails.getString("MarketingRepName")+"' and			 "+
			"       ProspCustAddedOn  >= '"+fromDate+" 00:00:00' and  ProspCustAddedOn <= '"+toDate+" 23:59:59' "+
			"		 UNION "+
			"		 SELECT count(*) ,'NoOfSO' FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det where TWEmpName='"+rsDetails.getString("MarketingRepName")+"' "+
			"		 and SalesOrderDate between '"+fromDate+"' and '"+toDate+"' and SOCancelled=0"+
			"    		 UNION "+
			"		 SELECT count(*) ,'NoOfSQ' FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det where TWEmpName='"+rsDetails.getString("MarketingRepName")+"' "+
			"		 and SalesQuoDate between '"+fromDate+" 00:00:00  	' and '"+toDate+" 00:00:00  	' and SalesQuoCancelled=0"+
			"		 UNION "+
			"		 SELECT SUM(Total) ,'SumOfSO' FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det where TWEmpName='"+rsDetails.getString("MarketingRepName")+"' "+
			"		 and SalesOrderDate between '"+fromDate+"' and '"+toDate+"' and SOCancelled=0"+
			 " UNION "+
			 "SELECT Sum(Total),'TotalSQ' FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det WHERE TWEmpName='"+rsDetails.getString("MarketingRepName")+"' and SalesQuoDate between '"+fromDate+" 00:00:00' and '"+toDate+" 00:00:00'  AND SalesQuoCancelled =0 ";
			 ResultSet rsCount1=st2.executeQuery(sqlCount1);
			 System.out.println(">>>  "+sqlCount1);
			 String phoneCalls1=(rsCount1.next()?rsCount1.getString(1):"0");
			 String visits1=(rsCount1.next()?rsCount1.getString(1):"0");
			 System.out.println(">>>visits1:  "+visits1);
			 String letters1=(rsCount1.next()?rsCount1.getString(1):"0");
			 String meetings1=(rsCount1.next()?rsCount1.getString(1):"0");
			 System.out.println(">>>meetings1:  "+meetings1);
			 String email1=(rsCount1.next()?rsCount1.getString(1):"0");
			 String numberOfprospects1=(rsCount1.next()?rsCount1.getString(1):"0");
			 String numberOfSO1=(rsCount1.next()?rsCount1.getString(1):"0");
			 String numberOfSQ1=(rsCount1.next()?rsCount1.getString(1):"0");
			 String sumOfSO1=(rsCount1.next()?rsCount1.getString(1):"0");
			 sumOfSO1=(sumOfSO1==null?"0":sumOfSO1);	
			 String SqAchieved=(rsCount1.next()?rsCount1.getString(1):"0");
			 
			 
			 System.out.println("&&&&&&&&&&&&&&&&&&&&&  ");
			 String sqlvis="select ProspCustCode from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType "+
				"   in('Visit') and MarketingRepcode='"+MarktngCode+"' and FollowUpDate  between '"+fromDate+"' and '"+toDate+"' ";
			
			 System.out.println(sqlvis);
			 ResultSet rstt=st5.executeQuery(sqlvis);
			 System.out.println(sqlvis);
			 while(rstt.next())
			 {
				 abc=rstt.getString(1);
				 System.out.println("in while  ");
				 String sql55="select OEM from  "+session.getAttribute("CompanyMasterID").toString()+"prospectivecustmaster where CustomerCode='"+abc+"'";
				 ResultSet rs55=st2.executeQuery(sql55);
				 System.out.println(sql55);
				 if(rs55.next())
				 no=rs55.getInt("OEM");
				 System.out.println(no);
				 if(no == 0)
				 {
					 System.out.println("===inside if ===");
					 visitcounter=1;
				 }
				 else
				 {
					 System.out.println("===inside else ===");
					 visitcounter=2;
				 }
				 
			/*	 if(no > 0 && no < 100)
				 {
					 visitcounter=1;
				 }
				 
				 if(no > 100 && no < 300)
				 {
					 visitcounter=2;
				 }
				 
				 if(no > 300 && no < 500)
				 {
					 visitcounter=3;
				 }
				 
				 if(no > 500 )
				 {
					 visitcounter=4;
				 }*/
				 
				 finalvisits=finalvisits+visitcounter;
				 
			 }
			 System.out.println("OUT OF WHILE  [finalvisits]"+finalvisits);
			 
			 System.out.println("22222222222222222222 "+finalvisits);
			 
			 double target_visit = 0.0;//+++++++++++++++++=
			 double Month_indexofvisits=0,month_P_indexofvisits=0,Month_index_total12=0,Month_Grandindex12=0;
				try{
					System.out.println("11111111  "+rsDetails.getInt("VisitsTarget"));
					if(rsDetails.getInt("VisitsTarget")==0) 
					{
						System.out.println("IN IFF  ");
						Month_index_total +=Month_indexofvisits;
						Month_Grandindex +=month_P_indexofvisits;
					}
					else
					{
						//++++++++++++++++++
						if(flag_day == true) 
						{
							target_visit = (double)Math.round(((double)rsDetails.getInt("VisitsTarget")*4));
							
						}else
						{
							
							target_visit = (double)Math.round(((double)rsDetails.getInt("VisitsTarget")/(double)7)*diff);
						}
						
						System.out.println("%%IN LESE   %%%%%%%%%");
						//Month_indexofvisits=((double)(Integer.parseInt(visits1)+Integer.parseInt(meetings1))/(double)Math.round(((double)rsRep.getInt("VisitsTarget")/(double)7)*Datediff))*35;
						Month_indexofvisits=((double)(finalvisits+Integer.parseInt(meetings1))/target_visit)*80;
						Month_index_total12 +=Month_indexofvisits;
						month_P_indexofvisits=((double)(finalvisits+Integer.parseInt(meetings1))/target_visit)*80;
			            Month_Grandindex12 +=month_P_indexofvisits;
					}
					
				}catch(Exception e){System.out.println(e);}
				/*double Month_indexofsalesquo=0,Month_P_indexofsalesquo=0;
				int dayofmonth=0,nooffromdaysmonth=0,TargetFinal=0;
				try{
					if(rsDetails.getInt("QuoteValueWeeklyTarget")==0)
					{
						Month_index_total12 +=Month_indexofsalesquo;
						Month_Grandindex12 +=Month_P_indexofsalesquo;
					}
					else
					{
						System.out.println(">>>>>>>>:"+rsDetails.getInt("QuoteValueWeeklyTarget"));
						TargetForFromMonth=(rsDetails.getInt("QuoteValueWeeklyTarget")*4)/frommonthdays;
						TargetForToMonth=(rsDetails.getInt("QuoteValueWeeklyTarget")*4)/tomonthdays;
						System.out.println(">>>>>>TargetForFromMonth:"+TargetForFromMonth);
						System.out.println(">>>>>>TargetForToMonth:"+TargetForToMonth);
					    
						TargetFinal=TargetForFromMonth*DateDiffToday;
						System.out.println(">>>>>>TargetFinal:"+TargetFinal);
						
						
						
					Month_indexofsalesquo=(((double)Integer.parseInt(SqAchieved))/(double)TargetFinal)*35;
					Month_index_total12 +=Month_indexofsalesquo;
					Month_P_indexofsalesquo=(((double)Integer.parseInt(SqAchieved))/(double)TargetFinal)*35;
					Month_Grandindex12 +=Month_P_indexofsalesquo;
					
					}
					
				}catch(Exception e){System.out.println(e);}*/
				double Month_indexofnewprospect=0,Month_P_indexofnewprospect=0;
				double target_prospect = 0.0;
				
				try{
					if(rsDetails.getInt("NewProspectTarget")==0)
					{
						Month_index_total12 +=Month_indexofnewprospect;
						Month_Grandindex12 +=Month_P_indexofnewprospect;	
					}
					else
					{
						if(flag_day == true) 
						{
							target_prospect = (double)Math.round(((double)rsDetails.getInt("NewProspectTarget")*4));						
						}else
						{						
							target_prospect = (double)Math.round(((double)rsDetails.getInt("NewProspectTarget")/(double)7)*diff);
						}
						
						Month_indexofnewprospect=((double)(Integer.parseInt(numberOfprospects1))/target_prospect)*20;
						Month_index_total12 +=Month_indexofnewprospect;
						Month_P_indexofnewprospect=((double)(Integer.parseInt(numberOfprospects1))/target_prospect)*20;
						Month_Grandindex12 +=Month_P_indexofnewprospect;
					}
				}catch(Exception e){System.out.println(e);}
				/*double Month_indexofphonecalls=0,Month_P_indexofphonecalls=0;
				try{
					Month_indexofphonecalls=((double)(Integer.parseInt(phoneCalls1)+Integer.parseInt(email1))/(double)Math.round(((double)(rsDetails.getInt("CallsTarget")+rsDetails.getInt("LettersTarget"))/(double)7)*diff))*10;
					Month_index_total12 +=Month_indexofphonecalls;
					Month_P_indexofphonecalls=((double)(Integer.parseInt(phoneCalls1)+Integer.parseInt(email1))/(double)Math.round(((double)(rsDetails.getInt("CallsTarget")+rsDetails.getInt("LettersTarget"))/(double)7)*diff))*10;
					Month_Grandindex12 +=Month_P_indexofphonecalls;
				}catch(Exception e){System.out.println(e);}*/
			
			%>
		 	<td align ="right"><div align ="right"><input type="text" value="-" id="indextop"  name="indextop" style="border: none;" /></div></td>	
			</tr>
			
			<%
			
		}
		if(i==1){
			%>
			<tr><td colspan="11" align="center"><b></b></td></tr>
			<tr><td colspan="11" align="center"><b>--- NO DATA ---</b></td></tr>
			<%
		}	
	}
	
	%>
	</table>
	<br>
	
	<%
	if(null != request.getQueryString())
	if(selectedName.contains("All"))
	{	
		if((session.getAttribute("userLevel").toString().equalsIgnoreCase("level5")) || session.getAttribute("user").toString().equalsIgnoreCase("Puri"))
		  {
				
			%>
			<div align="center" style="font-size: 1.4em; margin-top: 0.5em;margin-bottom: 0.5em;"><a><font face = "Arial">Performance Of Team During <%=newfromdate %> To <%=newtodate%></font></a>
			</div>
			
			<%
			
			String sqlDate="SELECT DAYOFWEEK('"+todaysDate+"')";
			System.out.println(sqlDate);
			ResultSet rsDate=st3.executeQuery(sqlDate);
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
			rsDate=st4.executeQuery(sqlDate);
				rsDate.next();
			
			String MondayOfThisWeek=rsDate.getString(1);
			
			System.out.println("+*+*+*+*+*+*+*+*   "+MondayOfThisWeek);
			String sqlRep1="Select *  from "+session.getAttribute("CompanyMasterID").toString()+"marketingrepmaster WHERE  username<>'' and password<>''  and (Compressor=1 or DigitalEquipment=1 or DGSet=1 or Endoscope=1 or OtherGroups=1)  order by  MarketingRepNAme";
			ResultSet rsRep1=st1.executeQuery(sqlRep1);
			System.out.println("SALME QUERY   "+sqlRep1);
			
			int masterCounter1=1;
			if(rsRep1.next())
			{
				System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>............ ");
			try{	
			SQValueMonthly=rsRep1.getLong("QuoteValueMonthlyTarget");
				SQValueWeekly=rsRep1.getLong("QuoteValueWeeklyTarget");
			}catch(Exception e){e.printStackTrace();}	
			int j=0;
			int sumVisits1=0,sumPhoneCalls1=0,sumLetters1=0,sumSalesQuotation1=0,sumNewProspects1=0,sumProspTotal=0;
			int  allvisits[] = new int[7],allphoneCalls[] = new int[7],allletters[] = new int[7],allSalesQuotation[] = new int[7],allnewProspects[] = new int[7],allProsTotal[]=new int[7];
			System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>............ ");
			
			/*DateFormat formatter ; 
			Date from,to ; 
			 formatter = new SimpleDateFormat("yyyy-MM-dd");
			 from = (Date)formatter.parse(fromDate);  
			 to = (Date)formatter.parse(toDate);
			 System.out.println(">>>>>>>>>>>>>>>from :"+from ); 
			 System.out.println(">>>>>>>>>>>>>>>to :"+to);
			  double diff= (to.getTime() - from.getTime()) / (1000 * 60 * 60 * 24)+1;
			  System.out.println(">>>>>>>>>>>>>>>>>>diff:"+diff);*/
			%>
			<table align=center border=1 class="sortable" style="width: 50%">
			<tr>
					<th><b>Particulars</b></th>
					<th><b>Weightage(%)</b></th>
					<th><b>Total</b></th>
					<th><b>Target</b></th>
					<th><b>Weighted Index (%)</b></th>
					<th><b>Index UptoDate(%)</b></th>
			</tr> 
			<%
			htmlstring.append("<br><h4 align=center> Performance Of Team During "+newfromdate+" To "+newtodate+"  </h4>" +
					"<table align=center border=1 cellpadding=0 cellspacing=0>" +
						"<tr>" +
						"<th><b>Particulars</b></th>" +
						"<th><b>Weightage</b></th>" +
						"<th><b>Total</b></th>" +
						"<th><b>Target</b></th>" +
						"<th><b>Weighted Index </b></th>" +
						"<th><b>Index UptoDate</b></th></tr>");
			
			/*String firstdayofmonthDate=new SimpleDateFormat("yyyy-MM-dd").format(monthsDateAsDate);
			//String SqlDateDiff1="Select DATEDIFF('"+todaysDate+"','"+firstdayofmonthDate+"')";
			ResultSet rsDate1=st.executeQuery(SqlDateDiff1);
			rsDate1.next();
			int DateDiffToday=rsDate1.getInt(1)+1; 
			
			String SqlLastday="Select LAST_DAY('"+firstdayofmonthDate+"')";
			ResultSet rsLastday=st1.executeQuery(SqlLastday);
			rsLastday.next();
			String LastD=rsLastday.getString(1);
			
			String SqlDateDiff2="Select DATEDIFF('"+LastD+"','"+firstdayofmonthDate+"')";
			ResultSet rsDate2=st3.executeQuery(SqlDateDiff2);
			rsDate2.next();
			int DateDiffMonth=rsDate2.getInt(1)+1; */
			
			String sqlMarktingAll ="SELECT count( * ) ,'Visit' FROM "+session.getAttribute("CompanyMasterID").toString()+"followup WHERE FollowUpType IN ('Visit', 'v', 'Meeting') AND FollowUpDate between '"+fromDate+"' and '"+toDate+"'  "+
			 " UNION "+
			 "SELECT count( * ),'PhoneCall' FROM "+session.getAttribute("CompanyMasterID").toString()+"followup WHERE FollowUpType IN ('phoneCall', 'Ph Call') AND FollowUpDate between '"+fromDate+"' and '"+toDate+"' "+
			 " UNION "+
			 "SELECT count( * ),'Letters' FROM "+session.getAttribute("CompanyMasterID").toString()+"followup WHERE FollowUpType IN ('Letters', 'E-mail') AND FollowUpDAte between '"+fromDate+"' and '"+toDate+"' "+
			   " UNION "+
			 "SELECT count(*),'NoOfSQ' FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det WHERE SalesQuoDate between '"+fromDate+" 00:00:00' and '"+toDate+" 00:00:00'  AND SalesQuoCancelled =0 "+
			 " UNION "+
			 "SELECT count( * ),'NoOfNC' FROM "+session.getAttribute("CompanyMasterID").toString()+"prospectivecustmaster WHERE AddedOnDate between '"+fromDate+" 00:00:00' and '"+toDate+" 00:00:00'  AND ( CustEnteredByRep = Assighnedby )"+
			 " UNION "+
			 "SELECT Sum(Total),'TotalSQ' FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det WHERE SalesQuoDate between '"+fromDate+" 00:00:00' and '"+toDate+" 00:00:00'  AND SalesQuoCancelled =0 ";
				
			 
			System.out.println("QUERY  FOR ALL   ALL   ALLL ALLLL  ALLLL "+sqlMarktingAll);
			ResultSet rsMarketingAll = st.executeQuery(sqlMarktingAll);
			
			while(rsMarketingAll.next())
			{
					sumVisits1+= allvisits[j]=rsMarketingAll.getInt(1);
					if(rsMarketingAll.next())
						sumPhoneCalls1+= allphoneCalls[j]=rsMarketingAll.getInt(1);
					if(rsMarketingAll.next())
						sumLetters1+= allletters[j]=rsMarketingAll.getInt(1);
					if(rsMarketingAll.next())
						sumSalesQuotation1+= allSalesQuotation[j]=rsMarketingAll.getInt(1);
					if(rsMarketingAll.next())
						sumNewProspects1+= allnewProspects[j]=rsMarketingAll.getInt(1);
					if(rsMarketingAll.next())
						sumProspTotal+=allProsTotal[j]=rsMarketingAll.getInt(1);
					 j++;
			}
			
			//cntLoop++;
			
			
			
			/* start of  new logic for visits*/
			
			String abc2="";
			int no1=0,viscount=0,finalvisitcnt=0;
			String sqlvis1="select ProspCustCode from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType IN ('Visit', 'v', 'Meeting')  and FollowUpDate  between '"+fromDate+"' and '"+toDate+"' ";
			
			 System.out.println(sqlvis1);
			 ResultSet rstt1=st2.executeQuery(sqlvis1);
			 System.out.println(sqlvis1);
			 while(rstt1.next())
			 {
				 abc2=rstt1.getString(1);
				 System.out.println("in while  ");
				 String sql555="select OEM from  "+session.getAttribute("CompanyMasterID").toString()+"prospectivecustmaster where CustomerCode='"+abc2+"'";
				 ResultSet rs555=st3.executeQuery(sql555);
				 System.out.println(sql555);
				 if(rs555.next())
				 no1=rs555.getInt("OEM");
				 System.out.println(no);
				 if(no1 == 0)
				 {
					 viscount=1;
				 }else
				 {
					 viscount=2;
				 }
				 
				/* if(no1 > 0 && no1 < 100)
				 {
					 viscount=1;
				 }
				 
				 if(no1 > 100 && no1 < 300)
				 {
					 viscount=2;
				 }
				 
				 if(no1 > 300 && no1 < 500)
				 {
					 viscount=3;
				 }
				 
				 if(no1 > 500 )
				 {
					 viscount=4;
				 }*/
				 
				 finalvisitcnt=finalvisitcnt+viscount;
				 
			 }
			/*end of new logic for visits*/
			
			
			
			
			
			
			
			
			
			double target_visit = 0.0;
			double totalvisformonth=0,totalcalsformonth=0,totalletsformonth=0,totalsalquoformonth=0,totalnewquoformonth=0;
			String sqlTarget="Select SUM(VisitsTarget),SUM(CallsTarget),sum(LettersTarget),sum(QuoteValueWeeklyTarget),sum(NewProspectTarget) from "+session.getAttribute("CompanyMasterID").toString()+"marketingrepmaster "+
			"WHERE  username<>'' and password<>'' and (Compressor=1 or DigitalEquipment=1 or DGSet=1 or Endoscope=1 or OtherGroups=1)  order by  MarketingRepNAme";
			System.out.println(sqlTarget);
			ResultSet rsTargetForMonth=st5.executeQuery(sqlTarget);
			while(rsTargetForMonth.next())
			{
				 totalvisformonth=rsTargetForMonth.getInt(1);
				 totalcalsformonth=rsTargetForMonth.getInt(2);
				 totalletsformonth=rsTargetForMonth.getInt(3);
				 totalsalquoformonth=rsTargetForMonth.getInt(4)*4;
				 totalnewquoformonth=rsTargetForMonth.getInt(5);
			
			}
			System.out.println(">>>>>>>>>>>>>totalsalquoformonth:"+totalsalquoformonth);
			int cntformonth=0;
			double Month_indexofvisits=0,month_P_indexofvisits=0;
			
			//++++++++++++++++++
			if(flag_day == true) 
			{
				target_visit = Math.round(((double)totalvisformonth)*4);
				
			}else
			{
				
				target_visit = Math.round(((double)totalvisformonth/(double)7)*diff);
			}
			//++++++++++++++++++
			
			try{
				Month_indexofvisits=((double)(finalvisitcnt)/target_visit)*80;
				Month_index_total +=Month_indexofvisits;
				month_P_indexofvisits=((double)(finalvisitcnt)/target_visit)*80;
			    Month_Grandindex +=month_P_indexofvisits;
			//indexofvisitsformnth=(100*sumVisitsformonth)/totalvisformonth;
			}catch(Exception e){System.out.println(e);}
			htmlstring.append("<tr> "+
			                   "<td><b>Visits/Meetings</b> </td> "+
			                   "<td>80</td>"+
			                   "<td>"+finalvisitcnt+"</td> "+
			                   "<td>"+(int)target_visit+"</td>"+
			                   "<td>"+df2.format(Month_indexofvisits)+" </td>"+
			                   "<td>"+df2.format(month_P_indexofvisits)+"</td></tr>");
			
			%>
			
			<tr>
			 <td><div align="left"><b>Visits/Meetings</b></div></td>
			 <td><div align="right">80</div></td>
			 <td><div align="right"><%= finalvisitcnt  %></div></td>
			 <td><div align="right"><%=(int)target_visit %></div></td>
			 <td><div align="right"><%=df2.format(Month_indexofvisits) %></div></td>
			 <td><div align="right"><%=df2.format(month_P_indexofvisits) %></div></td>
			</tr>
			<%
		//	cntformonth=0;
		//	double Month_indexofsalesquo=0,Month_P_indexofsalesquo=0;
		//	try{
				/*System.out.println(">>>>>>>>:"+rsDetails.getInt("QuoteValueWeeklyTarget"));
				TargetForFromMonth=(rsDetails.getInt("QuoteValueWeeklyTarget")*4)/frommonthdays;
				TargetForToMonth=(rsDetails.getInt("QuoteValueWeeklyTarget")*4)/tomonthdays;
				System.out.println(">>>>>>TargetForFromMonth:"+TargetForFromMonth);
				System.out.println(">>>>>>TargetForToMonth:"+TargetForToMonth);
			    
				TargetFinal=TargetForFromMonth*DateDiffToday;
				System.out.println(">>>>>>TargetFinal:"+TargetFinal);*/
			/*	totalsalquoformonth=totalsalquoformonth/30;
				System.out.println(">>>>>>>>>>>>>>Oneday Target:"+totalsalquoformonth);
				Month_indexofsalesquo=((double)(sumProspTotal)/(double)Math.round((double)totalsalquoformonth*diff))*35;
				Month_index_total +=Month_indexofsalesquo;
				Month_P_indexofsalesquo=((double)(sumProspTotal)/(double)Math.round((double)totalsalquoformonth*diff))*35;
				Month_Grandindex +=Month_P_indexofsalesquo;
			}catch(Exception e){System.out.println(e);}*/ 
			
			
			
		/*	htmlstring.append("<tr> "+
			        "<td><b>Sales Quotations (Rs.)</b> </td> "+
			        "<td>35</td>"+
			       // "<td>"+sumSalesQuotation1+"</td> "+
			      //  "<td>"+Math.round(((double)totalvisformonth/(double)7)*diff)+"</td>"+
					"<td>"+sumProspTotal+"</td> "+
			  	     "<td>"+(totalsalquoformonth)*diff+"</td>"+
		"<td>"+df2.format(Month_indexofsalesquo)+" </td>"+
			        "<td>"+df2.format(Month_P_indexofsalesquo)+"</td></tr>");*/
			%>
			
		<!-- 	<tr>
			 <td><div align="left"><b>Sales Quotations(Rs.)</b></div></td>
			 <td><div align="right">35</div></td>
			</tr> -->
			<%
			cntformonth=0;
			//++++++++++++++++++++++++++++++++
			double target_prospect = 0.0;
			if(flag_day == true) 
			{
				target_prospect = Math.round(((double)totalnewquoformonth)*4);
				
			}else
			{
				
				target_prospect = Math.round(((double)totalnewquoformonth/(double)7)*diff);
			}
			//++++++++++++++++++++++++++++++
			double Month_indexofnewprospect=0,Month_P_indexofnewprospect=0;
			try{
				Month_indexofnewprospect=((double)(sumNewProspects1)/target_prospect)*20;
				Month_index_total +=Month_indexofnewprospect;
				Month_P_indexofnewprospect=((double)(sumNewProspects1)/target_prospect)*20;
				Month_Grandindex +=Month_P_indexofnewprospect;
				//indexofnewprosformnth=(100*sumNewProspectsformonth)/totalnewquoformonth ;
				}catch(Exception e){System.out.println(e);}
				htmlstring.append("<tr> "+
				        "<td><b>New Prospects</b> </td> "+
				        "<td>20</td>"+
				        "<td>"+sumNewProspects1+"</td> "+
				        "<td>"+ (int)target_prospect+"</td>"+
				        "<td>"+df2.format(Month_indexofnewprospect)+" </td>"+
				        "<td>"+df2.format(Month_P_indexofnewprospect)+"</td></tr>");
			%>
			<tr>
			 <td><div align="left"><b>New Prospects</b></div></td>
			 <td><div align="right">20</div></td>
			 <td><div align="right"><%=sumNewProspects1 %></div></td>
			 <td><div align="right"><%= (int)target_prospect%></div></td>
			 <td><div align="right"><%=df2.format(Month_indexofnewprospect) %></div></td>
			 <td><div align="right"><%=df2.format(Month_P_indexofnewprospect) %></div></td>
			</tr>
			<%
		/*	cntformonth=0;
			
			double Month_indexofphonecalls=0,Month_P_indexofphonecalls=0;
			try{
				Month_indexofphonecalls=((double)(sumPhoneCalls1+sumLetters1)/(double)Math.round(((double)(totalcalsformonth+totalletsformonth)/(double)7)*diff))*10;
				Month_index_total +=Month_indexofphonecalls;
				Month_P_indexofphonecalls=((double)(sumPhoneCalls1+sumLetters1)/(double)Math.round(((double)(totalcalsformonth+totalletsformonth)/(double)7)*diff))*10;
				Month_Grandindex +=Month_P_indexofphonecalls;
			}catch(Exception e){System.out.println(e);}
			  int Sumt=sumPhoneCalls1+sumLetters1;
			htmlstring.append("<tr> "+
			        "<td><b>Customer Contacts</b> </td> "+
			        "<td>10</td>"+
			        "<td>"+Sumt+"</td> "+
			        "<td>"+Math.round(((double)(totalcalsformonth+totalletsformonth)/(double)7)*diff )+"</td>"+
			        "<td>"+df2.format(Month_indexofphonecalls)+" </td>"+
			        "<td>"+df2.format(Month_P_indexofphonecalls)+"</td></tr>");
			int SumT=sumPhoneCalls1+sumLetters1+sumNewProspects1+sumSalesQuotation1+sumVisits1;
			htmlstring.append("<tr> "+
			        "<td> </td> "+
			        "<td><b>Total</b></td>"+
			        "<td>"+SumT+"</td> "+
			        "<td>"+Math.round(((double)(totalvisformonth+totalcalsformonth+totalletsformonth+totalsalquoformonth+totalnewquoformonth)/(double)7)*diff )+"</td>"+
			        "<td>"+df2.format(Month_index_total)+" </td>"+
			        "<td>"+df2.format(Month_Grandindex)+"</td></tr></table>");*/
			//System.out.println(">>>>>>>>>htmlstring:"+htmlstring);
			%>
			
	
			<tr>
			 <td colspan="4"><div align="right"><b>Total</b></div></td>
			  <td><div align="right"><%=df2.format(Month_index_total) %></div></td>
			 <td><div align="right"><%=df2.format(Month_Grandindex) %></div></td>
			</tr>
			</table>

			<br>
			<%
		 
			//System.out.println(masterDataNew);
		 }
	
	 } 
	}
	else
	{
		  double target_visit = 0.0;
		
		  int frommonthdays=0,tomonthdays=0,TargetForFromMonth=0,TargetForToMonth=0,diffdate=0,DateDiffToday=0;
		  String Sqlfrom=" SELECT day( last_day( '"+fromDate+"' ) )  ";
		  System.out.println("Sqlfrom:"+Sqlfrom);
		  ResultSet rsfrom=st.executeQuery(Sqlfrom);
		  if(rsfrom.next())
		  {
			  frommonthdays=rsfrom.getInt(1);
		  }
		  System.out.println("frommonthdays:"+frommonthdays);
		  String Sqlto=" SELECT day( last_day( '"+toDate+"' ) )  ";
		  System.out.println("Sqlto:"+Sqlto);
		  ResultSet rsto=st1.executeQuery(Sqlto);
		  if(rsto.next())
		  {
			  tomonthdays=rsto.getInt(1);
		  }
		  System.out.println("tomonthdays:"+tomonthdays);
		  
		  String SqlDateDiff1="Select DATEDIFF('"+toDate+"','"+fromDate+"')";
		  ResultSet rsDate1=st.executeQuery(SqlDateDiff1);
		  rsDate1.next();
		  DateDiffToday=rsDate1.getInt(1)+1;
		  System.out.println(">>>>>>>>>>>DateDiffToday:"+DateDiffToday);
		
		%>
		
	<%	 String Name="";
		 String SqlMarRepName="Select * from "+session.getAttribute("CompanyMasterID").toString()+"marketingrepmaster where MarketingRepCode='"+MarktngCode+"'";
		 System.out.println(">>>>>>>>>SqlMarRepName:"+SqlMarRepName);
		 ResultSet RsMarketng=st.executeQuery(SqlMarRepName);
		 if(RsMarketng.next())
		 {
			 Name=RsMarketng.getString("MarketingRepName");
			 System.out.println(">>>>>>>>>RepName:"+Name); 
		String sqlCount="SELECT    count(*) , 'PhoneCall'  from "+session.getAttribute("CompanyMasterID").toString()+"followup where			 FollowUpType   "+
		"       in('phoneCall','Ph Call') and MarketingRepcode='"+MarktngCode+"' and FollowUpDate  between			 "+
		"       '"+fromDate+"' and '"+toDate+"'			 "+
		"        union			 "+
		"       SELECT    count(*) , 'Visit'  from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType			 "+
		"       in('Visit') and MarketingRepcode='"+MarktngCode+"' and FollowUpDate  between			 "+
		"       '"+fromDate+"' and '"+toDate+"'			 "+
		"       union			 "+
		"       SELECT    count(*) , 'Letter'  from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType			 "+
		"       in('Letter') and MarketingRepcode='"+MarktngCode+"' and FollowUpDate  between			 "+
		"       '"+fromDate+"' and '"+toDate+"'			 "+
		"       union			 "+
		"       SELECT count(*) , 'Meeting' from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType			 "+
		"       in('Meeting') and MarketingRepcode='"+MarktngCode+"' and FollowUpDate  between			 "+
		"       '"+fromDate+"' and '"+toDate+"'			 "+
		"       union			 "+
		"       SELECT count(*) , 'Email' from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType			 "+
		"       in('E-mail','E mail','Mail','Email') and MarketingRepcode='"+MarktngCode+"' and FollowUpDate  between			 "+
		"       '"+fromDate+"' and '"+toDate+"'			 "+
		"       union			 "+
		"       SELECT    count(*) , 'NoOfProspects'  from "+session.getAttribute("CompanyMasterID").toString()+"prospectivecustmaster where			 "+
		"       CustEnteredByRep ='"+Name+"' and	Assighnedby='"+Name+"'	and	 "+
		"       ProspCustAddedOn  >= '"+fromDate+" 00:00:00' and  ProspCustAddedOn <= '"+toDate+" 23:59:59' "+
		"		 UNION "+
		"		 SELECT count(*) ,'NoOfSO' FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det where TWEmpName='"+Name+"' "+
		"		 and SalesOrderDate between '"+fromDate+"' and '"+toDate+"' and SOCancelled=0"+
		"    		 UNION "+
		"		 SELECT count(*) ,'NoOfSQ' FROM "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det where TWEmpName='"+Name+"' "+
		"		 and SalesQuoDate between '"+fromDate+" 00:00:00  	' and '"+toDate+" 00:00:00  	' and SalesQuoCancelled=0"+
		"		 UNION "+
		"		 SELECT SUM(Total) ,'SumOfSO' FROM "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det where TWEmpName='"+Name+"' "+
		"		 and SalesOrderDate between '"+fromDate+"' and '"+toDate+"' and SOCancelled=0"+
		"		 UNION "+
		"		SELECT Sum(Total),'TotalSO' FROM `"+session.getAttribute("CompanyMasterID").toString()+"salesquo_det` WHERE TWEmpName='"+Name+"' and SalesQuoCancelled='0' and SalesQuoDate between '"+fromDate+" 00:00:00' and '"+toDate+" 00:00:00'";


		 ResultSet rsCount=st2.executeQuery(sqlCount);
		 System.out.println(">>>  "+sqlCount);
		 String phoneCalls1=(rsCount.next()?rsCount.getString(1):"0");
		 String visits1=(rsCount.next()?rsCount.getString(1):"0");
		 System.out.println(">>>visits1:  "+visits1);
		 String letters1=(rsCount.next()?rsCount.getString(1):"0");
		 String meetings1=(rsCount.next()?rsCount.getString(1):"0");
		 System.out.println(">>>meetings1:  "+meetings1);
		 String email1=(rsCount.next()?rsCount.getString(1):"0");
		 System.out.println(">>>email1:  "+email1);
		 String numberOfprospects1=(rsCount.next()?rsCount.getString(1):"0");
		 System.out.println(">>>numberOfprospects1:  "+numberOfprospects1);
		 String numberOfSO1=(rsCount.next()?rsCount.getString(1):"0");
		 System.out.println(">>>numberOfSO1:  "+numberOfSO1);
		 String numberOfSQ1=(rsCount.next()?rsCount.getString(1):"0");
		 System.out.println(">>>numberOfSQ1:  "+numberOfSQ1);
		 String sumOfSO1=(rsCount.next()?rsCount.getString(1):"0");
		 System.out.println(">>>sumOfSO1:  "+sumOfSO1);
		 rsCount.next();
		 String quoTotal=rsCount.getString(1);
		 System.out.println(">>>quoTotal:  "+quoTotal);
		 if(quoTotal==null)
		 {
			 
			 quoTotal="0";
		 }
		 long SQcount1=Long.parseLong(quoTotal);
		 System.out.println("SQ cunt is   "+SQcount1);
		 if(quoTotal==null)
		 {
			 
			 SQcount1=0;
		 }
		 sumOfSO1=(sumOfSO1==null?"0":sumOfSO1);
		 
		 
		 
		 
			/* start of  new logic for visits*/
			
			String abc3="";
			int no3=0,viscount3=0,finalvisitcnt3=0;
			String sqlvis3="select ProspCustCode from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType IN ('Visit') and MarketingRepcode='"+MarktngCode+"' and FollowUpDate  between '"+fromDate+"' and '"+toDate+"' ";
			 ResultSet rstt3=st2.executeQuery(sqlvis3);
			 System.out.println("sachin kapre "+sqlvis3);
			 while(rstt3.next())
			 {
				 abc3=rstt3.getString(1);
				 System.out.println("in while  ");
				 String sql33="select OEM from  "+session.getAttribute("CompanyMasterID").toString()+"prospectivecustmaster where CustomerCode='"+abc3+"'";
				 ResultSet rs33=st3.executeQuery(sql33);
			//	 System.out.println(sql33);
				 if(rs33.next())
				 no3=rs33.getInt("OEM");
				 System.out.println(no3);
				 if(no3 == 0)
				 {
					 viscount3=1;
				 }
				 else
				 {
					 viscount3=2;
				 }
				 
				/* if(no3 > 0 && no3 < 100)
				 {
					 viscount3=1;
				 }
				 
				 if(no3 > 100 && no3 < 300)
				 {
					 viscount3=2;
				 }
				 
				 if(no3 > 300 && no3 < 500)
				 {
					 viscount3=3;
				 }
				 
				 if(no3 > 500 )
				 {
					 viscount3=4;
				 }
				 */
				 
				 finalvisitcnt3=finalvisitcnt3+viscount3;
			 }
			 
			/*end of new logic for visits*/
		 
		 
		 
		 
		 
		 
		 
	%>         
	<div align="center" style="font-size: 1.4em; margin-top: 0.5em;margin-bottom: 0.5em;"><a><font face = "Arial" size = 3>Performance Of <%=Name %> During <%=newfromdate %> To <%=newtodate%></font></a>
		</div>
	     <table   border=1  class="sortable"  style="width: 65%;font-size: 8;font-family: arial;margin-left:220px ;margin-right:120px;">
			<tr>
			<th>Particulars</th>
			<th><b>Weightage(%)</b></th>
			<th>Total</th>
			<th>Target</th>
			<th>Weighted Index(%)</th>
			<th>Index UptoDate(%)</th>
			</tr>
			
			<%
			htmlstring.append("<br><h4 align=center> Performance Of "+Name+" During "+newfromdate+" To "+newtodate+"  </h4>" +
					"<table align=center border=1 cellpadding=0 cellspacing=0>" +
						"<tr>" +
						"<th><b>Particulars</b></th>" +
						"<th><b>Weightage</b></th>" +
						"<th><b>Total</b></th>" +
						"<th><b>Target</b></th>" +
						"<th><b>Weighted Index </b></th>" +
						"<th><b>Index UptoDate</b></th></tr>");
			
			double Month_indexofvisits=0,month_P_indexofvisits=0;
			try{
				if(RsMarketng.getInt("VisitsTarget")==0)
				{
					Month_index_total +=Month_indexofvisits;
					Month_Grandindex +=month_P_indexofvisits;
				}
				else
				{
					
					//++++++++++++++++++
					if(flag_day == true) 
					{
						target_visit = (double)Math.round(((double)RsMarketng.getInt("VisitsTarget"))*4);
						
					}else
					{
						
						target_visit = (double)Math.round(((double)RsMarketng.getInt("VisitsTarget")/(double)7)*diff);
					}
					//++++++++++++++++++
					
					//Month_indexofvisits=((double)(Integer.parseInt(visits1)+Integer.parseInt(meetings1))/(double)Math.round(((double)rsRep.getInt("VisitsTarget")/(double)7)*Datediff))*35;
					Month_indexofvisits=((double)(finalvisitcnt3+Integer.parseInt(meetings1))/target_visit)*80;
					Month_index_total +=Month_indexofvisits;
					month_P_indexofvisits=((double)(finalvisitcnt3+Integer.parseInt(meetings1))/target_visit)*80;
		            Month_Grandindex +=month_P_indexofvisits;
				}
				
			}catch(Exception e){System.out.println(e);}
			int Sumt=finalvisitcnt3+Integer.parseInt(meetings1);
			htmlstring.append("<tr> "+
	                "<td><b>Visits/Meetings</b> </td> "+
	                "<td>80</td>"+
	                "<td>"+Sumt+"</td> "+
	                "<td>"+(int)target_visit+"</td>"+
	                "<td>"+df2.format(Month_indexofvisits)+" </td>"+
	                "<td>"+df2.format(month_P_indexofvisits)+"</td></tr>");
		
			%>
			<tr>
			<td><div align="left">Visits/Meeting </div></td>
			 <td><div align="right">80</div></td>
			<td><div align="right"><%=finalvisitcnt3+Integer.parseInt(meetings1) %></div></td>
			<td><div align="right"><%=(int)target_visit %></div></td>
			<td><div align="right"><%=df2.format(Month_indexofvisits) %></div></td>
			<td><div align="right"><%=df2.format(month_P_indexofvisits) %></div></td>
			</tr>
			<%
			
		/*	double Month_indexofsalesquo=0,Month_P_indexofsalesquo=0, TotalTarget=0;
			int TargetFinal=0;
			try{
				System.out.println(">>>>>>>>:"+RsMarketng.getInt("QuoteValueWeeklyTarget"));
				TargetForFromMonth=(RsMarketng.getInt("QuoteValueWeeklyTarget")*4)/frommonthdays;
				TargetForToMonth=(RsMarketng.getInt("QuoteValueWeeklyTarget")*4)/tomonthdays;
				System.out.println(">>>>>>TargetForFromMonth:"+TargetForFromMonth);
				System.out.println(">>>>>>TargetForToMonth:"+TargetForToMonth);
			    
				TargetFinal=TargetForFromMonth*DateDiffToday;
				System.out.println(">>>>>>TargetFinal:"+TargetFinal);
				
				
				
			Month_indexofsalesquo=((double)(SQcount1)/(double)Math.round(((double)TargetFinal)))*35;
			Month_index_total +=Month_indexofsalesquo;
			Month_P_indexofsalesquo=((double)(SQcount1)/(double)Math.round(((double)TargetFinal)))*35;
			Month_Grandindex +=Month_P_indexofsalesquo;
				
			}catch(Exception e){System.out.println(e);}
			
			/*try{
				TotalTarget=RsMarketng.getDouble("QuoteValueWeeklyTarget")*4;
				System.out.println("TOTAL TARGE     : "+TotalTarget);
				Month_indexofsalesquo=(SQcount1/TotalTarget)*35;
				System.out.println("INDEX OF    QUPOPTA "+Month_indexofsalesquo);
				Month_index_total +=Month_indexofsalesquo;
				
			//	Month_P_indexofsalesquo=(SQcount1/(((TotalTarget)/Datediff)*diff))*35;
				Month_Grandindex +=Month_P_indexofsalesquo;
				
			}catch(Exception e){System.out.println(e);}*/
			
			
		/*	htmlstring.append("<tr> "+
			        "<td><b>Sales Quotations (Rs.)</b> </td> "+
			        "<td>35</td>"+
			       // "<td>"+Integer.parseInt(numberOfSQ1)+"</td> "+
			        //"<td>"+Math.round(((double)RsMarketng.getInt("SQTarget")/(double)7)*diff)+"</td>"+
			       
			        "<td align=right>"+SQcount1+"</td> "+
		       		"<td align=right>"+Math.round((double)TargetFinal)+"</td>"+
		            "<td>"+df2.format(Month_indexofsalesquo)+" </td>"+
			        "<td>"+df2.format(Month_P_indexofsalesquo)+"</td></tr>");*/
			
			%>

			<% 
			
			//++++++++++++++++++++++++++++++++
			double target_prospect = 0.0;
			double Month_indexofnewprospect=0,Month_P_indexofnewprospect=0;
			try{
				if(RsMarketng.getInt("NewProspectTarget")==0)
				{
					Month_index_total +=Month_indexofnewprospect;
					Month_Grandindex +=Month_P_indexofnewprospect;	
				}
				else
				{
					
					if(flag_day == true) 
					{
						target_prospect = (double)Math.round(((double)RsMarketng.getInt("NewProspectTarget"))*4);						
					}else
					{						
						target_prospect = (double)Math.round(((double)RsMarketng.getInt("NewProspectTarget")/(double)7)*diff);
					}
					//++++++++++++++++++++++++++++++
					
					Month_indexofnewprospect=((double)(Integer.parseInt(numberOfprospects1))/target_prospect)*20;
					Month_index_total +=Month_indexofnewprospect;
					Month_P_indexofnewprospect=((double)(Integer.parseInt(numberOfprospects1))/target_prospect)*20;
					Month_Grandindex +=Month_P_indexofnewprospect;
				}
			}catch(Exception e){System.out.println(e);}
			htmlstring.append("<tr> "+
			        "<td><b>New Prospects</b> </td> "+
			        "<td>20</td>"+
			        "<td>"+Integer.parseInt(numberOfprospects1)+"</td> "+
			        "<td>"+(int)target_prospect+"</td>"+
			        "<td>"+df2.format(Month_indexofnewprospect)+" </td>"+
			        "<td>"+df2.format(Month_P_indexofnewprospect)+"</td></tr>");
		    
			%>	
			<tr>
			<td align='right'><div align="left">New Prospects </div></td>
			<td><div align="right">20</div></td>
			<td align='right'><div align="right"><%=Integer.parseInt(numberOfprospects1) %></div></td>
			<td align='right'><div align="right"><%=(int)target_prospect %></div></td>
			<td align='right'><div align="right"><%=df2.format(Month_indexofnewprospect) %></div></td>
			<td align='right'><div align="right"><%=df2.format(Month_P_indexofnewprospect) %></div></td>
			</tr>
			<% 
	/*		double Month_indexofphonecalls=0,Month_P_indexofphonecalls=0;
			try{
				Month_indexofphonecalls=((double)(Integer.parseInt(phoneCalls1)+Integer.parseInt(email1))/(double)Math.round(((double)(RsMarketng.getInt("CallsTarget")+RsMarketng.getInt("LettersTarget"))/(double)7)*diff))*10;
				Month_index_total +=Month_indexofphonecalls;
				Month_P_indexofphonecalls=((double)(Integer.parseInt(phoneCalls1)+Integer.parseInt(email1))/(double)Math.round(((double)(RsMarketng.getInt("CallsTarget")+RsMarketng.getInt("LettersTarget"))/(double)7)*diff))*10;
				Month_Grandindex +=Month_P_indexofphonecalls;
			}catch(Exception e){System.out.println(e);}
			
			int SumT=Integer.parseInt(phoneCalls1)+Integer.parseInt(email1);
			htmlstring.append("<tr> "+
			        "<td><b>Customer Contacts</b> </td> "+
			        "<td>10</td>"+
			        "<td>"+SumT+"</td> "+
			        "<td>"+Math.round(((double)(RsMarketng.getInt("CallsTarget")+RsMarketng.getInt("LettersTarget"))/(double)7)*diff)+"</td>"+
			        "<td>"+df2.format(Month_indexofphonecalls)+" </td>"+
			        "<td>"+df2.format(Month_P_indexofphonecalls)+"</td></tr>");
			int SumT1=Integer.parseInt(phoneCalls1)+Integer.parseInt(email1)+Integer.parseInt(visits1)+Integer.parseInt(meetings1)+Integer.parseInt(numberOfSQ1)+Integer.parseInt(numberOfprospects1);
			htmlstring.append("<tr> "+
			        "<td colspan=4 align=right><b>Total</b></td>"+
			        "<td>"+df2.format(Month_index_total)+" </td>"+
			        "<td>"+df2.format(Month_Grandindex)+"</td></tr></table>");
			System.out.println(">>>>>>>>>htmlstring:"+htmlstring);*/
			%>
		
			<%
	         		
			%>
			<tr>
			<td align='right' colspan="4"><div align="right"><b>Total</b></div></td>
			<td align='right'><div align="right"><%=df2.format(Month_index_total) %></div></td>
			<td align='right'><div align="right"><%=df2.format(Month_Grandindex) %></div></td>
			</tr>
			</table>
	<br>
	  <script type="text/javascript">
	  	document.getElementById('indextop').value='<%=df2.format(Month_Grandindex) %>';
	  </script>
	<%
		 }
	}
	
		%>
</br>
</br>
</br>
<input type="hidden" id="tableHTML" name="tableHTML" value="" />
<input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" />
</div>
</form>		
		<br></br>
		<table align="center">
		<tr align="center">
		<td><div align="left"><b>Enter E-Mail Id:</b></div></td>
		<td><input type="text" name="mail" id="mail" style="width: 280px;" value="" /></td>
		<td><input type="hidden" name="mailstring" id="mailstring" value="<%=htmlstring %>"/></td>
		<td><input type="button" name="sendemail" value="Send" onclick="EmailSending();"/></td>
		
		</tr>
		</table>
		<%
} 
catch (Exception e)
{
	out.print("!!!Connection Lost!!!");
}
finally
{
	conn.close();
}

%>
	<br><br> <br><br> <br><br> <br><br>
	<br><br> <br><br> <br><br> <br><br>
	<div id="footer" style=" bottom:0px; width:100%;">
	<p><a href="http://www.myfleetview.com"> Copyright &copy; 2009
	by Transworld Compressor Technologies Ltd. All Rights Reserved.</a></p>
	</div>
	<!-- end #footer -->
	</body>
	</html>
</jsp:useBean> 