<%@ page language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="moreservlets.listeners.*" errorPage="" %>
<link href="css/ERP.css" rel="stylesheet" type="text/css"></link>
<style type="text/css">@import url(jscalendar-1.0/calendar-blue.css);</style>
<%@ page import = "java.io.FileNotFoundException"%>
<%@ page import = "java.io.FileOutputStream"%>
<%@ page import = " java.io.IOException"%>
<%@ page import="javax.activation.*" %>
<script type="text/javascript" language="javascript" src="calendar/prototype-1.js"></script>
<script type="text/javascript" language="javascript" src="calendar/prototype-base-extensions.js"></script>
<script type="text/javascript" language="javascript" src="calendar/prototype-date-extensions.js"></script>
<script type="text/javascript" language="javascript" src="calendar/behaviour.js"></script> 
<script type="text/javascript" language="javascript" src="calendar/datepicker.js"></script> 
<link rel="stylesheet" href="calendar/datepicker.css">
<script type="text/javascript" language="javascript" src="calendar/behaviors.js"></script> 

<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">  

<body onkeypress="hideList(event);" onclick="hideOnClick();">
<script>
function formValidation()
{
	
	
	validate1();
	
	document.getElementById("companynaw1").style.display='none';
	
	var compnaw=document.getElementById("companyName").value;
	
//var invalid=/^[A-Za-z0-9]+[\s\-]*[.,&-A-Za-z]+[\s\- .,&A-Za-z0-9]*$/;
	var invalid=/^[A-Za-z0-9]+[\s\-]*[\s\- .,&A-Za-z0-9]*[A-Za-z]+$/;
	if(!invalid.test(compnaw))
		{
		alert("Please Enter Valid Company Name");
		
		
		return false;
		}
	
	if(compnaw.trim()=="" || compnaw.trim()==null )
		{
		document.getElementById("companynaw1").style.display="";
		return false;
		}
	
	
	document.getElementById("contact1").style.display="none";
	document.getElementById("contact2").style.display="none";	
var name=document.getElementById("contactperson@123").value;
//	var invalid=/^[a-zA-Z  .]+$/;
var invalid=/^[a-zA-Z  .]+$/;
var oth=name.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
if(name=="" || oth==""){
	document.getElementById("contact1").style.display="";
	return false;
}
if(!invalid.test(name)){
document.getElementById("contact2").style.display="";
     return false;
 }		
	
	
	document.getElementById("std3").style.display="none";
	document.getElementById("std4").style.display="none";
	var mob=document.getElementById("potentialValue").value;
	 var invalid=/^[0-9]+$/; 
	   if(!(mob ==0))
			{
				 if(isNaN(mob))
					{
						document.getElementById("std3").style.display="";
						return false;
					}	
				 if(!invalid.test(mob)){
                     document.getElementById("std4").style.display="";
                             return false;
                         }
					
			    }
	
	

	document.getElementById("noofunits1").style.display="none";
	document.getElementById("noofunits2").style.display="none";
	var mob=document.getElementById("noofunits").value;
	var invalid=/^[0-9]+$/; 
	if(!(mob ==0))
		{
			 if(isNaN(mob))
				{
					document.getElementById("noofunits1").style.display="";
					return false;
				}	
			 if(!invalid.test(mob)){
			        document.getElementById("noofunits2").style.display="";
			                return false;
			            }
				
				
		    }

	
	 
	
	
	
	document.getElementById("contact3").style.display="none";	
	var name1=document.getElementById("weeklyOffOn").value;
	var invalid=/[^A-Za-z\s]/;
	var oth=name1.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
	if(name1==" " || oth==" "){
		
		
		}
	else{
		if(invalid.test(name1)){
	    document.getElementById("contact3").style.display="";
		     return false;
		 }	
	}
	
	
	
	 document.getElementById("mob7").style.display="none";
		document.getElementById("mob8").style.display="none";
		var mob=document.getElementById("alternateNumber").value;
		 var invalid=/^[0-9]+$/; 
		   if(!(mob ==0))
				{
					 if(isNaN(mob))
						{
							document.getElementById("mob7").style.display="";
							return false;
						}	
					 if(!invalid.test(mob)){
	                     document.getElementById("mob8").style.display="";
	                             return false;
	                         }
						
				    }
	
	
	
	
			 document.getElementById("phone1").style.display="none";
// 			   document.getElementById("phone2").style.display="none";
			   document.getElementById("phone3").style.display="none";
			   var invalid=/^[0-9 ]+$/; 
			  var mob=document.getElementById("phone").value;
		 
			   if(!(mob ==0))
					{
				   if(!invalid.test(mob))
							{
								document.getElementById("phone1").style.display="";
								return false;
							}	
					}
					else
					{
						mob="";
						document.getElementById("phone3").style.display="";
					    return false;	
					}
   
	
	
	document.getElementById("noofunits3").style.display="none";
	document.getElementById("noofunits4").style.display="none";
	var mob=document.getElementById("std").value;
	var invalid=/^[0-9]+$/; 
	   if(!(mob ==0))
			{
				 if(isNaN(mob))
					{
						document.getElementById("noofunits3").style.display="";
						return false;
					}	
				 if(!invalid.test(mob)){
				        document.getElementById("noofunits4").style.display="";
				                return false;
				            }
				 }
	
	
	
	document.getElementById("fax1").style.display="none";
	document.getElementById("fax2").style.display="none";
	var mob=document.getElementById("faxno").value;
	 var invalid=/^[0-9]+$/; 
	   if(!(mob ==0))
			{
				 if(isNaN(mob))
					{
						document.getElementById("fax1").style.display="";
						return false;
					}	
				 if(!invalid.test(mob)){
                        document.getElementById("fax2").style.display="";
                                return false;
                            }
				 
					
			    }
	
	
	   document.getElementById("mob1").style.display="none";
	   document.getElementById("mob12").style.display="none";
	   document.getElementById("mob123").style.display="none";
			  var invalid=/^[0-9]+$/; 
   var mob=document.getElementById("mobile").value;
   if(!(mob ==0))
		{
			 if(!invalid.test(mob))
				{
					document.getElementById("mob1").style.display="";
					return false;
				}	
			 if((mob.trim().length < 10)  || (mob.trim().length >15))
					 {
					 document.getElementById("mob12").style.display=""; 
		        return false;
		    }
		}
		else
		{
			mob="";
			document.getElementById("mob123").style.display="";
		    return false;	
		}
	
	 
   
   document.getElementById("zip1").style.display='none';
		document.getElementById("zip2").style.display='none';
		var invalid=/^[0-9]+$/;
		var mob=document.getElementById("zip").value;
		   if(!(mob ==0))
				{
					 if(isNaN(mob))
						{
							document.getElementById("zip1").style.display="";
							return false;
						}	
					  if(!invalid.test(mob)){
                  document.getElementById("zip2").style.display="";
                          return false;
                      }
				    }
	
	
	
	
	
	
		   document.getElementById("email3").style.display="none";
			document.getElementById("email1").style.display="none";
			document.getElementById("email2").style.display="none";

			var txtEmail=document.getElementById("email").value; 
			var text= /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,15})+$/;

			if(txtEmail=="")
				{
				document.getElementById("email3").style.display="";
				return false;
				}

			if(!text.test(txtEmail))
				{
				document.getElementById("email2").style.display="";
				return false;
				
				}
	
	
}


