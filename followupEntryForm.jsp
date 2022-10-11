<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="header.jsp"%>
<script src="dropdown.js" type="text/javascript"></script>
		<script src="ledgerDetails.js" type="text/javascript"></script>

<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">
<%!Connection con;%>
<%
Class.forName(DB_Driver);
con = DriverManager.getConnection(DB_NAME, DB_USERNAME,DB_PASSWORD);
%>

<html>
    
	<style>
			body
			{
            margin: 0px;
            padding: 0px;
            }
            body .page { width: 750px; margin: 0 auto; }
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
            #tooltip
            {
  			  	position:relative;
    			font-family:arial,sans-serif;
    			font-size:10px;
    			color:#000;
    			padding:3px;
    			border:1px solid #000;
    			background-color:#ffe;
			}
			table.mysortable
			{
				text-align: left;
				font-family: Verdana, Geneva, Arial, Helvetica, sans-serif ;
				font-weight: normal;
				font-size: 11px;
				color: #fff;
				background-color: #1581AB; <!-- -->
				border: 0px;
				border-collapse: collapse;
				border-spacing: 0px;
			}

			table.mysortable td
			{
				background-color: #F8F8FF;
				color: #000;
				padding: 4px;
				border: 1px #808080 solid;
			}
			table.mysortable th
			{
				background-color: #1581AB;
				color: white;
				padding: 4px;
				border: 1px #808080 solid;
			}

			table.mysortable td.hed
			{
				background-color: #C6DEFF;
				color: #696969;
				padding: 4px;
				border-bottom: 2px #808080 solid;
				font-size: 12px;
				font-weight: bold;
			} 

			table.mysortable td.hed1
			{
				background-color: #C6DEFF;
				color: #696969;
				padding: 4px;
				border-bottom: 2px #808080 solid;
				font-size: 12px;
				font-weight: bold;
			} 

</style>
	<style type="text/css">
	
</style>


<script src="sorttable.js" type="text/javascript"></script>
<script type="text/javascript">

window.onload = function()
{
        getSpokenTo();
};

function getSpokenTo()
{
		 
		//var company=document.getElementById("Name").value;
		var company=document.addFolloUp.Name.value;
		//alert(company);
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
				
				document.addFolloUp.spokento.value=reslt.trim();
			//	document.getElementById("spokento").innerHTML=aa;
			} 
		}
		    //alert(company);
			queryString = "?company=" +company+"";
			ajaxRequest.open("GET", "getSpokenTo.jsp" + queryString, true);
			ajaxRequest.send(null); 
}	



function getClient1(id)
{
   //alert("in get"+id);
    if(id=="+")
    {//alert("123")
	  document.getElementById("otherclient").style.display="";
	  document.getElementById("client").style.display='none';
	 document.getElementById("client1").style.display="";
    }
    else
    {
    	document.getElementById("EmpNames").value=""; 
    }
}
function getClient2(id)
{// alert("in2 get"+id);
	if(id=="+")
    {
	document.getElementById("otherclient1").style.display="";
	document.getElementById("client1").style.display='none';
	document.getElementById("client2").style.display="";
	document.getElementById("A50").style.display="";
	
    }
	else
    {
		document.getElementById("EmpNames1").value=""; 
    	document.getElementById("otherclient").style.display='none';
    	document.getElementById("client").style.display="";
    	document.getElementById("client1").style.display='none';
    	document.getElementById("A50").style.display='none';
    	
    }
	
}

function getClient3(id)
{
	    document.getElementById("EmpNames2").value=""; 
    	document.getElementById("otherclient1").style.display='none';
    	document.getElementById("otherclient").style.display='';
    	document.getElementById("client1").style.display="";
    	
    	document.getElementById("client2").style.display="none";
    	document.getElementById("client3").style.display='none';
}




function showrow()
{
	try{
	//alert(document.getElementById("inorout").value);
	var show1=document.getElementById("paymentFollowUp");
	
	if(show1.checked==true ){
		document.getElementById("showpay").style.display = "";
		}
		
	else{
		document.getElementById("showpay").style.display = "none";
	}
}catch (e) {
	alert(e);
}
	}




function getEmp(id)
	{


//alert("Alert is " +id);


	//alert("m shoaib");
	
	 if(id==1)
    {
		document.getElementById("EmpList").style.display='block';
		var emp=document.getElementById("EmpNames").value;
    }
	 if(id==2)
	    {
		 document.getElementById("EmpList1").style.display='block';
			var emp=document.getElementById("EmpNames1").value;

	    }

	 if(id==3)
	    {
		 document.getElementById("EmpList2").style.display='block';
			var emp=document.getElementById("EmpNames2").value;
	    }


	 if(emp=="")
	 {
		 document.getElementById("EmpList").style.display='none';
		 document.getElementById("EmpList1").style.display='none';
		 document.getElementById("EmpList2").style.display='none';
	 }
	 else
	 {
//		alert(document.getElementById("EmpNames").value);
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
//alert("Result is "+reslt);
				if(id==1)
				{
				document.getElementById("EmpList").innerHTML=reslt;
				
				}

				if(id==2)
				{
				document.getElementById("EmpList1").innerHTML=reslt;
				}
				if(id==3)
				{
				document.getElementById("EmpList2").innerHTML=reslt;
				}
			} 
		}
		var queryString = "?emp="+emp+"&id="+id;
		//alert(""+queryString);
		ajaxRequest.open("GET", "GenericAjaxSearchME.jsp" + queryString, true);
		ajaxRequest.send(null); 
	 }//end of else
	}



function showVisitingCardDetails(eName,empMail,id)
{
	//alert("eName"+eName);
	//alert("empMail"+empMail);
	//alert("id jnjk"+id);
	
	if(id==1)
	{
	document.getElementById("EmpNames").value=empMail;
	document.getElementById("SelectedEmpMail").value=empMail;
	document.getElementById("EmpList").style.display='none';
	}
	if(id==2)
	{
	document.getElementById("EmpNames1").value=empMail;
	document.getElementById("SelectedEmpMail1").value=empMail;
	document.getElementById("EmpList1").style.display='none';
	}
	if(id==3)
	{
	document.getElementById("EmpNames2").value=empMail;
	document.getElementById("SelectedEmpMail2").value=empMail;
	document.getElementById("EmpList2").style.display='none';
	}
}

function getvalid()
{
//alert("hi");

	var fromdate=document.addFolloUp.fromdate.value;
	var threedaysbk = document.addFolloUp.threedaysbk.value;
	var fdate=document.addFolloUp.cpdate.value;
	var dm1,dd1,dy1,dm2,dd2,dy2;
	var dd11,yy11,mm1,mm2,mm11,dd22,yy22,mm22;



	
	dd11=fromdate.substring(0,2);
	dd22=threedaysbk.substring(0,2);
	
	
	mm1=fromdate.substring(3,6);
	mm2=threedaysbk.substring(3,6);
	
	
	mm11=dateformat(mm1);
	mm22=dateformat(mm2);
	
	

	yy11=fromdate.substring(7,11);
	yy22=threedaysbk.substring(7,11);

	

	if(yy11 < yy22)
	{
		alert("Follow-Up is not allowed for this date");
		
		document.addFolloUp.fromdate.value=fdate;
		return false;
	}
	
	else if(yy11==yy22)
	{
		
			
		if(mm11<mm22)
		{
			alert("Follow-Up is not allowed for this date");
			
			document.addFolloUp.fromdate.value=fdate;			
			return false;
		}
			else if(mm11==mm22)

			{
				
				//alert("hi");
				if(dd11<dd22)
				{
					alert("Follow-Up is not allowed for this date");
					
					document.addFolloUp.fromdate.value=fdate;
										
					return false;
				}
				
			}
	}

	
	
	
}









