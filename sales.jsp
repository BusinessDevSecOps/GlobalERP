<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="header.jsp"%>
<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">
<%@page import="java.util.Date"%>
<html>
<body onload="resetAll();" style="font-family:verdana;">
<script language="JavaScript1.2">


var globalmodel;
var counter=1;
function popup(webadd)
{ 
	window.open(webadd,'jav','width=565,height=320,top=200,left=300,resizable=no');
	
}
function validate()
{
		var company=document.ledgerDetails.companyName.value;
		
		 if(company=="") 
		 {
			   alert("Please Select Company");   return false; 	
		 }
		return true;		
}
	

      
	  function checkAll()
	  {
		   
			  var field=document.getElementsByName('chk');
				var i;
				try{
			  for (i = 0; i < field.length; i++)
			  		 field[i].checked = true ;
				}catch(e){alert(e);}
	  }
	  
	  function unCheckAll()
	  {
		   
			  var field=document.getElementsByName('chk');
				var i;
				try{
			  for (i = 0; i < field.length; i++)
			  		 field[i].checked = false ;
				}catch(e){alert(e);}
	  }

      function deleteRow(srno) 
      {
          
	    var ajaxRequest;
	    try{
			   ajaxRequest = new XMLHttpRequest();
		}  
	   catch (e)
	   {
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
			   alert("Your browser broke!");
			   return false;
			  }
		}
	   }
			         	        var queryString = "?delete=yes&srno="+srno;
			         	       	ajaxRequest.open("GET", "AjaxSalesEnq.jsp" + queryString, true);
			         	       	ajaxRequest.send(null); 
			         	       	ajaxRequest.onreadystatechange = function()
			         	         {
			         	                if(ajaxRequest.readyState == 4)
			         	                {
			         	                        var reslt=ajaxRequest.responseText;
			         	                        var data=reslt.split("#");
			         	                        if(data[1].indexOf('Yes')!=-1)
			         	                        {
			         	                        	alert("Item Deleted Successfully");
			         	                        	window.location.reload();
			         	                        }
			         	                        else
			         		                        alert("!!! ERROR while removing data from GRID due to Server Side problem. Please try again.");
			         	                }
			         	         }

             			
             
          
      }





 
	function getCompanies(prospect)
	{
		document.getElementById('companyList').style.visibility = 'visible';
		
			var company=document.ledgerDetails.companyNames.value;

			if(company=="")
			{
				document.getElementById('companyList').style.visibility = 'hidden';
				
			}
			else
			{
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
			var queryString = "?company=" +company;
			ajaxRequest.open("GET", "GetCustomerNames.jsp" + queryString, true);
			ajaxRequest.send(null);
			}//end of else 
		
	}
	
	function showVisitingCardDetails(companyName)
	{
		//document.getElementById('visitingCard').style.visibility='visible';
		document.ledgerDetails.companyNames.value='';
		//document.getElementById('companyList').style.height = '10px'; 
		document.getElementById('companyList').style.visibility = 'hidden';

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

				var data=reslt.split("#");
				document.ledgerDetails.companyName.value=data[1];
				document.ledgerDetails.companyNames.value=data[1];
				document.ledgerDetails.companyPerson.value=data[2];
				document.ledgerDetails.companyEmail.value=data[3];
				document.ledgerDetails.companyCity.value=data[4];
				document.ledgerDetails.companyProduct.value=data[5];
				document.ledgerDetails.companyPhone.value=data[6];
			}
		}
		var queryString = "?companyName=" +companyName;
		ajaxRequest.open("GET", "AjaxShowVisitingCard.jsp" + queryString, true);
		ajaxRequest.send(null); 
 
 
  }

	function viewvisitingcard()
	{
		document.getElementById("visitingCard").style.visibility="visible";
	}

	function disablevisitingcard()
	{
		document.getElementById("visitingCard").style.visibility="hidden";
	}
	
	function showentryform()
	{
		document.getElementById("dataentry").style.visibility="visible";
	}

	function cancelentryform()
	{
		document.getElementById("dataentry").style.visibility="hidden";
		document.getElementById("itementry").style.visibility="hidden"; 
	}
	 
	
	function newwindow(webadd)
	{ 
		window.open(webadd+'?email='+document.ledgerDetails.companyEmail.value+'&toDate='+document.ledgerDetails.todate.value+'&fromDate='+document.ledgerDetails.fromdate.value+'&company='+document.ledgerDetails.companyName.value,'jav','width=470,height=400,top=250,left=600,resizable=no');
	}
	function addnewitem()
	{
		document.getElementById("itementry").style.visibility="visible";
	} 
    function cancelitementryform()
    {
    	document.getElementById("itementry").style.visibility="hidden"; 
    }
   
    function popup1()
    {
    	window.open('AllSalesModule.jsp');
    }
	if (document.all || document.getElementById)
		document.body.style.background = "url('images/bg.jpg')  white top no-repeat ";