function validate1(){
	
var compnaw=document.getElementById("companyName").value;
	
//alert("Company Name:-"+compnaw);
	// 	compnaw=compnaw.replace(/ /,'*');
//  	compnaw=compnaw.replace(/./,'#');
// 	alert("ampersnd1"+compnaw);
// 	compnaw=compnaw.replace(/&/,'%26');
	
// 	alert("ampersnd2"+compnaw);
	compnaw=compnaw.replace(/,/,'...');
	compnaw=compnaw.replace(/;/,'**');
	compnaw=compnaw.replace(/:/,'##');
// 	compnaw=compnaw.replace(/!/,'***');
// 	compnaw=compnaw.replace(/@/,'###');
// 	compnaw=compnaw.replace(/$/,'####');
// 	compnaw=compnaw.replace(/%/,'****');
	compnaw=compnaw.replace(/_/,'*****');
	compnaw=compnaw.replace(/-/,'#####');
	
	compnaw=encodeURIComponent(compnaw);
	
	
	
		
	//alert("IN FUNCVOOM     ");
// 	var prospect=document.addCustomer.companyName.value;
// 	alert("prospppppppp"+prospect);
	
	
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
	//alert("eeeeeeeeeeeeeeeeeeeeeeeeee");
	// Create a function that will receive data sent from the server
	ajaxRequest.onreadystatechange = function()
	{
		if(ajaxRequest.readyState == 4)
		{//alert("######################### ");
			//var reselt=ajaxRequest.responseText;
// 			document.getElementById("err").innerHTML=reselt; 

 		   var reselt=ajaxRequest.responseText;
		   //alert("Original result new"+reselt);
 			var finalres=reselt.split("#");
			//var finalres=reselt.trim();
			//alert("After trim"+finalres[0]);
			var finalrescount=finalres[1].trim();
			//alert("finalrescount"+finalrescount);
			//alert("finalrescount2"+finalrescount[2]);
		if(finalrescount>=1)
		   {
 			alert("Customer Name Already Exists !!You Can Not Add This Customer---->"+finalres[0].trim());
         // alert("Customer Name Is Already Exists! You Can't Add This C!!");
 			document.addCustomer.companyName.value="";
 			//document.getElementById("comlist").style.display='none';
		  }
		 
		}
	
	}
	
	var queryString = "?prospect=" +compnaw;
	
	
	ajaxRequest.open("GET", "AjaxCheckForCustomer.jsp" + queryString, true);
	ajaxRequest.send(null); 
}

function code1()
{
	document.getElementById("std3").style.display="none";
	document.getElementById("std4").style.display="none";
	var mob=document.getElementById("potentialValue").value;
	 var invalid=/^[0-9]+$/; 
	   if(!(mob ==0))
			{
				 if(isNaN(mob))
					{
						document.getElementById("std3").style.display="";
						return false;
					}	
				 if(!invalid.test(mob)){
                     document.getElementById("std4").style.display="";
                             return false;
                         }
					
			    }
			}
