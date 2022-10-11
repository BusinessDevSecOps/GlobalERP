<%@ include file="header.jsp" %>
<%@ include file="ConnectionComplaint.jsp" %>
<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<script type="text/javascript">


function gotoPrint(divName)  
{  
	  
	  var printContents = document.getElementById(divName).innerHTML; 
	  var originalContents = document.body.innerHTML; 
	  document.body.innerHTML = printContents;  
	  window.print();
	  document.body.innerHTML = originalContents;  
}

function gotoExcel(elemId, frmFldId)  
{  
	      
          var obj = document.getElementById(elemId);  
          var oFld = document.getElementById(frmFldId); 
          oFld.value = obj.innerHTML;  
          document.ComplaintReport.action ="excel.jsp";
          document.forms["ComplaintReport"].submit();
} 

function allSelected(allVal)
{
	if(document.customdetail.extAll.checked) 
	{
		document.getElementById("frmDT").style.display='none';
    	document.getElementById("toDT").style.display='none';
    }
	else 
	{
		document.getElementById("frmDT").style.display="";
    	document.getElementById("toDT").style.display="";
	}
}
</script>

<%

	     String fname=(String)session.getAttribute("EmpName");
		 
		 String Name=fname;
		 String UserTypeValue=(String)session.getAttribute("user");
		
String datenew1="";
String datenew2="";
if(request.getParameter("data")!=null)
{
  datenew1=request.getParameter("data");
  datenew2=request.getParameter("data1");
}
else
{
	datenew1=datenew2=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
}

		DateFormat df123= new SimpleDateFormat("dd-MMM-yyyy");
		DateFormat df1234= new SimpleDateFormat("yyyy-MM-dd");
		String dataDate1=df1234.format(df123.parse(datenew1));
		String dataDate2=df1234.format(df123.parse(datenew2));
		dataDate1 = dataDate1+" 00:00:00";
		dataDate2 = dataDate2+" 23:59:59";
		%>
		
		<div style="font-size: 1.8em; text-align: center; margin-top: 0.5em; margin-bottom: 0.4em;margin-left: 0.6em" align="center">
	Complaint Report</div>
	<div align="center" style="font-size: 1.8em; text-align: center; margin-top: 0.5em; margin-bottom: 0.4em;margin-left: 8em">
<form name="customdetail" method="get" style="text-align: center;">
<%System.out.println("\n$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");%>
  
		<table align="center" border="0" style="margin-top: 0.5em; margin-bottom: 0.4em;margin-left: 1em; text-align: center;">
			<tr align="center">
				<td align="left"><font color="#F75D59" size="2">Pending</font>&nbsp;&nbsp;&nbsp;<font color="#4CC417" size="2">Solved</font></td>
				<td></td><td></td><td></td>
				<td align="left"><b>Complaints&nbsp;&nbsp;</b>
				<select name="incidentDrp" id="incidentDrp" 
				style="width: 87px; height:20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;">
			 		<option value="All" selected>All</option>
			 		<option value="Pending">Pending</option>
			 		<option value="Solved">Solved</option>
			 		
			    </select>
				</td>
				<td></td>
				<td>
				All <input type="checkbox" name="extAll" id="extAll" value="yes"  onclick="allSelected(this.value);"></input>
				</td>
				<td></td>
				<td id="frmDT" align="left" style="display:''"><b>From&nbsp;&nbsp;</b>
					<input type="text" id="data" name="data" size="12" value="<%=datenew1%>" 
					style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;" readonly />
					<script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "data"       // ID of the button
					    }
					  );
				</script>
				</td>
				
				<td id="toDT" align="left" style="display:''"><b>To&nbsp;&nbsp;</b>
					<input type="text" id="data1" name="data1" size="12" value="<%=datenew2%>" 
					style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;" readonly />
					<script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data1",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "trigger1"       // ID of the button
					    }
					  );
				</script>&nbsp;&nbsp;&nbsp;
			 	 
				</td>
				<td><input type="submit" name="button" value="Go"></td>
			</tr>
		</table>
		<%
		System.out.println("*********  133  ");
		%>