</script>

 
<!-- end #header --> <!-- end #page -->
<%
		erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
%>
<%
		Connection conn = null;
		Statement st = null;
		Format format=new SimpleDateFormat("dd-MMM-yyyy");
		Format parse=new SimpleDateFormat("yyyy-MM-dd");
		String fromDate="",toDate="",fromDateCal="",toDateCal="";
		String companyName="",phone="",contact="",email="",product="",city="";
%>
<%
	
		Date today = new Date();
		fromDateCal=new SimpleDateFormat("dd-MMM-yyyy").format(today);
 		try 
 		{
				conn = erp.ReturnConnection();
				st = conn.createStatement();
		} 
 		catch (Exception e) 
 		{
		
 		}
 		String sqlCreateTmpTable="" +
    			"	CREATE TABLE IF NOT EXISTS "+session.getAttribute("CompanyMasterID").toString()+"tmp_" + session.getAttribute("EmpName").toString().replaceAll(" ","_").replace(".","") + " ( " +
				"		srno INT(10) NOT NULL, " +
				"		TheGroup     VARCHAR(50) NULL, " +
				"		make		VARCHAR(50) NULL, " +
				"		model		VARCHAR(50) NULL, " +
				"		description		VARCHAR(255)	NULL, " +
				"		quantity		VARCHAR(50) NULL,  " +
				"		modelNotKnown		boolean NULL  " +
				");";
			
			/*try
			{
				st.executeUpdate("DROP table "+session.getAttribute("CompanyMasterID").toString()+"tmp_" + session.getAttribute("EmpName").toString().replaceAll(" ","_").replace(".",""));
			}
			catch(Exception e)
			{
				System.out.println(e);
			}*/
			
			st.executeUpdate(sqlCreateTmpTable);
			System.out.println(sqlCreateTmpTable);
%>

<form name='ledgerDetails' action="insertSalesEnq.jsp" onsubmit="return validate();" method="post" autocomplete="off">

