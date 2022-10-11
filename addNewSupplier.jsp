<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="header.jsp"%>
<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">
<body>
<script type="text/javascript">
function validate()
{

//alert("IN THE FUNCTION");
//var marketingRep=document.addSupplier.repName.value;//alert(marketingRep);
var sName=document.addSupplier.supplierName.value;//alert(sName);
var contactPerson=document.addSupplier.contactPerson.value;//alert(contactPerson);
var website=document.addSupplier.website.value;//alert(website);
var email=document.addSupplier.email.value;//alert(email);
var address=document.addSupplier.address.value;//alert(address);
var city=document.addSupplier.city.value;//alert(city);
var zip=document.addSupplier.zip.value;//alert(zip);
var state=document.addSupplier.state.value;//alert(state);
var country=document.addSupplier.country.value;//alert(country);
var mobi=document.addSupplier.mobile.value;//alert(mobi);
var phone=document.addSupplier.ph.value;//alert(phone);
var supCate=document.addSupplier.supCategory.value;	//alert(supCate);
var supRat=document.addSupplier.supRating.value;//alert(supRat);
var supProdt=document.addSupplier.supProduct.value;//alert(supProdt);
var EnteredOn=document.addSupplier.fromdate.value;//alert(EnteredOn);
var fax1=document.addSupplier.fax.value;///(fax1);
var weeklyOff=document.addSupplier.weeklyoff.value;//alert(weeklyOff);
var alterNumber=document.addSupplier.alternateNumber.value;//alert(alterNumber);
var aCode=document.addSupplier.areaCode.value;//alert(aCode);
var desig=document.addSupplier.designation.value;//alert(desig);
//var SupPOAuthReqd=document.addSupplier.supAuthorisation.value;alert(SupPOAuthReqd);

//var SupPOAuthorisationReqd=document.addSupplier.supAuthorisation.value;//alert(">>>>      "+SupPOAuthorisationReqd);
		                    
    var numericExpression = /^[0-9]+$/;
	if(contactPerson.match(numericExpression))
	{
	alert("Contact Persons name cannot be  Numeric");
	return false;
	}

	if(sName=="")
	{
	alert("Please enter Supplier Name");
	return false;
		}
			
	if(sName.match(numericExpression))
	{
	alert("Supplier name cannot br Numeric ");
	return false;
	}

	if(contactPerson=="")
	{
		alert(" Please Enter Contact Person");
		return false;
	}
	
	if( mobi=="")
	{
	alert("Please enter Mobile Number");
	return false;
	}

	if( email=="")
	{
	alert("Please enter Email Address");
	return false;
	}



var at="@";
var dot=".";
var lat=email.indexOf(at);
var lstr=email.length;
var ldot=email.indexOf(dot);
	if(email.indexOf(at)==-1 && email!=""){
	alert("Invalid E-mail ID");
	return false;
	}
	
	if(!(mobi.match(numericExpression)) && mobi!=""){
	alert("Mobile Number Should Be Numeric Value");
	return false;
	}
	
	if(phone!="")
	if(!(phone.match(numericExpression))){
	alert("Phone Number Should Be Numeric Value");
	return false;
	}
	
var agree=confirm(" supplierName: "+sName+"\n Contact Person : "+contactPerson+"\n Email: "+email+"\n Mobile: "+mobi+"\n\nAre you sure you want to continue with these values?");
	if (agree)
	return true ;
	else
	return false ;

}

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
String FollowUpType = "";
Date today = new Date();
String fromDate = "", toDate = "";
fromDate = new SimpleDateFormat("dd-MMM-yyyy").format(today);
%>

<%
try {
conn = erp.ReturnConnection();
st = conn.createStatement();
st1 = conn.createStatement();
st2 = conn.createStatement();
st3 = conn.createStatement();
st4 = conn.createStatement();
} catch (Exception e) {
}
%>

