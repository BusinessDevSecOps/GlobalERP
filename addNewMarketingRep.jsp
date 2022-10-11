<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="header.jsp"%>
<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">

	<body onkeypress="hideList(event);" onclick="hideOnClick();">

	<script type="text/javascript">


	function dodisable()
	{
	document.addNewMarketingRep.repuname.readOnly="true";
	document.addNewMarketingRep.email.readOnly="true";
	document.addNewMarketingRep.phone.readOnly="true";
	document.addNewMarketingRep.userpsd.readOnly="true";
	document.addNewMarketingRep.userlevel.readOnly="true"; 
	document.addNewMarketingRep.talevel.readOnly="true";
	}




	function validate()
	{
		var username=document.addNewMarketingRep.repuname.value;
		if(username=="")
		{
		alert("Please Enter the User Name");
	     return false;
		}


        var Email=document.addNewMarketingRep.email.value;
        if(Email=="")
        {
          alert("Please Enter the Email-Id");
          return false;
         }



       var addr=document.addNewMarketingRep.address.value;
       if(addr=="")
       {
          alert("Please Enter the Address..");
          return false;

           } 

        var City= /^[A-Za-z ]+$/;  
    	var City=City.test(document.addNewMarketingRep.city.value);
        if(City==false)
         {     
             alert('City Name must have characters only');  
             return false;  
         }  


       var State=/^[A-Za-z ]+$/;
       var State=State.test(document.addNewMarketingRep.state.value);
       if(State==false)
       {
          alert("State Name Must have characters only..");
          return false;
       }  



       var Country=/^[A-Za-z ]+$/;
       var Country=Country.test(document.addNewMarketingRep.country.value);
       if(Country==false)
       {
          alert("Country Name Must have Characters only..");
          return false;

        }

        

        var vistar=document.addNewMarketingRep.visittarget.value;//alert(vistar);
        var calltargets=document.addNewMarketingRep.calltarget.value;//alert(calltargets);
		 var letargets=document.addNewMarketingRep.lettarget.value;//alert(letargets);
		 var sqtargets=document.addNewMarketingRep.squotarget.value;//alert(sqtargets);
		 var nprstargets=document.addNewMarketingRep.nprostarget.value;//alert(nprstargets);
		 
	      var numericExpression = /^[0-9]+$/;

	      if(!(vistar.match(numericExpression)))
			{
					    alert("Visit target should be Numeric");
					    return false;
			}	
	      

	    if(!(calltargets.match(numericExpression)))
		    {
			    alert("call target should be Numeric");
			    return false;
			}	

		if(!(letargets.match(numericExpression)) )
			{
				    alert("Letter target should be Numeric");
				    return false;
			}

	      
		if(!(sqtargets.match(numericExpression)) )
			{
				    alert("SalesQuotation target should be Numeric");
				    return false;
			}

	      	
		if(!(nprstargets.match(numericExpression)) )
			    {
				    alert("NewProspect target should be Numeric");
				    return false;
				}
	    		

   }


	