function contactpersonfun1()
{
	
	document.getElementById("contact3").style.display="none";	
var name1=document.getElementById("weeklyOffOn").value;
var invalid=/[^A-Za-z\s]/;
var oth=name1.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
if(name1==" " || oth==" "){
	
	
	}
else{
	if(invalid.test(name1)){
    document.getElementById("contact3").style.display="";
	     return false;
	 }	
}
}
function funmob3()
{
	   
	document.getElementById("mob7").style.display="none";
	document.getElementById("mob8").style.display="none";
	var mob=document.getElementById("alternateNumber").value;
	 var invalid=/^[0-9]+$/; 
	   if(!(mob ==0))
			{
				 if(isNaN(mob))
					{
						document.getElementById("mob7").style.display="";
						return false;
					}	
				 if(!invalid.test(mob)){
                     document.getElementById("mob8").style.display="";
                             return false;
                         }
					
			    }
	
			
}
			
function validateEmail()
{
	document.getElementById("email3").style.display="none";
	document.getElementById("email1").style.display="none";
	document.getElementById("email2").style.display="none";

	var txtEmail=document.getElementById("email").value;

	var text= /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,15})+$/;

	if(txtEmail=="")
		{
		document.getElementById("email3").style.display="";
		return false;
		}

	if(!text.test(txtEmail))
		{
		document.getElementById("email2").style.display="";
		return false;
		
		}

	}
function contactpersonfun12()
{
	document.getElementById("contact10").style.display="none";
	document.getElementById("contact20").style.display="none";	
var name=document.getElementById("companyName").value;
//	var invalid=/[^A-Za-z\s]/;
var invalid=/^[a-zA-Z  .]+$/;
var oth=name.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
if(name=="" || oth==""){
	document.getElementById("contact10").style.display="";
		return false;
	}
if(!invalid.test(name)){
 document.getElementById("contact20").style.display="";
	     return false;
	 }	
}
function contactpersonfun()
{
	document.getElementById("contact1").style.display="none";
	document.getElementById("contact2").style.display="none";	
var name=document.getElementById("contactperson@123").value;
//	var invalid=/[^A-Za-z\s]/;
var invalid=/^[a-zA-Z  .]+$/;
var oth=name.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
if(name=="" || oth==""){
	document.getElementById("contact1").style.display="";
		return false;
	}
if(!invalid.test(name)){
 document.getElementById("contact2").style.display="";
	     return false;
	 }	
}
function showbox()
{

	//alert("hi");
	var country = document.getElementById("country1").value;
	//var country=e.options[e.selectedIndex].Text;
if(country!=null)
	{
	document.getElementById("f13").style.display="";
	
	}
else
	{
	document.getElementById("f13").style.display='none';
	
	}
	//alert(country);
	
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
			//alert(reslt);
			document.getElementById("state").disabled = false;
			//alert("after true");
			document.getElementById("state").innerHTML=reslt;
			
			
		
		} 
	};
	
	var queryString = "?country="+country;
	ajaxRequest.open("GET", "AjaxGetState.jsp" + queryString, true);
	ajaxRequest.send(null); 
	
	
}
function showbox2()
{

	//alert("hi");
	var country = document.getElementById("country1").value;
	//var country=e.options[e.selectedIndex].Text;

	//alert(country);
	
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
			//alert(reslt);
			//document.getElementById("city").disabled = false;
			document.getElementById("city").innerHTML=reslt;
			
		} 
	};
	
	var queryString = "?country="+country;
	ajaxRequest.open("GET", "AjaxGetCity.jsp" + queryString, true);
	ajaxRequest.send(null); 
	
	
}

