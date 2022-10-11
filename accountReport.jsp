<%@ page language="java" import="java.sql.*" import="java.util.*" import="java.text.*" errorPage=""
    pageEncoding="ISO-8859-1"%>
   <%@ include file="header.jsp" %>
   <jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Account Report</title>
<link href="css/style.css" rel="stylesheet" type="text/css"  />



<!--<script src="js/sorttable.js" type="text/javascript"></script>-->


<!-- <style>-->
<!--th-->
<!--{-->
<!--background: #C6DEFF;-->
<!--}-->
<!--table.sortable td-->
<!--{-->
<!--background-color: ;-->
<!--color: #000;-->
<!--padding: 4px;-->
<!--text-align: center;-->
<!--border: 1px #808080 solid;}-->
<!---->
<!--#nav.sticky-->
<!--{-->
<!--position:absolute;-->
<!--}-->
<!--</style>-->
<script type="text/javascript">
function gotoExcel (elemId, frmFldId)  
{  
//alert("*********** ");

         var obj = document.getElementById(elemId);  

         var oFld = document.getElementById(frmFldId); 

          oFld.value = obj.innerHTML;  

          document.accountform.action ="excel.jsp";     // CHANGE FORM NAME HERE

          document.forms["accountform"].submit();       // CHANGE FORM NAME HERE

} 
function DeleteRow(id)
{
	    
	//alert("Control inside deldte function"+id);
	
	var agree=confirm("Do You Want to Deactivate this Record?");
	    //alert(agree);
	    if(agree)
	    {
		 var ajaxRequest;  // The variable that makes Ajax possible!
		    try
		    {	// Opera 8.0+, Firefox, Safari
				ajaxRequest = new XMLHttpRequest();
		    }  
			catch (e)
			{	// Internet Explorer Browsers
				try
				{	ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
				} 
				catch (e)
				{	try
					{
						ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
					} 
					catch (e)
					{	// Something went wrong
						alert("Your browser broke!");
						return false;
					}
				}
			}
			// Create a function that will receive data sent from the server
			ajaxRequest.onreadystatechange = function()
			{	//alert("ddddddddddddddddddddddd");
				if(ajaxRequest.readyState == 4 )
				{	var reslt=ajaxRequest.responseText;
			//	alert(">>>    "+reslt);
				  var data=reslt;
				  data=data.replace(/^\s+|\s+$/g,"");
				//  alert("datttt"+data);
				  var z=data.split("#");
				 


					if(data=="Yes")
					{					
                        alert("Record Deactivated Successfully.");
				    	window.location.reload();
					}
					if(data=="No")
					{					
                       alert("Error In Deactivating .");
				    	window.location.reload();
					}
	           } 
			}
			var queryString = "?action=delete&id="+id;
			ajaxRequest.open("GET", "AjaxAccountDelete.jsp" + queryString, true);
			ajaxRequest.send(null); 
	    }
	    else
	    {return false;
	    }
 }	




function getcheckedrow()
{
	//alert("hiiiii");
	var cnt1=0,k=1,flag="t";
	var chklength=document.getElementsByName("chkbx");
//	alert("hiiiii"+chklength);
	var i=1,j,cnt=0;
	var id="";
	//alert("hiiiii1");
	for(cnt1=0;cnt1<chklength.length;cnt1++)
	{
		if( document.getElementById("chk"+k).checked == true )
		{
			flag="success";
		}
	k++;	
	}

	if(flag == "success")
	{
	
	for(cnt=0;cnt<chklength.length;cnt++)
	{
		//alert("for"+chklength.length);
		
		if(document.getElementById("chk"+i).checked)
		{
			//alert("if");
			id=id+","+document.getElementById("net_id1"+i).innerHTML;
		}
		i++;
	}
	//alert("check"+id);
	DeleteRow(id);
	}
	else
	{
		alert("Please Select Account For Deactivation");
	}
	
}
</script>
</head>
<body>
 
<table width="100%">
<tr>

<td align="center" colspan="2">
<a align="center" style="font-size:1.6em">Net Banking Master</a></td>
</tr>
<tr><td><a href="Accounts.jsp">BACK</a></td></tr>
<tr><td><a href="netbankingentryform.jsp"><b>Add</b></a> &nbsp
<a href="#" type="button" name="del"   onclick="getcheckedrow()" /><b>Deactivate</b></a></td>
<!--<td align="right"><a href="#" title="Export to Excel"  onclick="gotoExcel('dept','tableHTML');"><img src="images/excel.jpg" width="18px" height="18px"></a></td>-->
<td align="right">
								<font size="1">&nbsp;&nbsp;&nbsp;<%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new java.util.Date())%></font>
				<a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('dept','tableHTML');">

	     <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img>
	
					<a href="#" onclick="window.print();return false;" title="Print"><img src="images/print.jpg" width="15px" height="15px"></img></a>
			 
				</td>