function hideList(e){
    if(e.which == 0){
    	document.getElementById("ProspectList").style.visibility='hidden';
    }
}
    function hideOnClick(){
        //	document.getElementById("ProspectList").style.visibility='hidden';
}
	function getProspectes() {
		
		document.getElementById("ProspectList").style.visibility='visible';
		var prospect=document.addCustomer.companyName.value;
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

		// Create a function that will receive data sent from the server
		ajaxRequest.onreadystatechange = function()
		{
			if(ajaxRequest.readyState == 4)
			{
				var reslt=ajaxRequest.responseText;
				//alert(reslt);
				//var mySplitResult = reslt.split("#");
				//alert(mySplitResult[15]);
				document.getElementById("ProspectList").innerHTML=reslt;


			} 
		}
		var queryString = "?prospect=" +prospect+'&displayList=true';
		ajaxRequest.open("GET", "AjaxGetProspectInfo.jsp" + queryString, true);
		ajaxRequest.send(null); 

		
	}



	function Changing()
	 {
		 //alert("in fun");
		var name=document.getElementById("repName").options[document.getElementById("repName").selectedIndex].value;
		//alert(name);	 
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
					//alert(">>>    "+reslt);
					var data=reslt.split("ZZ");
				    //alert("<*****  "+data);
					//alert(data[0]);
					if(data[0].indexOf("Yes")!=-1)
					{					
				    	///window.location.reload();
				    	//alert("data fetch successfully");
				    	document.getElementById("repusername").value=data[1];
						document.getElementById("Email").value=data[2];
						document.getElementById("Mobno").value=data[3];
						document.getElementById("pwd").value=data[4];
						document.getElementById("ULevel").value=data[5];
						document.getElementById("TALevel").value=data[6];
						
					}
					else
					{
				    	alert("data not fetch successfully");
						
					}
					
	         } 

		}
			
			var queryString = "?name="+name;
			//alert(queryString);
			
			ajaxRequest.open("GET", "AjaxNewMarkRep.jsp" + queryString, true);
			ajaxRequest.send(null); 
	 }


	function Changingedit()
	{

		var name=document.getElementById("repName").options[document.getElementById("repName").selectedIndex].value;
		//alert(name);	 
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
					//alert(">>>    "+reslt);
					var data=reslt.split("ZZ");
				    //alert("<*****  "+data);
					//alert(data[0]);
					if(data[0].indexOf("Yes")!=-1)
					{					
				    	///window.location.reload();
				    	//alert("data fetch successfully");
				    	document.getElementById("repusername").value=data[1];
						document.getElementById("Email").value=data[2];
						document.getElementById("Mobno").value=data[3];
						document.getElementById("pwd").value=data[4];
						document.getElementById("ULevel").value=data[5];
						document.getElementById("TALevel").value=data[6];
						
					}
					else
					{
				    	alert("data not fetch successfully");
						
					}
					
	         } 

		}
			
			var queryString = "?name="+name;
			//alert(queryString);
			
			ajaxRequest.open("GET", "AjaxEditMarkrep.jsp" + queryString, true);
			ajaxRequest.send(null); 
	}
	 		
	 // var agree=confirm(" CompanyName: "+company+"\n Rep. Person : \n Email: "+email+"\n Mobile: "+mobile+"\n\nAre you sure you want to continue with these values?");
	 //if (agree)
	 //return true ;
	 //else
	 //return false ;

	 //if (document.all || document.getElementById)
		//document.body.style.background = "url('images/bg.jpg')  white top no-repeat "
</script>
 
	<%
		erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
	%>
	<%
		Connection conn = null;
			Statement st = null, st1 = null, st3 = null, st4 = null;
			Statement st2 = null;
			String selectedName;
			String FollowUpType = "";
	%>
	<%
		if (null == request.getParameter("repName"))
				selectedName = "All";
			else
				selectedName = request.getParameter("repName");

			try {
				conn = erp.ReturnConnection();
				st = conn.createStatement();
				st1 = conn.createStatement();
				st2 = conn.createStatement();
				st3 = conn.createStatement();
				st4 = conn.createStatement();
			} catch (Exception e) {
			}
			if (null == request.getParameter("division"))
				selectedName = "All";
			else
				selectedName = request.getParameter("division");
			
			String type=request.getParameter("type");
			System.out.println(type);
	%>