function showbox1()
{

	//alert("hi");
	var state = document.getElementById("state").value;
//alert(state);
	//var country=e.options[e.selectedIndex].Text;
if(state!=null)
	{
	document.getElementById("f11").style.display="";
	
	}
else
	{
	document.getElementById("f11").style.display='none';
	
	}
	//alert(country);
	
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
			//alert(reslt);
			document.getElementById("city").disabled = false;
			document.getElementById("city").innerHTML=reslt;
		
		} 
	};
	
	var queryString = "?state="+state;
	//alert(queryString);
	ajaxRequest.open("GET", "AjaxGetCity.jsp" + queryString, true);
	ajaxRequest.send(null); 
	
	
}
function funmob1()
   {
		   document.getElementById("mob1").style.display="none";
		   document.getElementById("mob12").style.display="none";
		   document.getElementById("mob123").style.display="none";
				  var invalid=/^[0-9]+$/; 
	   var mob=document.getElementById("mobile").value;
	   
	  
	   
	   if(!(mob ==0))
			{
				 if(!invalid.test(mob))
					{
						document.getElementById("mob1").style.display="";
						return false;
					}	
				 if((mob.trim().length < 10)  || (mob.trim().length >15))
						 {
						 document.getElementById("mob12").style.display=""; 
			        return false;
			    }
			}
			else
			{
				mob="";
				document.getElementById("mob123").style.display="";
			    return false;	
			}
	   
	   
	   }
 function funmob2()
	 {
	 document.getElementById("phone1").style.display="none";
	   document.getElementById("phone3").style.display="none";
	   var invalid=/^[0-9 ]+$/; 
	  var mob=document.getElementById("phone").value;
 
	   if(!(mob ==0))
			{
		   if(!invalid.test(mob))
					{
						document.getElementById("phone1").style.display="";
						return false;
					}	
					 
			}
			else
			{
				mob="";
				document.getElementById("phone3").style.display="";
			    return false;	
			}
   }
 function pin()
	{
	 document.getElementById("zip1").style.display='none';
		document.getElementById("zip2").style.display='none';
		var invalid=/^[0-9]+$/;
		var mob=document.getElementById("zip").value;
		   if(!(mob ==0))
				{
					 if(isNaN(mob))
						{
							document.getElementById("zip1").style.display="";
							return false;
						}	
					  if(!invalid.test(mob)){
                           document.getElementById("zip2").style.display="";
                                   return false;
                               }
				    }
				}
 function fax()
	{
		document.getElementById("fax1").style.display="none";
		document.getElementById("fax2").style.display="none";
		var mob=document.getElementById("faxno").value;
		 var invalid=/^[0-9]+$/; 
		   if(!(mob ==0))
				{
					 if(isNaN(mob))
						{
							document.getElementById("fax1").style.display="";
							return false;
						}	
					 if(!invalid.test(mob)){
                            document.getElementById("fax2").style.display="";
                                    return false;
                                }
					 
						
				    }
				}

 function units5()
	{
		document.getElementById("noofunits3").style.display="none";
		document.getElementById("noofunits4").style.display="none";
		var mob=document.getElementById("std").value;
		var invalid=/^[0-9]+$/; 
		   if(!(mob ==0))
				{
					 if(isNaN(mob))
						{
							document.getElementById("noofunits3").style.display="";
							return false;
						}	
					 if(!invalid.test(mob)){
					        document.getElementById("noofunits4").style.display="";
					                return false;
					            }
						
						
				    }
				}
 
 
 function units()
	{
		document.getElementById("noofunits1").style.display="none";
		document.getElementById("noofunits2").style.display="none";
		var mob=document.getElementById("noofunits").value;
		var invalid=/^[0-9]+$/; 
		   if(!(mob ==0))
				{
					 if(isNaN(mob))
						{
							document.getElementById("noofunits1").style.display="";
							return false;
						}	
					 if(!invalid.test(mob)){
					        document.getElementById("noofunits2").style.display="";
					                return false;
					            }
						
						
				    }
				}

var globalcompany;var flag=true;
function hideList(e)
{
if(e.which == 0){
	document.getElementById("ProspectList").style.visibility='hidden';
}
}
function hideOnClick()
{
    //	document.getElementById("ProspectList").style.visibility='hidden';
}
function getProspectes()
{
	var list;
	document.getElementById("comlist").style.display="";
	
	document.getElementById("list").style.visibility='visible';
	var prospect=document.addCustomer.companyName.value;
	//alert(prospect);
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
			document.getElementById("list").innerHTML=reslt;
		
		} 
	}
	var queryString = "?prospect=" +prospect+"&displayList=true";
	ajaxRequest.open("GET", "ListOfSuppliers.jsp" + queryString, true);
	ajaxRequest.send(null); 
}
 
function validateProspectes()
{
	document.getElementById("companynaw1").style.display='none';

	var compnaw=document.getElementById("companyName").value;
	
	
	//var invalid=/^[A-Z0-9]+[.,&0-9]*[A-Za-z]+$/;
	
	var invalid=/^[A-Za-z0-9]+[\s\-]*[\s\- .,&A-Za-z0-9]*[A-Za-z]+$/;
	
	if(!invalid.test(compnaw))
		{
		alert("Please Enter Valid Company Name");
		
		
		return false;
		}
	
	if(compnaw.trim()=="" || compnaw.trim()==null )
	{
	document.getElementById("companynaw1").style.display="";
	return false;
	}
// 	compnaw=compnaw.replace(/ /,'*');
//  	compnaw=compnaw.replace(/./,'#');
// 	alert("ampersnd1"+compnaw);
// 	compnaw=compnaw.replace(/&/,'%26');
	
// 	alert("ampersnd2"+compnaw);
	compnaw=compnaw.replace(/,/,'...');
	compnaw=compnaw.replace(/;/,'**');
	compnaw=compnaw.replace(/:/,'##');
// 	compnaw=compnaw.replace(/!/,'***');
// 	compnaw=compnaw.replace(/@/,'###');
// 	compnaw=compnaw.replace(/$/,'####');
// 	compnaw=compnaw.replace(/%/,'****');
	compnaw=compnaw.replace(/_/,'*****');
	compnaw=compnaw.replace(/-/,'#####');
	
	compnaw=encodeURIComponent(compnaw);
	
	
	
		
	//alert("IN FUNCVOOM     ");
// 	var prospect=document.addCustomer.companyName.value;
// 	alert("prospppppppp"+prospect);
	
	
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
	//alert("eeeeeeeeeeeeeeeeeeeeeeeeee");
	// Create a function that will receive data sent from the server
	ajaxRequest.onreadystatechange = function()
	{
		if(ajaxRequest.readyState == 4)
		{//alert("######################### ");
			//var reselt=ajaxRequest.responseText;
// 			document.getElementById("err").innerHTML=reselt; 

 		   var reselt=ajaxRequest.responseText;
// 		   alert("Original result"+reselt);
 			var finalres=reselt.split("#");
			//var finalres=reselt.trim();
			//alert("After trim"+finalres[0]);
			var finalrescount=finalres[1].trim();
			//alert("finalrescount"+finalrescount);
			//alert("finalrescount2"+finalrescount[2]);
		if(finalrescount>=1)
		   {
 			alert("Customer Name Already Exists !!You Can Not Add This Customer---->"+finalres[0].trim());
         // alert("Customer Name Is Already Exists! You Can't Add This C!!");
 			document.addCustomer.companyName.value="";
 			document.getElementById("comlist").style.display='none';
		  }
		 
		}
	
	}
	
	var queryString = "?prospect=" +compnaw;
	
	
	ajaxRequest.open("GET", "AjaxCheckForCustomer.jsp" + queryString, true);
	ajaxRequest.send(null); 
		
}

  


