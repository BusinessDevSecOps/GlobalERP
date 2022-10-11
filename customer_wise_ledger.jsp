<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="header.jsp"%>
<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">
<head>
<script src="dropdown.js" type="text/javascript"></script>
<script src="ledgerDetails.js" type="text/javascript"></script>

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
																		title : 'Customer_wise_ledger Report '
																							+ $(
																						"#data1")
																						.val(),
																	},
																	{
																		extend : 'pdf',
																		orientation : 'landscape',
																		pageSize : 'LEGAL',
																		title : 'Customer_wise_ledger Report '
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
																		title : 'Customer_wise_ledger Report '
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
																		title : 'Customer_wise_ledger Report '
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
																		title : 'Customer_wise_ledger Report '
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
														null,null,null,null,null,null,null

												]
											});
						});
	</script>


		
		
		
		
	 <script language="JavaScript1.2">
			function popUp(webadd,company,type,customercode)
			{ 
				window.open('customerDetails.jsp'+'?companyName='+company+'&customercode='+customercode+'&type='+type,'jav','width=750,height=670,top=30,left=300,resizable=no');
			}

			function gotoExcel(elemId, frmFldId)  
			{  
				
			    var obj = document.getElementById(elemId);  
			   
			    var oFld = document.getElementById(frmFldId); 
			   
			    oFld.value = obj.innerHTML;
			    //alert("ok");  
			    document.agingreport.action ="excel.jsp";
			    document.forms["agingreport"].submit();
			    //alert("zale");
			 }
				
			
</script>
</head>
	<%
		erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
	%>
	<%
		Connection conn = null;
			Statement st = null, st1 = null, st3 = null, st4 = null;
			Statement st2 = null, STPC=null;
			String selectedName;
			String FollowUpType="";
			Format format=new SimpleDateFormat("dd-MMM-yyyy");
			Format parse=new SimpleDateFormat("yyyy-MM-dd");
			String todaysDate="",last30Days="",last60Days="",last90Days="",lastOneYear="",lastTwoYears="",lastThreeYears="";
			//String todaysMonth="",last30Month="",last60Month="",last90Month="";
	%>
	<%
	Date today = new Date();
	Calendar cal = Calendar.getInstance();
	cal.setTime(today);
	todaysDate=new SimpleDateFormat("yyyy-MM-dd").format(today);
	
	cal.add(Calendar.DAY_OF_MONTH, -30);
	Date today30 = cal.getTime();
	
	last30Days=new SimpleDateFormat("yyyy-MM-dd").format(today30);
	
	cal.add(Calendar.DAY_OF_MONTH, -30);
	Date today60 = cal.getTime();
	last60Days=new SimpleDateFormat("yyyy-MM-dd").format(today60);
	
	cal.add(Calendar.DAY_OF_MONTH, -30);
	Date today90 = cal.getTime();
	last90Days=new SimpleDateFormat("yyyy-MM-dd").format(today90);
	
	
	cal.add(Calendar.DAY_OF_MONTH, +90);
	
	
	cal.add(Calendar.YEAR, -1);
	Date oneYear = cal.getTime();
	lastOneYear=new SimpleDateFormat("yyyy-MM-dd").format(oneYear);
	
	cal.add(Calendar.YEAR, -1);
	Date twoYears = cal.getTime();
	lastTwoYears=new SimpleDateFormat("yyyy-MM-dd").format(twoYears);
	
	cal.add(Calendar.YEAR, -1);
	Date threeYears = cal.getTime();
	lastThreeYears=new SimpleDateFormat("yyyy-MM-dd").format(threeYears);
	String exportFileName="AgingReportDetails.xls";
	String GroupName="";
 //	System.out.println(todaysDate+last30Days+last60Days+last90Days+">  "+lastOneYear+"  "+lastThreeYears+"  "+lastTwoYears);