function validate()
{
	//alert("Hi***");
	var tt=document.addFolloUp.inorout.value;
	var cmt=document.addFolloUp.comments.value;
	
	var oth=cmt.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
	var contactPerson=document.addFolloUp.spokento.value;
	var amt=document.addFolloUp.expectedamnt.value;
	//alert(tt);
	 var invalid=/[^A-Za-z\s]/;
	var followtype=document.addFolloUp.followUpType.value;
	var spoken=document.addFolloUp.spokento.value;
	
	var othspoken=spoken.replace(/^\s\s*/, '').replace(/\s\s*$/, '');



	
		    	  
if(followtype=="Select")
{
	alert("Please select follow up type" );
	return false;
}

if(spoken=="" || othspoken=="")
{
	alert("Please enter spoken to" );
	return false;
}
if(invalid.test(contactPerson)){
    alert('Please enter characters value for spokan to..');  
    return false;
}
		    		
	if(document.addFolloUp.comments.value=='' || oth=="")
	{
		alert("Please Enter Comments" );
		return false;
	}
	
/*	if(document.addFolloUp.todate.value=='')
	{
		alert("Please Enter Next Follow-Up Date" );
		return false;
	}

*/
//alert("hi11");
var fromdate=document.addFolloUp.fromdate.value;

var todate=document.addFolloUp.todate.value;
//var hrs=document.addFolloUp.hrs.value;
//var mins=document.addFolloUp.mins.value;
var dm1,dd1,dy1,dm2,dd2,dy2;
var dd11,yy11,mm1,mm2,mm11,dd22,yy22,mm22;

dd11=todate.substring(0,2);
dd22=fromdate.substring(0,2);


mm1=todate.substring(3,6);
mm2=fromdate.substring(3,6);


mm11=dateformat(mm1);
mm22=dateformat(mm2);

yy11=todate.substring(7,11);
yy22=fromdate.substring(7,11);

var	h1=fromdate.substring(12,14);
var	m1=fromdate.substring(15,17);

var	hrs=todate.substring(12,14);
var	mins=todate.substring(15,17);

//alert("h1 "+h1);
//alert("m1 "+m1);

//alert("hrs "+hrs);
//alert("mins "+mins);



if(yy11 < yy22)
{
	alert("Selected Next Follow Up Date should be greater than Follow Up Date");
	
	return false;
}

else if(yy11==yy22)
{
	
		
	if(mm11<mm22)
	{
		alert("Selected Next Follow Up Date should be greater than Follow Up Date");
		
		return false;
	}
		else if(mm11==mm22)

		{
			
			
			if(dd11<dd22)
			{
				alert("Selected Next Follow Up Date should be greater than Follow Up Date");
				
				return false;
			}
			else if(dd11==dd22)
			{
				
				 if(hrs<h1)
				{
						alert("Selected Next Follow Up Time should be greater than Follow Up Time");
					return false;
					}	

				else if(hrs==h1)
				{
					
					 if(mins<=m1)
					{
							alert("Selected Next Follow Up Time should be greater than Follow Up Time");
						
						return false;
					}

					 
				}




				}
		}
}





	
	if(isNaN(amt))
	{
		alert("Please enter numeric value for excepted ammount");
		return false;
	}

	


	//var docTypeN = document.getElementById("documentTypeN").options[document.getElementById("documentTypeN").selectedIndex].innerHTML;
	// var docTypeN = document.getElementById("documentTypeN").options[document.getElementById("documentTypeN").selectedIndex].innerHTML;
	// var fileN = document.getElementById("upN").value.trim();

	 var docType = document.getElementById("documentType").options[document.getElementById("documentType").selectedIndex].innerHTML;
	 var file = document.getElementById("up").value.trim();

	 var docType1 = document.getElementById("documentType1").options[document.getElementById("documentType1").selectedIndex].innerHTML;
	 var file1 = document.getElementById("up1").value.trim();

	 var docType2 = document.getElementById("documentType2").options[document.getElementById("documentType2").selectedIndex].innerHTML;
	 var file2 = document.getElementById("up2").value.trim();

	 var docType3 = document.getElementById("documentType3").options[document.getElementById("documentType3").selectedIndex].innerHTML;
	 var file3 = document.getElementById("up3").value.trim();

	 var docType4 = document.getElementById("documentType4").options[document.getElementById("documentType4").selectedIndex].innerHTML;
	 var file4 = document.getElementById("up4").value.trim();

	 //alert(">>"+docType+"  "+file);
	 //alert(">>"+(docType == "Select" && !(file == "")));
	 	 
/*	 if(docTypeN == "Select" && !(fileN == ""))
	 {
	 	alert("Pls select document type!");	
	 	return false;
	 }
*/
	 //alert(document.getElementById("tr1").style.display == "");

	 if(document.getElementById("tr1").style.display != "none")
	 {
	 	if(docType == "Select" && !(file == ""))
	 	{
	 		alert("Pls select document type!");	
	 		return false;
	 	}

	 }

	 if(document.getElementById("tr5").style.display != "none")
	 {
	 	if(docType1 == "Select" && !(file1 == ""))
	 	{
	 		alert("Pls select document type!");	
	 		return false;
	 	}

	 }

	 if(document.getElementById("tr7").style.display != "none")
	 {
	 	if(docType2 == "Select" && !(file2 == ""))
	 	{
	 		alert("Pls select document type!");	
	 		return false;
	 	}

	 }

	 if(document.getElementById("tr9").style.display != "none")
	 {
	 	if(docType3 == "Select" && !(file3 == ""))
	 	{
	 		alert("Pls select document type!");	
	 		return false;
	 	}

	 }

	 if(document.getElementById("tr11").style.display != "none")
	 {
	 	if(docType4 == "Select" && !(file4 == ""))
	 	{
	 		alert("Pls select document type!");	
	 		return false;
	 	}

	 }



	 return true;
		
//	alert("Check for Comments"+document.addFolloUp.comments.value);
	
	
	/*var userDate = document.addFolloUp.fromdate.value;
	//alert("111 "+userDate);
	var fourdaysbk = document.addFolloUp.fourdaysback.value;
	//alert("222 "+fourdaysbk);
	var ydy = document.addFolloUp.yesterday.value;
	//alert("333 "+ydy);
	if(userDate < fourdaysbk)
	{
		alert("Follow-Up For "+userDate+" Is Not Allowed");
		return false;
	}
	return true; */
}

function dateformat(days)
{
if(days=='Jan')
return(01);
else
if(days=='Feb')
	return(02);
else
	if(days=='Mar')
		return(03);
	else
		if(days=='Apr')
			return(04);
		else
			if(days=='May')
				return(05);
			else
				if(days=='Jun')
					return(06);
				else
					if(days=='Jul')
						return(07);
					else
						if(days=='Aug')
							return(08);
						else
							if(days=='Sep')
								return(09);
							else
								if(days=='Oct')
									return(10);
								else
									if(days=='Nov')
										return(11);
									else
										if(days=='Dec')
											return(12);
}

function change()
{
	//document.addFolloUp.submitFollowUp.value="";
	
	return false;
}