function showentryform2()
{
	
	document.getElementById("country1").disabled = true;
	document.getElementById("newcountry").style.display="";
	document.getElementById("f14").style.display="";
	document.getElementById("f15").style.display='none';
	document.getElementById("f13").style.display="";
	
	//document.getElementById("city").value='-';
	//document.addCustomer.city.style.visibility="hidden";
}
function showminus2(id)
{
document.getElementById("country1").disabled = false;
document.getElementById("f14").style.display='none';
document.getElementById("newcountry").style.display='none';
document.getElementById("f13").style.display='none';
document.getElementById("f15").style.display="";
document.getElementById("newcountry").value="";



}
function showentryform1()
{
	
	document.getElementById("state").disabled = true;
	document.getElementById("newstate").style.display="";
	document.getElementById("f12").style.display="";
	document.getElementById("f13").style.display='none';
	document.getElementById("f11").style.display="";


}
function showminus1(id)
{
document.getElementById("state").disabled = false;
document.getElementById("f12").style.display='none';
document.getElementById("newstate").style.display='none';
document.getElementById("f11").style.display='none';

document.getElementById("f13").style.display="";
document.getElementById("newstate").value="";

//document.addCustomer.city.style.visibility="visible";

}

function showentryform()
{
	
	document.getElementById("city").disabled = true;//select id
	document.getElementById("newcity").style.display="";//input type id
	document.getElementById("f10").style.display="";
	document.getElementById("f11").style.display='none';
	
	//document.getElementById("city").value='-';
	//document.addCustomer.city.style.visibility="hidden";
}
function showminus(id)
{
document.getElementById("city").disabled = false;
document.getElementById("f10").style.display='none';
document.getElementById("newcity").style.display='none';

document.getElementById("f11").style.display="";
document.getElementById("newcity").value="";

//document.addCustomer.city.style.visibility="visible";

}

function getClient1(id)
{ 
	//alert("in2 get"+id);

	if(id=="+")
    {
	document.getElementById("f1").style.display='none';
	document.getElementById("mobileno1").style.display='';
	document.getElementById("f2").style.display="";
	document.getElementById("f3").style.display="";
	
    }
}
function getClient2(id)

    {
	if(id=="+")
    {
	document.getElementById("f1").style.display='none';
	document.getElementById("mobileno2").style.display='';
	document.getElementById("f2").style.display='none';
	document.getElementById("f3").style.display='none';
	document.getElementById("f4").style.display="";
	
	
    }
	else{


		//alert("in2 get"+id);

		    document.getElementById("mobileno1").value="";
		document.getElementById("f1").style.display="";
		document.getElementById("mobileno1").style.display='none';
		
		document.getElementById("f2").style.display='none';
		document.getElementById("f3").style.display='none';
    }
    }


function getClient3(id)
{ 
	//alert("in2 get"+id);

	if(id=="-")
    {
	//document.getElementById("f1").style.display='none';
	document.getElementById("mobileno2").style.display='none';
	document.getElementById("f2").style.display="";
	document.getElementById("f3").style.display="";
	document.getElementById("f4").style.display='none';
	
	
    }
}


function Disable()
{
	var abc=document.getElementById("country1").value;
	alert(abc);
	if(abc=="Select")
		{
		
// 		document.getElementById("state").disabled = true;
		}
	else{
		
		
		document.getElementById("state").disabled = true;
		document.getElementById("city").disabled = true;
	}
	
	}
		


</script>
<%@ include file="header.jsp"%>
<%!
Connection con1;
%>
<% 
		Class.forName(DB_Driver);
		con1 = DriverManager.getConnection(DB_NAME,DB_USERNAME,DB_PASSWORD);
		%>
		
		<%



Statement stdynamicdrop = null;
String datenew1="",datenew2="",datenew3="";
datenew1=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
datenew3=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date());
datenew2=datenew1;
//centnon1.getConnection();
// con1=centconn.ReturnConnection();
//stdynamicdrop=con1.createStatement();
String Category=request.getParameter("Category");
System.out.println("-CAt===="+Category);
Statement st = null, st1 = null, st3 = null, st4 = null,st2 = null;

String selectedName;
String FollowUpType = "";String company="";
st = con1.createStatement();
st1 = con1.createStatement();
st2 = con1.createStatement();
st3 = con1.createStatement();
st4 = con1.createStatement();


%>
 
