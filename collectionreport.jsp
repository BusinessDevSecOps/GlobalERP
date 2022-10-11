<%@page import="java.io.*" import="java.sql.*" %>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@ include file="header.jsp"%>

<jsp:useBean id="tally" class="com.tally.beans.TALLY" scope="page">
<style>
body {

            margin: 0px;
            padding: 0px;
            }
            
            #divheader
            {
            height:50;
            background:	White;
            }
            
            #header 
            {
            background: #2675a8;
            font:large;
            color:green;
            width: 100%;
            }
            
            #leftcolumn 
            {
            background:#0099CC;
            float: left;
            width: 35%;
            height: 400px;
            }
            
            #content 
            {
            border:medium;
            border-color:blue;
            background: ;
            float: left;
            width: 100%;
            height: 400px;
            overflow:scroll;
            }
            
            #myfooter 
            {
            background: #df781c;
            clear: both;
            width: 100%;
            }
            
}
</style>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Payment Collection Report</title>
</head>


<script type="text/javascript">
       var t = new ScrollableTable(document.getElementById('invoice'), 100);
       
       function gotoExcel (elemId, frmFldId)  
       {  
            //alert("*********** ");
                var obj = document.getElementById(elemId);  

                var oFld = document.getElementById(frmFldId); 

                 oFld.value = obj.innerHTML;  

                 document.collectionreport.action ="excel.jsp";     // CHANGE FORM NAME HERE

                 document.forms["collectionreport"].submit();       // CHANGE FORM NAME HERE
       } 
</script>
<form name="collection" method="get" action="" autocomplete="off">
<%

	String begindate="",enddate="",begindateCal="",enddateCal="";
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	DecimalFormat df2 = new DecimalFormat( "0.00" );
	java.util.Date d1 = null;
	java.util.Date d2 = null;
	Date today = new Date();
	Calendar cal = Calendar.getInstance();
	cal.setTime(today);
	cal.add(Calendar.DAY_OF_MONTH, -30);
	Date today30 = cal.getTime();
	String todaysDateTime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
	begindateCal=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
	enddateCal=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());

	if (!(null == request.getParameter("begindate"))) {
	    begindate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("begindate")));
	    begindateCal=request.getParameter("begindate");
	}
	if (!(null == request.getParameter("enddate"))){
    	enddate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("enddate")));
    	enddateCal=request.getParameter("enddate");
	}
	
//if (request.getQueryString()==null)
//{
%>


	<div id = "main" align="center">
    	 <table align="center" >
	<tr>
	<td colspan="3" align="center"><a>Collection Report</a></td>
 </tr>
     	<tr>
     	<td style="width: 200px;">
    	Begin Date   :
    	
    	<input type="text" id="begindate"
	 	name="begindate" value="<%=begindateCal %>" size="15" readonly
	 	style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF" />
	 	<script type="text/javascript">
			  Calendar.setup(
	    	{
	      inputField  : "begindate",         // ID of the input field
	      ifFormat    : "%d-%b-%Y",     // the date format
	      button      : "begindate"       // ID of the button
	    }
	  );
	</script>
	</td>
	<td  style="width: 200px;">
     End Date   :
 
    <input type="text" id="enddate"
	 name="enddate" value="<%=enddateCal %>" size="15" readonly
	 style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF" />
	 <script type="text/javascript">
		  Calendar.setup(
	    {
	      inputField  : "enddate",         // ID of the input field
	      ifFormat    : "%d-%b-%Y",     // the date format
	      button      : "enddate"       // ID of the button
	    }
	  );
	</script>
	</td>
	<td>
	<input type="submit" name="submit" id="submit" style="border: outset;"
	value="Go" onclick="makeinvisible()";/></td>
     </tr>
  
     
      </table>
      </div>
      
      <div>
      <table>
         <tr>
     <td>
     <div id='accountsList' style="color:green;">
	<div style="height: 50px; width: 350px; overflow: auto; border:solid inset;"></div>
	</div>
	</td>
     </tr>
 </table>
      </div>
      <%