<script>document.getElementById("dataentry").style.visibility="hidden";</script>
<div id="visitingCard" style="position:absolute; margin-top:7%;margin-left:45%;border:thin solid black;background-color:#94ECF6;">
   <table>
   <tr>
	<td align="left" ><div id="Company"><b>Company</b></div></td>
	<td align="left">
	<div id="companyName">
	    <input type="text" name="companyName"	id="search-text" value="<%=companyName %>"
						style='border-style: none; width: 200px; height: 12px; background-color: #94ECF6;' readonly="readonly" />
	</div>
	</td>
	<td align="center" style="width: 25%"><div id="Contact"><b>Contact </b></div></td>
	<td valign="top" align="right">
	<div id="companyPerson"><input type="text" name="companyPerson" id="search-text" readonly="readonly" value="<%=contact %>"
			style='border-style: none; width: 200px; background-color: #94ECF6;'/>
	</div>
	</td>
	</tr>
    <tr>
	<td align="left"><div id="Phone"><b>Phone</b></div>
	</td>
	<td align="left">
	<div id="companyPhone"><input type="text" name="companyPhone"
			id="search-text" value="<%=phone %>"
			style='border-style: none; width: 200px; height: 12px; background-color: #94ECF6;' readonly="readonly"/>
	</div>
	</td>
	<td align="center" style="width: 25%" valign="middle"><div id="Email"><b>E-Mail </b></div>
	</td>
	<td valign="top" align="right" style="">
	<div id="companyEmail">
			<textarea name="companyEmail" rows="1" id="search-text"   readonly="readonly"
					style='border-style: none; width: 200px; height: 30px; background-color: #94ECF6;'><%=email %>
			</textarea>
    </div>
	</td>
	</tr>
	<tr>
	<td align="left"><div id="Product"><b>Product</b></div>
	</td>
	<td align="left">
	<div id="companyProduct"><input type="text" name="companyProduct" id="search-text" value="<%=product %>"
	       style='border-style: none; width: 200px; height: 12px; background-color: #94ECF6;'readonly="readonly"/>
	</div>
	</td>
	<td align="center" style="width: 25%"><div id=City"><b>City </b></div>
	</td>
	<td valign="top" align="right">
		<div id="companyCity"><input type="text" readonly="readonly"
	    		name="companyCity" id="search-text" value="<%=city %>" 
				style='border-style: none; width: 200px; background-color: #94ECF6;' />
		</div>
	</td>
    </tr>
    </table>
</div>
<script>document.getElementById("visitingCard").style.visibility="hidden";</script>
<!--<div id='companyList' style="width:275px;position:absolute; margin-top:7%; margin-left:12.5%; height:200px;overflow: auto; background:#94ECF6;border:thin solid black;" >-->
<!--</div> -->
<script>document.getElementById("companyList").style.visibility="hidden";</script>
<div 	style="font-size: 1.6em; text-align: center; border:thin solid black;">
<div style="position:absolute;margin-left:0;margin-top;0;text-align:left;width:100px;height:35x;">
	<table>
	<tr>
	<td>
	<a href="AllSalesModule.jsp" style="font-weight: bold; color: black; " >
    <img src="images/arrow_left.png" width="42px" height="42px" style="border-style: none"></img>
    </a>
    </td>
    <td><b>Back</b>
    </td>
    </tr>
    </table>
</div> 
	<div style="margin-left:30%;border:thin solid black;width:40%;background-color: #D3E5FA;height:40px;">Sales Enquiry Form

</div> <div align="right"><a href="#" onclick="popup1();"><font color="blue";><u>GO TO SALES MENU</u></font></a></div>
	
	</div>
		<div style="border:thin solid black; height:30;background-color: #D3E5FA""> 
		<table width="100%" >
  			<tr>
  			<td width="400px">
  			<div id="companyNames"><b>Customer Name:-</b>
  				<input type="text" name="companyNames" onkeyup="getCompanies()" style="width: 275px;"  autocomplete="off" />
 			</div>
			</td>
			
			
			<td><b>Cust Ref No:</b>
			<input type="text" name="customerRefNumber" id="search-text"  value='-'  style="width: 125px;" />	
			</td>
			<td><b>Due Date:</b>
			 <input type="text" id="fromdate" 	name="fromdate" value="<%=fromDateCal %>" size="15" readonly
					style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF" />
			<script type="text/javascript">
			  Calendar.setup(
			    {
			      inputField  : "fromdate",         // ID of the input field
			      ifFormat    : "%d-%b-%Y",     // the date format
			      button      : "fromdate"       // ID of the button
			    }
    		  );
	  		 </script>
			</td>
			<td valign="top">
 			    <a href="#" onmouseover="viewvisitingcard()" onmouseout="disablevisitingcard()" ><b>[View Contact Details]</b></a>
			</td>
 			</tr>
 			
 			<tr>
 			<td colspan="3" valign="top">
	        <div id="remarks">
	        <table style="width:100%;">
	        <tr>
	        <td width="670px"><div id='companyList'>
							<div style="height: 10px; width: 150px; overflow: auto;">
							<table style="display: none;">

							</table>

							</div>
							</div></td>
	        <td style="width:70;">
	        <b>Remarks:</b>
	        </td>
	        <td>
	        	 <textarea name="remarks"  rows="2" style=" width: 400px; height: 30px;" ></textarea>
	        	 </td>
	        	 
	        	 </tr>
	        	 </table>
   		    </div>
   		    </td>
 			</tr>
 			<tr>
 			<td colspan="3" align="center">
 			<div id="newentry" style="width:100%;">
     		<a href="#" style="font-weight: bold; color: blue; " onclick="popup('SalesEnquiryEntry.jsp');">
     		(+)
     		</a> 
      		<b>New Entry </b><input type="hidden" name="status" id="status" value="" />
      		<input type="submit" name="submit" value="Save Enquiry" class="formElement" />
      		</div>
      		</td>
      		</tr>
  	    </table>