</form>
</div>
<br></br>

<div style="margin-top: 0.5em; margin-bottom: 0.4em;margin-left: 0.6em; width: 120%" align="center">
<form name="ComplaintReport" name="ComplaintReport" action="" method="post">
<div id="table1">
<%! Connection conn;%>
<%
try
{
	String exportFileName ="";
	Statement st=null,st1=null;
	 Class.forName(DB_Driver1); 
		conn = DriverManager.getConnection(DB_NAME12,DB_USERNAME1,DB_PASSWORD1);
		System.out.println("conn "+conn);
		
		String sql=null;
		ResultSet rst=null;
		st=conn.createStatement();
		st1=conn.createStatement();
		
	    exportFileName=session.getAttribute("user").toString()+"_ComplaintReport.xls"; 
       
%>
		
		
		<div  align="right">
		
                           <input type="hidden" id="tableHTML" name="tableHTML" value="" />  
                           <input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" /> 
     
                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoPrint('table1');">
                           <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img></a> 
      
                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img></a>
                           <%=new java.util.Date() %>
                      </div>
		
        <%
        int i=0;
		String sqlData="";
		System.out.println("******  182  ");
		String statVal=request.getParameter("incidentDrp");
		String chbxAll=request.getParameter("extAll");
		System.out.println("***** 185  ");
		if(statVal==null || statVal.equalsIgnoreCase("null"))
		{
			statVal = "All";
		}
		
        System.out.println("****   "+statVal);
		
		if(chbxAll!=null && chbxAll!="")
		{
			if(statVal=="All" || statVal.equals("All"))
			{
        		if(UserTypeValue.equalsIgnoreCase("reshma"))
        		{
        			sql="select ComplaintID,ComplaintDateTime,Description,Website,ReportName,Category,Priority,Status,ClosingComment,ClosedBy,EntBy,Email1,ContactNumber,Closeddatetime from "+session.getAttribute("CompanyMasterID").toString()+"ComplaintDetail where Website='ERP' order by ComplaintDateTime";
        		}
     		   else
       		   {
        			sql="select ComplaintID,ComplaintDateTime,Description,Website,ReportName,Category,Priority,Status,ClosingComment,ClosedBy,EntBy,Email1,ContactNumber,Closeddatetime from "+session.getAttribute("CompanyMasterID").toString()+"ComplaintDetail where Name='"+Name+"' and  Website='ERP' order by ComplaintDateTime";
        	   }
		   }
			else
			{
				if(UserTypeValue.equalsIgnoreCase("reshma"))
		        {
					System.out.println(UserTypeValue);
		        	sql="select ComplaintID,ComplaintDateTime,Description,Website,ReportName,Category,Priority,Status,ClosingComment,ClosedBy,EntBy,Email1,ContactNumber,Closeddatetime from "+session.getAttribute("CompanyMasterID").toString()+"ComplaintDetail  where  Status='"+statVal+"' and  Website='ERP' order by ComplaintDateTime";
		        }
		        else
		        {
		        	System.out.println(UserTypeValue);
		        	sql="select ComplaintID,ComplaintDateTime,Description,Website,ReportName,Category,Priority,Status,ClosingComment,ClosedBy,EntBy,Email1,ContactNumber,Closeddatetime from "+session.getAttribute("CompanyMasterID").toString()+"ComplaintDetail where Name='"+Name+"' and Status='"+statVal+"' and  Website='ERP' order by ComplaintDateTime";
		        }
			}
		}
		else if(statVal!=null && statVal!="")
		{
			System.out.println("**************************>>"+statVal);
			if(statVal=="All" || statVal.equals("All"))
			{
				if(UserTypeValue.equalsIgnoreCase("reshma"))
		        {
		        	sql="select ComplaintID,ComplaintDateTime,Description,Website,ReportName,Category,Priority,Status,ClosingComment,ClosedBy,EntBy,Email1,ContactNumber,Closeddatetime from "+session.getAttribute("CompanyMasterID").toString()+"ComplaintDetail  where ComplaintDateTime between '"+dataDate1+"' and '"+dataDate2+"' and  Website='ERP' order by ComplaintDateTime";
		        }
		        else
		        {
		        	sql="select ComplaintID,ComplaintDateTime,Description,Website,ReportName,Category,Priority,Status,ClosingComment,ClosedBy,EntBy,Email1,ContactNumber,Closeddatetime from "+session.getAttribute("CompanyMasterID").toString()+"ComplaintDetail where ComplaintDateTime between '"+dataDate1+"' and '"+dataDate2+"' and Name='"+Name+"' and  Website='ERP' order by ComplaintDateTime";
		        }
			}
			else 
			{
				if(UserTypeValue.equalsIgnoreCase("reshma"))
		        {
					System.out.println(UserTypeValue);
		        	sql="select ComplaintID,ComplaintDateTime,Description,Website,ReportName,Category,Priority,Status,ClosingComment,ClosedBy,EntBy,Email1,ContactNumber,Closeddatetime from "+session.getAttribute("CompanyMasterID").toString()+"ComplaintDetail  where ComplaintDateTime between '"+dataDate1+"' and '"+dataDate2+"' and Status='"+statVal+"' and  Website='ERP' order by ComplaintDateTime";
		        }
		        else
		        {
		        	sql="select ComplaintID,ComplaintDateTime,Description,Website,ReportName,Category,Priority,Status,ClosingComment,ClosedBy,EntBy,Email1,ContactNumber,Closeddatetime from "+session.getAttribute("CompanyMasterID").toString()+"ComplaintDetail where ComplaintDateTime between '"+dataDate1+"' and '"+dataDate2+"' and Name='"+Name+"' and Status='"+statVal+"'  and  Website='ERP' order by ComplaintDateTime";
		        }
			}
		}
		else
		{
			if(UserTypeValue.equalsIgnoreCase("reshma"))
	        {
	        	sql="select ComplaintID,ComplaintDateTime,Description,Website,ReportName,Category,Priority,Status,ClosingComment,ClosedBy,EntBy,Email1,ContactNumber,Closeddatetime from "+session.getAttribute("CompanyMasterID").toString()+"ComplaintDetail where ComplaintDateTime between '"+dataDate1+"' and '"+dataDate2+"' and  Website='ERP' order by ComplaintDateTime";
	        }
	        else
	        {
	        	sql="select ComplaintID,ComplaintDateTime,Description,Website,ReportName,Category,Priority,Status,ClosingComment,ClosedBy,EntBy,Email1,ContactNumber,Closeddatetime from "+session.getAttribute("CompanyMasterID").toString()+"ComplaintDetail where ComplaintDateTime between '"+dataDate1+"' and '"+dataDate2+"' and Name='"+Name+"'  and  Website='ERP' order by ComplaintDateTime";
	        }
		}
        System.out.println("*********    "+sql);
        %>
        <table width="100%" align="center"><tr><td>
		<table align="center" class="sortable">
		<tr>
		<%
		System.out.println("**** 253 "+statVal);
		if(statVal=="All" || statVal.equals("All") || statVal=="Solved" || statVal.equals("Solved"))
		{
		%>
		<th><div align="center"><font size="2" ><b>Sr. No.</b></font></div></th>
		<th><div align="center"><font size="2" ><b>Complaint ID</b></font></div></th>
		<th><div align="center"><font size="2" ><b>Complaint Date Time</b></font></div></th>
		<th><div align="center" style="width: 100%;" ><font size="2"><b>Description</b></font></div></th>
		<th><div  style="width: 20%;" align="center"><font size="2" ><b>Website</b></font></div></th>
		<th><div  style="width: 20%;" align="center"><font size="2" ><b>Report Name</b></font></div></th>
		<th><div align="center"><font size="2"><b>Category</b></font></div></th>
		<th><div align="center"><font size="2"><b>Priority</b></font></div></th>
		<th><div  align="center"><font size="2"><b>Email ID</b></font></div></th>
		<th><div align="center"><font size="2"><b>Contact Number</b></font></div></th>
		<th><div align="center"><font size="2"><b>Entered By</b></font></div></th>
		<th><div align="center"><font size="2"><b>Status</b></font></div></th>
		<th><div align="center"><font size="2"><b>Closed Date Time</b></font></div></th>
		<th><div align="center"><font size="2" ><b>Closing Comments</b></font></div></th>
		<th><div align="center"><font size="2" ><b>Closed By</b></font></div></th>
		<%
		}
		else if(statVal=="Pending" || statVal.equals("Pending"))
		{
			%>
			<th><div align="center"><font size="2" ><b>Sr. No.</b></font></div></th>
		<th><div align="center"><font size="2" ><b>Complaint ID</b></font></div></th>
		<th><div align="center"><font size="2" ><b>Complaint Date Time</b></font></div></th>
		<th><div align="center" style="width: 100%;" ><font size="2"><b>Description</b></font></div></th>
		<th><div  style="width: 20%;" align="center"><font size="2" ><b>Website</b></font></div></th>
		<th><div  style="width: 20%;" align="center"><font size="2" ><b>Report Name</b></font></div></th>
		<th><div align="center"><font size="2"><b>Category</b></font></div></th>
		<th><div align="center"><font size="2"><b>Priority</b></font></div></th>
		<th><div align="center"><font size="2"><b>Email ID</b></font></div></th>
		<th><div align="center"><font size="2"><b>Contact Number</b></font></div></th>
		<th><div align="center"><font size="2"><b>Entered By</b></font></div></th>
		<th><div align="center"><font size="2"><b>Status</b></font></div></th>
		<th><div align="center"><font size="2" ><b>Closing Comments</b></font></div></th>
		<th><div align="center"><font size="2" ><b>Closed By</b></font></div></th>
			
			<%
			}
		System.out.println("****  293");
		%>
		</tr>
		<%
		System.out.println("****  296");
        rst=st.executeQuery(sql);
        while(rst.next())
        {
        	
        	if(rst.getString("Status").equalsIgnoreCase("Solved"))
			{
        		i++;
        		//System.out.println("Solved "+rst.getString("Status"));
					%><tr>
					 <td align="right"  style="background-color: #AEF8B1;"><div align="right"><font size="2" ><%= i%></font></div></td>
          			<td align="right"  style="background-color: #AEF8B1;"><div align="right"><font size="2" ><%= rst.getString("ComplaintID")%></font></div></td>
		  			<td align="right"  style="background-color: #AEF8B1;" sorttable_customkey="20080211131900"><div align="right"><font size="2" ><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst.getString("ComplaintDateTime")))%></font></div></td>
		 			 <td align="left"  style="background-color: #AEF8B1; width: 180%;"><div align="left"><font size="2" ><%= rst.getString("Description")%></font></div></td>
		  			<td align="left"  style="background-color: #AEF8B1; width: 20%;"><div align="left"><font size="2" ><%= rst.getString("Website")%></font></div></td>
		  			<td align="left"  style="background-color: #AEF8B1; width: 20%;"><div align="left"><font size="2" ><%= rst.getString("ReportName")%></font></div></td>
		  			<td align="left"  style="background-color: #AEF8B1;"><div align="left"><font size="2" ><%= rst.getString("Category")%></font></div></td>
		  			<td align="left"  style="background-color: #AEF8B1;"><div align="left"><font size="2" ><%= rst.getString("Priority")%></font></div></td>
		  			<td align="left"  style="background-color: #AEF8B1;"><div align="left" style="overflow: auto; width: 150px;"><font size="2" ><%= rst.getString("Email1")%></font></div></td>
		  			<td align="left"  style="background-color: #AEF8B1;"><div align="left"><font size="2" ><%= rst.getString("ContactNumber")%></font></div></td>
		  			<td align="left"  style="background-color: #AEF8B1;"><div align="left"><font size="2" ><%= rst.getString("EntBy")%></font></div></td>
		  			<td align="left"  style="background-color: #AEF8B1;"><div align="left"><font size="2" ><%= rst.getString("Status")%></font></div></td>
		  			<%
		  			if(rst.getString("Closeddatetime")==null)
		  			{
		  			%>
		  			<td align="left"  style="background-color: #AEF8B1;"><div align="left"><font size="2" >-</font></div></td>
		  			<%
		  			}
		  			else
		  			{
		  			%>
		  			<td align="right"  style="background-color: #AEF8B1;" sorttable_customkey="20080211131900"><div align="right"><font size="2" ><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst.getString("Closeddatetime")))%></font></div></td>
		   			<%} %>
		   			<td align="left"  style="background-color: #AEF8B1;"><div align="left"><font size="2" ><%= rst.getString("ClosingComment")%></font></div></td>
		  			<td align="left"  style="background-color: #AEF8B1;"><div align="left"><font size="2" ><%= rst.getString("ClosedBy")%></font></div></td>
		  			 </tr>
					
					<%					
			}
			else if(rst.getString("Status").equalsIgnoreCase("Pending"))
			{
				i++;
				//System.out.println("Pending " +rst.getString("Status"));
				%><tr>
				<td align="right"  style="background-color: #F9966B;"><div align="right"><font size="2" ><%= i%></font></div></td>
          		<td align="right"  style="background-color: #F9966B;"><div align="right"><font size="2" ><%= rst.getString("ComplaintID")%></font></div></td>
		  		<td align="right"  style="background-color: #F9966B;" sorttable_customkey="20080211131900"><div align="right"><font size="2" ><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst.getString("ComplaintDateTime")))%></font></div></td>
		 		<td align="left"  style="background-color: #F9966B; width: 180%;"><div align="left"><font size="2" ><%= rst.getString("Description")%></font></div></td>
		  		<td align="left"  style="background-color: #F9966B; width: 20%;"><div align="left"><font size="2" ><%= rst.getString("Website")%></font></div></td>
		  		<td align="left"  style="background-color: #F9966B; width: 20%;"><div align="left"><font size="2" ><%= rst.getString("ReportName")%></font></div></td>
		  		<td align="left"  style="background-color: #F9966B;"><div align="left"><font size="2" ><%= rst.getString("Category")%></font></div></td>
		  		<td align="left"  style="background-color: #F9966B;"><div align="left"><font size="2" ><%= rst.getString("Priority")%></font></div></td>
		  		<td align="left"  style="background-color: #F9966B;"><div align="left" style="overflow: auto;width: 150px;"><font size="2" ><%= rst.getString("Email1")%></font></div></td>
		  		<td align="left"  style="background-color: #F9966B;"><div align="left"><font size="2" ><%= rst.getString("ContactNumber")%></font></div></td>
		  		<td align="left"  style="background-color: #F9966B;"><div align="left"><font size="2" ><%= rst.getString("EntBy")%></font></div></td>
		  		<td align="left"  style="background-color: #F9966B;"><div align="left"><font size="2" ><%= rst.getString("Status")%></font></div></td>
		  		<%
		  		if(statVal=="All" || statVal.equals("All"))
		  		{
		  			%>
		  			<td align="left"  style="background-color: #F9966B;"><div align="left"><font size="2" >-</font></div></td>
		  			<%
		  		}
		  		%>
		   		<td align="left"  style="background-color: #F9966B;"><div align="left"><font size="2" ><%= rst.getString("ClosingComment")%></font></div></td>
		  		<td align="left"  style="background-color: #F9966B;"><div align="left"><font size="2" ><%= rst.getString("ClosedBy")%></font></div></td>
		  			 </tr>
				<%
			}
       
          %>
         
        <% }%> 
         
      </table></td></tr></table>
        </div>
         </form>
         </div>
         
         <%
}
catch(Exception e)
{
	//out.print("Exception "+e);
	e.printStackTrace();
}
finally
{
	try
	{
		conn.close();
	}catch(Exception e)
	{e.printStackTrace();}
	try
	{
		erp.closeConnection();
	}catch(Exception e)
	{e.printStackTrace();}
}
%>

</jsp:useBean>
	