</tr>

</table>
<table width=55% align="center" border="1" style="border-color: #C6DEFF;" cellpadding="0" cellspacing="0">
                        <tr>
                       <td> <b><font size="2" color="black">Color Code Indication For Account:</font></b></td>
                       <td ><font size="2" ><a href="accountLink.jsp?st=all" style="color: black">ALL  </a></font></td>
                        <td bgcolor="#FAAFBE"><font size="2" ><a href="accountLink.jsp?st=deactive1" style="color:blue">Deactivated Account </a></font></td>
                        <td bgcolor="#AEF8B1"><font size="2" ><a href="accountLink.jsp?st=active1" style="color:blue">Active Account  </a></font></td>
                        
                        <%
                      	String accountstate ="-";
                        try
                        {
                        	if(null!=request.getQueryString())
                        		{
                        accountstate = request.getParameter("accountstate");
                        		}
                        System.out.println("status of activation*****"+accountstate);
                        }catch(Exception e)
                        {
                        System.out.println(" accnt states"+e.toString());	
                        }
                      %>
                        </tr>
                </table>
<div align="center">
<form action="" method="post" name="accountform" id="accountform" autocomplete="off">
<%
String exportFileName="Account_report.xls";   // GIVE YOUR REPORT NAME
%>
<!--<div id='dept' align="center" style="height: 400px;overflow:scroll;">-->
<div id='dept' align="center">

<input type="hidden" id="tableHTML" name="tableHTML" value="" />   

	<input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" /> 

<table align="center" id="reporttbl" class="sortable" border="3" style=" color: black;border-collapse:collapse;" >
<thead>
<tr>
<th><b>Edit</b></th>
<th><b>Select</b></th>
<th><b>ID</b></th>
<th><b>Beneficiary Name</b></th>
<th><b>Account Number</b></th>
<th><b>IFSC Code</b></th>
<th><b>Bank Name</b></th>
<th><b> Branch Name</b></th>
<th><b>Email Id</b></th>
<th><b>Entered By</b></th>
<th><b>Entered On</b></th>
<th><b>Category</b></th>
<th><b>Emp Id</b></th>
<th><b>Status</b></th>
<th><b>Level Limit</b></th>
</tr>
</thead>
<% erp.getConnection(DB_Driver,DB_NAME,DB_USERNAME,DB_PASSWORD); %>
<%!
Connection conn=null;
%>

<%
//////////



conn=erp.ReturnConnection();
Statement st=conn.createStatement();
Statement st1=conn.createStatement();


