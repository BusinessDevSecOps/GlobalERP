<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="header.jsp"%>
<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">

	<script src="dropdown.js" type="text/javascript"></script>
		<script src="ledgerDetails.js" type="text/javascript"></script>

	<script language="JavaScript1.2">

	
	if (document.all || document.getElementById)
		document.body.style.background = "url('images/bg.jpg')  white top no-repeat "
</script>


	 
	<%
		erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
	%>
	<%
		Connection conn = null;
			Statement st = null, st1 = null, st3 = null, st4 = null;
			Statement st2 = null;
			String selectedName;
			String FollowUpType="";
			Format format=new SimpleDateFormat("dd-MMM-yyyy");
			Format parse=new SimpleDateFormat("yyyy-MM-dd");
			String fromDate="",toDate="",fromDateCal="",toDateCal="";
			String companyName="",phone="",contact="",email="",product="",city="";
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
	if (!(null == request.getParameter("companyName"))) 
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
				st3 = conn.createStatement();
				st4 = conn.createStatement();
		 
			if (null == request.getParameter("repName"))
				selectedName = "All";
			else
				selectedName = request.getParameter("repName");
	%>
	
    <div style="position:absolute;margin-left:0;margin-top;0;text-align:left;width:100px;height:35x;">
	<table>
	<tr>
	<td>
	<a href="javascript:history.back(-1);" style="font-weight: bold; color: black; " >
    <img src="images/arrow_left.png" width="42px" height="42px" style="border-style: none"></img>
    </a>
    </td>
    <td><b>Back</b>
    </td>
    </tr>
    </table>
   </div>  
	<div
		style="font-size: 1.5em; text-align: center; margin-top: 5px; margin-bottom: 5px;"><a> 
		  Document's Uploaded For <%=request.getParameter("companyName")%></a>
    </div>


<br></br>
<%	
String sqlDetails="",companyCode="",openingBalance=null;
double sumDebit=0,sumCredit=0;

%><div id="tabS" style="visibility: visible;">

	<table border="1px"  class="sortable" width="40%">
	<tr>
	<th>Sr.No</th>
	<th>Marketing Representative name</th>
	<th>Follow-Up Date</th>
	<th>Comments</th>
	<th>Spoken To</th>
	<th>Reply</th>
	<th>Remarks</th>
	<th>Document Type</th>
	<th>File Attached</th>
	
	</tr>
 <% 
 
					int i = 1;
					sqlDetails = " SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"followup AS a LEFT OUTER JOIN   "+session.getAttribute("CompanyMasterID").toString()+"marketingrepmaster "+
					"  AS b ON ( a.MarketingRepCode = b.MarketingRepCode )			"+
					"where a.ProspCustName='"+request.getParameter("companyName")+"' and DocumentStatus = 'Upload' ORDER BY  a.followupdate DESC ";
					
					//sqlDetails = " SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"followup where ProspCustName='"+request.getParameter("companyName")+"' and DocumentStatus = 'Upload' ORDER BY followupdate DESC ";
					System.out.println(sqlDetails);
					ResultSet rsDetails = st.executeQuery(sqlDetails);
					while (rsDetails.next()) {
						%>
						<tr>
						<td align="left" width=3%;><div align ="right"><%=i++ %></div></td>
						<td align="left" width=12%><div align ="left"><%=rsDetails.getString("MarketingRepName") %></div></td>
						<td><div align ="right" width=8%><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse
									(rsDetails.getString("FollowUpDate")))%></div></td>
						<td><div align ="left" ><%=((rsDetails.getString("Comments")!=null ) && (rsDetails.getString("Comments")!="" ) ? rsDetails.getString("Comments") : "-") %></div></td>
						<td><div align ="left"><%=((rsDetails.getString("SpokenTo")!=null ) && (rsDetails.getString("SpokenTo")!="" ) ? rsDetails.getString("SpokenTo") : "-") %></div></td>
						<td><div align ="left"><%=rsDetails.getString("Reply") %></div></td>
						<td><div align ="left"><%=((rsDetails.getString("Remarks")!=null ) && (rsDetails.getString("Remarks")!="" ) ? rsDetails.getString("Remarks") : "-") %></div></td>
						<td><div align ="left"><%=((rsDetails.getString("DocumentType")!=null ) && (rsDetails.getString("DocumentType")!="" ) ? rsDetails.getString("DocumentType") : "-") %></div></td>
						
						<% 
				System.out.println("=======================>>"+rsDetails.getString("DocumentName"));
				String delims12= "[,]";
				if(rsDetails.getString("DocumentName").equalsIgnoreCase("-"))
				{
					%>
					<td><a href="#" ><font size="2"><%=rsDetails.getString("DocumentName")%></font><br></br></a></td>
					<%
				}
				else
				{
				String[] tok = rsDetails.getString("DocumentName").split(delims12);
				
				//for (String t1 : tok)
					%>
					<td>
					<%
					for (int ij=1;ij<tok.length;ij++)
					{
					System.out.println("=======================>>"+tok[ij]);
					%>
						<a href="DocumentsAttached.jsp?documentName=<%=tok[ij]%>" onclick="window.open(this.href);return false;"><font size="2"><%=tok[ij]%></font><br></br></a>
					<%	
					
				}%>
					</td>
					<%
				}
				%>
						
					
						
						</tr>
						<%
					}
 
					if(i==1){
%><tr><td colspan="14">***</td></tr>
<tr><td colspan="14"><b><%=request.getParameter("companyName") %>
 &nbsp;&nbsp;is not followed up since <u><%=fromDateCal %></u> &nbsp;to&nbsp;  <%=toDateCal %></u></b></td></tr>

<%}
} catch (Exception e) {
out.print("!!!Connection Lost!!!");
}
finally{
	conn.close();
}%>
</table>
</div>
	 
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