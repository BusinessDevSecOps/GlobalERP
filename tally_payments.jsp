<%@page import="java.io.*" import="java.sql.*" %>
<%@page import="java.text.*"%>
<%@ include file="header.jsp"%>

<jsp:useBean id="tally" class="com.tally.beans.TALLY" scope="page">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Tally Conversion - Payments Vouchers</title>
</head>
<body>
<form name="xyz" method="get" action="">
<%
tally.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
Connection conn = null;
Statement st = null, st1 = null, st3 = null, st4 = null;
Statement st2 = null;
String selectedName;
Format format=new SimpleDateFormat("dd-MMM-yyyy");
Format parse=new SimpleDateFormat("yyyy-MM-dd");
String fromDate="",toDate="",fromDateCal="",toDateCal="",mDate;
String companyName="",phone="",contact="",email="",product="",city="";
Date today = new Date();
String todaysDateTime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
Calendar cal = Calendar.getInstance();
cal.setTime(today);
cal.add(Calendar.DAY_OF_MONTH, -30);
Date today30 = cal.getTime();
fromDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(today30);
toDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
fromDate=new SimpleDateFormat("yyyy-MM-dd").format(today30);
toDate=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
if (!(null == request.getParameter("fromdate")))
{
	fromDate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("fromdate")));
	fromDateCal=request.getParameter("fromdate");
}    		
if (!(null == request.getParameter("todate"))){
	toDate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("todate")));
	toDateCal=request.getParameter("todate");
}
%>
    <table align="center" >
    	   <tr>
    	    <td align="center" valign="top" style="width: 180px;">
			Begin Date:
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
 </td><td align="center" valign="top" style="width: 20px;">
			&nbsp;<b>to</b> </td><td align="left" valign="top" style="width: 180px;"> End Date:
			  
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
			 </td><td align="left" valign="top">&nbsp;&nbsp;
	 <input type="submit" name="submit" id="submit" style="border: outset;"
				value="GO"></input></td>
				<%--
				<td align="right">
								<font size="1">&nbsp;&nbsp;&nbsp;<%=new java.util.Date()%></font>
				<a style="visibility: hidden;" href="#" onclick="javascript:window.open('excelLedgerDetails.jsp?company=<%=companyName %>&companyPhone=<%=phone %>&companyEmail=<%=email %>&companyPerson=<%=email %>&companyCity=<%=city %>&companyProduct=<%=product %>&fromDate=<%=fromDate %>&toDate=<%=toDate %>');" title="Export To Excel">

				<img src="images/excel.jpg"	width="15px" height="15px"></img></a>&nbsp;&nbsp;&nbsp;
				<a href="#" onclick="window.print();return false;" title="Print"><img src="images/print.jpg" width="15px" height="15px"></img></a>
				</td>
				 --%>	
    </tr></table>
    </form>
    
    <%
        if (request.getQueryString()!=null)
        {
        String text = "";
        try {
            conn = tally.ReturnConnection();
		    st1 = conn.createStatement();
		    st2 = conn.createStatement();
            //out.println(fromDate);
            //out.println(toDate);
            
		    //SELECT str_to_date(paymentdate,'%d-%b-%Y') as mydate from "+session.getAttribute("CompanyMasterID").toString()+"supallpaymentdetails 
            //SELECT CONVERT(CONCAT(substring(paymentdate,8,2),'-09','-',substring(paymentdate,1,2)),DATE) as mydate from "+session.getAttribute("CompanyMasterID").toString()+"supallpaymentdetails  order by mydate
            
            //String sql="select * from "+session.getAttribute("CompanyMasterID").toString()+"supallpaymentdetails as a INNER JOIN "+session.getAttribute("CompanyMasterID").toString()+"supplierdet as b on a.suppliercode = b.suppliercode where a.paymentdate BETWEEN '"+fromDate+"' and '"+toDate+"'  and paymentmode = 'Cheque' order by paymentdate";
            String sql="select *,str_to_date(a.paymentdate,'%d-%b-%Y') as mydate from "+session.getAttribute("CompanyMasterID").toString()+"supallpaymentdetails as a INNER JOIN "+session.getAttribute("CompanyMasterID").toString()+"supplierdet as b on a.suppliercode = b.suppliercode where str_to_date(a.paymentdate,'%d-%b-%Y') BETWEEN '"+fromDate+"' and '"+toDate+"' and paymentmode = 'Cheque' order by str_to_date(a.paymentdate,'%d-%b-%Y')";
            String sql1="";
            System.out.println(sql);
            ResultSet rs=st1.executeQuery(sql);
            %>
                     
            <table width="100%" border="2" style="font-size: 10" class="sortable">
            <tr >
            <td colspan="7" align="center"><h1>Converted Data to Tally [PAYMENTS]</h1></td>
            </tr>
            <th>Voucher Date</th>
            <th>Voucher No</th>
            <th>Account Name</th>
            <th align="right">Amount</th>
            <th>Bank Name</th>
            <th>Narrations</th>
            <th>Status</th>
            <%
            String senddata=null;
            while(rs.next()) 
            {
            %>
            <tr>
            <%
            	String mVoudate=rs.getString("mydate");
                mVoudate="2011-04-01";
                System.out.println("first"+mVoudate);
                mVoudate=mVoudate.substring(0,4)+mVoudate.substring(5,7)+mVoudate.substring(8,10);
                System.out.println(mVoudate);
                String mVoucherno=rs.getString("moneyreceiptno");
                String entrysearch = tally.search_in_tables("SELECT * from "+session.getAttribute("CompanyMasterID").toString()+"tallydata_conv where voucher_no='"+mVoucherno+"' and voucher_type='Payments'");
                //out.println("Entry found:"+entrysearch);
                String mCompanyname=rs.getString("b.suppliername").replace("&","&amp;");
                String mBankname=rs.getString("bankname"); // "HDFC Bank A/c No.00392050000250";//"HDFC Bank"; // FOR OTHER BANKS WE HAVE MAKE CHANGES IN OUR ERP
                String mAmount=rs.getString("amountpaid");
                String mNarration=rs.getString("remarks");
                text= mVoudate+mVoucherno;
                String mUsername=session.getAttribute("EmpName").toString();
                //String mTodaydate= today;
                senddata=null;
                
                //System.out.println(sql1);
                //st2.executeUpdate(sql1);
            %>
            <td><div> <%=mVoudate.substring(6,8)+"-"+mVoudate.substring(4,6)+"-"+mVoudate.substring(0,4)%></div></td>
            <td><%=mVoucherno%></td>
			<td><%=mCompanyname%></td>
			<td align="right"><%=mAmount%></td>
			<td><%=mBankname%></td>
			<td><%=mNarration%></td> 
			
			<%
			String ipAddress =request.getRemoteAddr(); 
			String Connected = tally.connectTallyserver(ipAddress);
			if (Connected=="Not Connected !!!")
			{
			%>
			<h3>Please Start your Tally ERP 9 Software First and Reload this page .... </h4>
			 	
			<% 
			}
			
			StringBuilder xmldoc = new StringBuilder();
			xmldoc.append("<ENVELOPE>\r\n");
			xmldoc.append("<HEADER>\r\n");
			xmldoc.append("<TALLYREQUEST>Import Data</TALLYREQUEST>\r\n");
			xmldoc.append("</HEADER>\r\n");
			xmldoc.append("<BODY>\r\n");
			xmldoc.append("<IMPORTDATA>\r\n");
			xmldoc.append("<REQUESTDESC>\r\n");
			xmldoc.append("<REPORTNAME>Vouchers</REPORTNAME>\r\n");
			xmldoc.append("<STATICVARIABLES>\r\n");
            xmldoc.append("</STATICVARIABLES>\r\n");
            xmldoc.append("</REQUESTDESC>\r\n");
            xmldoc.append("<REQUESTDATA>\r\n");
            xmldoc.append("<TALLYMESSAGE xmlns:UDF='TallyUDF'>\r\n");
            xmldoc.append("<VOUCHER  VCHTYPE='Payment' ACTION='Create'>\r\n");
            xmldoc.append("<BASICBANKERSDATE.LIST TYPE='Date'>\r\n");
            xmldoc.append("<BASICBANKERSDATE>"+mVoudate+"</BASICBANKERSDATE>\r\n");
            xmldoc.append("</BASICBANKERSDATE.LIST>\r\n");
            xmldoc.append("<DATE>"+mVoudate+"</DATE>\r\n");
            xmldoc.append("<NARRATION>"+mNarration+"</NARRATION>\r\n");
            xmldoc.append("<VOUCHERTYPENAME>Payment</VOUCHERTYPENAME>\r\n");
            xmldoc.append("<VOUCHERNUMBER>"+mVoucherno+"</VOUCHERNUMBER>\r\n");
            xmldoc.append("<PARTYLEDGERNAME>"+mCompanyname+"</PARTYLEDGERNAME>\r\n");
            xmldoc.append("<BASICVOUCHERCHEQUENAME>Neft "+mCompanyname+"</BASICVOUCHERCHEQUENAME>\r\n");
            xmldoc.append("<BASICVOUCHERCROSSCOMMENT>A/c Payee</BASICVOUCHERCROSSCOMMENT>\r\n");
            xmldoc.append("<CSTFORMISSUETYPE/>\r\n");
            xmldoc.append("<CSTFORMRECVTYPE/>\r\n");
            xmldoc.append("<FBTPAYMENTTYPE>Default</FBTPAYMENTTYPE>\r\n");
            xmldoc.append("<VCHGSTCLASS/>\r\n");
            xmldoc.append("<ENTEREDBY>murali</ENTEREDBY>\r\n");
            xmldoc.append("<DIFFACTUALQTY>No</DIFFACTUALQTY>\r\n");
            xmldoc.append("<AUDITED>No</AUDITED>\r\n");
            xmldoc.append("<FORJOBCOSTING>No</FORJOBCOSTING>\r\n");
            xmldoc.append("<ISOPTIONAL>No</ISOPTIONAL>\r\n");
            xmldoc.append("<EFFECTIVEDATE>"+mVoudate+"</EFFECTIVEDATE>\r\n");
            xmldoc.append("<USEFORINTEREST>No</USEFORINTEREST>\r\n");
            xmldoc.append("<USEFORGAINLOSS>No</USEFORGAINLOSS>\r\n");
            xmldoc.append("<USEFORGODOWNTRANSFER>No</USEFORGODOWNTRANSFER>\r\n");
            xmldoc.append("<USEFORCOMPOUND>No</USEFORCOMPOUND>\r\n");
            xmldoc.append("<ALTERID> 158797</ALTERID>\r\n");
            xmldoc.append("<EXCISEOPENING>No</EXCISEOPENING>\r\n");
            xmldoc.append("<USEFORFINALPRODUCTION>No</USEFORFINALPRODUCTION>\r\n");
            xmldoc.append("<ISCANCELLED>No</ISCANCELLED>\r\n");
            xmldoc.append("<HASCASHFLOW>Yes</HASCASHFLOW>\r\n");
            xmldoc.append("<ISPOSTDATED>No</ISPOSTDATED>\r\n");
            xmldoc.append("<USETRACKINGNUMBER>No</USETRACKINGNUMBER>\r\n");
            xmldoc.append("<ISINVOICE>No</ISINVOICE>\r\n");
            xmldoc.append("<MFGJOURNAL>No</MFGJOURNAL>\r\n");
            xmldoc.append("<HASDISCOUNTS>No</HASDISCOUNTS>\r\n");
            xmldoc.append("<ASPAYSLIP>No</ASPAYSLIP>\r\n");
            xmldoc.append("<ISCOSTCENTRE>No</ISCOSTCENTRE>\r\n");
            xmldoc.append("<ISDELETED>No</ISDELETED>\r\n");
            xmldoc.append("<ASORIGINAL>No</ASORIGINAL>\r\n");
            xmldoc.append("<ALLLEDGERENTRIES.LIST>\r\n");
            xmldoc.append("<LEDGERNAME>"+mCompanyname+"</LEDGERNAME>\r\n");
            xmldoc.append("<GSTCLASS/>\r\n");
            xmldoc.append("<ISDEEMEDPOSITIVE>Yes</ISDEEMEDPOSITIVE>\r\n");
            xmldoc.append("<LEDGERFROMITEM>No</LEDGERFROMITEM>\r\n");
            xmldoc.append("<REMOVEZEROENTRIES>No</REMOVEZEROENTRIES>\r\n");
            xmldoc.append("<ISPARTYLEDGER>Yes</ISPARTYLEDGER>\r\n");
            xmldoc.append("<AMOUNT>-"+mAmount+"</AMOUNT>\r\n");
            xmldoc.append("<BILLALLOCATIONS.LIST>\r\n");
            xmldoc.append("<NAME>"+mVoucherno+"</NAME>\r\n");
            xmldoc.append("<BILLTYPE>Agst Ref</BILLTYPE>\r\n");
            xmldoc.append("<AMOUNT>-"+mAmount+"</AMOUNT>\r\n");
            xmldoc.append("</BILLALLOCATIONS.LIST>\r\n");
            xmldoc.append("</ALLLEDGERENTRIES.LIST>\r\n");
            xmldoc.append("<ALLLEDGERENTRIES.LIST>\r\n");
            xmldoc.append("<LEDGERNAME>"+mBankname+"</LEDGERNAME>\r\n");
            xmldoc.append("<GSTCLASS/>\r\n");
            xmldoc.append("<ISDEEMEDPOSITIVE>No</ISDEEMEDPOSITIVE>\r\n");
            xmldoc.append("<LEDGERFROMITEM>No</LEDGERFROMITEM>\r\n");
            xmldoc.append("<REMOVEZEROENTRIES>No</REMOVEZEROENTRIES>\r\n");
            xmldoc.append("<ISPARTYLEDGER>Yes</ISPARTYLEDGER>\r\n");
            xmldoc.append("<AMOUNT>"+mAmount+"</AMOUNT>\r\n");
            xmldoc.append("</ALLLEDGERENTRIES.LIST>\r\n");
            xmldoc.append("</VOUCHER>\r\n");
            xmldoc.append("</TALLYMESSAGE>\r\n");
            xmldoc.append("</REQUESTDATA>\r\n");
            xmldoc.append("</IMPORTDATA>\r\n");
            xmldoc.append("</BODY>\r\n");
            xmldoc.append("</ENVELOPE>\r\n");
            %>
            <td>
            <%
            if (entrysearch=="NOT FOUND")
            {
                 senddata = tally.sendTallyserver(xmldoc.toString(),ipAddress);
                 out.println(senddata);
            }
            else
            {
                senddata=entrysearch;            	
            	out.println(entrysearch);
            }
            %>
            </td>
            <%
                   
            if (senddata.contains("Updated") && (entrysearch=="NOT FOUND") )
            {
            	sql1="insert into "+session.getAttribute("CompanyMasterID").toString()+"tallydata_conv (voucher_type,voucher_date,voucher_no,accountname,secondaccount,amount,narrations,username,create_date,tallyvid)"+
                     "VALUES ( 'Payments','"+mVoudate+"','"+mVoucherno+"','"+mCompanyname+"','"+mBankname+"','"+mAmount+"','"+mNarration+"','"+mUsername+"','"+todaysDateTime+"','"+senddata+"' )";
                st2.executeUpdate(sql1);
        	}
            }
        }
        catch(Exception e)
        {
          out.println(e);
        }
        %>
        </tr>
        </table>
        <%
        }
        %>
    <br><br> <br><br> <br><br> <br><br>
	<br><br> <br><br> <br><br> <br><br>
	<br><br> <br><br> <br><br> <br><br>
	<div id="footer">
	<p><a href="http://www.myfleetview.com"> Copyright &copy; 2009
	by Transworld Compressor Technologies Ltd. All Rights Reserved.</a></p>
	</div>
	</body>
</html>
</jsp:useBean>