/*
function attach()
{
alert("1");

	    document.getElementById("tr1").style.display="none";
        document.getElementById("tr2").style.display=""; 
    //document.getElementById("Attach2").style.display="";
        document.getElementById("tr3").style.display="";
		document.getElementById("imageDiv1").style.display="";
		document.getElementById("filetd1").style.display="";
        
    
    
    
}


function attach1()
{
	//alert("2");

	document.getElementById("tr3").style.display="none";
    document.getElementById("tr4").style.display=""; 
    
        document.getElementById("tr5").style.display=""; 
        document.getElementById("imageDiv2").style.display="";
		document.getElementById("filetd2").style.display="";
        
    
	    
}
function attach2()
{
	document.getElementById("tr5").style.display="none";
    document.getElementById("tr6").style.display=""; 
    
        document.getElementById("tr7").style.display=""; 
        document.getElementById("imageDiv3").style.display="";
		document.getElementById("filetd3").style.display="";
        
    
}
function attach3()
{
	document.getElementById("tr7").style.display="none";
    document.getElementById("tr8").style.display=""; 
    
        document.getElementById("imageDiv4").style.display="";
		document.getElementById("filetd4").style.display="";
        
}

*/






function attach()
{
	try{
	//alert("Hii att");
	//alert("in attach ");
	
		
var cnt=document.addFolloUp.counter.value;
//alert("351 count "+cnt);
if(cnt>0)
{
	//alert("count "+cnt);
}
else 
{
cnt=1;
var flagvalue=document.addFolloUp.flagvalue.value;
flagvalue++;
document.addFolloUp.flagvalue.value=flagvalue;
//alert(cnt);
document.addFolloUp.counter.value=cnt;

       document.getElementById("tr1").style.display="";   
	     //document.getElementById("comm").style.display="";   
	       	
       document.addFolloUp.Filename1.style.display="";
      // document.incident.Filename1.value="";
      //document.getElementById("imageDiv").innerHTML="";
       document.getElementById("imageDiv").style.display="none";
     //  document.incident.Upload.style.display="";  
       document.getElementById("tr2").style.display="";   
}
	}catch(e)
	{
		alert(e);
	}
}

function attach1()
{
	var cnt=document.addFolloUp.counter.value;
	cnt++;
	//alert(cnt);
	document.addFolloUp.counter.value=cnt;
	//alert("in attach1 ");
	
	document.getElementById("tr5").style.display="";  
	document.addFolloUp.Filename2.style.display="";
	//document.getElementById("imageDiv1").innerHTML="";
    document.getElementById("imageDiv1").style.display="none" ;	
    document.getElementById("tr2").style.display="none"; 
    document.getElementById("tr6").style.display="";  
}
function attach2()
{
	var cnt=document.addFolloUp.counter.value;
	cnt++;
	//alert(cnt);
	document.addFolloUp.counter.value=cnt;
	//alert("in attach2 ");
	document.getElementById("tr7").style.display="";   
	document.addFolloUp.Filename3.style.display="";
	//document.getElementById("imageDiv2").innerHTML="";
    document.getElementById("imageDiv2").style.display="none";
    document.getElementById("tr6").style.display="none"; 
    document.getElementById("tr8").style.display="";  
}
function attach3()
{
	var cnt=document.addFolloUp.counter.value;
	cnt++;
	//alert(cnt);
	document.addFolloUp.counter.value=cnt;
	//alert("in attach3 ");
	document.getElementById("tr9").style.display="";   
	document.addFolloUp.Filename4.style.display="";
	//document.getElementById("imageDiv3").innerHTML="";
    document.getElementById("imageDiv3").style.display="none";
    document.getElementById("tr8").style.display="none"; 
    document.getElementById("tr10").style.display="";  
}
function attach4()
{
	var cnt=document.addFolloUp.counter.value;
	cnt++;
	//alert(cnt);
	document.addFolloUp.counter.value=cnt;
	//alert("in attach4 ");
	document.getElementById("tr11").style.display="";
	document.addFolloUp.Filename5.style.display="";
	//document.getElementById("imageDiv4").innerHTML="";
    document.getElementById("imageDiv4").style.display="none";   	
    document.getElementById("tr10").style.display="none"; 
    //document.getElementById("tr12").style.display="";  
   // document.write("<tr align='center' id='tr23' style='' bgcolor='#FFF6F7'><td><div id='imageDiv' align='center'><font color='maroon' size='2'><b></b></font></div></td><td><input type='file' cols='40' name='Filename' value=''></td></tr>");
}


function upload()
{
	try{
		var id_value = document.getElementById('up').value;
		var file1=document.addFolloUp.Filename1.value;
	

		 if(id_value != '')
		 { 
			 var valid_extensions = /(.jpg|.jpeg|.doc~|.doc|.txt|.png|.pdf|.ods|.xls|.txt~)$/i;
			// var valid_type = /(.txt|.jpeg|.doc)$/i;
			    
		  if(valid_extensions.test(id_value))
		  { 
			
			  document.addFolloUp.Filename1.style.display="none";
				document.getElementById("imageDiv").style.display="";
				document.getElementById("f1").innerHTML=file1;
			  
		   //alert('OK');
		  }
		 // else if()
		  else
		  {
			 
			 
			 
			 var cnt=document.addFolloUp.counter.value;
   
   /// cnt--;
   // alert(cnt);
    if(cnt==0)
    {
    	document.addFolloUp.counter.value=cnt;
 		cleareall();
 		document.getElementById("f1").innerHTML=""; 	
 		
    }
    else
    {
    	 document.addFolloUp.Filename1.style.display="none";
			document.getElementById("imageDiv").style.display="";
			document.getElementById("f1").innerHTML=file1;
/*
    document.addFolloUp.counter.value=cnt;
	 document.addFolloUp.Filename1.value="";

	 document.addFolloUp.Filename2.value="";
	     document.getElementById("tr1").style.display="none";
	     //document.getElementById("comm").style.display="none";   
	        
       document.getElementById("tr2").style.display="none"; 
       document.getElementById("f1").innerHTML="";
        */ 	
}
		//	  alert("Please Upload only doc,jpg,pdf,png,ods,xls,txt and jpeg Formatted File");
		   
		  }
		 }
	
	//alert(file1);
	
	
	//document.incident.Upload.style.display="none";
	
	
	} catch(e)
	{
		alert(e);
	}

}

function upload1()
{
	try{
		var file1=document.addFolloUp.Filename2.value;
		var id_value = document.getElementById('up1').value;

		 if(id_value != '')
		 { 
			  var valid_extensions = /(.jpg|.jpeg|.doc~|.doc|.txt|.png|.ods|.xls|.pdf|.txt~)$/i;
		  if(valid_extensions.test(id_value))
		  { 
		//alert(file1);
		
		document.addFolloUp.Filename2.style.display="none";
		document.getElementById("imageDiv1").style.display="";
		document.getElementById("f2").innerHTML=file1;
		//document.incident.Upload.style.display="none";
		
		
		}
		  else
		  {

			  var cnt=document.addFolloUp.counter.value;
			   
			//    cnt--;
			  // alert(cnt);
			    if(cnt==0)
			    {
			    	document.addFolloUp.counter.value=cnt;
					cleareall();
					document.getElementById("f2").innerHTML=""; 
			    }
			    else
			    {

			    	document.addFolloUp.Filename2.style.display="none";
					document.getElementById("imageDiv1").style.display="";
					document.getElementById("f2").innerHTML=file1;
/*
			    document.addFolloUp.counter.value=cnt;
				
					  document.addFolloUp.Filename2.value="";
				       document.getElementById("tr5").style.display="none";   
				       document.getElementById("f2").innerHTML="";
				       */ 
			}
		//	  alert("Please Upload only doc,jpg,pdf,png,ods,xls,txt and jpeg Formatted File");
		   
		  }
		 }
	}catch(e)
		{
			alert(e);
		}
}

