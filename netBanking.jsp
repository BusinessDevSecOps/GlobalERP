<DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> 
<%@ include file="header.jsp"%>
<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">
<%@page import="java.util.Date"%>

 
<script language="JavaScript1.2">

function showVisitingName(companyName,customerCode)
{
	document.netbanking.benfName.value=companyName;
	
	document.getElementById("NameList").style.display='none';
	ChangingField('changefield');
	//alert("code "+customerode);
	
	//document..isCheckedAll.checked=false;
}

function getCompanies(type)
{
	document.getElementById("NameList").style.display='block';
	var name=document.netbanking.benfName.value;
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
			document.getElementById("NameList").innerHTML=reslt;
		} 
	}
	var queryString = "?name=" +name+"&type="+type;
	ajaxRequest.open("GET", "netBankAjaxSearch.jsp" + queryString, true);
	ajaxRequest.send(null); 
	
}


function ChangingField(type)
{
	//alert("call");
		var name=document.netbanking.benfName.value;
	//alert(name);
	
	//document.getElementById("NameList").style.display='block';

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
			var temp= reslt.split(",");
			//alert("result  "+reslt);
			//alert("1 "+temp[0]);
			//alert("2 "+temp[1]);
			//alert("3 "+temp[2]);
			var data=temp[0];
			  data=data.replace(/^\s+|\s+$/g,"");
			document.getElementById("benfBankName").value=data;
			document.getElementById("accountNo").value=temp[1];
			document.getElementById("ifcCode").value=temp[2];
			document.getElementById("level1limit").value=temp[3];
		} 
	}
	var queryString = "?name=" +name+"&type="+type;
	ajaxRequest.open("GET", "netBankAjaxSearch.jsp" + queryString, true);
	ajaxRequest.send(null); 

	}
