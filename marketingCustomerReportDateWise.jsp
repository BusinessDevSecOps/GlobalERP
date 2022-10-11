<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="header.jsp"%>
 <jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">
  
 
	<script src="dropdown.js" type="text/javascript"></script>
	<link rel="stylesheet"
		href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>


	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<!-- Export Options Links of DataTables -->

	<link rel="stylesheet"
		href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css">
	<script
		src=" https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
	<script
		src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
	<script
		src=" https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	<script
		src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
	<script
		src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
	<script
		src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
	<script
		src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script>


	<script type="text/javascript">
		$(document).ready(
				function() {
					$('#example').DataTable(
							{
								"pagingType" : "full_numbers",

								dom : 'Blfrtip',

								buttons : [

								{
									extend : 'collection',

									text : 'Export',
									buttons : [
											{
												extend : 'excel',
												title : 'Follow up Report '
														+ $("#data").val()
														+ '-'
														+ $("#data1").val(),
											},
											{
												extend : 'pdf',
												orientation : 'landscape',
												pageSize : 'LEGAL',
												title : 'Follow up Report '
														+ $("#data").val()
														+ '-'
														+ $("#data1").val(),
											},
											{
												extend : 'csv',
												title : 'Follow up Report '
														+ $("#data").val()
														+ '-'
														+ $("#data1").val(),
											},
											{
												extend : 'print',
												title : 'Follow up Report '
														+ $("#data").val()
														+ '-'
														+ $("#data1").val(),
											},
											{
												extend : 'copy',
												title : 'Follow up Report '
														+ $("#data").val()
														+ '-'
														+ $("#data1").val(),
											},

									/* 'copy', 'csv', 'excel', 'pdf', 'print' */
									]
								}
								],
								lengthMenu : [ [ -1, 10, 25, 50, 100 ],
										[ "All", 10, 25, 50, 100 ] ],

							});
				});
	</script>
	

	
	<body>

	<script language="JavaScript1.2">

	 
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
	

	 
	function popUp(webadd,code1,count1,no)
	{
	//alert("IN POPUP   ");
	window.open(webadd+'?Code1='+code1+'&count1='+count1+'&number='+no);
	}
	function popUpNew(webadd,code1,count1,no,dt1,dt2)
	{
	//alert("IN POPUP   ");
	window.open(webadd+'?Code1='+code1+'&count1='+count1+'&number='+no+'&dt1='+dt1+'&dt2='+dt2);
	}
	function popupindex(webadd,code,name)
	{
		//alert("in fun");
		
		window.open('IndexMarketingDash.jsp'+'?code='+code+'&name='+name,'jav','width=550,height=530,top=30,left=300,resizable=no');
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




function hideField(){
	try{
		if(document.marketing.marketingRep.checked){

			//alert("markt checked");
			document.marketing.customer.checked=false;
    		//document.getElementById('col1').style.display='none';
    		document.getElementById('col2').style.display="";
    		document.getElementById('col3').style.display='none';
			//document.getElementById('CustFoll').style.display='none';
			//document.getElementById('marketingreportdiv').style.display=='block';

			
			
			}	
		else
		{
			//document.getElementById('col1').style.display="";
			document.getElementById('col2').style.display='none';
			document.getElementById('col3').style.display="";
		//	document.getElementById('marketingreportdiv').style.display='none';

			document.marketing.custName.value="";
		}	
	}
	catch(e)
		{
			//alert(e);
		}
		
}




function validate()
{
	if(document.marketing.customer.checked){

	var  a=document.marketing.companyNames.value;
	//alert("Val==>"+a);
	/*
	if(a=="")
	{
		alert("Please Select Company ");
		  return false;
	}else
	{
		return true;
	}
	*/

	document.marketing.custName.value="a";
	return true;

	}else if(document.marketing.marketingRep.checked)
	{
		document.marketing.custName.value="select";
		return true;
	}else
	{
		alert("Please Select  Checkbox For Report");
		return false;
	}
	
}



function getCompanies(type)
{
	document.getElementById("companyList").style.display='block';
	var company=document.marketing.companyNames.value;

//alert("COMPPPP"+company);

	if(company.length=="")
	{
		document.getElementById('companyList').style.visibility = 'hidden';
		
	}
	else
	{
		document.getElementById("companyList").style.visibility="visible";
		company=company.replace(".", "");
		company=company.replace(",", "");
		company=company.replace("$", "");
		company=company.replace("#", "");
		company=company.replace("?", "");
		company=company.replace("-", "");
		company=company.replace("_", "");
		company=company.replace(" ", "");
		company=company.replace("(", "");
		company=company.replace(")", "");

	
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
	var queryString = "?company=" +company+"&type="+type;
	ajaxRequest.open("GET", "ajaxCustomerFollow." + queryString, true);
	ajaxRequest.send(null); 

	}//end if else
}
function chk()
{

	
	
	var chkf="";
	var chkt="";
	var objFromDate = document.getElementById("fromdate").value;
	var fdate=objFromDate.split("-");
	if(fdate[1]=="Jan")
	{
		chkf="01";
	}
	if(fdate[1]=="Feb")
	{
		chkf="02";
	}
	if(fdate[1]=="Mar")
	{
		chkf="03";
	}
	if(fdate[1]=="Apr")
	{
		chkf="04";
	}
	if(fdate[1]=="May")
	{
		chkf="05";
	}
	if(fdate[1]=="Jun")
	{
		chkf="06";
	}
	if(fdate[1]=="Jul")
	{
		chkf="07";
	}
	if(fdate[1]=="Aug")
	{
		chkf="08";
	}
	if(fdate[1]=="Sep")
	{
		chkf="09";
	}
	if(fdate[1]=="Oct")
	{
		chkf="10";
	}
	if(fdate[1]=="Nov")
	{
		chkf="11";
	}
	if(fdate[1]=="Dec")
	{
		chkf="12";
	}
	var objFromDate1=""+fdate[2]+"-"+chkf+"-"+fdate[0]+"";
    var objToDate = document.getElementById("todate").value;
    var tdate=objToDate.split("-");
    if(tdate[1]=="Jan")
	{
    	chkt="01";
	}
	if(tdate[1]=="Feb")
	{
		chkt="02";
	}
	if(tdate[1]=="Mar")
	{
		chkt="03";
	}
	if(tdate[1]=="Apr")
	{
		chkt="04";
	}
	if(tdate[1]=="May")
	{
		chkt="05";
	}
	if(tdate[1]=="Jun")
	{
		chkt="06";
	}
	if(tdate[1]=="Jul")
	{
		chkt="07";
	}
	if(tdate[1]=="Aug")
	{
		chkt="08";
	}
	if(tdate[1]=="Sep")
	{
		chkt="09";
	}
	if(tdate[1]=="Oct")
	{
		chkt="10";
	}
	if(tdate[1]=="Nov")
	{
		chkt="11";
	}
	if(tdate[1]=="Dec")
	{
		chkt="12";
	}
    var objToDate1=""+tdate[2]+"-"+chkt+"-"+tdate[0]+"";
   // alert("Entry from date > "+objFromDate1+" Todate > "+objToDate1);
     
    var date1 = new Date(objFromDate1);
    var date2 = new Date(objToDate1);
    
    //alert("from > "+date1+" Todate > "+date2);
    
    var date3 = new Date();
    var date4 = date3.getMonth() + "-" + date3.getDay() + "-" + date3.getYear();
    var currentDate = new Date(date4);
     
        if(date1 > date2)
        {
            alert("From Date Should be Less Than To Date");
            return false; 
        }
//         else if(date1 > currentDate)
//         {
//             alert("From Date should be less than current date");
//             return false; 
//         }
 //        else if(date2 > currentDate) 
 //        {
  //           alert("To Date should be less than current date");
 //         return false; 
  //       }
//
        return true;
	
}

function showCompany(companyName,customerCode){

	//document.getElementById("companyNames").value=companyName;
	document.marketing.companyNames.value=companyName;
	document.marketing.custName.value=companyName;
	
	document.marketing.custCode.value=customerCode;
	
	document.getElementById("companyList").style.display='none';
	document.marketing.isCheckedAll.checked=false;
}
</script>


	<!-- end #header --> <!-- end #page --> 
	<%
		erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
	%>
	<%
	
		Connection conn = null;
			Statement st = null, st1 = null ;
			Statement st2 = null,st3=null ,st4=null,st5=null, st6 = null,stMaster=null,stMaster1=null,stDATE=null,stweek=null,stweek1=null;
			
			String selectedName;
			String FollowUpType="";
			Format format=new SimpleDateFormat("dd-MMM-yyyy");
			Format parse=new SimpleDateFormat("yyyy-MM-dd");
			String fromDate="",toDate="",fromDateCal="",toDateCal="",fromdatevdTime="",todatevdTime="";
			String sqlDetails="";
			String visits="0",phoneCalls="0",letters="0",meetings="0",email="0",numberOfprospects="0",numberOfSQ="0",numberOfSO="0",sumOfSO="0",ActionPoints="0";
			String newfromdate="",newtodate="";
			double Grandindex=0,P_Grandindex=0,Grandindex1=0,P_Grandindex1=0,Month_index_total=0,Month_Grandindex=0;
			DecimalFormat df2 = new DecimalFormat("0.00");
			String MarktngCode="";
			StringBuffer htmlstring= new StringBuffer();
			long	SQValueMonthly=0,SQValueWeekly=0;
			String SQValue="";
			String abc="";
			int visitcounter=0,no=0,finalvisits=0;
			
			String customercode=null;
		       String custName=null;
		       String usermail="";
		   	String repr="";
		       
		       String divFlag="T";
		       
		       int k;

			
	%>
	<%
	String exportFileName="FollowUpDetails.xls";
	Date today = new Date();
	Calendar cal = Calendar.getInstance();
	cal.setTime(today);
	cal.add(Calendar.DAY_OF_MONTH, -30);
	Date today30 = cal.getTime();
	fromDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(today30);
	
	String todaysDate=new SimpleDateFormat("yyyy-MM-dd").format(today);
	//cal.set(cal.get(cal.YEAR),cal.get(cal.MONTH),1);
	//Date monthsDateAsDate = cal.getTime();
	 Calendar date = Calendar.getInstance();
           date.set(Calendar.DAY_OF_MONTH, 1);
      DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
       String startDate=df.format(date.getTime());


           // out.println("this is start date"+startDate);
	
	
	
	
	toDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
	//fromDate=toDate=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	toDate=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	
	if (!(null == request.getParameter("fromdate"))) {
	fromDate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("fromdate")));
	System.out.println(">>>>>>>>>fromDate:"+fromDate);
	newfromdate=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("fromdate")));
	fromdatevdTime=new SimpleDateFormat("yyyy-MM-dd ").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("fromdate")));
	fromDateCal=request.getParameter("fromdate");
	}
	else
	{
		fromDate=new SimpleDateFormat("yyyy-MM-dd").format(date.getTime());
		fromDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(date.getTime());
		System.out.println("======>"+fromDateCal);
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
	
	
	if(!(session.getAttribute("userLevel").toString().equalsIgnoreCase("level5")))
		selectedName = session.getAttribute("EmpName").toString();
		
	
	
	
	
	

	if (!(null == request.getParameter("custCode"))){
		customercode=request.getParameter("custCode");
	}
	
	if (!(null == request.getParameter("custName"))){
		custName=request.getParameter("custName");
	}
	else
	{
		custName="Select";
	}
	
	
	System.out.println("Customer Name==&*&*&*&*&*&&*&**&==>"+custName);
	
	
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
					stMaster= conn.createStatement();
					stMaster1=conn.createStatement();
					stDATE=conn.createStatement();
					stweek=conn.createStatement();
					stweek1=conn.createStatement();
					
					
				
					Date tomorrow=new Date();
					
					//Date today = new SimpleDateFormat("yyyy-MM-dd").parse("2013-06-30");
					//Date tomorrow = new SimpleDateFormat("yyyy-MM-dd").parse("2013-06-30");
					
					Calendar cal1 = Calendar.getInstance();
					Calendar now = Calendar.getInstance();
					cal1.setTime(today);
					String todaysDateRk=new SimpleDateFormat("yyyy-MM-dd").format(today);
					String todaysDateInMMM=new SimpleDateFormat("dd-MMM-yyyy").format(today);
					
					cal1.add(Calendar.DAY_OF_MONTH, -1);
					
					Date YesterdaysDateAsDate = cal1.getTime();
					String yesterdaysDate=new SimpleDateFormat("yyyy-MM-dd").format(YesterdaysDateAsDate);
					
					cal1.setTime(today);
					cal1.add(Calendar.DAY_OF_MONTH, +1);
					Date  tomorowAsDate=cal1.getTime();
					String tomoDate=new SimpleDateFormat("yyyy-MM-dd").format(tomorowAsDate);
					String tomoDateInMMM=new SimpleDateFormat("dd-MMM-yyyy").format(tomorowAsDate);
//					System.out.println(tomoDateInMMM+"())))))))))))))))))))))  ");
					
					cal1.setTime(today);
					Date sevendaysbefore=new Date();
					cal1.add(Calendar.DAY_OF_MONTH, -7);
					sevendaysbefore=cal1.getTime();
					String sevenbefore=new SimpleDateFormat("yyyy-MM-dd").format(sevendaysbefore);
					String sevenbeforeInMMM=new SimpleDateFormat("dd-MMM-yyyy").format(sevendaysbefore);
//					System.out.println(sevenbeforeInMMM+"())))))))))))))))))))))  ");
					
					cal1.setTime(today);
					cal1.add(Calendar.DAY_OF_MONTH,-30);
					Date MonthAsDate=cal1.getTime();
					String monthbefore=new SimpleDateFormat("yyyy-MM-dd").format(MonthAsDate);
					String monthbeforeInMMM=new SimpleDateFormat("dd-MMM-yyyy").format(MonthAsDate);
//					System.out.println(monthbeforeInMMM+"())))))))))))))))))))))  ");
					
					cal1.setTime(today);
					cal1.add(Calendar.DAY_OF_MONTH,-60);
					Date twoMonthAsDate=cal1.getTime();
					String twomonthbefore=new SimpleDateFormat("yyyy-MM-dd").format(twoMonthAsDate);
					String twomonthbeforeInMMM=new SimpleDateFormat("dd-MMM-yyyy").format(twoMonthAsDate);
//					System.out.println(twomonthbeforeInMMM+"++++++++++++++++++= ");
					
					cal1.setTime(today);
					cal1.add(Calendar.DAY_OF_MONTH,-90);
					Date threeMonthAsDate=cal1.getTime();
					String threemonthbefore=new SimpleDateFormat("yyyy-MM-dd").format(threeMonthAsDate);
					
					System.out.println("3 3 3 3  333333 33 333333   "+threemonthbefore);
					String threemonthbeforeInMMM=new SimpleDateFormat("dd-MMM-yyyy").format(threeMonthAsDate);
					//System.out.println(threemonthbeforeInMMM+"++++++++++++++++++= ");
					
					cal1.setTime(today);
					cal1.add(Calendar.DAY_OF_MONTH,-180);
					Date sixMonthAsDate=cal1.getTime();
					String sixmonthbefore=new SimpleDateFormat("yyyy-MM-dd").format(sixMonthAsDate);
					String sixmonthbeforeInMMM=new SimpleDateFormat("dd-MMM-yyyy").format(sixMonthAsDate);
					//System.out.println(sixmonthbeforeInMMM+"++++++++++++++++++= ");
					
					cal1.setTime(today);
					now.setTime(today);
						
					String sqlDate="SELECT DAYOFWEEK('"+todaysDate+"')";
					//System.out.println(sqlDate);
					ResultSet rsDate=stDATE.executeQuery(sqlDate);
					int dayOfWeek=1,weekCount=1;
					rsDate.next();
					dayOfWeek=rsDate.getInt(1);
		%>


<%
//++++++++++++++++++Ravi+++++++++++++++++++++++++++++++++
boolean flag_day = false;
String f_day =  fromDate.substring(fromDate.lastIndexOf("-")+1).trim();
String l_day =  toDate.substring(toDate.lastIndexOf("-")+1).trim();

System.out.println("The fromdate day =====================>"+fromDate+"  First Day of Month ==>"+f_day);
System.out.println("The todate day   =====================>"+toDate+"    Last Day of Month  ==>"+l_day);

int days_of_month = 0;
int d1 = 0;
int ij=1;
if(f_day.equals("01")){
	
	Date d = new SimpleDateFormat("yyyy-MM-dd").parse(fromDate);
	Calendar cal12= Calendar.getInstance();
	cal12.setTime(d);
	 d1 = cal12.getActualMaximum(Calendar.DAY_OF_MONTH);	

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
		<a><font face ="Arial" size = 3 color="black"><b>  Follow Up Report From <%=fromDateCal %> To <%=toDateCal %></b> </font></a>
		</div>
	
	
	<form  name="marketing" action="" method="get" onsubmit="return validate();"  >
	
	
	
	<table border="0" width="100%">
			<tr>
					<td valign="top" align="right" width="35%">
					 
						 
					</td>
					<td id ="col1" style="display:none"  align="right" valign="top">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  <b>Enter Company :</b>
					<input type="text" name="companyNames" id="companyNames" style="width:230px;" autocomplete="off"  value=""  onkeyup="if (event.keyCode == 27){document.getElementById('companyList').style.display = 'none';} else { getCompanies('quotation'); }" /> 
	 				&nbsp;&nbsp;&nbsp;<br>
	 				
     				</td><td></td>
	
				<td align="left">
				<font size="2"><b> From</b></font>&nbsp;&nbsp;
				<input type="text" id="fromdate"
							name="fromdate" value="<%=fromDateCal %>" size="15" readonly
							style="width: 75px; padding: 4px 5px 2px 5px;margin-right: 20px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF" &nbps;&nbps; />
						
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
				<b>To </b>
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
		
				<input type="submit" name="submit" id="Marketingsbmt" autocomplete="off" style="border: outset;width:55px;height: 24px;margin-left: 20px;" stylevalue="Go"  onclick="chk()"/>
				</td>
				
				<td>
				<br><br><br>
				 
					</td>
					
<!--					<td  id ="col3" style="display:none">-->
<!--				     <input type="submit" name="Customersbmt" id="Customersbmt" style="border: outset;"-->
<!--					value="Enter" />-->
<!--					</td>-->
			</tr>
		</table>
			</form>
	
	
	
	
	
	
	
<%
		
			 ij=1;
%>


<div  id="CustFoll">


<form id="marketingreport" name="marketingreport" method="post">	
 
 <br></br>
	
		
		<div id="a">
		<table id="example" class="sortable" style="width: 100%;font-size: 8;font-family: arial;margin-top:0.5em;margin-bottom: 0.5em;" border="1" >
		<tr>
		<th>SrNo</th>
		<th>Representative Name</th>
		<th>Customer</th>
		<th>Customers  Followed </th>
		<th>Missed Follow Up </th>
		<th>Yesterday's Follow Up </th>
		<th>Yesterday's Missed Follow Up </th>
		<th>Today's Follow Up</th>
		<th>Tomorrow's Follow Up</th>
		
		
		</tr>
		
	<%
	String sqlMarktRep="";
	////
	if((session.getAttribute("userLevel").toString().equalsIgnoreCase("level5"))){
		
		sqlMarktRep="Select *  from 100000marketingrepmaster as tm,100000security as ts WHERE  tm.username<>'' and tm.password<>'' and (tm.Compressor=1 or tm.DigitalEquipment=1 or tm.DGSet=1 or tm.Endoscope=1 or tm.OtherGroups=1) and ts.activestatus='Yes' and tm.username = ts.username  order by  tm.MarketingRepNAme";
	 
					 }else{
						
						 sqlMarktRep="Select *  from 100000marketingrepmaster as tm,100000security as ts WHERE  tm.username<>'' and tm.password<>'' and (tm.Compressor=1 or tm.DigitalEquipment=1 or tm.DGSet=1 or tm.Endoscope=1 or tm.OtherGroups=1) and ts.activestatus='Yes' and tm.username = ts.username  order by  tm.MarketingRepNAme";
											
						} 






	////

	
		
		
ResultSet rsMrktRep=stMaster.executeQuery(sqlMarktRep);
System.out.println("New name----------->"+sqlMarktRep);

while(rsMrktRep.next())
{
	
String aa=rsMrktRep.getString("MarketingRepName");

System.out.println("QRYYYYc For  Marketing Rep**==NAME====>"+aa);

%>

<%//************************************MAIN QUERY GIVES EMP NAME*********************************************************************************
String sqlRep="Select *  from "+session.getAttribute("CompanyMasterID").toString()+"marketingrepmaster WHERE  username<>'' and password<>'' and MarketingRepName='"+aa+"'  and (Compressor=1 or DigitalEquipment=1 or DGSet=1 or Endoscope=1 or OtherGroups=1)  order by  MarketingRepNAme";
ResultSet rsRep=stMaster1.executeQuery(sqlRep);
System.out.println("QRYYYYc For  Marketing Rep**======>"+sqlRep);
%>






<tr>
<%
int i=0;
if(rsRep.next())
{			
	System.out.println("QRYYYYc For  Marketing Rep**======>+i"+i);

			
			k=0;
			int sumVisits=0,sumPhoneCalls=0,sumLetters=0,sumSalesQuotation=0,sumNewProspects=0;
			usermail=rsRep.getString("MarketingRepEMail"); 
			String	code=rsRep.getString("MarketingRepCode");
			repr=rsRep.getString("MarketingRepName");
		%>
		
		<td><div align="right"><%=ij++%></div></td>
		<td><div align="left"><%=aa %></div></td>
		
		<%
			String sqlCustomers="";
			int CountMain=0;int CountInMonth=0,CountInTwoMonth=0,CountIn60To90=0,CountIn90To180=0,CountGrtr180=0,CountYesterDay=0,CountToDay=0,CountTommorow=0,missedCountYesterDay=0;
			
			
			
			sqlCustomers="Select count(Distinct ProspCustName),1 as CountMain from "+session.getAttribute("CompanyMasterID").toString()+"followup Where MarketingRepcode='"+code+"' AND ProspCustName <> '-'  "+
			" UNION "+
			"Select count(Distinct ProspCustName),2 as CountInMonth from "+session.getAttribute("CompanyMasterID").toString()+"followup Where MarketingRepcode='"+code+"' AND ProspCustName <> '-'  AND FollowUpDate > '"+monthbefore+"' "+
			" UNION "+
			"Select count(Distinct ProspCustName),3 as CountInTwoMonth from "+session.getAttribute("CompanyMasterID").toString()+"followup Where MarketingRepcode='"+code+"' AND ProspCustName <> '-'  AND FollowUpDate < '"+toDate+"' AND FollowUpDate > '"+fromDate+"' AND FollowUpType <> 'Assigned' "+
			" UNION "+
			"Select count(Distinct ProspCustName),4 as CountIn60To90 from "+session.getAttribute("CompanyMasterID").toString()+"followup Where MarketingRepcode='"+code+"' AND ProspCustName <> '-'  AND FollowUpDate < '"+toDate+"' AND FollowUpDate > '"+fromDate+"' "+
			" UNION "+
			"Select count(Distinct ProspCustName),5 as CountIn90To180 from "+session.getAttribute("CompanyMasterID").toString()+"followup Where MarketingRepcode='"+code+"' AND ProspCustName <> '-'  AND FollowUpDate < '"+toDate+"' AND FollowUpDate > '"+fromDate+"' "+
			" UNION "+
			"Select count(Distinct ProspCustName),6 as CountGrtr180 from "+session.getAttribute("CompanyMasterID").toString()+"followup Where MarketingRepcode='"+code+"' AND ProspCustName <> '-'  AND  FollowUpDate < '"+sixmonthbefore+"' "+
			" UNION "+
			"Select count(Distinct ProspCustName),7 as missCountYesterday from "+session.getAttribute("CompanyMasterID").toString()+"followup Where MarketingRepcode='"+code+"' AND ProspCustName <> '-'  AND  FollowUpDate = '"+yesterdaysDate+"' "+
			" UNION "+
			"Select count(Distinct ProspCustName),7 as CountYesterday from "+session.getAttribute("CompanyMasterID").toString()+"followup Where MarketingRepcode='"+code+"' AND ProspCustName <> '-'  AND  NextFollowUpDate = '"+yesterdaysDate+"' "+
			" UNION "+
			"Select count(Distinct ProspCustName),8 as CountToday from "+session.getAttribute("CompanyMasterID").toString()+"followup Where MarketingRepcode='"+code+"' AND ProspCustName <> '-'  AND  NextFollowUpDate = '"+todaysDate+"' "+
			" UNION "+
			"Select count(Distinct ProspCustName),9 as CountTommorow from "+session.getAttribute("CompanyMasterID").toString()+"followup Where MarketingRepcode='"+code+"' AND ProspCustName <> '-'  AND  NextFollowUpDate = '"+tomoDate+"'";
			//System.out.println(">>>>>> ######### "+sqlCustomers);
			ResultSet rsCust=st1.executeQuery(sqlCustomers);
			if(rsCust.next())
			CountMain=rsCust.getInt(1);  //getInt(1) because it's first column 
			//System.out.println(CountMain);
			if(rsCust.next())
			CountInMonth=rsCust.getInt(1);            //getInt(1) because it's first column 
			//System.out.println(CountInMonth);
			if(rsCust.next())
			CountInTwoMonth=rsCust.getInt(1);
			//System.out.println(CountInTwoMonth);
			if(rsCust.next())
			CountIn60To90=rsCust.getInt(1);
			//System.out.println(CountIn60To90);
			if(rsCust.next())
			CountIn90To180=rsCust.getInt(1);
			//System.out.println(CountIn90To180);
			if(rsCust.next())
			CountGrtr180=rsCust.getInt(1);
			//System.out.println(CountGrtr180);
			if(rsCust.next())
			missedCountYesterDay=rsCust.getInt(1);
			if(rsCust.next())
			CountYesterDay=rsCust.getInt(1);
			//System.out.println(CountYesterDay);
			if(rsCust.next())
			CountToDay=rsCust.getInt(1);
			//System.out.println(CountToDay);
			if(rsCust.next())
			CountTommorow=rsCust.getInt(1);
			//System.out.println(CountTommorow);
			
			
%>	
		
		<td><div align="right"> <a href="#" onclick="popUp('customerFollowupList.jsp','<%=code %>','<%=CountMain %>','<%= 1%>');"><%=CountMain %></a></div></td>
		<%

		 int totcount=0;
		
		String sqlList = "select ProspCustName,ContactPerson,Address,City,ProspCustCode from "+session.getAttribute("CompanyMasterID").toString()+"followup where MarketingRepcode='"
			+ code
			+ "' AND ProspCustName <> '-' AND FollowUpDate < '"
			+ toDate
			+ "' and FollowUpDate > '"
			+ fromDate
			+ "' Group By ProspCustName";

System.out.println(sqlList);	
ResultSet rsList=st1.executeQuery(sqlList);
System.out.println(sqlList);

		
		 while(rsList.next())
		 {
			 
			 totcount++;
			
			 
		 }
		 
		 System.out.println("Missed Foll Cont===>"+totcount);
		%>
		
		<td><div align="right"><a href="#" onclick="popUpNew('customerFollowupsecondlevel.jsp','<%=code %>','<%=totcount %>','<%=2 %>','<%=toDate %>','<%=fromDate %>');"><%=totcount %></a></div></td>
		
		<%

		 int Missedfollowupinlastmonth=0,count=0;
		
		String missedinlastmonth="SELECT * FROM db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"followup Group By ProspCustName having max(NextFollowUpDate)  Between '"+fromDate+"' AND '"+toDate+"' and MarketingRepcode = '"+code+"'";
		 //String missedinlastmonth="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"followup WHERE MarketingRepcode = '"+code+"' AND NextFollowUpDate Between '"+fromDate+"' AND '"+toDate+"'";
		 System.out.println("missed qry Betwn Date   "+missedinlastmonth);

		 ResultSet rsMissedmonth=st1.executeQuery(missedinlastmonth);
		 while(rsMissedmonth.next())
		 {
			 
			 count++;
			
			 
		 }
		 
		 System.out.println("Missed Foll Cont===>"+count);
		%>
		
		
		
		<td><div align="right"><a href="#" onclick="popUpNew('customerFollowupsecondlevel.jsp','<%=code %>','<%=count%>','<%=3 %>','<%=toDate %>','<%=fromDate %>');"><%=count%></a></div></td>


		
		
		<%
		String lastweekDate1="",lastweekDate2="";
	    String lastweek="SELECT DATE_SUB( curdate( ) , INTERVAL 7 DAY )";	
		ResultSet rsweek=stweek.executeQuery(lastweek);
		if(rsweek.next())
		{
			 lastweekDate1=rsweek.getString(1);
		//	 System.out.println(">>>>>>>>>>lastweekDate1:"+lastweekDate1);
		}
		String lastweek1="SELECT DATE_SUB( curdate( ) , INTERVAL 1 DAY )";	
		ResultSet rsweek1=stweek1.executeQuery(lastweek1);
		if(rsweek1.next())
		{
			 lastweekDate2=rsweek1.getString(1);
	//		 System.out.println(">>>>>>>>>>lastweekDate2:"+lastweekDate2);
		}
		
		
		int followupinlastyesterday=0,countFollNew=0;
		
	//	String Folllastyesterday="SELECT * FROM db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"followup Group By ProspCustName having FollowUpDate = '"+yesterdaysDate+"'  and MarketingRepcode = '"+code+"'";
		
		String Folllastyesterday="select * from "+session.getAttribute("CompanyMasterID").toString()+"followup where MarketingRepcode='"+code+"' AND ProspCustName <> '-'  AND  FollowUpDate = '"+yesterdaysDate+"' ";
		 //String missedinlastmonth="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"followup WHERE MarketingRepcode = '"+code+"' AND NextFollowUpDate Between '"+fromDate+"' AND '"+toDate+"'";
		 System.out.println("missed qry Betwn Date   "+Folllastyesterday);

		 ResultSet rsyesterday=st1.executeQuery(Folllastyesterday);
		 while(rsyesterday.next())
		 {
			 
			 countFollNew++;
			 
			 
		 }
		 
		 System.out.println("Missed Foll Cont===>"+countFollNew);
		 %>
		
		<td><div align="right"><a href="#" onclick="popUpNew('customerFollowupsecondlevel.jsp','<%=code %>','<%=countFollNew%>','<%=4%>','<%=yesterdaysDate %>','<%=yesterdaysDate %>');"><%=countFollNew%></a></div></td>
		<%
		int Missedfollowupinlastyesterday=0,countNew=0;
		
		String missedinlastyesterday="SELECT * FROM db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"followup Group By ProspCustName having max(NextFollowUpDate)='"+yesterdaysDate+"'  and MarketingRepcode = '"+code+"'";
		 //String missedinlastmonth="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"followup WHERE MarketingRepcode = '"+code+"' AND NextFollowUpDate Between '"+fromDate+"' AND '"+toDate+"'";
		 System.out.println("missed qry Betwn Date   "+missedinlastyesterday);

		 ResultSet rsMissedyesterday=st1.executeQuery(missedinlastyesterday);
		 while(rsMissedyesterday.next())
		 {
			 
			 countNew++;
			 
			 
		 }
		 
		 System.out.println("Missed Foll Cont===>"+countNew);
		 %>
		<td><div align="right"><a href="#" onclick="popUpNew('customerFollowupsecondlevel.jsp','<%=code %>','<%=countNew%>','<%=5%>','<%=yesterdaysDate %>','<%=yesterdaysDate %>');"><%=countNew%></a></div></td>
		
		<%
		int CountToDayNew=0;
		
		String Todayqry="select ProspCustName,ContactPerson,Address,City,ProspCustCode from "+session.getAttribute("CompanyMasterID").toString()+"followup where MarketingRepcode='"+code+"' AND ProspCustName <> '-'  AND  NextFollowUpDate = '"+todaysDate+"' ";
		 //String missedinlastmonth="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"followup WHERE MarketingRepcode = '"+code+"' AND NextFollowUpDate Between '"+fromDate+"' AND '"+toDate+"'";
		 System.out.println("missed qry Betwn Date   "+Todayqry);

		 ResultSet rstoday=st1.executeQuery(Todayqry);
		 while(rstoday.next())
		 {
			 
			 CountToDayNew++;
			 
			 
		 }
		 
		 System.out.println("Missed Foll Cont===>"+countNew);
		 %>
		<td><div align="right"><a href="#" onclick="popUpNew('customerFollowupsecondlevel.jsp','<%=code %>','<%=CountToDayNew%>','<%=6%>','<%=todaysDate %>','<%=todaysDate %>');"><%=CountToDayNew%></a></div></td>
		
		<%
		int CountTomorNew=0;
		
		String Tomorqry="select ProspCustName,ContactPerson,Address,City,ProspCustCode from "+session.getAttribute("CompanyMasterID").toString()+"followup where MarketingRepcode='"+code+"' AND ProspCustName <> '-'  AND  NextFollowUpDate = '"+tomoDate+"'";
		 //String missedinlastmonth="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"followup WHERE MarketingRepcode = '"+code+"' AND NextFollowUpDate Between '"+fromDate+"' AND '"+toDate+"'";
		 System.out.println("missed qry Betwn Date   "+Tomorqry);

		 ResultSet rstom=st1.executeQuery(Tomorqry);
		 while(rstom.next())
		 {
			 
			 CountTomorNew++;
			 
			 
		 }
		 
		 System.out.println("Missed Foll Cont===>"+CountTomorNew);
		 %>
		<td><div align="right"><a href="#" onclick="popUpNew('customerFollowupsecondlevel.jsp','<%=code %>','<%=CountTomorNew%>','<%=7%>','<%=tomoDate %>','<%=tomoDate %>');"><%=CountTomorNew%></a></div></td>
		
		
		
		
	<%}

%>
</tr> 			
			 			
			 			
			
			
		<%}
		
		if(ij==1){
		%>
		<tr><td colspan="16" align="center"><b></b></td></tr>
		<tr><td colspan="16" align="center"><b>--- NO DATA ---</b></td></tr>
		<%
	}
		%>
	</table>
	</div>
	<br>
	
	
<input type="hidden" id="tableHTML" name="tableHTML" value="" />
<input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" />
</br></div>
</div>
</form>


	
	
	
	
	
	


</div>	
<!--Marketing  Div End -->
		
		<%
} 
catch (Exception e)
{
	
	System.out.println("xxxxx"+e.toString());
	
	out.print("!!!Connection Lost!!!");
}
finally
{
	conn.close();
}

%>
	
	<!-- <div id="footer">
	<p><a href="http://www.myfleetview.com"> Copyright &copy; 2009
	by Transworld  Technologies Ltd. All Rights Reserved.</a></p>
	</div> -->
	<!-- end #footer -->
	</body>
	</html>
</jsp:useBean> 
<%@ include file="footer_new.jsp" %>