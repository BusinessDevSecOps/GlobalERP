v<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ include file="header.jsp"%>
<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">
	
<%
	erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
%>
<%
    Connection conn = null;
    Statement st = null, st1 = null,st2=null,st3=null,st4=null,st5=null,stDATE=null,stMaster=null;
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
		} catch (Exception e) {
		};
	Date today = new Date();
	Date tomorrow=new Date();
	Calendar cal = Calendar.getInstance();
	Calendar now = Calendar.getInstance();
	cal.setTime(today);
	String todaysDate=new SimpleDateFormat("yyyy-MM-dd").format(today);
	String todaysDateInMMM=new SimpleDateFormat("dd-MMM-yyyy").format(today);
 
	
	String sqlFollowup="";		
	String fromDateCal = "", toDateCal = "", sql = "",mainCustomer="";
	fromDateCal = toDateCal = new SimpleDateFormat("dd-MMM-yyyy")
			.format(new java.util.Date());
	String fromdate=request.getParameter("fromDate");
	String newfromdate=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("fromDate")));
	System.out.println("<><><><><><>      "+fromdate);
	
	String todate=request.getParameter("toDate");
	String newtodate=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("toDate")));
	System.out.println("<><><><><><>      "+todate);
	
	String number=request.getParameter("Number");
	System.out.println("**&&&**&*&**&*&*    "+number);
	
	String repcode=request.getParameter("repCode");
	System.out.println("**&&&**&*&**&*&*    "+repcode);
	
//	String repName = request.getParameter("repName");
//	System.out.println("rep Name000000000000000000"+repName);
	
	String sqlName="select 	MarketingRepName from "+session.getAttribute("CompanyMasterID").toString()+"marketingrepmaster where MarketingRepCode='"+repcode+"'" ;
	ResultSet rsName=st.executeQuery(sqlName);
	rsName.next();
	String name=rsName.getString("MarketingRepName");		
%>


<%if(number.contains("6")){ %>
	<div align="center" style="font-size: 1.4em; margin-top: 0.5em;margin-bottom: 0.5em;"><a>Prospects Details of:<%=name%> Between <%=newfromdate %> to <%=newtodate %> </a>
	</div>
	<table border=1 class="sortable">	
	<tr>
	
	<th>Sr No</th>
	<th>Name</th>
	<th>Prospects Customer Added On</th>
	<th>Contact Person</th>
	<th>City</th>
	<th>Address</th>
	</tr>
	<%
	System.out.println("sssssssssssssssssssshhhhoaib");
	int a=1;
	String sqlVisits="Select * from "+session.getAttribute("CompanyMasterID").toString()+"prospectivecustmaster where CustEnteredByRep = '"+name+"' and ProspCustAddedOn >= '"+fromdate+" 00:00:00' and  ProspCustAddedOn  <= '"+todate+" 23:59:59'";
	//Select * from "+session.getAttribute("CompanyMasterID").toString()+"prospectivecustmaster where CustEnteredByRep = 'vikrant dhavale' and ProspCustAddedOn >= '2012-03-19 00:00:00' and ProspCustAddedOn  <= '2012-03-19 00:00:00'
	
	System.out.println("sql Visit-----------"+sqlVisits);
	ResultSet rsVisit=st.executeQuery(sqlVisits);
	while(rsVisit.next()){
		System.out.println("in While --------------------------");
	%>
	<tr>
	<td><div align="right"><%=a %></div></td>
	<td><div align="left"><%=rsVisit.getString("CompanyName") %></div></td>
	<td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsVisit.getString("ProspCustAddedOn"))) %></div></td>
	<td><div align="left"><%=rsVisit.getString("ContactPerson") %></div></td>
	<td><div align="left"><%=rsVisit.getString("City") %></div></td>
	<td><div align="left"><%=rsVisit.getString("Address") %></div></td>
	</tr>
	<%
	a++;
	
	} %>
	</table>	