function upload2()
{
	try{
		var file1=document.addFolloUp.Filename3.value;
		var id_value = document.getElementById('up2').value;

		 if(id_value != '')
		 { 
			  var valid_extensions = /(.jpg|.jpeg|.doc~|.doc|.txt|.png|.pdf|.ods|.xls|.txt~)$/i;
		  if(valid_extensions.test(id_value))
		  { 
		//alert(file1);
		
		document.addFolloUp.Filename3.style.display="none";
		document.getElementById("imageDiv2").style.display="";
		document.getElementById("f3").innerHTML=file1;
		//document.incident.Upload.style.display="none";
		

			}
			  else
			  {

				  var cnt=document.addFolloUp.counter.value;
				   
				//    cnt--;
				   // alert(cnt);
				    if(cnt==0)
				    {
				    	document.addFolloUp.counter.value=cnt;
						cleareall();
						document.getElementById("f3").innerHTML=""; 
				    }
				    else
				    {

				    	document.addFolloUp.Filename3.style.display="none";
						document.getElementById("imageDiv2").style.display="";
						document.getElementById("f3").innerHTML=file1;
					    /*
				 
				    document.addFolloUp.counter.value=cnt;
					
					 document.addFolloUp.Filename3.value="";
					document.getElementById("tr7").value=""; 
				       document.getElementById("tr7").style.display="none"; 
				       document.getElementById("f3").innerHTML="";
					       */ 
				} 
			//	  alert("Please Upload only doc,jpg,pdf,png,ods,xls,txt and jpeg Formatted File");
			   
			  }
			 }
		}catch(e)
		{
			alert(e);
		}
}

function upload3()
{
	try{
		var file1=document.addFolloUp.Filename4.value;
		var id_value = document.getElementById('up3').value;

		 if(id_value != '')
		 { 
			  var valid_extensions = /(.jpg|.jpeg|.doc~|.doc|.txt|.png|.pdf|.ods|.xls|.txt~)$/i;
		  if(valid_extensions.test(id_value))
		  { 
		//alert(file1);
		
		document.addFolloUp.Filename4.style.display="none";
		document.getElementById("imageDiv3").style.display="";
		document.getElementById("f4").innerHTML=file1;
		//document.incident.Upload.style.display="none";


	}
	  else
	  {
		  var cnt=document.addFolloUp.counter.value;

		  //  cnt--;
		  // alert(cnt);
		    if(cnt==0)
		    {
		    	document.addFolloUp.counter.value=cnt;
				cleareall();
				document.getElementById("f4").innerHTML=""; 
		    }
		    else
		    {

		    	document.addFolloUp.Filename4.style.display="none";
				document.getElementById("imageDiv3").style.display="";
				document.getElementById("f4").innerHTML=file1;
			    /*

		    document.addFolloUp.counter.value=cnt;
			
			 document.addFolloUp.Filename4.value="";
			document.getElementById("tr9").value=""; 
		    document.getElementById("tr9").style.display="none";
		    document.getElementById("f4").innerHTML="";
			    */ 
		   
		}
		 
		//  alert("Please Upload only doc,jpg,pdf,png,ods,xls,txt and jpeg Formatted File");
	   
	  }
	 }
		
		}catch(e)
		{
			alert(e);
		}
}

function upload4()
{
	try{
		var file1=document.addFolloUp.Filename5.value;
		var id_value = document.getElementById('up4').value;

		 if(id_value != '')
		 { 
			  var valid_extensions = /(.jpg|.jpeg|.doc~|.doc|.txt|.png|.pdf|.ods|.xls|.txt~)$/i;  
		  if(valid_extensions.test(id_value))
		  { 
		//alert(file1);
		
		document.addFolloUp.Filename5.style.display="none";
		document.getElementById("imageDiv4").style.display="";
		document.getElementById("f5").innerHTML=file1;
		//document.incident.Upload.style.display="none";
		


	}
	  else
	  {
		  var cnt=document.addFolloUp.counter.value;

		//    cnt--;
		   //alert(cnt);
		    if(cnt==0)
		    {
		    	document.addFolloUp.counter.value=cnt;
				cleareall();
				document.getElementById("f5").innerHTML=""; 
		    }
		    else
		    {

		    	document.addFolloUp.Filename5.style.display="none";
				document.getElementById("imageDiv4").style.display="";
				document.getElementById("f5").innerHTML=file1;

		/*    document.addFolloUp.counter.value=cnt;
			
			 document.addFolloUp.Filename5.value="";
			document.getElementById("tr11").value=""; 
		       document.getElementById("tr11").style.display="none";  
		       document.getElementById("f5").innerHTML="";
			       */ 
		  	
		}
		//  alert("Please Upload only doc,jpg,pdf,png,ods,xls,txt and jpeg Formatted File");
	   
	  }
	 }
		}catch(e)
		{
			alert(e);
		}
}


function cancel()
{
	//alert("in cancel");
	var cnt=document.addFolloUp.counter.value;
   
    cnt--;
   // alert(cnt);
    if(cnt==0)
    {
    	document.addFolloUp.counter.value=cnt;
 		cleareall();
 		document.getElementById("f1").innerHTML=""; 	
 		
    }
    else
    {

    document.addFolloUp.counter.value=cnt;
	 document.addFolloUp.Filename1.value="";

	 document.addFolloUp.Filename2.value="";
	     document.getElementById("tr1").style.display="none";  
	     //document.getElementById("comm").style.display="";   
	      
       document.getElementById("tr2").style.display="none"; 
       document.getElementById("f1").innerHTML=""; 	
}
}
function cancel1()
{//alert("in cancel 1");
	var cnt=document.addFolloUp.counter.value;
   
    cnt--;
  // alert(cnt);
    if(cnt==0)
    {
    	document.addFolloUp.counter.value=cnt;
		cleareall();
		document.getElementById("f2").innerHTML=""; 
    }
    else
    {

    document.addFolloUp.counter.value=cnt;
	
		  document.addFolloUp.Filename2.value="";
	       document.getElementById("tr5").style.display="none";   
	       document.getElementById("f2").innerHTML="";
	       //document.getElementById("tr2").style.display=""; 
}
}
function cancel2()
{//alert("in cancel 2");
	var cnt=document.addFolloUp.counter.value;
   
    cnt--;
   // alert(cnt);
    if(cnt==0)
    {
    	document.addFolloUp.counter.value=cnt;
		cleareall();
		document.getElementById("f3").innerHTML=""; 
    }
    else
    {
 
    document.addFolloUp.counter.value=cnt;
	
	 document.addFolloUp.Filename3.value="";
		document.getElementById("tr7").value=""; 
       document.getElementById("tr7").style.display="none"; 
       document.getElementById("f3").innerHTML=""; 
       //document.getElementById("tr6").style.display="";
}
}
function cancel3()
{//alert("in cancel 3");
	var cnt=document.addFolloUp.counter.value;

    cnt--;
  // alert(cnt);
    if(cnt==0)
    {
    	document.addFolloUp.counter.value=cnt;
		cleareall();
		document.getElementById("f4").innerHTML=""; 
    }
    else
    {

    document.addFolloUp.counter.value=cnt;
	
	 document.addFolloUp.Filename4.value="";
	document.getElementById("tr9").value=""; 
    document.getElementById("tr9").style.display="none";
    document.getElementById("f4").innerHTML="";
    //document.getElementById("tr8").style.display=""; 
   
}
}
function cancel4()
{//alert("in cancel 4");
	var cnt=document.addFolloUp.counter.value;

    cnt--;
   //alert(cnt);
    if(cnt==0)
    {
    	document.addFolloUp.counter.value=cnt;
		cleareall();
		document.getElementById("f5").innerHTML=""; 
    }
    else
    {

    document.addFolloUp.counter.value=cnt;
	
	 document.addFolloUp.Filename5.value="";
	document.getElementById("tr11").value=""; 
       document.getElementById("tr11").style.display="none";  
       document.getElementById("f5").innerHTML=""; 
       //document.getElementById("tr10").style.display="";
  	
}
}