function ChangingClaimType()
{
	alert("hi");
	var category= document.getElementById("category").value;
		
	 
		 category=category.split(",");
		 for (var k = 0; k < category.length; k++) {

             var a=category[k];
             var b=category[k];
		 }
           
		 
		// alert("1st>"+a);
		 alert("2nd>"+b);
		 document.getElementById("categorySelected").value=b;
	
	
}
	function fillpayamount() {
		var amount=document.netbanking.amount.value;
		checkamount(amount);
		convertRsToWord(amount);
		
		
		
	}
	function checkamount(amount)
	{
		alert("hi11_amont--->"+amount);
		var category_amt=document.getElementById("categorySelected").value;
		alert("hi_category-->"+category_amt);
	amount++;
	amount--;
	category_amt++;
	category_amt--;
	
		if(amount > category_amt)
		{
			alert("Invalid amount Entered");
			document.netbanking.refNo.value("");
			document.netbanking.amount.value("");
			//document.getElementById("amount").value;
		}
		else{
			alert("OKKK");
		}
	}
		
	function convertRsToWord(amount)
	{
 		var junkVal=amount;
		    junkVal=Math.floor(junkVal);
		    var obStr=new String(junkVal);
		     numReversed=obStr.split("");
		    actnumber=numReversed.reverse();

		   if(Number(junkVal) >=0){
		        //do nothing
		    }
		    else{
		    alert('wrong Number cannot be converted');
		    return false;
		    }
		    if(Number(junkVal)==0){
		        alert("You can enter Rupees Zero Only");
		    	document.getElementById('payAmount').value=obStr+' '+'Rupees Zero Only';
		        return false;
		    }
		    if(actnumber.length>9){
		        alert('Oops!!!! the Number is too big to covertes');
		        return false;
		    }
		 
		    var iWords=["Zero", " One", " Two", " Three", " Four", " Five", " Six", " Seven", " Eight", " Nine"];
		    var ePlace=['Ten', ' Eleven', ' Twelve', ' Thirteen', ' Fourteen', ' Fifteen', ' Sixteen', ' Seventeen', ' Eighteen', ' Nineteen'];
		    var tensPlace=['dummy', ' Ten', ' Twenty', ' Thirty', ' Forty', ' Fifty', ' Sixty', ' Seventy', ' Eighty', ' Ninety' ];
		 
		    var iWordsLength=numReversed.length;
		    var totalWords="";
		    var inWords=new Array();
		    var finalWord="";
		    j=0;
			for(i=0; i<iWordsLength; i++){
		    switch(i)
		        {
		        case 0:
		        if(actnumber[i]==0 || actnumber[i+1]==1 ) {
		                inWords[j]='';
		            }
		            else {
		                inWords[j]=iWords[actnumber[i]];
		            }
		            inWords[j]=inWords[j]+' Only';
		        break;
		        case 1:
		            tens_complication();
		            break;
		        case 2:
		       if(actnumber[i]==0) {
		           inWords[j]='';
		        }
		        else if(actnumber[i-1]!=0 && actnumber[i-2]!=0) {
		                inWords[j]=iWords[actnumber[i]]+' Hundred and';
		        }
		            else {
		            inWords[j]=iWords[actnumber[i]]+' Hundred';
		            }
		       break;
		        case 3:
		            if(actnumber[i]==0 || actnumber[i+1]==1) {
		                inWords[j]='';
		            }
		            else {2
		            inWords[j]=iWords[actnumber[i]];
		            }
		            if(actnumber[i+1] != 0 || actnumber[i] > 0){
		            inWords[j]=inWords[j]+" Thousand";
		        }
		            break;
		        case 4:
		            tens_complication();
		        break;
		        case 5:
		            if(actnumber[i]==0 || actnumber[i+1]==1) {
		            inWords[j]='';
		            }
		        else {
		            inWords[j]=iWords[actnumber[i]];
		        }
		            if(actnumber[i+1] != 0 || actnumber[i] > 0){
		                inWords[j]=inWords[j]+" Lacs";
		       }
		            break;
		        case 6:
		            tens_complication();
		            break;
		        case 7:
		            if(actnumber[i]==0 || actnumber[i+1]==1 ){
		                inWords[j]='';
		            }
		            else {
		                inWords[j]=iWords[actnumber[i]];
		            }
		            inWords[j]=inWords[j]+" Crore";
		            break;
		        case 8:
		            tens_complication();
		        break;
		        default:
		            break;
		    }
		        j++;
		}

			function tens_complication() {
		        if(actnumber[i]==0) {
		            inWords[j]='';
		        }
		        else if(actnumber[i]==1) {
		        inWords[j]=ePlace[actnumber[i-1]];
		        }
		        else {
		       inWords[j]=tensPlace[actnumber[i]];
		        }
			}
		inWords.reverse();
		for(i=0; i<inWords.length; i++) {
		    finalWord+=inWords[i];
		}
		    document.getElementById('payAmount').value=obStr+'  Rupees'+finalWord;
			

		

		
	}
	
	function dateValidate(dt,today)
	{//alert("date validate");
		var d=new Date().getMonth();
	//	alert(today);
		dy1=dt.substring(7,11);
		dy2=today.substring(0,4);
	//alert("current date "+dy1);
		//alert("sys date "+dy2);
		dm1=d;
		//alert("current month "+dm1);
		dm2=today.substring(5,7);
		//alert("sys month"+dm2);
		
		dd1=dt.substring(0,2);
		dd2=today.substring(8,10);

		//alert(dy1+"=="+dy2+"=="+dm1+"=="+dm2+"=="+dd1+"=="+dd2);

		if((dm1>dm2) ||  (dy1>dy2) )
		{
			alert("Please Select Valid Date Year");
			return false;
		}
		
		return true;
	}
	
   function validation() 
   {
	
	var name=document.netbanking.benfName.value;
	var amount=document.netbanking.amount.value;
	var refNo=document.netbanking.refNo.value;
	var comment=document.netbanking.comment.value;
	var category=document.netbanking.category.value;
	var temp=category.split(",");
	var limit=temp[1];
	var cate=temp[0];
	convertRsToWord(amount);
	//alert("amount"+amount);alert(limit);alert(cate);
    var amount1 = amount++;
    amount1 = --amount;
   // alert("amount "+amount1);
	    if(name=="")
		{
		alert("Please Enter Beneficially Name");
		return false;
		}
		
		if(amount=="")
		{
		alert("Please Enter Amount To Pay");
		return false;
		}
		if(isNaN(amount))
	       {
		     alert("Please Enter Numeric Value for Amount");
		     return false;
	       }
	   // alert("amount1 -"+amount);	alert("limit  	"+limit);
		 //alert(amount > limit);
		if(amount > limit)
		{ alert("Amount- "+amount+" Eceeds the Max Limit For "+cate+ "\n Limit is "+limit);
	     return false;
			
		}
		if(refNo=="")
		{
		alert("Please Enter Refrance No. ");
		return false;
		}
		if(comment=="")
		{
		alert("Please Enter Comments");
		return false;
		}
		
		var agree=confirm("The Amount Entered is:"+document.getElementById('payAmount').value+"\n Are you want to continue");
		if (agree)
			return true ;
		else
			return false ;
		
		
		
		
		return true;
		
}