<%}
else
{
%>

<%if(number.contains("1")){ %>
	<div align="center" style="font-size: 1.4em; margin-top: 0.5em;margin-bottom: 0.5em;"><a>Visit Details of:<%=name%> Between <%=newfromdate %> To <%=newtodate %> </a>
	</div>
<%}%>	
	
<%if(number.contains("2")){ %>
	<div align="center" style="font-size: 1.4em; margin-top: 0.5em;margin-bottom: 0.5em;"><a>Phone Call Details of:<%=name%> Between <%=newfromdate %> To <%=newtodate %> </a>
	</div>
<%}%>	
	
<%if(number.contains("3")){ %>
	<div align="center" style="font-size: 1.4em; margin-top: 0.5em;margin-bottom: 0.5em;"><a>Letters Details of:<%=name%> Between <%=newfromdate %> To <%=newtodate %> </a>
	</div>
<%}%>

<%if(number.contains("4")){ %>
	<div align="center" style="font-size: 1.4em; margin-top: 0.5em;margin-bottom: 0.5em;"><a>Email Details of:<%=name%> Between <%=newfromdate %> To <%=newtodate %> </a>
	</div>
<%}%>

<%if(number.contains("5")){ %>
	<div align="center" style="font-size: 1.4em; margin-top: 0.5em;margin-bottom: 0.5em;"><a>Meetings Details of:<%=name%> Between <%=newfromdate %> to <%=newtodate %> </a>
	</div>
<%}%>


	<table border=1 class="sortable">	
	<tr>
	
	<th>Sr No</th>
	<th>Customer</th>
	<th>Follow Up Date</th>
	<th>Comments</th>
	<th>Next Followup</th>
	<th>Followup Subject</th>
	<th>Contact Person</th>
	<th>City</th>
	<th>Address</th>
	<th>Reply</th>
	
	</tr>

<%if(number.contains("1")){ %>
	
	<%
	int a=1;
	String sqlVisits="Select * from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType in ('Visit')  and MarketingRepcode='"+repcode+"'	and FollowUpDate between '"+fromdate+"' and '"+todate+"'";
	ResultSet rsVisit=st.executeQuery(sqlVisits);
	while(rsVisit.next()){
	%>
	<tr>
	<td><div align="right"><%=a %></div></td>
	<td><div align="left"><%=rsVisit.getString("ProspCustName") %></div></td>
	<td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsVisit.getString("FollowUpDate"))) %></div></td>
	<td><div align="left"><%=rsVisit.getString("Comments") %></div></td>
	<td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsVisit.getString("NextFollowUpDate"))) %></div></td>
	<td><div align="left"><%=rsVisit.getString("FollowUpSubject") %></div></td>
	<td><div align="left"><%=rsVisit.getString("ContactPerson") %></div></td>
	<td><div align="left"><%=rsVisit.getString("City") %></div></td>
	<td><div align="left"><%=rsVisit.getString("Address") %></div></td>
	<td><div align="left"><%=rsVisit.getString("Reply") %></div></td>
	</tr>

	<%
	a++;
	} %>
	</table>	
<% } %>

<% if(number.contains("2")){
	int a=1;
	String sqlPhone="Select * from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType in ('phoneCall','Ph Call')  and MarketingRepcode='"+repcode+"'	and FollowUpDate between '"+fromdate+"' and '"+todate+"'";
	ResultSet rsPhone=st1.executeQuery(sqlPhone);
	while(rsPhone.next()){
%>
	<tr>
	<td><div align="right"><%=a %></div></td>
	<td><div align="left"><%=rsPhone.getString("ProspCustName") %></div></td>
	<td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsPhone.getString("FollowUpDate"))) %></div></td>
	<td><div align="left"><%=rsPhone.getString("Comments") %></div></td>
	<td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsPhone.getString("NextFollowUpDate"))) %></div></td>
	<td><div align="left"><%=rsPhone.getString("FollowUpSubject") %></div></td>
	<td><div align="left"><%=rsPhone.getString("ContactPerson") %></div></td>
	<td><div align="left"><%=rsPhone.getString("City") %></div></td>
	<td><div align="left"><%=rsPhone.getString("Address") %></div></td>
	<td><div align="left"><%=rsPhone.getString("Reply") %></div></td>
	</tr>
	
	<%
	a++;
	} %>
	</table>

<% } %>