<form name="addCustomer" action="addCustomer.jsp" method="post" onsubmit="return formValidation();">
<%

if(Category.equals("Liaison") || Category=="Liaison")
{
	Category="Liaison";
	
%>
<input type="hidden" name="Category" id="Category" value="<%=Category %>"  />
<br>
<br>
<div align="center" class="headerlay"><table style="color:#fff;"><tbody><tr><td><label id="element_1" name="element_1"  class="description" for="element_1"><font size="3px" color="black"><b>Add New <%=Category %> Officer</b></font> </label></td></tr></tbody></table></div>
<% }
else
	
{
	
	Category="Prospect";
%>
<br>
<br>
<div align="center" class="headerlay"><table style="color:#fff;"><tbody><tr><td><label id="element_1" name="element_1"  class="description" for="element_1"><font size="3px" color="black"><b>Add New <%=Category %></b></font> </label></td></tr></tbody></table></div>
<%} %>

<table border="0" width="400" align="center" class="sortable_entry_new">
<tr>
<td><label id="element_1" name="element_1"  class="description" for="element_1"><b>Marketing Rep. Name :</b> <%=session.getAttribute("EmpName").toString() %></textarea><br><br><!--1,1--></label></td>
<td><!--1,2--></td>
</tr>
<tr>
 <td><label id="element_1" name="element_1"  class="description" for="element_1"><font color="red" size="2">*</font><b>Company Name</b></label><input type="text"  class="element text medium" name="companyName"   id="companyName" onkeyup="getProspectes();"  onblur="validateProspectes()" /></textarea>
 <div>
<label id="companynaw1" style="display: none;"><font face="Arial" size="2" color="red">Please Enter company Name</font></label>
<label id="companynaw2" style="display: none;"><font face="Arial" size="2" color="red">Please Enter Character value</font></label>
</div>
<font face="Arial" size="2" color="red">
				<span id="err"> </span>
				</font> 

</td>
<td><label id="element_1" name="element_1"  class="description" for="element_1"><font color="red" size="2">*</font><b>Contact Person :</b> </label><input id="contactperson@123" name="contactPerson"  class="element text medium" type="text"  value=""  onblur="return contactpersonfun();"/></input>
<div><label id="contact1" style="display: none;"><font face="Arial" size="2" color="red">Please Enter Contact Person Name</font></label>  
 	<label id="contact2" style="display: none;"><font face="Arial" size="2" color="red">Please Enter Character Value</font></label> 
 </div>

</td>

</tr>

<tr>


	  	<tr>
		<%
		System.out.println("usr level  -> "+session.getAttribute("userLevel").toString());
		if((session.getAttribute("userLevel").toString().equalsIgnoreCase("level5"))){ %>

	
<td><label id="element_1" name="element_1"  class="description" for="element_1"><b>Assign To :</b> </label><select id="assignTo" name="assignTo"  class="element select medium" >
	<%
							String sql = "select MarketingRepName ,MarketingRepCode from db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"marketingrepmaster "+
							" WHERE username<>'' and password<>''  and (Compressor=1 OR	DigitalEquipment=1 OR 	DGSet=1 OR 	Endoscope=1 OR 	OtherGroups=1 ) order by MarketingRepName";
								ResultSet rs = st.executeQuery(sql);
								%>
								<option value="<%=session.getAttribute("EmpName").toString() %>"><%=session.getAttribute("EmpName").toString() %></option>
								<%
								while (rs.next()) {
						%>
						<option value="<%=rs.getString(1)%>">
							<%=rs.getString(1)%></option>
						<%
							}
						%>
					</select>
					<input type="hidden" name="assignedBy" value="<%=session.getAttribute("EmpName").toString() %>"  />
			</td> 

		
			<td><label id="element_1" name="element_1"  class="description" for="element_1"><b>Lead reference :</b> </label><input id="leadRef" name="leadRef"  class="element text medium" type="text"  value=""/></textarea><br><br><!--3,2--></td>
		<%} else{%>
		<tr>
		<input type="hidden" name="assignedBy" value="<%=session.getAttribute("EmpName").toString() %>"  /></input>
		<input type="hidden" name="assignTo" value="<%=session.getAttribute("EmpName").toString() %>"  /></input>
		
		<td><label id="element_1" name="element_1"  class="description" for="element_1"><b>Lead reference :</b> </label><input id="leadRef" name="leadRef"  class="element text medium" type="text"  value=""/></textarea><br><br><!--3,2--></td>
		<%} %>
		

</tr>
<tr>