<%
if (request.getParameter("companyName") == null) {
%>
<div
style="font-size: 2em; text-align: center; margin-top: 1.0em; margin-bottom: 1.0em;">
<a>Add New Supplier</a></div>
<form name="addSupplier" method="post" action="addSupplier.jsp"
onSubmit="return validate();">
<table border="0" cellpadding="3" width="100%"
style="background: white;">
<tr>
<td valign="top" align="left">
<div id="repName">Marketing Rep. Name:</div>
</td>
<td valign="top" style="font-size: 1.2em;" ><%=session.getAttribute("EmpName").toString()%>

</td>
<td valign="top" align="left" >Supplier Name : #</td>
<td align="left">
<div id="supplierName">
<input type="text" name="supplierName" 
id="search-text" style='height: 12px;' /></div>
</td>
</tr>
<tr>
<td valign="top" align="left">Contact Person : #</td>
<td>
<div id="contactPerson"><input type="text" name="contactPerson"
id="search-text" style='height: 12px;' /></div>
</td>
<td valign="top" align="left">Designation :</td>
<td align="left">
<div id="designation"><input type="text" name="designation"
id="search-text" style='height: 12px;' /></div>
</td>
		
</tr>
<tr>
<td valign="top" align="left">E-mails : *<br>
(add comma seprated<br>
Id's if more than one)</td>
<td>
<div id="email"><textarea name="email" rows="1"
id="search-text" style='width: 175px; height: auto;'></textarea></div>
</td>
<td valign="top" align="left">Address :</td>
<td>
<div id="address"><textarea name="address" rows="2"
id="search-text" style='width: 175px; height: auto;'>
</textarea></div>
</td>
</tr>
<tr>
<td valign="top" align="left">City :</td>
<td align="left">
<div id="city"><input type="text" name="city"
id="search-text" style='height: 12px;' /></div>
</td>
<td valign="top" align="left">ZipCode :</td>
<td align="left">
<div id="zip"><input type="text" name="zip" id="search-text"
style='height: 12px;' /></div>
</td>
</tr>
<tr>
<td valign="top" align="left">State :</td>
<td align="left">
<div id="state"><input type="text" name="state"
id="search-text" style='height: 12px;' /></div>
</td>
<td valign="top" align="left">Country :</td>
<td align="left">
<div id="country"><input type="text" name="country"
id="search-text" style='height: 12px;' /></div>
</td>
</tr>
<tr>
<td valign="top" align="left">Mobile No : *</td>
<td>
<div id="mobile"><input type="text" name="mobile"
id="search-text" style='height: 12px;' /></div>
</td>
<td valign="top" align="left">Fax No :</td>
<td align="left">
<div id="fax"><input type="text" name="fax" id="search-text"
style='height: 12px;' /></div>
</td>
</tr>

<tr>
<td valign="top" align="left">Area Code :</td>
<td>
<div id="areaCode"><input type="text" name="areaCode" id="search-text"
style='height: 12px;' /></div>
</td>
<td valign="top" align="left">Phone Number : </td>
<td align="left">
<div id="ph"><input type="text" name="ph" id="search-text"
style='height: 12px;' /></div>
</td>
</tr>
<tr>
<td valign="top" align="left">Supplier category :</td>
<td><select name="supCategory" id="supCategory"
style="width: 188px; height: 20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000;">
<option value='Select'>Select</option>
<option value='1'>Manufacturer</option>
<option value='2'>Authorised Dealer</option>
<option value='3'>After Market Trader</option>
<option value='4'>Others</option>
</select></td>
<td valign="top" align="left">Supplier Rating : </td>

<td><select name="supRating" id="supRating"
style="width: 188px; height: 20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000;">
<option value='Select'>Select</option>
<option value='1'>1</option>
<option value='2'>2</option>
<option value='3'>3</option>
<option value='4'>4</option>
<option value='5'>5</option>

</select></td>


</tr>
<tr>
<td valign="top" align="left">Supplier product :</td>
<td>
<div id="supProduct"><input type="text" name="supProduct"
id="search-text" style='height: 12px;' /></div>
</td>
<td valign="top" align="left">Supplier Entered On :</td>
<td><input type="text" id="fromdate" name="fromdate"
value="<%=fromDate%>" size="15" readonly
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
</td>
</tr>
<tr>
<td valign="top" align="left">Weekly Off :</td>
<td><select name="weeklyoff" id="weeklyoff"
style="width: 188px; height: 20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000;">
<option value='Select'>Select</option>
<option value='monday'>Monday</option>
<option value='tuesday'>Tuesday</option>
<option value='wednesday'>Wednesday</option>
<option value='thurday'>Thursday</option>
<option value='friday'>Friday</option>
<option value='saterday'>Saterday</option>
<option value='sunday'>Sunday</option>
</select></td>
<td valign="top" align="left">Alternate Number :</td>
<td align="left">
<div id="alternateNumber"><input type="text"
name="alternateNumber" id="search-text" style='height: 12px;' /></div>
</td>
</tr>
<tr>

	
<td valign="top" align="left">WebSite :</td>
<td>
<div id="website"><input type="text" name="website"
id="search-text" style='height: 12px;' /></div>
</td>
</tr>
<tr>
<td><input type="checkbox"  id="supAuthorisation" name="supAuthorisation"  value="True" unchecked/>Sup PO Authorisation Reqd  </td>

</tr>
<tr></tr>
<tr>
<td valign="bottom" align="center" colspan="4">
<div><input type="submit" id="search-submit"
name="submitSupplierDet" value="Submit" /></div>
</td>
</tr>
<tr>
<td colspan="3"># : Either of the field is compulsory</td>
</tr>
<tr>
<td colspan="3">* : Either of the field is compulsory</td>
</tr>
</table>
</form>
<%
}
%>

<br>
<div id="footer">
<p><a href="http://www.myfleetview.com"> Copyright &copy; 2009
by Transworld Compressor Technologies Ltd. All Rights Reserved.</a></p>
</div>
<!-- end #footer -->
</body>
</html>
</jsp:useBean>