/////////
 
 String date="",status1="",sql="";
 if(accountstate.equalsIgnoreCase("-")){
	 sql = "select * from  "+session.getAttribute("CompanyMasterID").toString()+"netbanking ORDER BY `ID` ASC ";
 }
 else if(accountstate.equalsIgnoreCase("active1"))
 {
	 sql = "select * from  "+session.getAttribute("CompanyMasterID").toString()+"netbanking where Status='-' ORDER BY `ID` ASC ";
 }
 else if(accountstate.equalsIgnoreCase("deactive1"))
 {
	 sql = "select * from  "+session.getAttribute("CompanyMasterID").toString()+"netbanking where Status='Deactivate' ORDER BY `ID` ASC ";
 }else
 {
	 sql = "select * from  "+session.getAttribute("CompanyMasterID").toString()+"netbanking  ORDER BY `ID` ASC ";
 }
 ResultSet rs = st.executeQuery(sql);
 System.out.println("query for report====>>>"+sql);
 String name="";
 int j=0;
 while(rs.next())
 {  
	 j++;
	 String color=""; 
	 
	 if (rs.getString("Status").equalsIgnoreCase("Deactivate")) {
		 color = "#FAAFBE";
		// color = "red";

		} else 
		{

			color = "#AEF8B1";
			// color = "green";
		}
	 System.out.println("colorrrrrrr"+color);
 %>
 <tr style="background: <%=color%>;">
 <td style="background: <%=color%>;" width="1%" align="right"><a href="editnetbankdata.jsp?ID=<%=rs.getString("id")%>"><img src="images/edit1.jpeg" width ="18px" height="18px"></a></td>
 <%status1=rs.getString("Status");
	
	if(status1.equalsIgnoreCase("Deactivate") )
	{
		%>

		<td style="background: <%=color%>;" width="1%" align="right"><div  style="visibility:hidden"><input type="checkbox" name="chkbx" disabled="disabled" id="chk<%=j%>" /></div></td>
		<%
	}else 
	{
		%>
		<td style="background: <%=color%>;" width="1%" align="right"><input type="checkbox" name="chkbx" id="chk<%=j%>" /></td>
		<%
	}
	
	%>
 
 <td  style="background: <%=color%>;" width="2%" align="right" id="net_id<%=j %>"><div align="right" id="net_id1<%=j %>"><%=rs.getString("id")%></div></td>
 <td style="background: <%=color%>;" width="2%" align="left"><div align="left"><%=rs.getString("BeneficiaryName")%></div></td>
 <td style="background: <%=color%>;" width="1%" align="right"><div align="right" ><%=rs.getString("BeneficiaryAccountNumber")%></div></td>
 <td style="background: <%=color%>;" width="2%" align="right"><div align="right"><%=rs.getString("IFCCode")%></div></td>
 <td style="background: <%=color%>;" width="2%" align="left"><div align="left"><%=rs.getString("BeneBankName")%></div></td>
 <td style="background: <%=color%>;" width="2%" align="left"><div align="left"><%=rs.getString("BeneBankBranchName")%></div></td>
 <td style="background: <%=color%>;" width="2%" align="left"><div align="left"><%=rs.getString("Beneficiaryemailid")%></div></td>
 <td style="background: <%=color%>;" width="2%" align="left"><div align="left"><%=rs.getString("EnteredBy")%></div></td>
 <%
 String test="";
 
 /*
 try{
 	 test=( rs.getDate("EnteredOn") ).toString();
 	 //test=rs.getString("EnteredOn") ;
 }catch(Exception e)
 {
	 test="000";
	 System.out.println("exception--Date---->"+e);
 }
 */
 ///
 
 try
	{
	 test=rs.getString("EnteredOn");
	System.out.println("creationDate======>1111"+test);
	if(test!=null)
	{
		if(test.equalsIgnoreCase("0000-00-00"))
		{
			test="0000-00-00";
		}
		else
		{
		test=new SimpleDateFormat("dd-MMM-yyyy")
		.format(new SimpleDateFormat(
		"yyyy-MM-dd")
		.parse(test));
		}
		System.out.println("creationDate======>"+test);
	}
	else
	{
		test="0000-00-00";
	}
	}catch(Exception e)
	{
		test="0000-00-00";
		System.out.println("date==22=>"+e.toString());
	}
 %>
 
 <td style="background: <%=color%>;" width="2%" align="right"><div align="right"><%=test%></div></td>
 <td style="background: <%=color%>;" width="2%" align="right"><div align="right"><%=rs.getString("Category")%></div></td>
 <td style="background: <%=color%>;" width="2%" align="right"><div align="right"><%=rs.getString("AccountID")%></div></td>
 <%
 String status="";
 try{
	 status=rs.getString("Status") ;
	 if(status.equalsIgnoreCase("Deactivate"))
	 {
		 status="Deactive";
	 }
	 else
	 {
		 status="Active";
	 }
 }catch(Exception e)
 {
	 status="test";
	 System.out.println("exception------>"+e);
 }
 
 
 %>
 
 <td style="background: <%=color%>;" width="2%" align="left"><div align="right"><%=status%></div></td>
 <td style="background: <%=color%>;" width="2%" align="right"><div align="right"><%=rs.getString("Level1Limit")%></div></td>
 
 
 </tr>
<% }conn.close();%>
</table></div></form></div>
<div id="footer"><p>
<a href="http://www.myfleetview.com">
Copyright &copy; 2009 by Transworld Compressor Technologies Ltd. All Rights Reserved.</a></p>
</div>
</body>
</html>
</jsp:useBean>