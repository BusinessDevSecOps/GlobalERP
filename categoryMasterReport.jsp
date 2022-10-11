<%@ page language="java" import="java.sql.*" import="java.util.*" import="java.text.*" errorPage=""
    pageEncoding="ISO-8859-1"%>
    <%@ include file="header.jsp" %>
   <jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Department Report</title>
<link href="css/style.css" rel="stylesheet" type="text/css"  />
<script src="js/sorttable.js" type="text/javascript"></script>


<!-- <style>-->
<!--th-->
<!--{-->
<!--background: #C6DEFF;-->
<!--}-->
<!--</style>-->
<script type="text/javascript">
function gotoExcel (elemId, frmFldId)  
{  
//alert("*********** ");

         var obj = document.getElementById(elemId);  

         var oFld = document.getElementById(frmFldId); 

          oFld.value = obj.innerHTML;  

          document.categoryform.action ="excel.jsp";     // CHANGE FORM NAME HERE

          document.forms["categoryform"].submit();       // CHANGE FORM NAME HERE

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
			ajaxRequest.open("GET", "AjaxCategoryDelete.jsp" + queryString, true);
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
	for(cnt1=0;cnt1<chklength.length;cnt1++)
	{
		if( document.getElementById("chk"+k).checked == true )
		{
			flag="success";
		}
	k++;	
	}
	var i=1,j,cnt=0;
	var id="";
	//alert("hiiiii1");
	
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
		alert("Please Select Category For Deactivation");
	}
	
}
</script>
</head>
<body>

<table width="60%" align="center">
<tr>
<td align="center" colspan="2">
<a align="center" style="font-size:1.6em">Category Master</a></td>
</tr>
<tr><td><a href="Accounts.jsp">BACK</a></td></tr>
<tr><td><a href="new_categoryMaster.jsp"><b>Add</b></a> &nbsp
<input type="button" name="del"  value="Deactivate" onclick="getcheckedrow()" /></td>
<!--<td align="right"><a href="#" title="Export to Excel"  onclick="gotoExcel('dept','tableHTML');"><img src="images/excel.jpg" width="18px" height="18px"></a></td>-->
<td align="right">
								<font size="1">&nbsp;&nbsp;&nbsp;<%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new java.util.Date())%></font>
				<a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('dept','tableHTML');">

	     <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img>
	
					<a href="#" onclick="window.print();return false;" title="Print"><img src="images/print.jpg" width="15px" height="15px"></img></a>
			 
				</td>
</tr>
</table>
<div align="center" >
<form  name="categoryform"id="categoryform" action="" method="post" name="">
<%
String exportFileName="Category_report.xls";   // GIVE YOUR REPORT NAME
%>
<div id='dept' align="center" style="height: 400px;overflow:scroll;">

<input type="hidden" id="tableHTML" name="tableHTML" value="" />   

	<input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" /> 

<table align="center" id="reporttbl" class="sortable" border="3" style=" color: black;border-collapse:collapse; width: 70%;" >
<thead>
<tr>
<th><b>Edit</b></th>
<th><b>Select</b></th>
<th><b>Id</b></th>
<th><b>Category</b></th>
<th><b>Limit</b></th>
<th><b>Status</b></th>

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
 
 String date="",status1="";
 String sql = "select * from  "+session.getAttribute("CompanyMasterID").toString()+"netbankingcategory  ";
 ResultSet rs = st.executeQuery(sql);
 String name="",color="";
 int j=0;
 while(rs.next())
 {  
	
	j++; 
	 if (rs.getString("Status").equalsIgnoreCase("Deactivate")) {
		 color = "#FF8080";

		} else 
		{

			color = "#CCFF99";
		}
	 System.out.println("colorrrrrrr"+color);
	 
 %>
 <tr style="background:<%=color%>;">
 
<td style="background:<%=color%>;" width="" align="right"><a href="Edit_categoryMaster.jsp?ID=<%=rs.getString("id")%>"><img src="images/edit1.jpeg" width ="18px" height="18px"></a></td>


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
 

<td style="background:<%=color%>;" width="2%" align="right" id="net_id<%=j %>"><div align="right" id="net_id1<%=j %>"><%=rs.getString("id")%></div></td>
 <td style="background:<%=color%>;" width="" align="left"><div align="left"><%=rs.getString("Category")%></div></td>
 <td style="background:<%=color%>;" width="" align="right"><div align="right"><%=rs.getString("Limit1")%></div></td>
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
 <td style="background:<%=color%>;" width="" align="left"><div align="left"><%=status%></div></td>
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