<!-- <option value="select" selected="selected">select</option><option value="D.M.Raut">D.M.Raut</option><option value="Romil Shah">Romil Shah</option></select></textarea><br><br>3,1</td> -->
<!-- <td><label id="element_1" name="element_1"  class="description" for="element_1"><b>Lead reference :</b> </label><input id="leadRef" name="leadRef"  class="element text medium" type="text"  value=""/></textarea><br><br>3,2</td> -->
</tr>
<tr>
<td><label id="element_1" name="element_1"  class="description" for="element_1"><b>WebSite :</b> </label><input id="website" name="website"  class="element text medium" type="text"  value=""/></textarea><br><br><!--4,1--></td>
<td><!--4,2--></td>
</tr>
<tr>
<td><label id="element_1" name="element_1"  class="description" for="element_1"><font color="red" size="2">*</font><b>E-mail :</b> </label><input id="email" name="email"  class="element text medium" type="text"  value=""  onblur="return validateEmail();"/></textarea>
<div>
<label  id="email3" style="display: none;"><font face="Arial" size="2" color="red">Please Enter EmailID</font></label> 
<label  id="email1" style="display: none;"><font face="Arial" size="2" color="red">Please Enter valid EmailID</font></label> 
<label   id="email2" style="display: none;"><font face="Arial" size="2" color="red">Please Enter valid EmailID</font></label> 
</div>
</td>
<td><label id="element_1" name="element_1"  class="description" for="element_1"><b>Address :</b> </label><textarea id="address" name="address" style='width: 200px; height:50px' class="element textarea medium"/></textarea><br><br><!--11,2--></td>

</tr>
<tr>
<td><label id="element_1" name="element_1"  class="description" for="element_1"><b>Country :</b> </label>  
<select  id="country1" name="country1"  onchange="showbox();showbox2();"  class="element select medium"  >
				  	<option value="Select">     </option>
				  <% String sqlDropdown3="SELECT Distinct(Country) FROM db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"citystctryinfo order by Country asc";
				  ResultSet rsDropdown3=st2.executeQuery(sqlDropdown3);
				  while(rsDropdown3.next()){
				  %>
				  <option value="<%=rsDropdown3.getString(1)%>"><%=rsDropdown3.getString(1)%></option>
							
						<% 	}%> 
				</select></textarea><br>
					<div>
					 <input type="text" class="element text medium" name="newcountry" id="newcountry" style="display: none"/><a href="#" style="font-weight: bold; color: blue;display: none " id="f14" onclick="showminus2('-')"><font  size="3" >(-)</font></a>
	
				
				<a href="#" style="font-weight: bold; color: blue;" id="f15" onclick="showentryform2();">Add Country</a>
		
			</div>
		
				</td>
<td>
<label id="element_1" name="element_1"  class="description" for="element_1"><b>State :</b></label>
<select  disabled class="element select medium" id="state"  name="state"   onchange="showbox1()" > 
	<option value="Select">    </option>
				<% String sqlDropdown2="SELECT Distinct State FROM db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"citystctryinfo order by State asc";
				  ResultSet rsDropdown2=st2.executeQuery(sqlDropdown2);
				  while(rsDropdown2.next()){
				  %>
				  <option value="<%=rsDropdown2.getString(1)%>"><%=rsDropdown2.getString(1)%></option>
							
						<% 	}%> 

            </select>
            <div>

				 <input  class="element text medium"  name="newstate" id="newstate" style=" display: none"/><a href="#" style="font-weight: bold; color: blue;display: none " id="f12" onclick="showminus1('-')"><font  size="3" >(-)</font></a>
	
				
				<a href="#" style="display: none;font-weight: bold; color: blue;" id="f13" onclick="showentryform1();" >Add State</a></br>
		
			</div>

			</td>

<tr>
<td><label id="element_1" name="element_1"  class="description" for="element_1"><b>City :</b> </label>
<select  disabled class="element select medium" id="city" name="city" style='width: px; height: auto;'>
<option value="Select">    </option>
				  <% String sqlDropdown1="SELECT Distinct City FROM db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"citystctryinfo order by City asc ";
				  ResultSet rsDropdown1=st2.executeQuery(sqlDropdown1);
				  while(rsDropdown1.next()){
				  %>
				  <option><%=rsDropdown1.getString(1)%></option>
							
						<% 	}%> 
				</select>
							<div>
			<input  class="element text medium" name="newcity" id="newcity" style="width: ; display: none"  /><a href="#" style="font-weight: bold; color: blue;display: none " id="f10" onclick="showminus('-')"><font  size="3" >(-)</font></a>
	
				
				<a href="#" style="display: none;font-weight: bold; color: blue;" id="f11" onclick="showentryform();">Add City</a></br>
			</div>
			</td>
<td><label id="element_1" name="element_1"  class="description" for="element_1"><b>PinCode :</b> </label><input id="zip" name="zip"  class="element text medium" type="text"  value="" onblur="return pin();"/></textarea><br><br><!--7,2-->
<div>
				 <label id="zip1" style="display: none;"><font face="Arial" size="2" color="red">Please Enter Numeric Value</font></label> 
				 <label id="zip2" style="display: none;"><font face="Arial" size="2" color="red">Please Enter Numeric Value</font></label> 
				</div>
				</td>
</tr>
<tr>
<td><label id="element_1" name="element_1"  class="description" for="element_1"><font color="red" size="2">*</font><b>Mobile No :</b> </label><input id="mobile" name="mobile"  class="element text medium" type="text"  value=""  onblur="return funmob1();"/></textarea>
 <div>
	<label id="mob1"  style="display: none;"><font face="Arial" size="2" color="red">Please Enter Numeric value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></label>
				<label id="mob12" style="display: none;"><font face="Arial" size="2" color="red">Number Should Be 10-15 Digits&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></label>
		        <label id="mob123"  style="display: none;"><font face="Arial" size="2" color="red">Please Enter Mobile Number&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></label>
		         </div>
		        </td>