<% if(number.contains("3")) { 
	int a=1;
	String sqlLetters="Select * from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType in ('Letter')  and MarketingRepcode='"+repcode+"'	and FollowUpDate between '"+fromdate+"' and '"+todate+"'";
	ResultSet rsLetters=st1.executeQuery(sqlLetters);
	while(rsLetters.next()){
	%>
	<tr>
	<td><div align="right"><%=a %></div></td>
	<td><div align="left"><%=rsLetters.getString("ProspCustName") %></div></td>
	<td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsLetters.getString("FollowUpDate"))) %></div></td>
	<td><div align="left"><%=rsLetters.getString("Comments") %></div></td>
	<td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsLetters.getString("NextFollowUpDate"))) %></div></td>
	<td><div align="left"><%=rsLetters.getString("FollowUpSubject") %></div></td>
	<td><div align="left"><%=rsLetters.getString("ContactPerson") %></div></td>
	<td><div align="left"><%=rsLetters.getString("City") %></div></td>
	<td><div align="left"><%=rsLetters.getString("Address") %></div></td>
	<td><div align="left"><%=rsLetters.getString("Reply") %></div></td>
	</tr>
	<%
	a++;
	} %>
	</table>
	
<% } %>

<% if(number.contains("4")) {
	int a=1;
	String sqlEmails="Select * from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType in ('E-mail','E mail','Mail','Email')  and MarketingRepcode='"+repcode+"'	and FollowUpDate between '"+fromdate+"' and '"+todate+"'";
	ResultSet rsemails=st1.executeQuery(sqlEmails);
	while(rsemails.next()){
%>
	<tr>
	<td><div align="right"><%=a %></div></td>
	<td><div align="left"><%=rsemails.getString("ProspCustName") %></div></td>
	<td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsemails.getString("FollowUpDate"))) %></div></td>
	<td><div align="left"><%=rsemails.getString("Comments") %></div></td>
	<td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsemails.getString("NextFollowUpDate"))) %></div></td>
	<td><div align="left"><%=rsemails.getString("FollowUpSubject") %></div></td>
	<td><div align="left"><%=rsemails.getString("ContactPerson") %></div></td>
	<td><div align="left"><%=rsemails.getString("City") %></div></td>
	<td><div align="left"><%=rsemails.getString("Address") %></div></td>
	<td><div align="left"><%=rsemails.getString("Reply") %></div></td>
	</tr>
	
	
	<%
	a++;
	} %>
	</table>
 	
<% } %>

<% if(number.contains("5")) { 
	int a=1;
	String sqlMeetings="Select * from "+session.getAttribute("CompanyMasterID").toString()+"followup where FollowUpType in ('Meeting')  and MarketingRepcode='"+repcode+"'	and FollowUpDate between '"+fromdate+"' and '"+todate+"'";
	ResultSet rsmeetings=st4.executeQuery(sqlMeetings);
	while(rsmeetings.next()){
	%>
	<tr>
	<td><div align="right"><%=a %></div></td>
	<td><div align="left"><%=rsmeetings.getString("ProspCustName") %></div></td>
	<td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsmeetings.getString("FollowUpDate"))) %></div></td>
	<td><div align="left"><%=rsmeetings.getString("Comments") %></div></td>
	<td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsmeetings.getString("NextFollowUpDate"))) %></div></td>
	<td><div align="left"><%=rsmeetings.getString("FollowUpSubject") %></div></td>
	<td><div align="left"><%=rsmeetings.getString("ContactPerson") %></div></td>
	<td><div align="left"><%=rsmeetings.getString("City") %></div></td>
	<td><div align="left"><%=rsmeetings.getString("Address") %></div></td>
	<td><div align="left"><%=rsmeetings.getString("Reply") %></div></td>
	</tr>
	<%
	a++;
	} %>
	</table>
	
<% 
}
}
%>

<div></div>
   






<br><br><br><br><br>
<br><br><br><br><br><br><br><br>        
	<br><br><br>
	<div id="footer">
	<p><a href="http://www.myfleetview.com"> Copyright &copy; 2009
	by Transworld Compressor Technologies Ltd. All Rights Reserved.</a></p>
	</div>
	<!-- end #footer -->
	</body>
	</html>
</jsp:useBean>