function cleareall()
{
	//alert("in clear");
	var cnt = document.addFolloUp.counter.value;
	//alert("cnt =>"+cnt);
	 document.getElementById("tr").style.display="";
	 document.getElementById("plusN").style.display="";
	 document.getElementById("tr1").style.display="none"; 
     document.getElementById("tr5").style.display="none"; 
     document.getElementById("tr7").style.display="none"; 
     document.getElementById("tr9").style.display="none"; 
     document.getElementById("tr11").style.display="none"; 
     document.addFolloUp.Filename1.value="";
	 document.addFolloUp.Filename2.value="";
	 document.addFolloUp.Filename3.value="";
	 document.addFolloUp.Filename4.value="";
	 document.addFolloUp.Filename5.value="";
	 //alert("cnt =>"+cnt);
	 document.addFolloUp.counter.value=cnt;
}

</script>
<head>
<title>Add Follow-up For Customer</title>
</head>
<body>
<%  
    String custCode = "";
    String fromDateCal = "",toDateCal = "";
    Date d = new Date();
	Format df1 = new SimpleDateFormat("yyyy-MM-dd");
	String dtoday = df1.format(d);
	DateFormat df = new SimpleDateFormat("dd-MMM-yyyy");
	DateFormat d1 = new SimpleDateFormat("yyyy-MM-dd");
	Format d2 = new SimpleDateFormat("HH:mm:ss");
	String incdReg = d2.format(d);
	String hrTime = incdReg.substring(0, 2);
	String minTime = incdReg.substring(3, 5);
	System.out.println(">>>>>>>>>>>>dtoday:" + dtoday);
	
	fromDateCal = toDateCal = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date());
	
    String todaysTime = new SimpleDateFormat(" HH:mm:ss").format(new java.util.Date());
    Date tdy = new Date();
	Date tomorrow = new Date();
	Calendar cal = Calendar.getInstance();
	Calendar now = Calendar.getInstance();
	cal.setTime(tdy);
	String todaysDate = new SimpleDateFormat("dd-MMM-yyyy").format(tdy);
	cal.add(Calendar.DAY_OF_MONTH, -1);
	Date YesterdaysDateAsDate = cal.getTime();
	String yesterdaysDate = new SimpleDateFormat("dd-MMM-yyyy").format(YesterdaysDateAsDate);
	
	
	

	Date today = new Date();
	cal.setTime(today);
	cal.add(Calendar.DAY_OF_MONTH, -3);
	Date  datebeforefourdays=cal.getTime();
	String dateFrBack=new SimpleDateFormat("yyyy-MM-dd").format(datebeforefourdays);
	
	
	String dateFrBackInMMM=new SimpleDateFormat("dd-MMM-yyyy").format(datebeforefourdays);
	
	
	System.out.println(dateFrBackInMMM+"())))))))))))))))))))))  ");
	
	String msg=request.getParameter("msg");
	System.out.println("msg number is >>>> " +msg);

	if(msg !=null)
	{
		%>
		
		<script type="text/javascript">
		//var msg="";
		//alert("respond msg"+msg);
		//if(msg=="No")
		//{
	//		alert("Error in Adding Follow Up Entry");
	//	}
	//	else
	//	{
	//	alert("Follow Up is added successfully in system");
	//	window.location.href("home.jsp");
	//	window.close();
	//	}
		</script>
		
		<%
	}
	
	
	
	
	
	
		
%>    
<form action="addFollowUp.jsp" name="addFolloUp" method="post" enctype="multipart/form-data" onsubmit="return validate();">
          <input type="hidden" name="yesterday" id="yesterday" value="<%=yesterdaysDate%>">
          <input type="hidden" name="threedaysbk" id="threedaysbk" value="<%=dateFrBackInMMM %>">
                    <input type="hidden" name="cpdate" id="cpdate" value="<%=fromDateCal%>">
          
          
          
          <input type="hidden" name="spokenPerson" id="spokenPerson" value="">
<%  
String company = "";
if(request.getParameter("Company") == null || request.getParameter("Company").equals(""))
{
	System.out.println("*******prosp***********---------jjjjjjkkkll*******"+request.getParameter("Prospect"));
	company = request.getParameter("Prospect");
	
}
else
{
	System.out.println("*******cust******************"+request.getParameter("Company"));
    company = request.getParameter("Company"); 
}
Statement stmt1 = con.createStatement();
Statement stmt2 = con.createStatement();
String checkSQL = "select * from "+session.getAttribute("CompanyMasterID").toString()+"prospectivecustmaster where CompanyName ='" + company + "' and SalesCustomerCode != 0 limit 1";
ResultSet rs = stmt1.executeQuery(checkSQL);
System.out.println(checkSQL);
if(rs.next())
{
	System.out.println("IN IFFF  ");
	custCode = rs.getString("CustomerCode");
	System.out.println("*******cust******************"+custCode);
}
else
{
	String checkSQL1 = "select * from   "+session.getAttribute("CompanyMasterID").toString()+"prospectivecustmaster where CompanyName ='" + company + "' and 	SalesCustomerCode = 0 limit 1";
	ResultSet rs1 = stmt2.executeQuery(checkSQL1);
	if(rs1.next())
	{
		System.out.println("IN ELSE ELSE   ");
		custCode = rs1.getString("CustomerCode");
		System.out.println("*************prosp************"+custCode);
	}
}


System.out.println(custCode+"  **  "+company);