<td><label id="element_1" name="element_1"  class="description" for="element_1"><b>Fax No :</b> </label><input id="faxno" name="faxno"  class="element text medium" type="text"  value=""   onblur="return fax();"/></textarea>
<div>
 <label id="fax1" style="display: none;"><font face="Arial" size="2" color="red">Please Enter Numeric Value</font></label> 
				<label id="fax2" style="display: none;"><font face="Arial" size="2" color="red">Please Enter Numeric Value</font></label>
</div>
</td>
</tr>
<tr>
<td><label id="element_1" name="element_1"  class="description" for="element_1"><b>STD Code :</b> </label><input id="std" name="std" maxlength="6" class="element text medium" type="text"  value="" onblur="return units5();"/></textarea>
	<div>
				 <label id="noofunits3" style="display: none;"><font face="Arial" size="2" color="red">Please Enter Numeric Value</font></label>
				 <label id="noofunits4" style="display: none;"><font face="Arial" size="2" color="red">Please Enter Numeric Value</font></label> 
				</div>
				</td>
<td><label id="element_1" name="element_1"  class="description" for="element_1"><font color="red" size="2">*</font><b>Phone Number :</b> </label><input id="phone" name="phone"  class="element text medium" type="text"  value=""  onblur="return funmob2();"/></textarea>
<div>		<label id="phone1"  style="display: none;"><font face="Arial" size="2" color="red">Please Enter Numeric value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></label>
				<label id="phone2" style="display: none;"><font face="Arial" size="2" color="red">Number Should Be 10-14 Digits&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></label>
		        <label id="phone3"  style="display: none;"><font face="Arial" size="2" color="red">Please Enter Phone Number&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></label>
		         </div>
</td>


</tr>
<tr>
<td><label id="element_1" name="element_1"  class="description" for="element_1"><b>Category :</b> </label><select id="category" name="category"  class="element select medium" > 
		  	<option value="0">Select</option>
				  	
				  <% String sqlDropdown="SELECT TheGroupName,TheGroupCode FROM db_GlobalERP."+session.getAttribute("CompanyMasterID").toString()+"tbl_groupmaster where IsDataValid='1' order by TheGroupName";
				  ResultSet rsDropdown=st2.executeQuery(sqlDropdown);
				  while(rsDropdown.next()){
				  %>
				  <option value="<%=rsDropdown.getString(2)%>">
				  <%=rsDropdown.getString(1)%></option>
							
						<% 	}%> 
						</select>
<td><label id="element_1" name="element_1"  class="description" for="element_1"><b>Intrested In Product :</b> </label><input id="product" name="product"  class="element text medium" type="text"  value=""/></textarea><br><br><!--10,2--></td>
</tr>
<tr>
<td><label id="element_1" name="element_1"  class="description" for="element_1"><b>Weekly Off :</b> </label><input id="weeklyOffOn" name="weeklyOffOn"  class="element text medium" type="text"  value="" onblur="return contactpersonfun1();"/></textarea>
<div>	 
 				<label id="contact3" style="display: none;"><font face="Arial" size="2" color="red">Please Enter Character Value</font></label> 
 		   </div>
<label id="element_1" name="element_1"  class="description" for="element_1"><b>Potential Value :</b> </label><input id="potentialValue" name="potentialValue"  class="element text medium" type="text"  value="" onblur="return code1();" /></textarea>
<div>
				 <label id="std3" style="display: none;"><font face="Arial" size="2" color="red">Please Enter Numeric Value</font></label> 
				 <label id="std4" style="display: none;"><font face="Arial" size="2" color="red">Please Enter Numeric Value</font></label> 
				</div>
<label id="element_1" name="element_1"  class="description" for="element_1"><b>No Of Units :</b> </label><input id="noofunits" name="noofunits"  class="element text medium" type="text"  value="0" onblur="return  units();"/></textarea>

<div>
				 <label id="noofunits1" style="display: none;"><font face="Arial" size="2" color="red">Please Enter Numeric Value</font></label> 
				 <label id="noofunits2" style="display: none;"><font face="Arial" size="2" color="red">Please Enter Numeric Value</font></label> 
				</div>
</td>

<td><label id="element_1" name="element_1"  class="description" for="element_1"><b>Alternate Number :</b> </label><input id="alternateNumber" name="alternateNumber" maxlength="15" class="element text medium" type="text"  value="" onblur="return  funmob3();" /></textarea>
  <div>
				<label id="mob7"  style="display: none;"><font face="Arial" size="2" color="red">Please Enter Numeric value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></label>
                <label id="mob8"  style="display: none;"><font face="Arial" size="2" color="red">Please Enter Numeric value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></label>
		      </div>
<label id="element_1" name="element_1"  class="description" for="element_1"><b>Comments :</b> </label><textarea id="comments" name="comments" style='width: 200px; height:50px' class="element textarea medium"/></textarea><br><br><!--11,2--></td>
</tr>
</table>
<div align="center">
<label id="element_1" name="element_1"  class="description" for="element_1"><b></b> </label><input id="submit" name="submit"  class="button_text" type="submit"  value="Submit" /></textarea><br><br>
</div>
</form>
</jsp:useBean>

<%-- <%@include file="footer_new.jsp"%> --%>

<%@ include file="footer_new.jsp"%>