</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%
     erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
	 
	 Connection conn = null;
     Statement st = null,st1=null,st2=null;
     String SqlTrType="",sql="";
     String name="",category="";
     String date="";
     int limit=0;
%>

<%
try {
conn = erp.ReturnConnection();
st = conn.createStatement();
st1 = conn.createStatement();
st2 = conn.createStatement();


date=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
String flag=request.getParameter("flag");
System.out.println("flag  AFTER ALERT"+flag);

String tranType=request.getParameter("tranType");
System.out.println("tranType AFTER ALERT"+tranType);

String Flgfnewfile="";
Flgfnewfile= request.getParameter("Flgfnewfile");
if(Flgfnewfile==null)
{
Flgfnewfile="NO";	

}

if(Flgfnewfile.equalsIgnoreCase("yes") || Flgfnewfile=="yes")
{
%>
<script>
	alert("File Records are Saved Sussessfully.");
	abc1();
	function abc1()
	{
	var agree=confirm("Are you want to transaction continue");
	if(agree)
	{ 
		return true;
	}
	else
	{ 
		 window.open('Accounts.jsp','_self');
	}
	
	}
</script>
<%
}

System.out.println("Flgfnewfile" +Flgfnewfile);


if (null == request.getParameter("benfName"))
{
	  name = "";
}
else
{	name = request.getParameter("benfName");
}

%>
<body>
<form name="netbanking" id="netbanking" method="post" action="netbankInsert.jsp?Flgfnewfile=<%=Flgfnewfile%>">
<div>
<div style="font-size: 1.8em; text-align: center; margin-top: 0.0em; margin-bottom: 0.2em;">

				  <a>Net Banking</a></div> 
				  <a href="Accounts.jsp">BACK</a></div>  
    <table  border="0" height="62%" width="100%" >
	    <tr>
	    	<td> 
	    		  <table  align="center" valign="top" height="90%" width="70%" style=" border: 3px solid #C6DEFF; ">
	    	      <!--  <div id="entryform" align="center" style="width:70%;height:55%; border:thin solid; border-color: blue; position:absolute; border-radius: 12px 12px 12px 12px;">
	              -->
	    	       <tr><td width="17%"> &nbsp;&nbsp;&nbsp;Transaction Type </td>
	    	        <td  id="transtd">
	    	        
	    	        <select name="tranType" id="tranType" style="width: 200px; height: 20px; border: 1px solid black; font: small Arial, Helvetica, sans-serif; color: #000000;border-color: activeborder; ">
					
						<% 
	    	        	  SqlTrType="Select Accno,Description from "+session.getAttribute("CompanyMasterID").toString()+"netbankingaccmaster order by Description";
						 // System.out.println(SqlTrType);
	    	        	  ResultSet rs=st.executeQuery(SqlTrType);
	    	        	  
	    	        	  while(rs.next())
	    	        	  {
	    	        		  rs.getString("Accno");
	    	        		  rs.getString("Description");
	    	        		 // System.out.println(" Accno "+rs.getString("Accno")+ " Description "+rs.getString("Description"));
	    	        	  %>
					
						 <option value="<%=rs.getString("Accno")%>-<%=rs.getString("Description")%>"><%=rs.getString("Accno")%>-<%=rs.getString("Description")%></option>
						 <%} %>
						 </select>
						 <input type="hidden" id="tranType1" name="tranType1" value="<%=tranType%>"/>
						</td>
						<td width="21%"> &nbsp;&nbsp;&nbsp;Date</td>
						<td><input type="text" id="date"  name="date" value="<%=date%>" onchange="dateValidate(this.value,'<%=date%>');" size="15" readonly="readonly"
							style="width: 100px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE;  font: normal 11px Arial, Helvetica, sans-serif; background:#C0C0C0" />
							
							<script type="text/javascript">
							Calendar.setup(
							{
							inputField  : "date",         // ID of the input field
							ifFormat    : "%d-%b-%Y",    // the date format
							button      : "date"       // ID of the button
							}
							);
							</script>
							</td>
						
	    	        </tr>
	    	        
	    	        <tr>
	    	        <td>&nbsp;&nbsp;&nbsp;Beneficially Name</td>
	    	        <td>
	    	        <%/*sql="Select BeneficiaryName from "+session.getAttribute("CompanyMasterID").toString()+"netbanking order by BeneficiaryName";
				      		  System.out.println(sql);
					    	ResultSet rsname=st1.executeQuery(sql);
	    	        	  	 while(rsname.next())
	    	        		  {*/
	    	        %>
	    	       	<input type="text" name="benfName" id="benfName"  value="<%=name%>"  autocomplete="off" style="width: 200px; height: 20px; border: 1px solid black; font: small Arial, Helvetica, sans-serif; color: #000000;border-color: activeborder; " onkeyup="if (event.keyCode == 27){document.getElementById('NameList').style.display = 'none';} else { getCompanies('quotation'); }"/ >
						<div style="position: absolute;">
  						<table>
 						 <tr><td></td></tr>
 						 <tr><td>
  							<div id='NameList'>
 						 </div>
 						 </td></tr>
						  </table>
						</div>
					
						</td>
	    	        <td >&nbsp;&nbsp;&nbsp;Beneficially Bank Name</td>
	    	        <td ><input type="text" name="benfBankName" id="benfBankName" readonly="readonly"  style="width: 200px; height: 20px; border: 1px solid black; font: small Arial, Helvetica, sans-serif; color: #000000;border-color: activeborder;"/>
						 
						 <% //System.out.println(" name>>>>>>>>>"+name); 
						// sql="Select BeneBankName,IFCCode,BeneficiaryAccountNumber from "+session.getAttribute("CompanyMasterID").toString()+"netbanking where BeneficiaryName='"+name+"'";
						 //ResultSet rs1=st1.executeQuery(sql);
							//while(rs1.next())
							//{ 
							%><!-- <option value="<%//=rs1.getString("BeneBankName")%>"
								<%//if (name.equals(rs1.getString("BeneBankName"))) {%>
								Selected <%//}%>><%//=rs1.getString("BeneBankName")%></option>-->
							<%
							//}
						 %>
						
						</td>
	    	        </tr>
	    	        
	    	         <tr>
	    	        <td>&nbsp;&nbsp;&nbsp;Account No.</td>
	    	        <td>
	    	               <input type="text" name="accountNo" id="accountNo" readonly="readonly" style="width: 200px; height: 20px; border: 1px solid black; font: small Arial, Helvetica, sans-serif; color: #000000;border-color: activeborder; " onchange="ChangingClaimType();">
						      <!-- <select name="accountNo" id="accountNo" style="width: 200px; height: 20px; border: 1px solid black; font: small Arial, Helvetica, sans-serif; color: #000000;border-color: activeborder; " onchange="ChangingClaimType();">
						 <option value="localclaim">Local Claim</option>
						 <option value="travelclaim">Travel Claim</option>-->
						</td>
	    	        <td>&nbsp;&nbsp;&nbsp;IFSC code</td>
	    	        <td><input type="text" id="ifcCode" name="ifcCode" readonly="readonly" style="width: 200px; height: 20px; border: 1px solid black; font: small Arial, Helvetica, sans-serif; background: #FFFFFF;border-color: activeborder; " >
	    	        </td>
	    	        </tr>
	    	         <tr>
	    	        <td>&nbsp;&nbsp;&nbsp;Category</td>
	    	        <td><select name="category" id="category" style="width: 200px; height: 20px; border: 1px solid black; font: small Arial, Helvetica, sans-serif; color: #000000;border-color: activeborder; " onchange="ChangingClaimType();">
						 <%String sqlcatg="Select Category,limit1 from "+session.getAttribute("CompanyMasterID").toString()+"netbankingcategory where status='-' order by Category  ";
						   ResultSet rscat=st2.executeQuery(sqlcatg);
						   while(rscat.next())
						   {category=rscat.getString("Category");
						  %>
						 <option value="<%=category%>,<%=rscat.getString("limit1")%>"><%=rscat.getString("Category") %>  limit-<%=rscat.getString("limit1")%></option>
						 <%}
						   
						  /* 
						   String sqlcatg1="Select limit1 from "+session.getAttribute("CompanyMasterID").toString()+"netbankingcategory where Category='"+category+"'";
						   System.out.println(sqlcatg1);
						   ResultSet rscat1=st2.executeQuery(sqlcatg1);
						   while(rscat1.next())
						   {limit=rscat1.getInt("limit1");
						   }*/
						   %>
						   </select>
						   <input type="text" name="categorySelected" id="categorySelected" >
						   <input type="text" name="level1limit" id="level1limit" > 
						   
						</td>
	    	        <td>&nbsp;&nbsp;&nbsp;Comments</td>
	    	        <td><input type="text" id="comment" name="comment" size="15"
						style="width: 200px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE;  font: normal 11px Arial, Helvetica, sans-serif; background: # #DEDEDE" />
	    	        </td>
	    	        </tr>
	    	        <tr>
	    	        <td>&nbsp;&nbsp;&nbsp;Amount To Pay</td>
	    	        <td><input type="text" id="amount" name="amount" size="15" 
						style="width: 200px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE;  font: normal 11px Arial, Helvetica, sans-serif; background: # #000000" />
					</td>
	    	        <td>&nbsp;&nbsp;&nbsp;Ref No.</td>
	    	        <td><input type="text" id="refNo" name="refNo" size="15" onkeyup="fillpayamount();"
						style="width: 200px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE;  font: normal 11px Arial, Helvetica, sans-serif; background:# #000000" />
					</td>
	    	        </tr>
	    	        
	    	       
	    	        
	    	        <tr>
	    	        <td valign="top">&nbsp;&nbsp;&nbsp;PaymentAmount <br>&nbsp;&nbsp;&nbsp;Entered Is:
	    	        </td>
	    	        <td colspan="3">
	    	        	<h3><textarea readonly="readonly" name="payAmount" id="payAmount"   style="width: 700px; border: none; color:red; font: normal 16px Arial, Helvetica, sans-serif;" ></textarea></font>
	    	        	</h3>
	    	        </td>
	    	        </tr>
	    	        
	    	        <tr>
	    	        <td colspan="4" align="center" valign="top"><input type="submit" id="CreateFile" name="createFile" value="Create File" onclick="return validation();" style="border: outset; background-color: #FFFFFF" />	 	
	    	        </td>
	    	        </tr>
	    	     </div>
	    	      </table>
	    	     
	    	
	    	</td>
	    </tr>
	
	</table>
	</form>
	
<%	if(flag.equalsIgnoreCase("yes") || flag=="yes")
{   
%>
<script>
try{
abc();
}
catch(e)
{alert(e);}
function abc()
{  
	var agree=confirm("Do you want put another transaction in same file");

if (agree)
	{
	document.netbanking.tranType.disabled=true;
	return true ;
	
	}
else
	{
	    try{
			//alert("Data is Saved In File Successfully.");

	    	var tranType=document.getElementById("tranType").value;
		window.open('netBankAjaxSearch.jsp?type=update&tranType='+tranType+'','_self');
	    }catch(e){alert(e);}
	}
}

</script>
<%	
}
 }
catch(Exception e)
{System.out.println(" connection error "+e); 
}
%>	
	<div id="footer">
	<p><a href="http://www.192.168.2.133"> Copyright &copy; 2009
	by Transworld Compressor Technologies Ltd. All Rights Reserved.</a></p>
	</div>
<!-- end #footer -->
	

</body>
</jsp:useBean>