//} %>
</form>
<%
if (request.getQueryString()!=null)
{
%>
<table align="right" ><tr>	
				<td align="right">
						<a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('collection','tableHTML');">
							     <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img>
			            </a>
				</td>
				</tr>
				</table>
<form name="collectionreport" method="post" action="" autocomplete="off">

	  <%
String exportFileName="collectionreport_det.xls";   // GIVE YOUR REPORT NAME
%>
<div id='collection'>
<input type="hidden" id="tableHTML" name="tableHTML" value="" />   
<input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" /> 

     <table class="sortable">
     <tr>
     <td colspan = "12" width="100%" align="center">
     <h3>Collection Report From: <%=request.getParameter("begindate")%> to <%=request.getParameter("enddate")%></h3>
     </td>
     </tr>
     <tr>
     		<th width="50"><div>Payment Mode</div></th>
            <th><div>VoucherNo</div></th>
            <th><div align="left">Receipt-Date</div></th>
            <th width="400"><div align="left">Received From</div></th>
            <th><div align="left">Cheque No</div></th>
            <th><div align="left">Cheque Date</div></th>
            <th><div align="right">Amount</div></th>
            <th><div align="left">Invoice No</div></th>
            <th><div align="left">Tally Ref No.</div></th>
        </tr>
	    <%
        try
        {
        	tally.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
        	String mybegindate = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("begindate")));
     	    String myenddate = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("enddate")));
        	Connection conn = null;
        	Connection conn1 = null;
        	Statement st = null;
        	Statement st1 = null;
        	Statement st2 = null;
        	String todaydate="";
        	String a=""; 
        	double totalamount=0;
	        todaydate=new SimpleDateFormat("dd-MM-yyyy").format(new java.util.Date());
	        conn = tally.ReturnConnection();
	        conn1 = tally.ReturnConnection();
        	st = conn.createStatement();
        	st1 = conn1.createStatement();
        	st2 = conn1.createStatement();
        	String sql="";
        	String sql1="";
        	//if(request.getParameter("all_pending")!=null)
        	//{
        		sql="select DISTINCT twempname from "+session.getAttribute("CompanyMasterID").toString()+"collection"; // as a inner join "+session.getAttribute("CompanyMasterID").toString()+"customerdet as b on a.customercode=b.customercode where paymentdate between '"+mybegindate+"' and '"+myenddate+"' and tallyrefno !='    ' group by a.twempname order by a.twempname ";
        	//}
        	//else
        	//{
        	//	sql="select * from "+session.getAttribute("CompanyMasterID").toString()+"collection as a inner join "+session.getAttribute("CompanyMasterID").toString()+"customerdet as b on a.customercode=b.customercode where tallyrefno = '  ' order by paymentdate";
        	//}
        	System.out.println(sql);
        	ResultSet rs1=st2.executeQuery(sql);
        	String mtwempname="";
        	while (rs1.next())
        	{
                mtwempname = rs1.getString("twempname");
        		sql1="select * from "+session.getAttribute("CompanyMasterID").toString()+"collection as a inner join "+session.getAttribute("CompanyMasterID").toString()+"customerdet as b on a.customercode=b.customercode where paymentdate between '"+mybegindate+"' and '"+myenddate+"' and tallyrefno !='    ' and a.twempname = '"+mtwempname+"' order by a.paymentdate";
                System.out.println(sql1);
        		ResultSet rs=st.executeQuery(sql1);
        		String mtoday=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	        	String printflag="Y";
        		while(rs.next())
    	    	{
        			try{
        			String sql0="select InvNo from "+session.getAttribute("CompanyMasterID").toString()+"collectioninv where MoneyReceiptNo='"+rs.getString("a.MoneyReceiptNo")+"'";
        			System.out.println(sql0);
        			ResultSet rs0=st1.executeQuery(sql0);
        			if(rs0.next())
        			a=rs0.getString(1);
        			else 
        			a="-";
        			}catch(Exception e)
        			{e.printStackTrace();}
        			String mPayment_date =new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("a.paymentdate")));
        			String mpaydate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("a.paymentdate")));
        			String mCheque_date =new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("a.chorddorcreditnotedate")));
    				String mEntered_on=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss ").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs.getString("a.inserdt")));
    				d1 = format.parse(mtoday);
    				d2 = format.parse(mpaydate);
    		    	long diff = d1.getTime() - d2.getTime();
        			long diffDays = diff / (24 * 60 * 60 * 1000);
        			if (diffDays > 2)
        			{
        			}
        			else
        			{
        			}
        			if (printflag=="Y")
        			{
        				%>
        				<tr align="left">
            	    	<td colspan="9" align="left"><div align="left"><h3></stong>User Name:<%=mtwempname%></h3></div></td></tr>
            	    	<%
            	    	 printflag="N";
        			}
            		%>
            		<tr>
            		<td  width=75><div align="left"><%=rs.getString("a.paymentmode") %></div></td>
            		<td  width=75><div align="left"><%=rs.getString("a.paymentvoucherno") %></div></td>
            		<td ><div align="left"><%=mPayment_date%></div></td>
            		<td width="400"><div align="left"><%=rs.getString("b.companyname")%></div></td>
            		<td ><div align="left"><%=rs.getString("a.chorddorcreditnoteno")%></div></td>
            		<td ><div align="left"><%=mCheque_date%></div></td>
            		<%
            		double mamount=0.00;
            		mamount =Double.parseDouble(rs.getString("a.amountpaid"));
            	totalamount=totalamount+mamount;
            		%> 
            		<td><div align="right"><%=df2.format(mamount)%></div></td>
            		<td><div align="left"><%=a%></div></td>
            		<td><div align="left"><%=rs.getString("a.tallyrefno")%></div></td>
        			</tr>
        			
        			<%
            	}
        		%>
        		<%
        		if(totalamount!=0)
        		{
        		%>
            <tr><td colspan="9" align="right">Total : <%=df2.format(totalamount)%></td></tr>	
            	<%
        		}
        	}
        	
        	
        }
        catch (Exception e)
        {
        e.printStackTrace();
        }
        %>
     </table>
     </div>
   
     
	 <br>
	 <br><br><br><br><br><br>
	 <div id="footer">
	<p><a href="http://www.myfleetview.com"> Copyright &copy; 2009
           	by Transworld Compressor Technologies Ltd. All Rights Reserved.</a></p>
	</div>
	</form>
<%}
%>
	</body>
</html>
</jsp:useBean>