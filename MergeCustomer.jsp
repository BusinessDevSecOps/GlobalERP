<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict/aaa/EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="header.jsp"%>
<%@ page language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">
<html><head>
<script src="dropdown.js" type="text/javascript"></script>
<script src="dynamic.js" type="text/javascript"></script>

<script type="text/javascript">

function timer()
{
	setTimeout("getCompanies()", 2000);
}
function timer1()
{
	setTimeout("getCompanies1()", 2000);
}


function getCompanies(prospect)
{
	try{
		document.getElementById("comlist").style.display="";
	    document.getElementById("companyList").style.visibility="visible";
	    
		var company=document.getElementById("companyNames").value;
		 var counter=document.getElementById("counter").value;

	}catch(e)
	{
		alert(e);
	}
		if(counter>100)
		{
			counter=0;
		}
		//var timer=setTimeout("getValue()",10000);
//		alert(timer);
		var ajaxRequest;  // The variable that makes Ajax possible!
		try
		{
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

		// Create a function that will receive data sent from the server
		ajaxRequest.onreadystatechange = function()
		{
			if(ajaxRequest.readyState == 4)
			{
				var reslt=ajaxRequest.responseText;
				//alert("Result is" +reslt);
				document.getElementById("companyList").innerHTML=reslt;
				var b=document.getElementById("element").value;
				document.mergeprocpect.counter.value=b;
				document.mergeprocpect.counter.value=b*document.mergeprocpect.counter.value;
				counter=document.mergeprocpect.counter.value;
			} 
		}

		var queryString = "?company=" +company+"&limitcount="+counter+"";
		
			
		ajaxRequest.open("GET", "Ajaxmergecust.jsp" + queryString, true);
		ajaxRequest.send(null); 
		
}


function getCompanies1(prospect)
{
	try{
	//alert("HI");
	//alert("Procept is " +prospect);
		document.getElementById("comlist1").style.display="";
	    document.getElementById("companyList1").style.visibility="visible";
	    
	   // alert("hi");
		var company=document.getElementById("mergename").value;
		 var counter=document.getElementById("counter1").value;

		//var company=document.mergeprocpect.companyNames.value;
		//alert("hi");
	    //var counter=document.mergeprocpect.counter.value;alert("hi");
    	//alert(">>>>>>>>>>   "+counter);

    	//alert("Company name " +company);
	}catch(e)
	{
		alert(e);
	}
		if(counter>100)
		{
			counter=0;
		}
		//var timer=setTimeout("getValue()",10000);
//		alert(timer);
		var ajaxRequest;  // The variable that makes Ajax possible!
		try
		{
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

		// Create a function that will receive data sent from the server
		ajaxRequest.onreadystatechange = function()
		{
			if(ajaxRequest.readyState == 4)
			{
				var reslt=ajaxRequest.responseText;
				//alert("Result is" +reslt);
				document.getElementById("companyList1").innerHTML=reslt;
				var b=document.getElementById("element").value;
				document.mergeprocpect.counter1.value=b;
				document.mergeprocpect.counter1.value=b*document.mergeprocpect.counter1.value;
				counter=document.mergeprocpect.counter1.value;
			} 
		}

		var queryString = "?company=" +company+"&limitcount="+counter+"";
		
			
		ajaxRequest.open("GET", "Ajaxmergecust1.jsp" + queryString, true);
		ajaxRequest.send(null); 
		
}


function getCustomerDetails1(i) 
{   
	document.getElementById("companyList1").style.visibility="hidden";
	document.getElementById("comlist1").style.display="none";
//alert(	document.getElementById("mergename").value=document.getElementById("Name"+i).value);
	//alert(document.getElementById("companyCode").value=document.getElementById("Code"+i).value);
	document.getElementById("mergename").value=document.getElementById("cName1"+i).value;
	document.getElementById("companyCode").value=document.getElementById("cCode1"+i).value;

}



function mychkbx()
{
//try{
	var mainname=document.getElementById("mergename").value;
	var maincode=document.getElementById("companyCode").value;
	var othmergeto=mainname.replace(/^\s\s*/, '').replace(/\s\s*$/, '');

	var comment=document.getElementById("comment").value;
	var other=document.getElementById("other").value;
	var oth=other.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
	
var a="";
try{
if(mainname=="" || othmergeto=="")
{
	alert("Select proper merging customer name");
	return false;
}
else{
	

	 
	var k1= document.getElementById("item1").value;

//alert(k1);
   	  
	  for ( var i = 1; i < k1; i++ ) 
		  {	
		 
		  if ( document.getElementById("ab"+i).checked==true)
	 		{


			if(i==1)
			{
				a=document.getElementById("ab"+i).value;
			}else{
         	a=a+"/"+document.getElementById("ab"+i).value;
			}	

			  
		  }
		  }
}
}catch(e)
{
}
//alert("a is " +a);
if(a=="")
{
	alert("Please select customer for merging");
	return false;
}
else if(comment=="Select")
{
	   alert("Please Select Reason");
		return false;
		   
}
else if(comment=="Other" && (other=="" || oth==""))
{
	      alert("Please Enter Other Reason");
	  	return false;
	      
   
}
else{	  

	document.getElementById("save").value=a;


	 // window.location="Ajaxmergecustomer.jsp?save="+a+"&mergename="+mainname+"&comment="+comment+"&other="+other+"&companyCode="+maincode;
}    
   	 
//}catch (e) {
	//alert(e);
//}
}  



function showother()
{
	//alert(id);
	var SelValue1=document.getElementById("comment").value;
	//alert(SelValue1);
        if(SelValue1=="Other")
        {
        	document.getElementById("other").style.display="";          
        }
        else 
       {
        	document.getElementById("other").style.display='none';         
       }
}





</script>
</head>

<body>

<%
	erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
 %>
<%!
Connection conn=null;
%>	 
 <%
try{ 

 
 	Statement st = null, st1 = null, st3 = null, st4 = null;
 	Statement st2 = null;
 	String selectedName;
 	String save=request.getParameter("msg");
 	System.out.println(" msg is "+save);
 	String FollowUpType = "";

 	try {
 			conn = erp.ReturnConnection();
 			st = conn.createStatement();
 			st1 = conn.createStatement();
 			st2 = conn.createStatement();
 			st3 = conn.createStatement();
 			st4 = conn.createStatement();
 		} catch (Exception e) {
 		}
 		
 		 
 		if(save!=null)
{
	%>
	<script type="text/javascript">
	alert("Customer Merged Successfully");
	window.location="MergeCustomer.jsp";
	
	</script>
	<%
} 
 		 %> 
 		 
 		 
 		 
 		 
 		 
 		 
 		 
<form id="mergeprocpect" action="Ajaxmergecustomer.jsp" method="get" onsubmit="return mychkbx();">
					
				<div id="dataentry" align="center"  style="margin-left:10%; width:70%;  background-color: #E1F3F3; border: solid thin black;">
		<div style="border: thin solid blue; background-color: #457FC2; height: 40px; ">
		
		
		<table style="color: white; align: center; width: 80%">
		<tr style="color: white; text-align: center;">
				<td style="width: 80%; color: ">
				
				<font face="Arial" size="3" color="white" ><b>Merge Customer
				</b></font></td>
				</tr>
				</table>
				</div>
				<div style="margin-left: 25%;width: 100%">
					<table style="font-size:small" border="0" align="center" width = "100%" >
						<tr>
							<br></br>
							<td valign="top" style="width: 80%"  align="left">
							<font face="Arial" size="2" color="black"><b>Search Customer :</b></font>
							&nbsp;&nbsp;&nbsp;
		<input type="text" name="companyNames" id="companyNames" value="" style='width: 350px; font-size: 15px;' onkeyup="timer()" autocomplete="off" />
																
							
												
						</td>
						
						<td valign="top" style="width: 30%"  align="left">
						</td>
							
						</tr>
						<tr id = "comlist"  style="display:none;" >
						<td valign="top"   colspan="1" style="text-align: center;margin-left:10%;" >
						<div align="center" style="border: thin;margin-right: 15%"> 
						<div id='companyList' style="background-color: white;height: 150px; width: 350px; overflow: auto; border:solid inset;" align="center">
						
						</div>
							<input type="hidden" name="counter" id="counter" value="10" />
							</div>
						</td>
						
						</tr>
						
						
						
						<tr>
													<input type="hidden" id="save" name="save" value=""></input>
							
							<td valign="top" style="width: 80%"  align="left">
							<font face="Arial" size="2" color="black"><b>Merge To :</b></font>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="hidden" id="companyCode" name="companyCode" value="" />
	    	<input type="text" name="mergename" id="mergename" value="" style='width: 350px; font-size: 15px;' onkeyup="timer1()" autocomplete="off" />
																
							
													
						</td>
						
						<td valign="top" style="width: 30%"  align="left">
						</td>
							
						</tr>
						<tr id = "comlist1"  style="display:none;" >
						
						<td valign="top"   colspan="1" style="text-align: center;margin-left: 10%;" >
						<div align="center" style="border: thin;margin-right: 15%"> 
						<div id='companyList1' style="background-color: white;height: 150px; width: 350px; overflow: auto; border:solid inset;" align="center">
						
						</div>
							<input type="hidden" name="counter1" id="counter1" value="10" />
							</div>
						</td>
						
						</tr>
						<tr>
						<td valign="top" style="width: 50%"  align="left">
						<font face="Arial" size="2" color="black"><b>Reason Of Merging :</b></font>
						&nbsp;
						
						<%
					String sqlR = "select Reason from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"ReasonForMerge where Category='Customer'";
			             ResultSet rs = st.executeQuery(sqlR);
									
					%>
					
					<select name="comment" id="comment" style="width: 40%" onChange="showother();">
                     <option value="Select">--Select--</option>
                     <%
							while (rs.next()) {
						%>
						<option value="<%=rs.getString("Reason")%>"><%=rs.getString("Reason")%>
						</option>
						<%
							}
						%> 
                     <option value="Other">Other</option>
                     
                     			 </select>	</td>
                     		
                     
						</tr>		
						<tr>
						<td>
					     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;
						 <input type="text"  name="other" id="other" style="display:none;width: 50%" />
						
						
						</td>
						
						
						
						</tr>
						</table>
						<div style="margin-left: 8%">
						<table border =0 width="75%" align="center" style="border-collapse: collapse;font-size:small;" cellpadding="5" cellspacing="5">
						<tr>
						<td>
<input type="submit" name="add" value="Merge" style="width: 70px;" />						
						</td>
						<td>
						
						
						</td>
						</tr>
						</table>
						</div>
						
						
						</div>
						
						
						</div>
									<br>
          	<br>
	<div id="footer">
	<p><a href="http://www.myfleetview.com"> Copyright &copy; 2009
	by Transworld Compressor Technologies Ltd. All Rights Reserved.</a></p>
	</div>
						</form>
					


<%}catch(Exception e)
{
	e.printStackTrace();
}

%>
</body>

</html>
</jsp:useBean>