try {
				conn = erp.ReturnConnection();
				st = conn.createStatement();
				st1 = conn.createStatement();
				st2 = conn.createStatement();
				STPC=conn.createStatement();
		 
			if (null == request.getParameter("repName"))
				selectedName = "All";
			else
				selectedName = request.getParameter("repName");
	%>
 

	<div
		style="font-size: 1.8em; text-align: center; margin-bottom: 1.2em;"><a> 

		Aging Report</a>
 </div>

 <form>

 	<table align='center'>
 	
	 <tr>
	 	<td ><b>Show Zero</b></td><td ><input type="checkbox" name="showZero" value="showZero" checked="checked"/></td>
	 	<td >&nbsp;&nbsp;&nbsp;</td>
	 	<td ><b>Balance in range</b></td>
	 	<td >
	 	<table border="0">
	 	<tr>
	 		<td ><select name="balanceStartRange" id="balanceStartRange" style="
				  	width: 90px; height:20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; "
				>
				 <option value="min">MIN</option>
		 <option value="0">0</option>
		 <option value="10000">>10,000</option>
	   	 <option value="50000">>50,000</option>
	     <option value="100000">>1,00,000</option>
	     <option value="1000000">>10,00,000</option>
		 </select></td>
	 	 
	 	 <td ><b>TO</b></td>
	 	 
	 	 
	 		<td ><select name="balanceEndRange" id="balanceEndRange" style="
				  	width: 90px; height:20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; "
				>
		 <option value="max">MAX</option>
		 <option value="10000"><10,000</option>
	   	 <option value="50000"><50,000</option>
	     <option value="100000"><1,00,000</option>
	     <option value="1000000"><10,00,000</option>
		 </select></td>
	 	 </tr>
	 	</table>
	 	
	 	</td>
	 	<td >&nbsp;&nbsp;&nbsp;</td>
	 	<td ><b>Records</b></td>
		 	<td >
		 	<select name="numberOfRecords" id="numberOfRecords" style="
				  	width: 90px; height:20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; "
				>
		 <option value="10">10</option>
		 <option value="50">50</option>
	   	 <option value="100">100</option>
	     <option value="all" selected="selected">All</option>
		 </select>
		 		 
 
		 	</td>
		 	<td >&nbsp;&nbsp;&nbsp;</td>
		 <td ><b>Sort By</b> </td>
		 <td >
		 
		 <select name="sortBy" id="sortBy" style="
				  	width: 90px; height:20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; ">
				 <option selected="selected">All</option>
		 <option value="amount">Amount</option>
	     <option value="lastTransactions">lastTransactions</option>
		 </select>
		 
	 
		 </td>
		 <td >&nbsp;&nbsp;&nbsp;</td>
		 <td ><b> Active Since</b></td>
		 		 <td >
		 		 
		 		 		 	<select name="transactionsSince" id="transactionsSince" style="
				  	width: 90px; height:20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; "
				>
		 <option value="1">1 Yr</option>
		 <option value="2">2 Yrs</option>
	   	 <option value="3">3 Yrs</option>
	     <option value="all">All</option>
		 </select>
		 
 
		 </td>
		 <td>&nbsp;&nbsp;&nbsp;</td>
		 <td ><b>Group </b> </td>
		 <td ><select name="group" id="group" style="
				  	width: 120px; height:20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; "
				>
		 <option value="1">Compressor</option>
		 <option value="2">DGSet</option>
	   	 <option value="3">DigitalEquipment</option>
	     <option value="4">Endoscope</option>
	     <option value="all" selected="selected">All</option>
		 </select></td>
		 <td>&nbsp;&nbsp;&nbsp;</td>
	 	<td><input type="submit" id="search-submit"
				name="submitFollowUp" value="Submit" /></td>
	 </tr>
 	</table>
 </form>
<br></br>
<form id="agingreport" name="agingreport" method="post">


	 <%-- <div align="right">
	 		
			<font size="1">&nbsp;&nbsp;&nbsp;<%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date())%></font>
			 <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('a','tableHTML');">
			<img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img>
			</a>
 </div> --%>
 <br>
	<div id="a">
	<table border="1px"  class="sortable" id="example">
	
	<tr>
		<th>Sr.No</th>
		<th>Company</th>
		<th>Branch Name</th>
		<th>Group</th>
		<th>Contact</th>
		<th>Mobile No</th>
		<th>Last Tr. date</th>
	    <th>Tr ID </th>	
	    <th>Current Balance</th>
		<th>>=30</th>
				
				<th>31-60</th>
		<th>61-90</th>
		<th> >= 91 </th>
	</tr>

	

<%
 