<%
if(type=="new" || type.equalsIgnoreCase("new"))
{
%>

	<div
		style="font-size: 1.8em; text-align: center; margin-top: 0.5em; margin-bottom: 0.4em;">
	<a>Add New Marketing Representative</a> </div>
	<form name="addNewMarketingRep" method="post" action="addMarktRep.jsp"
		onsubmit="return validate();">
	<table border="0" cellpadding="3" width="100%"
		style="background: white;">
		<tr>
			<td valign="top" align="left">
			Marketing Rep. Name:
			</td>
			<td valign="top">
			<select name="repName" id="repName" style="
				  	width: 185px; height:20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; " onchange="Changing();">
<%
try
{
String repName="select distinct(EmpName) from "+session.getAttribute("CompanyMasterID").toString()+"security where ActiveStatus='Yes' and Dept='Marketing' order by EmpName";
ResultSet rsrepName=st.executeQuery(repName);
System.out.println("--------select user"+repName);
while(rsrepName.next())
{
%>
	 <option value="<%=rsrepName.getString("EmpName") %>"><%=rsrepName.getString("EmpName") %></option>
	<% 
}
}
catch(Exception e)
{
	System.out.println(">>>>>>>>>>>>Exception:e"+e);
}
%>
				  	
</select>
			
			</td>

			<td valign="top" align="left">Company Name : #</td>
			<td align="left">
			<div id="company"> <select name="company" style="
				  	width: 185px; height:20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; ">
			<option value='select'>SELECT</option>
			<option value='1,2,3'>All</option>
			<option value='1'>Transworld Compressor Technologies Ltd.</option>
			<option value='2'>Theta Trading</option>
			<option value='3'>Natasha Consultants Pvt. Ltd.</option>
				</select></div>
		</td>
		</tr>
	   <tr>
			<td valign="top" align="left">
			<div id='repName'>Marketing Rep. User Name:</div>
			</td>
			<td valign="top">
			<div id='repuname'><input type="text" name="repuname" id="repusername"  size="15" style="border: 1px solid #000000;" value="" onclick="dodisable()"/>
			</div>
			</td>

			<td valign="top" align="left">User Password : </td>
			<td align="left">
			<div id="userpassword"><input type="password" name="userpsd"
				id="pwd"  size="15" style="border: 1px solid #000000;" onclick="dodisable()" onkeyup="getProspectes()" /></div>

			</td>
		
		</tr>
	
		    <tr>
		    <td valign="top" align="left">
			<div id='email'>E-mail id :</div>
			</td>
			<td valign="top">
			<div id='email'><input type="text" name="email" id="Email" size="15" style="border: 1px solid #000000;" value="" onclick="dodisable()"/>
			</div>
			</td>
            
			<td valign="top" align="left">Address :</td>
			<td>
			<div id="address">
				<textarea
										name="address" rows="2" id="search-text"
										style='width: 175px; height: auto;'></textarea>
			</div>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left">City :</td>
			<td>
			<div id="city"><input type="text" name="city" id="search-text"
				 style='height: 12px;' /></div>
			</td>
				<td valign="top" align="left">Department :</td>
			<td><div id="dept">
			<input type="text" id="search-text" name="department" style="border: 1px solid #000000;" value="MARKETING" readonly="readonly"/>
			</div>
			
			</td>
			
		</tr>

		<tr>
			<td valign="top" align="left">State :</td>
			<td>
			<div id="state"><input type="text" name="state"
				id="search-text"  style='height: 12px;' /></div>
			</td>
			<td valign="top" align="left">Country :</td>
			<td align="left">
			<div id="country"><input type="text" name="country"
				id="search-text"  style='height: 12px;' /></div>
			</td>
		</tr>

		<tr>
			<td valign="top" align="left">Mobile No : </td>
			<td>
			<div id="phone"><input type="text" name="phone"
				id="Mobno" size="15" style="border: 1px solid #000000;" onclick="dodisable()"/></div>
			</td>
			
			<td valign="top" align="left">User Level :</td>
			<td align="left">
			<div id="userlevel"><input type="text" name="userlevel"
				id="ULevel" size="15" style="border: 1px solid #000000;" onclick="dodisable()"/></div>
			</td>
			
			
		</tr>

		
		<tr>
			<td valign="top" align="left">Visit Targets : </td>
			<td>
			<div id="visittarget"><input type="text" name="visittarget"
				id="search-text"  style='height: 12px;text-align: right;' /></div>
			</td>
			<td valign="top" align="left">Call Targets : </td>
			<td>
			<div id="calltarget"><input type="text" name="calltarget"
				id="search-text"  style='height: 12px;text-align: right;' /></div>
			</td>
		</tr>


		<tr>
			<td valign="top" align="left">Letters Targets : </td>
			<td>
			<div id="lettarget"><input type="text" name="lettarget"
				id="search-text"  style='height: 12px;text-align: right;' /></div>
			</td>
			<td valign="top" align="left">SalesQuotation Targets : </td>
			<td>
			<div id="squotarget"><input type="text" name="squotarget"
				id="search-text"  style='height: 12px;text-align: right;' /></div>
			</td>
		</tr>

<tr>
			<td valign="top" align="left">Nerw Prospects Targets : </td>
			<td>
			<div id="nprostarget"><input type="text" name="nprostarget"
				id="search-text"  style='height: 12px;text-align: right;' /></div>
			</td>
				
				<td valign="top" align="left">TA Level :</td>
			<td>
			<div id="talevel"><input type="text" name="talevel"
				id="TALevel" size="15" style="border: 1px solid #000000;" onclick="dodisable()"/></div>
			</td>
												
		</tr>
		<br>
		<tr>
		<table align="center">
		<tr>
		<td align="left">
			<div id="compressor"><input type="checkbox" name="compressor" value="True"  " /></div>
			</td>
			<td valign="top" align="left"><b>compressor :</b> </td>
			
			<td align="left">
			<div id="digiequp"><input type="checkbox" name="digiequp" value="True"  " /></div>
			</td>
			<td valign="top" align="left"><b>DigitalEquipments : </b></td>
			
			<td align="left">
			<div id="dgset"><input type="checkbox" name="dgset" value="True"  " /></div>
			</td>
			<td valign="top" align="left"><b>DGSet :</b> </td>
			
			<td align="left">
			<div id="endoscope"><input type="checkbox" name="endoscope" value="True"  " /></div>
			</td>
			<td valign="top" align="left"><b>Endoscope :</b> </td>
			
			<td align="left">
			<div id="othergroup"><input type="checkbox" name="othergroup" value="True" " /></div>
			</td>		
			<td valign="top" align="left"><b>OtherGroups: </b></td>
			
		</tr>
		</table>
		</tr>
		
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<br>
		<div align="center">
		<tr>

			<td valign="bottom" align="center" colspan="4">
			<div><input type="submit" id="search-submit"
				name="submitFollowUp" value="Submit" /></div>
			</td>
		</tr>
		</div>
	</table>
 
	</form>
<%
} else if(type.equalsIgnoreCase("edit"))
{
	System.out.println("IN ELSE PART  ");

	String repname=request.getParameter("repname");
	System.out.println(repname);
	
	String emailid="",add="",cty="",daprt="",stat1="",country1="",mobl="",usrlevel="",comp="",dgequp="",dgst="",endosp="",othergrp="",visittrg="",calltrg="",lettertarg="",salesquotarg="",newprosptrg="";
%>
	
		<div
		style="font-size: 1.8em; text-align: center; margin-top: 0.5em; margin-bottom: 0.4em;">
	<a>Edit Marketing Representative Details</a> </div>
	<form name="update" method="post" action="updatemarketingdata.jsp"
		onsubmit="return validate();">
	<table border="0" cellpadding="3" width="100%"
		style="background: white;">
		<tr>
			<td valign="top" align="left">
			Marketing Rep. Name:
			</td>
			<td valign="top">
			<input type="text" name="repName1" id="repName1" value="<%=repname %>"  />
			</td>
<%

String repName="select * from "+session.getAttribute("CompanyMasterID").toString()+"marketingrepmaster where MarketingRepName='"+repname+"'";
ResultSet rsrepName=st2.executeQuery(repName);
System.out.println("--------select user"+repName);
if(rsrepName.next())
{
	emailid=rsrepName.getString("MarketingRepEMail");
	add=rsrepName.getString("MarketingRepAddress");
	cty=rsrepName.getString("MarketingRepCity");
	daprt="Marketing";
	stat1=rsrepName.getString("MarketingRepState");
	country1=rsrepName.getString("MarketingRepCountry");
	mobl=rsrepName.getString("MarketingRepPhNo");
	usrlevel=rsrepName.getString("UserLevel");
	comp=rsrepName.getString("Compressor");
	dgequp=rsrepName.getString("DigitalEquipment");
	dgst=rsrepName.getString("DGSet");
	endosp=rsrepName.getString("Endoscope");
	othergrp=rsrepName.getString("OtherGroups");
	visittrg=rsrepName.getString("VisitsTarget");
	calltrg=rsrepName.getString("CallsTarget");
	lettertarg=rsrepName.getString("LettersTarget");
	salesquotarg=rsrepName.getString("SQTarget");
	newprosptrg=rsrepName.getString("NewProspectTarget");
}

%>
				  	

			
			

			<td valign="top" align="left">Company Name : #</td>
			<td align="left">
			<div id="company"> <input type="text" name="company" id="company" value="Transworld Compressor Technologies Ltd"/></div>
		</td>
		</tr>
	
	
		    <tr>
		    <td valign="top" align="left">
			<div id='email'>E-mail id :</div>
			</td>
			<td valign="top">
			<div id='email'><input type="text" name="email" id="Email"  style="border: 0px solid #000000;" value="<%=emailid %>" />
			</div>
			</td>
            
			<td valign="top" align="left">Address :</td>
			<td>
			<div id="address">
				<textarea
										name="address" rows="2" id="search-text"
										style='width: 175px; height: auto;' ><%=add %></textarea>
			</div>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left">City :</td>
			<td>
			<div id="city"><input type="text" name="city" id="search-text"
				 style='height: 12px;' value="<%=cty %>"/></div>
			</td>
				<td valign="top" align="left">Department :</td>
			<td><div id="dept">
			<input type="text" id="search-text" name="department" style="border: 0px solid #000000;" value="MARKETING" readonly="readonly"/>
			</div>
			
			</td>
			
		</tr>

	<tr>
			<td valign="top" align="left">State :</td>
			<td>
			<div id="state"><input type="text" name="state"
				id="search-text"  style='height: 12px;' value="<%=stat1 %>" /></div>
			</td>
			<td valign="top" align="left">Country :</td>
			<td align="left">
			<div id="country"><input type="text" name="country"
				id="search-text"  style='height: 12px;' value="<%=country1 %>"/></div>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left">Mobile No : </td>
			<td>
			<div id="phone"><input type="text" name="phone"
				id="search-text"  style='height: 12px;text-align: right;' value="<%=mobl %>"/></div>
			</td>
			
			<td valign="top" align="left">User Level :</td>
			<td align="left">
			<div id="userlevel"><input type="text" name="userlevel"
				id="search-text"  style='height: 12px;text-align: right;' value="<%=usrlevel %>""/></div>
			</td>
			
			
		</tr>

		
		<tr>
			<td valign="top" align="left">Visit Targets : </td>
			<td>
			<div id="visittarget"><input type="text" name="visittarget"
				id="search-text"  style='height: 12px;text-align: right;' value="<%=visittrg %>"/></div>
			</td>
			<td valign="top" align="left">Call Targets : </td>
			<td>
			<div id="calltarget"><input type="text" name="calltarget"
				id="search-text"  style='height: 12px;text-align: right;' value="<%=calltrg %>"/></div>
			</td>
		</tr>


		<tr>
			<td valign="top" align="left">Letters Targets : </td>
			<td>
			<div id="lettarget"><input type="text" name="lettarget"
				id="search-text"  style='height: 12px;text-align: right;' value="<%=lettertarg %>" /></div>
			</td>
			<td valign="top" align="left">SalesQuotation Targets : </td>
			<td>
			<div id="squotarget"><input type="text" name="squotarget"
				id="search-text"  style='height: 12px;text-align: right;' value="<%=salesquotarg %>"/></div>
			</td>
		</tr>

<tr>
			<td valign="top" align="left">Nerw Prospects Targets : </td>
			<td>
			<div id="nprostarget"><input type="text" name="nprostarget"
				id="search-text"  style='height: 12px;text-align: right;' value="<%=newprosptrg %>"/></div>
			</td>
				
				<td valign="top" align="left">TA Level :</td>
			<td>
			<div id="talevel"><input type="text" name="talevel"
				id="TALevel"  style="border: 0px solid #000000;" value="Level1"/></div>
			</td>
 		   </tr>
 		   <tr>
			<td>Compressor : </td>
			<td><div id="compressor"><input type="text" name="compressor"
				id="search-text"  style='height: 12px;text-align: right;' value="<%=comp %>"/></div>
			</td>
			<td>Digital Equipments : </td>
			<td><div id="compressor"><input type="text" name="digiequp"
				id="search-text"  style='height: 12px;text-align: right;' value="<%=dgequp %>" /></div>
			</td>
			</tr>
			
			 <tr>
			<td>DGSet : </td>
			<td><div id="dgset"><input type="text" name="dgset"
				id="search-text"  style='height: 12px;text-align: right;' value="<%=dgst %>" /></div>
			</td>
			<td>Endoscope : </td>
			<td><div id="endoscope"><input type="text" name="endoscope"
				id="search-text"  style='height: 12px;text-align: right;' value="<%=endosp %>" /></div>
			</td>
			</tr>
			
			<tr>
			
				<td>Other Groups : </td>
			<td><div id="othergroup"><input type="text" name="othergroup"
				id="search-text"  style='height: 12px;text-align: right;' value="<%=othergrp %>"/></div>
			</td>
		</tr>
		</table>
		</tr>
		
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<br>
		<div align="center">
		<tr>

			<td valign="bottom" align="center" colspan="4">
			<div><input type="submit" id="search-submit"
				name="submitFollowUp" value="Submit" /></div>
			</td>
		</tr>
		</div>
	</table>
 
	</form>
				
<%} %>
<br><br>
	<br><br>
	<br><br>
	<br><br>
	<br><br>

	
	<div id="footer">
	<p><a href="http://www.myfleetview.com"> Copyright &copy; 2009
	by Transworld Compressor Technologies Ltd. All Rights Reserved.</a></p>
	</div>
	
	</body>
	</html>
</jsp:useBean>