String sqldata = "select * from "+session.getAttribute("CompanyMasterID").toString()+"prospectivecustmaster where CustomerCode  ='" + custCode + "' and CompanyName= '"+company+"' limit 1";
System.out.println("********checking followup.....shoaib******"+sqldata);
System.out.println(sqldata);
ResultSet rsdata = stmt1.executeQuery(sqldata);
System.out.println(sqldata);
  if(rsdata.next())
   {
	  
	  System.out.println("&&&&&&&&&&&&&&&&&7");
	   %>
	   	    <input type="hidden" name="Code" id="Code" value="<%=rsdata.getString("CustomerCode")%>">
			<input type="hidden" name="city" id="city" value="<%=rsdata.getString("City")%>">
			<input type="hidden" name="contactperson" id="contactperson" value="<%=rsdata.getString("ContactPerson")%>">
			<input type="hidden" name="Name" id="Name" value="<%=rsdata.getString("CompanyName")%>">
	   <%
	   
   }
   else
   {
	   System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^7");
	   System.out.println(request.getParameter("Prospect"));
	   
       if( request.getParameter("Prospect")==null ||  request.getParameter("Prospect").equals("") || request.getParameter("Prospect").equals("null") || request.getParameter("Prospect").contains("null"))
        {
    	   System.out.println("IIIIIIIIIFFFFFFFFFFFFFFFFFfff");
          %>
			<input type="hidden" name="Code" id="Code" value="<%=request.getParameter("companycode")%>">
			<input type="hidden" name="Name" id="Name" value="<%=request.getParameter("Company")%>">
			<input type="hidden" name="city" id="city" value="<%=request.getParameter("companyCity")%>">
			<input type="hidden" name="contactperson" id="contactperson" value="<%=request.getParameter("companyContactPerson")%>">
          <%
        }
       else
       {
    	   System.out.println("EEEEEEEEEEEEEEEEELLLLLLLLLLLSSSSSSSSSSSSEEEEEEEee");
    	  %>
			<input type="hidden" name="Code" id="Code" value="<%=request.getParameter("customercode")%>">
			<input type="hidden" name="Name" id="Name" value="<%=request.getParameter("Prospect")%>">
			<input type="hidden" name="city" id="city" value="<%=request.getParameter("customerCity")%>">
			<input type="hidden" name="contactperson" id="contactperson" value="<%=request.getParameter("customerContactPerson")%>">
    	  <%   
       }
       System.out.println("213234232322344 ");
   }
  
  System.out.println("OUT OUT ");
      %>           
            
                  <div id="entry" style="margin-left:18%;margin-right:10%; margin-top:2%; height:425;width:70%; position:absolute; background-color: #E8EFF4; border-radius: 12px 12px 12px 12px;" >
            
	<div  style="background: url(images/main_col_bg1.png) no-repeat top left #F0F3F6 ;text-align: center;width: 100%">
            
            <table style="width: 100%">
            <tr>
            
            	<td align="center" colspan="5"><font face="Arial" color="black" size="3">
							
						 <b>Enter Follow Up</b></font><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face="Arial" size="2" >(<font color="red"> *</font> indicates mandatory fields)</font></br>
							</td>
            
            <td>
            </table>
            </div>
            
            
            
            
            
            
			<table style="width: 95%" >
			<tr>
			<br></br>
				</tr> 
				<tr>
					<td colspan="1">
					<table  style="width: 90%"   align="center" cellspacing="1">
					
					<tr>
							<th  style="width: 20%" align="left"><font size="2" face="Arial" color="black"><b>&nbsp;Follow Up Date/Time </b></font></th>
							<td  style="width: 30%" align="left" valign="top">
							<input type="text" id="fromdate" name="fromdate" value='<%=fromDateCal%>' size="15" readonly="readonly"	style="width: 60%; padding: 4px 5px 2px 5px; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF" onchange="getvalid();" />
							<!--<input type="button" name="From Date" value="From Date" id="trigger">-->
							<script type="text/javascript">
						Calendar.setup( {
							inputField : "fromdate", // ID of the input field
							ifFormat : "%d-%b-%Y %H:%M", // the date format
							button : "fromdate",
							showsTime	: "true" 
								 // ID of the button
						});
					</script>	
					
										
					
					
					
					<input type="hidden" name="followuptime" value="<%=todaysTime%>"/>				
					</td>
					<td></td>
						<th style="width: 22%" align="left"><font size="2" face="Arial" color="black"><b>Follow Up IN/OUT </b></font></th>
						<td  style="width: 50%">
						<input type="radio" name="inorout"  value="in" />
						<font size="2" face="Arial" color="black"><b>IN</b></font> &nbsp;&nbsp;&nbsp;  
						<input type="radio" name="inorout" checked="checked"  value="out" />
						
						<font size="2" face="Arial" color="black"><b>OUT</b></font></td>
						</tr>
						
						<tr>
					
							<th style="width: 2%" align="left"><font size="2" face="Arial" color="black"><b>&nbsp;Status </b></font> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
							
							<td style="width: 2%" class="element select medium" style="vertical-align: top;" align="left"><select
								name="followUpStatus" id="followUpStatus" style='width: 70%;'>
													<option value="select">Select</option>
								
								<option value="cold">Cold</option>
								<option value="hot">Hot</option>
								<option value="warm">Warm</option>
							</select></td>
<td style="width: 2%"></td>
					
							<th  style="width: 22%" align="left"><font size="2" color="red">*</font><font size="2" face="Arial" color="black"><b>Follow Up Type </b></font></th>
							<td style="width: 2%" style="vertical-align: top;" align="left">
							<select
								name="followUpType" id="followUpType" style='width: 80%;'>
														  	<option value="Select">Select</option>
								
									<option value="ActionPoints">Action Points</option>
									<option value="E-mail">E-mail</option>
								
								<option value="Letter">Letter</option>
								<option value="Meeting">Meeting</option>
								<option value="phoneCall">Phone Call</option>
								<option value="Visit">Visit</option>
								
								
							</select></td>
					</tr>
					
					</table>
					</td>
					</tr>
					</table>
					
						<table style=" width: 90%">
			<tr>
				</tr>
				<tr>
					<td colspan="1" >
					<table style=" width: 90%" align="center"  cellspacing="1">
						
						<tr>
						<th align="left" style=" width: 1.6%" ><font size="2" color="red">*</font><font face="Arial" size="2" color="black"><b>Spoken To </b></font></th>
							<td style="vertical-align: top;width: 10%" align="left">
							<input type="text" class="input" name="spokento" id="spokento" value="" style="height: 15px; width:84%; padding: 4px 5px 2px 5px;  background: #FFFFFF font :normal 11px Arial, Helvetica, sans-serif; width: 80; max-width: 40;"></td>
					
							</tr>
							
							</table>
							</td>
							</tr>
							</table>
					
					
					
					
					
					
					
					
					<table style="width: 95%" >
					<tr>
					<td>
										<table style="width: 90%" align="center"   cellspacing="1">
					
					
					<tr>
							<th style="width: 13%" align="center"><font size="2" color="red">*</font><font face="Arial" size="2" color="black"><b>Comments </b></font></th>
							<td style="vertical-align: top; width: 30%;" align="right"><textarea 
								wrap="virtual" rows="30" cols="30" name="comments" id="comments"
								style="height: 90px; width: 460px; padding: 4px 5px 2px 5px;  background: #FFFFFF font :normal 11px Arial, Helvetica, sans-serif; width: 70; max-width: 70;"></textarea></td>
					</tr>
					</table>
					</td>
					</tr>
					</table>
					
				
					
					
					<table style="width: 95%" border="0" >
			<tr>
				</tr>
				<tr>
					<td colspan="1">
					<table style="width: 90%" align="center" cellspacing="1" border="0">
					
					<tr>
							<th style="width: 20%" align="left"><font size="2" color="red">*</font><font face="Arial" size="2" color="black"><b>Next Follow Up &nbsp;&nbsp;Date/Time </b></font></th>
							
							
				<td style="width: 30%" align="left" valign="top">
								
								
								<input type="text" id="todate" name="todate" value='<%=fromDateCal%>' size="15" readonly="readonly"	style="width: 60%; padding: 4px 5px 2px 5px; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF" onchange="getvalid();" />
							<!--<input type="button" name="From Date" value="From Date" id="trigger">-->
							<script type="text/javascript">
						Calendar.setup( {
							inputField : "todate", // ID of the input field
							ifFormat : "%d-%b-%Y %H:%M", // the date format
							button : "todate",
							showsTime	: "true" 
								 // ID of the button
						});
					</script>									
		
		</td>
		