</div>

 <script>document.getElementById("itementry").style.visibility="hidden";</script>
<div align="center" style="border:thin solid black; font-size: 1.5em; margin-top: 0.4em; margin-bottom: 0.5em; height:225px; width:700;background-color: #D3E5FA;">
		<table id="dataTable"  border='1px'  class='sortable' >	
		<tr>
		<th style="width: 125px;">   <a href="#" onclick="checkAll()"> <font color="white">Chk All&nbsp;&nbsp;/&nbsp;</font></a>
		     <a href="#" onclick="unCheckAll()"> <font color="white">UnChk all</font></a>
		</th>
		<th> Sr no </th>
		<th>Group</th>
		<th>Make</th>
		<th>Model</th>
		<th>Description</th>
		<th>Quantity</th>
		</tr> 
<%
   int i=1;
   String SqlTmp="Select * from "+session.getAttribute("CompanyMasterID").toString()+"tmp_" + session.getAttribute("EmpName").toString().replaceAll(" ","_").replace(".","")+"";
   System.out.println(">>>>>>>>SqlTmp:"+SqlTmp);
   ResultSet rs=st.executeQuery(SqlTmp);
   while(rs.next())
   {
   %>
   <tr>
   <td style="width: 10px"><a href="#" style="font-weight: bold; color: black; " onclick="deleteRow('<%= rs.getInt("srno")%>');"><img src="images/delete.JPG" width="20px" height="18px" style="border-style: none"></img></a>
   <td><div align="right"><%=rs.getInt("srno") %></div></td>
   <td><div align="right"><%=rs.getString("TheGroup") %></div></td>
   <td><div align="right"><%=rs.getString("make") %></div></td>
   <td><div align="left"><%=rs.getString("model") %></div></td>
   <td><div align="left"><%=rs.getString("description") %></div></td>
   <td><div align="right"><%=rs.getString("quantity") %></div></td>
   
   </tr>
   <%
   }
%>		
		
		</table>
		
</div>
<div style="position:absolute;margin-left:85%;text-align:left;width:125px;">
<table>
<tr>
<td>
<b>Generate Quotation</b>
</td>
<td>
<a href="salesenq.jsp" style="font-weight: bold; color: black; " >
     		<img src="images/arrow_right.png" width="42px" height="42px" style="border-style: none"></img>
     		</a></td></tr></table></div> 
     		
     		
<br></br><br></br>
<div id="footer">
	<p><a href="http://www.myfleetview.com"> Copyright &copy; 2009
	by Transworld Compressor Technologies Ltd. All Rights Reserved.</a></p>
</div>
</form>
</body>
</html>
</jsp:useBean>