%> 
<%	
if(request.getQueryString()!=null)
{
 boolean showZeroBalance=true;
 if(request.getParameter("showZero")==null)
	 showZeroBalance=false;
 String startRange=request.getParameter("balanceStartRange");
 String endtRange=request.getParameter("balanceEndRange");
 String numberOfRecords=request.getParameter("numberOfRecords");
 String sortby=request.getParameter("sortBy");
 String transactionSince=request.getParameter("transactionsSince");
 String group=request.getParameter("group");

 
 String limit=" ";
 if(numberOfRecords.equalsIgnoreCase("all"))
	 limit=" ";
 else
	 limit=" LIMIT "+numberOfRecords;
 
 String balanceBetween=" ";
 if(!(startRange.equalsIgnoreCase("min")))
   balanceBetween=" AND Balance >="+startRange;
 if(!(endtRange.equalsIgnoreCase("max")))
	 balanceBetween+=" AND Balance <="+endtRange;	
 
 String showZeroBalanceInQuery="";
 if(showZeroBalance)
	 showZeroBalanceInQuery=" AND Balance!=0  ";
 
 String orderBy=" ";
 
 
 String category=" ";
 if(!(group.equalsIgnoreCase("all")))
 {
	 if(group.equalsIgnoreCase("1"))
		 category=" AND b.category='1' ";
	 else  if(group.equalsIgnoreCase("2"))
			 category=" AND b.category='2' ";
	 else if(group.equalsIgnoreCase("3"))
		 category=" AND b.category='3' ";
	 else
		 category=" AND b.category='4' ";
 }
 
 String transactionDate=" ";
 if(!(transactionSince.equalsIgnoreCase("all")))
 {
	 if(transactionSince.equalsIgnoreCase("1"))
		 	transactionDate="  AND TransactionDate >= '"+lastOneYear+"' ";
 	else if(transactionSince.equalsIgnoreCase("2"))
	 		transactionDate="  AND TransactionDate >= '"+lastTwoYears+"' ";
	 else
	    	transactionDate="  AND TransactionDate >= '"+lastThreeYears+"' ";
 }
 
 
 int i = 1;
					/* String sql = "SELECT  CustomerCode           "+
					"	FROM "+session.getAttribute("CompanyMasterID").toString()+"customerledgeraccount                                          "+
					"	WHERE 1  "+balanceBetween+"  "+showZeroBalanceInQuery+"    "+transactionDate+" GROUP BY CustomerCode  orde by balance   "+limit+"              ";
					 */
					
					String sql="SELECT CustomerCode, max( TransactionDate )"+
						" FROM "+session.getAttribute("CompanyMasterID").toString()+"customerledgeraccount where 1  "+transactionDate+" and customercode in (select customercode from "+session.getAttribute("CompanyMasterID").toString()+"customerdet where isdatavalid=1 ) "+
						" GROUP BY customercode ";
					
				//	System.out.println(">>>>");
					System.out.println(">>>>   "+sql);
					
					ResultSet rs=st.executeQuery(sql);
					while (rs.next()) {
						
						String sqlGroup="select TheGroupName from "+session.getAttribute("CompanyMasterID").toString()+"tbl_groupmaster where TheGroupCode =(select Category from "+session.getAttribute("CompanyMasterID").toString()+"customerdet where CustomerCode='"+rs.getString("CustomerCode")+"')";
						System.out.println(sqlGroup);
						ResultSet rsGroup=st1.executeQuery(sqlGroup);
						System.out.println(sqlGroup);
						GroupName="";
						if(rsGroup.next())
						{
						GroupName=rsGroup.getString(1);
						}
						String sqlDetails="SELECT * "+
						"	FROM "+session.getAttribute("CompanyMasterID").toString()+"customerledgeraccount AS a"+
						"	INNER JOIN "+session.getAttribute("CompanyMasterID").toString()+"customerdet AS b ON ( a.customercode = b.customercode )"+
						"	WHERE a.CustomerCode ='"+rs.getString("CustomerCode")+"' "+category+"  order by a.TransactionDate desc,a.TransactionId desc" ;
						System.out.println(sqlDetails);
						
						                    
						
						
						
					ResultSet rsDetails=st1.executeQuery(sqlDetails);
					if(rsDetails.next() ){

							 String sqlSum=" SELECT sum( debitamount ) , 90 AS a     "+
							 "  FROM "+session.getAttribute("CompanyMasterID").toString()+"customerledgeraccount                        "+
							 "  WHERE transactiondate < '"+last90Days+"'                "+
							 "  AND customercode = '"+rs.getString("CustomerCode")+"'                              "+
							 "  UNION                                               "+
							 "  SELECT sum( debitamount ) , 6090 AS b                  "+
							 "  FROM "+session.getAttribute("CompanyMasterID").toString()+"customerledgeraccount                        "+
							 "  WHERE transactiondate < '"+last60Days+"'                "+
							 "  AND transactiondate >= '"+last90Days+"'                  "+
							 "  AND customercode = '"+rs.getString("CustomerCode")+"'                              "+
							 "  UNION                                               "+
							 "  SELECT sum( debitamount ) , 3060 AS c                  "+
							 "  FROM "+session.getAttribute("CompanyMasterID").toString()+"customerledgeraccount                        "+
							 "  WHERE transactiondate < '"+last30Days+"'                "+
							 "  AND transactiondate >= '"+last60Days+"'                  "+
							 "  AND customercode = '"+rs.getString("CustomerCode")+"'                              "+
							 "  UNION                                               "+
							 "  SELECT sum( debitamount ) , 30 AS d                  "+
							 "  FROM "+session.getAttribute("CompanyMasterID").toString()+"customerledgeraccount                        "+
							 "  WHERE transactiondate >= '"+last30Days+"'                "+
							 "  AND customercode = '"+rs.getString("CustomerCode")+"'                              "+
							 "  UNION                                               "+
							 "  SELECT sum(debitamount), 5 AS e                  "+
							 "  FROM "+session.getAttribute("CompanyMasterID").toString()+"customerledgeraccount                        "+
							 "  WHERE customercode = '"+rs.getString("CustomerCode")+"'                              "+
							 "  UNION                                               "+
							 "  SELECT sum( creditamount ) , 6 AS f                 "+
							 "  FROM "+session.getAttribute("CompanyMasterID").toString()+"customerledgeraccount                        "+
							 "  WHERE customercode = '"+rs.getString("CustomerCode")+"' 							";
							 //System.out.println(">>>>   "+sqlSum);
							 ResultSet rsSum=st2.executeQuery(sqlSum);
							 
							 double  thirty=0,   sixty=0,   ninety=0,  moreThanninety =0;
							 double  thirtyDeduction=0,   sixtyDeduction=0,   ninetyDeduction=0,  moreThanninetyDeduction =0;
							 
							 double creditAmount=0,debitAmount=0,totalCreditAmount=0;
							 moreThanninety=0;
							 if(rsSum.next()) 
								 moreThanninety=rsSum.getDouble(1);
							 
							 if(rsSum.next())
								 ninety=(rsSum.getString(1)==null ? 0 : rsSum.getDouble(1));
							 
							 if(rsSum.next())
								 sixty=(rsSum.getString(1)==null ? 0 : rsSum.getDouble(1));
							 
							 if(rsSum.next())
								 thirty=(rsSum.getString(1)==null ? 0 : rsSum.getDouble(1));
							 
							 if(rsSum.next())
								 debitAmount=(rsSum.getString(1)==null ? 0 : rsSum.getDouble(1));
							 
							 if(rsSum.next())
								 totalCreditAmount=creditAmount=(rsSum.getString(1)==null ? 0 : rsSum.getDouble(1));
							 
					//System.out.print("SUM:::  "+thirty+"  "+sixty+"   "+ninety+"  "+moreThanninety);
					
					
							 if(moreThanninety>=creditAmount)
							 {
								 moreThanninetyDeduction=moreThanninety-creditAmount;
								 thirtyDeduction=thirty; sixtyDeduction=sixty  ;ninetyDeduction=ninety;
							 }
							 else if(moreThanninety<creditAmount)
							 {
								 moreThanninetyDeduction=0;
								 creditAmount=creditAmount-moreThanninety;
								 
								 if(ninety>=creditAmount)
								 {
									 ninetyDeduction=ninety-creditAmount;
									 thirtyDeduction=thirty; sixtyDeduction=sixty;
								 }
								 else{
									 ninetyDeduction=0;
									 creditAmount=creditAmount-ninety;
									 
									 if(sixty>=creditAmount){
										 sixtyDeduction=sixty-creditAmount;
										 thirtyDeduction=thirty;
									 }
									 else{
										 sixtyDeduction=0;
										 creditAmount=creditAmount-sixty;
										 //System.out.println("?????  "+thirty+"  "+creditAmount);
										 if(thirty>=creditAmount){
											 thirtyDeduction=thirty-creditAmount;
										 }
										 else{
											 thirtyDeduction=0;
											 creditAmount=creditAmount-thirty;
										 }
									 }
								 }
							 }
							 
							 
							 if(creditAmount>debitAmount)
							 {
								 moreThanninetyDeduction=thirtyDeduction=sixtyDeduction=ninetyDeduction=0;
							 }
 
							 
							 
							 boolean proceed=true;
							 //System.out.println(debitAmount-totalCreditAmount);
							               if(((debitAmount-totalCreditAmount)==0 && showZeroBalance==false)) 
							            	   proceed=false;
							              // System.out.println("show zero > "+showZeroBalance+"  go>>"+proceed);
							         if(proceed)   { 
 
	 
		%>
		<tr>
			<td align="right">
			<div align="right"><%=i++%></div>
			</td>
			
				<td>
			<div  align="left" style="overflow: auto; width: 220px;"><a href="#" onclick="popUp('customerDetails.jsp','<%=rsDetails.getString("CompanyName")%>','Customer','<%=rs.getString("CustomerCode")%>')"><%=rsDetails.getString("CompanyName")%></a></div>
			</td>
			
			<td>
			<div  align="left" style="overflow: auto; width: 200px;"><%=rsDetails.getString("BranchName")%></div>
			</td>
			<%if(GroupName=="")
				{
				GroupName="-";
				}%>
			
				<td>
			<div  align="left" style="overflow: auto; width: 200px;"><%=GroupName %></div>
			</td>
			
				<td>
			<div  align="left" style="overflow: auto; width: 200px;"><%=rsDetails.getString("ContactPerson")%></div>
			</td>
			
				<td>
			<div align="right"><%=rsDetails.getString("MobileNo")%></div>
			</td>
			
 
			
 
					<td>
			<div align="left" style="overflow: auto; width: 80px;"><%try{%><%=new SimpleDateFormat(
			"dd-MMM-yyyy")
			.format(new SimpleDateFormat(
					"yyyy-MM-dd")
					.parse(rsDetails.getString("TransactionDate")))%><%}catch(Exception e){System.out.println(e);}%></div>
			</td>
					<td>
			<div align="right"><%=rsDetails.getString("transactionid")%></div>
			</td>
			<%
			String STPCQuery="select * from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"prospectivecustmaster where CompanyName='"+rsDetails.getString("CompanyName")+"'";
			String CompanyName="", ContactPerson="",Phone="",EMail="",City="",IntrestedProduct="";
			ResultSet STPCRS=STPC.executeQuery(STPCQuery);
			if (STPCRS.next()) {		
				
				CompanyName=STPCRS.getString("CompanyName");
				ContactPerson=STPCRS.getString("ContactPerson");
				Phone=STPCRS.getString("Phone");
				EMail=STPCRS.getString("EMail");
				City=STPCRS.getString("City");
				IntrestedProduct=STPCRS.getString("IntrestedProduct");
				
			}
			%>
				<td>
			<div align="right"><a href="ledgerdetails.jsp?companyName=<%=CompanyName%>&customercode=<%=rs.getString("CustomerCode")%>&companyPerson=<%=ContactPerson%>&companyPhone=<%=Phone%>&companyEmail=<%=EMail%>&companyCity=<%=City%>&companyProduct=<%=IntrestedProduct%>"><%=new DecimalFormat("0.00").format(debitAmount-totalCreditAmount)%></a></div>
			</td>
 
 		
 
 
			<td>
			<div align="right"><%=new DecimalFormat("0.00").format(thirtyDeduction) %></div>
			</td>
						<td>
			<div align="right"><%=new DecimalFormat("0.00").format(sixtyDeduction)%></div>
			</td>
			<td>
			<div align="right"><%=new DecimalFormat("0.00").format(ninetyDeduction) %></div>
			</td>
			<td>
			<div align="right"><%=new DecimalFormat("0.00").format(moreThanninetyDeduction) %></div>
			</td>

		</tr>
		
		<% }
						  			 
		}
	}
				 
}
		} catch (Exception e) {
			}
			finally
			{
				%>
				<tfoot>
				<tr>
		<th>Sr.No</th>
		<th>Company</th>
		<th>Branch Name</th>
		<th>Group</th>
		<th>Contact</th>
		<th>Mobile No</th>
		<th>Last Tr. date</th>
	    <th>Tr ID </th>	
	    <th>Current Balance</th>
		<th>>=30</th>
		<th>31-60</th>
		<th>61-90</th>
		<th> >= 91 </th>
	</tr>
	</tfoot>
	</table>
	<input type="hidden" id="tableHTML" name="tableHTML" value="" />
	<input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" />
	</div>
</form>
	</body>
	</html>
</jsp:useBean>

<%@include file="footer_new.jsp"%>
				<%
			
				//conn.close();
			}
%>	