<td></td>
				
						<th style="width: 30%" align="left"><font face="Arial" size="2" color="black"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Next Follow Up Type </b></font></th>
						<td style="width: 27%" style="vertical-align: top;" align="left"><select
								name="nextfollowUpType" id="nextfollowUpType" style='width: 90%;'>
							  	<option value="Select">Select</option>
														<option value="ActionPoints">Action Points</option>
																<option value="E-mail">E-mail</option>
																<option value="Letter">Letter</option>
								
							
								<option value="Meeting">Meeting</option>
									<option value="phoneCall">Phone Call</option>
								<option value="Visit">Visit</option>
							</select></td>
				</tr>
				<tr>
						<th align="left"><font face="Arial" size="2" color="black"><b>&nbsp;Assigned To </b></font></th>
						<td>
						<select name="assignedwith" id="assignedwith" style='width: 70%;'>
						<option value="000">Select</option>
						<%
						String sqlrep="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"marketingrepmaster   WHERE username<>'' AND password<>''  AND ("+
			 					      "OtherGroups=1 OR Compressor=1 OR	DigitalEquipment=1 OR 	DGSet=1 OR 	Endoscope=1 OR 	OtherGroups=1) order by MarketingRepName";
						ResultSet rsRep=stmt1.executeQuery(sqlrep);
						while(rsRep.next())
						{
						%>
						<option value="<%=rsRep.getString(1) %>"><%=rsRep.getString("MarketingRepName") %></option>
						<%
						}
						%>
						</select>
						</td>
						<td></td>
							<th align="left"><font face="Arial" size="2" color="black"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Payment Follow Up </b></font></th>
							<td align="left" valign="top"><input type="checkbox" id="paymentFollowUp" name="paymentFollowUp" value="paymentFollowUp" onclick="showrow()"></input>
							&nbsp;&nbsp;&nbsp;<font face="Arial" size="2" color="black">
							<b>Reply</b></font><input type="checkbox" name="reply" value="reply"></input></td>
						
						</tr>
						
						
						<tr style="display: none;" id="showpay">
						<th align="left"><font face="Arial" size="2" color="black"><b>Amnt Expctd </b></font></th>
							<td style="vertical-align: top;" align="left"><textarea 
								wrap="virtual" rows="2" cols="10" name="expectedamnt" id="expectedamnt"
								style="height: 15px; padding: 4px 5px 2px 5px;  font :normal 11px Arial, Helvetica, sans-serif; width: 20; max-width: 20;"></textarea></td>
						<td></td>
							<th align="left"><font face="Arial" size="2" color="black"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Amnt Expectd On </b></font></th>
							<td align="left" valign="top"><input type="text"
								id="expectedon" name="expectedon" value='' size="15" readonly="readonly"
								style="width: 85px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF" />
							<!--<input type="button" name="From Date" value="From Date" id="trigger">-->
							<script type="text/javascript">
						Calendar.setup( {
							inputField : "expectedon", // ID of the input field
							ifFormat : "%d-%b-%Y", // the date format
							button : "expectedon" // ID of the button
						});
					</script>&nbsp;&nbsp;&nbsp;					
					</td>
					</tr>
						</table>
					</td>
					</tr>
					</table>
					<table style="width: 93%">
					<tr>
					<td>
										<table style="width: 90%" align="center"   cellspacing="1">
						
						
						
						
						<tr>
						<th align="left" style="width: 14%"><font face="Arial" size="2" color="black"><b>Preparation for next Follow Up </b></font></th>
							<td style="vertical-align: top;width: 30%;" align="right"><textarea 
								wrap="virtual" rows="30" cols="30" name="preparation" id="preparation"
								style="height: 80px;  width:460px; padding: 4px 5px 2px 5px; background: #FFFFFF font :normal 11px Arial, Helvetica, sans-serif; width: 70; max-width: 70;"></textarea></td>
						</tr>
						
						<tr>
						<th align="left" style="width: 18%"><font face="Arial" size="2" color="black"><b>Remarks </b></font></th>
							<td style="vertical-align: top;width: 30%;" align="left"><textarea 
								wrap="virtual" rows="30" cols="30" name="remarks" id="remarks"
								style="height: 80px; width:460px; padding: 4px 5px 2px 5px;  background: #FFFFFF font :normal 11px Arial, Helvetica, sans-serif; width: 70; max-width: 70;"></textarea></td>
						</tr>
							</table>
					</td>
					</tr>
					</table>
					
					
				
							
							
								<table style=" width: 94%" border="0">
			<tr>
				</tr>
				<tr>
				
					<td colspan="1">
					<table style=" width: 90%"  align="center" cellspacing="1" border="0" >
		<%int counter=0; %>
			
			<tr>
			<th align="left" ><font face="Arial" size="2" color="black"><b>Upload Document </b></font> </th>
<!--							<td style="vertical-align: top;" align="right"><font face="Arial" size="2" color="black"><b>Document Type </b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->
<!--							<select name="documentType" id="documentType" style='width: 20%;'>-->
<!--								<option value="select">Select</option>-->
<!--								<option value="contactcard">Contact Card</option>-->
<!--								<option value="commercial">Commercial</option>-->
<!--																<option value="legal">Legal</option>-->
<!--								 -->
<!--								<option value="meeting">Meeting</option>-->
<!--								<option value="notes">Notes</option>-->
<!--							</select>-->
<!--							</td>-->
			</tr>
			<tr>
			
			<input type="hidden"  name="counter" id="counter" value="<%=counter%>"></input>
			<input type="hidden"  name="flagvalue" id="flagvalue" value="<%=counter%>"></input>
			<td valign="top" align="center" colspan="2"><div align="center"><b>&nbsp;&nbsp; <a href="#!" onclick="attach();"><font size="2" face="Arial">Attach File</font></a>
		</b>
		                <div><font size="1" color="black" face="Arial">&nbsp;&nbsp;(You can attach a file <br>&nbsp;&nbsp;or a file which you would like to link with this follow up entry.)</font> </div>
			           <div id="div2" position="absolute" style="width: 250px;" align="center">
			           
		       		    <table border="0" align="center" >
		       			<tr align="center" id="tr1" style="display:none;">
		       		    <input type="hidden" id="ip1" name="ip1" value=""></input>
		       		    
		       			<!-- <td><div id="imageDiv" align="center"><font color="maroon" size="2"><b></b></font></div></td>-->
		       			<td align="right"><font face="Arial" size="2" color="black"><b>Type: </b></font>&nbsp;
							<select name="documentType" id="documentType" style="width: 120px;">
								<option value="Select">Select</option>
								<option value="contactcard">Contact Card</option>
								<option value="commercial">Commercial</option>
								<option value="legal">Legal</option>
								 
								<option value="meeting">Meeting</option>
								<option value="notes">Notes</option>
							</select>&nbsp;&nbsp;
							</td> 
                       <td align="right">&nbsp;&nbsp;<input type="file" cols="40" name="Filename1" id="up" value="" onchange="upload();"/></td>
                      <td style="display: none;width: 20%;" id="imageDiv" align="left" colspan="2"><font size="2" face="Arial" color="black" id="f1"></font></td>
                       <td>&nbsp;&nbsp;&nbsp;<b><a href="#!" onclick="cancel();"><font size="2" face="Arial">Remove</font></a></b></td>
                        </tr>
                       
                        <tr align="center" id="tr2" style="display: none;" >                        
                        <td valign="top" align="left"><b> &nbsp;&nbsp;<a href="#!" onclick="attach1();"><font size="2" face="Arial">AttachMoreFiles </font></a></td></tr>
		               <tr align="center" id="tr5" style="display: none;" >
		               <!--<td><div id="imageDiv" align="center"><font color="maroon" size="2"><b></b></font></div></td>-->
		               <td align="right" ><font face="Arial" size="2" color="black"><b>Type: </b></font>&nbsp;
							<select name="documentType1" id="documentType1" style="width: 120px;">
								<option value="Select">Select</option>
								<option value="contactcard">Contact Card</option>
								<option value="commercial">Commercial</option>
								<option value="legal">Legal</option>
								 
								<option value="meeting">Meeting</option>
								<option value="notes">Notes</option>
							</select>&nbsp;&nbsp;
							</td>
                        <td>&nbsp;&nbsp;<input type="file" cols="40" name="Filename2" value="" id="up1"  onchange="upload1();"/></td>
                       <td style="display: none;width: 20%;" id="imageDiv1" align="left" colspan="2"><font size="2" face="Arial" color="black" id="f2"></font></td>
                       <td>&nbsp;&nbsp;&nbsp; <b><a href="#!" onclick="cancel1();"><font size="2" face="Arial">Remove</font></a></b></td>
                        </tr>
                        
                         <tr align="center" id="tr6" style="display: none;" >                        
                        <td valign="top" align="left"><b>&nbsp;&nbsp; <a href="#!" onclick="attach2();"><font size="2" face="Arial">AttachMoreFiles </font></a></td></tr>
		               <tr align="center" id="tr7" style="display: none;" >
		               <!--<td><div id="imageDiv" align="center"><font color="maroon" size="2"><b></b></font></div></td>-->
		               <td align="right"><font face="Arial" size="2" color="black"><b>Type: </b></font>&nbsp;
							<select name="documentType2" id="documentType2" style="width: 120px;">
								<option value="Select">Select</option>
								<option value="contactcard">Contact Card</option>
								<option value="commercial">Commercial</option>
								<option value="legal">Legal</option>
								 
								<option value="meeting">Meeting</option>
								<option value="notes">Notes</option>
							</select>&nbsp;&nbsp;
							</td> 
                        <td>&nbsp;&nbsp;<input type="file" cols="40" name="Filename3" value="" id="up2"  onchange="upload2();"/></td>
                        <td style="display: none;width: 20%;" id="imageDiv2" align="left" colspan="2"><font size="2" face="Arial" color="black" id="f3"></font></td>
                        <td>&nbsp;&nbsp;&nbsp;<b><a href="#!" onclick="cancel2();"><font size="2" face="Arial">Remove</font></a></b></td>
                        </tr>
                         
                         
                         <tr align="center" id="tr8" style="display: none;" >                        
                        <td valign="top" align="left"><b>&nbsp;&nbsp; <a href="#!" onclick="attach3();"><font size="2" face="Arial">AttachMoreFiles </font></a></td></tr>
		               <tr align="center" id="tr9" style="display: none;" >
		               <!--<td><div id="imageDiv" align="center"><font color="maroon" size="2"><b></b></font></div></td>-->
		                <td  align="right" ><font face="Arial" size="2" color="black"><b>Type:</b></font>&nbsp;
							<select name="documentType3" id="documentType3" style="width: 120px;">
								<option value="Select">Select</option>
								<option value="contactcard">Contact Card</option>
								<option value="commercial">Commercial</option>
								<option value="legal">Legal</option>
								 
								<option value="meeting">Meeting</option>
								<option value="notes">Notes</option>
							</select>&nbsp;&nbsp;
							</td>
                        <td>&nbsp;&nbsp;<input type="file" cols="40" name="Filename4" value="" id="up3"  onchange="upload3();"/></td>
                         <td style="display: none;width: 20%;" id="imageDiv3" align="left" colspan="2"><font size="2" face="Arial" color="black" id="f4"></font></td>
                        <td>&nbsp;&nbsp;&nbsp;<b><a href="#!" onclick="cancel3();"><font size="2" face="Arial">Remove</font></a></b></td>
                        </tr>
                          
                           <tr align="center" id="tr10" style="display: none;" >                        
                        <td valign="top" align="left"><b>&nbsp;&nbsp; <a href="#!" onclick="attach4();"><font size="2" face="Arial">AttachMoreFiles </font></a></td></tr>
		               <tr align="center" id="tr11" style="display: none;" >
		               <td align="right" ><font face="Arial" size="2" color="black"><b>Type: </b></font>&nbsp;
							<select name="documentType4" id="documentType4" style="width: 120px;">
								<option value="Select">Select</option>
								<option value="contactcard">Contact Card</option>
								<option value="commercial">Commercial</option>
								<option value="legal">Legal</option>
								 
								<option value="meeting">Meeting</option>
								<option value="notes">Notes</option>
							</select>&nbsp;&nbsp;
							</td>  
		               <!--<td><div id="imageDiv" align="center"><font color="maroon" size="2"><b></b></font></div></td>-->
                        <td>&nbsp;&nbsp;<input type="file" cols="40" name="Filename5" value="" id="up4"  onchange="upload4();"/></td>
                         <td style="display: none;width: 20%;" id="imageDiv4" align="left" colspan="2"><font size="2" face="Arial" color="black" id="f5"></font></td>
                       <td>&nbsp;&nbsp;&nbsp;<b><a href="#!" onclick="cancel4();"><font size="2" face="Arial">Remove</font></a></b></td>
                        </tr>  
                        
                        </table>
                        </div>
			
			</td>
		</tr>
						
					

</table>
</td>
</tr>
</table>

						<table style=" width: 97%" border="0" >
			<tr>
				</tr>
				<tr>
					<td colspan="1">
					<table style=" width: 90%" border="0" align="center" cellspacing="1">
						<tr>
							<td valign="top" style="width: 19%" align="left">
							<font face="Arial" size="2" color="black"><b>Special Email To  </b></font>
							</td>
							<td style="width: 9%;">
							<input type="hidden" name="SelectedEmpMail"	id="SelectedEmpMail" value="" /> 
							<input type="text" name="EmpNames" id="EmpNames" style="width: 350px;" value=""	onkeyup="if (event.keyCode == 27){document.getElementById('EmpList').style.display = 'none';} else { getEmp(<%=1 %>); }"  />
							</td>
							<td>
							<div style="position: absolute;">
							<table>
								<tr>
									<td></td>
								</tr>
								<tr>
									<td>
									<div id='EmpList'></div>
									</td>
								</tr>
							</table>
							</div>
							</td>
						<td id="A30"><div id="client"><a href="#/" style="font-weight: bold; color: blue; " onclick="getClient1('+')"><font size="3" >(+)</font></a><a href="#/" style="font-weight: bold; color: blue; " onclick="getClient1('-')"><font size="3" ></font></a> </div></td>
							
		
<td colspan="0">
<div id="otherclient" style="display: none">
<input type="text" name="EmpNames1" style="width: 250px;" id="EmpNames1" class="input"  onkeyup="if (event.keyCode == 27){document.getElementById('EmpList1').style.display = 'none';} else { getEmp('<%=2 %>'); }"> 
<input type="hidden" name="SelectedEmpMail1" id="SelectedEmpMail1" value="" /> 
<div style="position: absolute;">
  <table><tr><td><div id='EmpList1'></div></td></tr></table></div>
 </div>
</td>

<td id="A31"><div id="client1" style="display: none"><a href="#/" style="font-weight: bold; color: blue; " onclick="getClient2('+')"><font size="3" >(+)</font></a><a href="#/" style="font-weight: bold; color: blue; " onclick="getClient2('-')"><font size="3" >(-)</font></a></div></td>


</tr>

<tr>
<td></td>
<td id="A27">

<div id="otherclient1" style="display: none">
<input type="text" name="EmpNames2" id="EmpNames2"  style="width: 350px;"  class="input"  onkeyup="if (event.keyCode == 27){document.getElementById('EmpList2').style.display = 'none';} else { getEmp('<%=3 %>'); }" > 
<input type="hidden" name="SelectedEmpMail2" id="SelectedEmpMail2" value="" />
</td>
<td> 
<div style="position: absolute;">
  <table><tr><td><div id='EmpList2'></div></td></tr></table></div>
 </div>

</td>
<td id="A50">
<div id="client2" style="display: none"><a href="#/" style="font-weight: bold; color: blue; " onclick="getClient3('-')"><font size="3" >(-)</font></a></div>
</td>
</tr>
</table>
					</td>
					</tr>
					</table>


<table align="center">

<tr>
						<th>.</th>
					<td align="center" colspan="3" valign="top">
							<div><input	type="submit" id="search-submit" name="submitFollowUp" value="Submit" style="border: outset; background-color: #C6DEFF;height: 10%"/></div>
							</td>
							
				</tr>
				</table>
						
					
				
	
					
		</div>
					
			
	
</form>
	
	
</body>
	<div id="footer" style="margin-top: 65%">
	<p><a href="http://www.myfleetview.com"> Copyright &copy; 2009
	by Transworld Compressor Technologies Ltd. All Rights Reserved.</a></p>
	</div>
	
</html>

</jsp:useBean>  
