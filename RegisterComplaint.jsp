<%@ include file="conn.jsp"%>
<%@ include file="ConnectionComplaint.jsp" %>
<%@page import="java.util.Date"%>
 

<%!
Connection conn,con;
String ReportName="",Description="",Entby="",Name="",EmailID="",Email1="",FileName="",Category="";
String Priority="",ClosingComments="",ClosedBy="",Status="";
Date ComplaintDateTime,UpadteDateTime;
String ContactNumber="";

%>
<html>
<head>
<script type="text/javascript">

onload=function resertval()
{
	 //var elems = document.getElementsByName("browser");
	 //	for(var i=0;i<elems.length;i++)
	 	//{
	 	//	elems[i].checked==false;
	 	//}

	 	//document.incident.EmailID.value="";
	 	//document.getElementById("Number").value="";
	 //	document.getElementById("search-text").value="";
	 //	document.getElementById("Category").value="Hardware";
	 	//document.getElementById("Priority").value="Low"; 	
}

function cleareall()
{
	//alert("in clear");
	 document.getElementById("tr1").style.display="none";   
     document.getElementById("tr2").style.display="none"; 
     document.getElementById("tr5").style.display="none"; 
     document.getElementById("tr6").style.display="none"; 
     document.getElementById("tr7").style.display="none"; 
     document.getElementById("tr8").style.display="none"; 
     document.getElementById("tr9").style.display="none"; 
     document.getElementById("tr10").style.display="none";
     document.getElementById("tr11").style.display="none";  
     document.getElementById("tr12").style.display="none"; 
     document.getElementById("tr13").style.display="none"; 
     document.getElementById("tr14").style.display="none"; 
     document.getElementById("tr15").style.display="none"; 
     document.getElementById("tr16").style.display="none";
     document.getElementById("tr17").style.display="none";  
     document.getElementById("tr18").style.display="none"; 
     document.getElementById("tr18").style.display="none"; 
     document.getElementById("tr20").style.display="none"; 
     document.getElementById("tr21").style.display="none"; 
        document.incident.Filename1.value="";
		document.incident.Filename2.value="";
		document.incident.Filename3.value="";
		document.incident.Filename4.value="";
		document.incident.Filename5.value="";
		document.incident.Filename6.value="";
		document.incident.Filename7.value="";
		document.incident.Filename8.value="";
		document.incident.Filename9.value="";
		document.incident.Filename10.value="";
}
function validateEmail(email)
{
     var splitted = email.match("^(.+)@(.+)$");
    if(splitted == null) return false;
    if(splitted[1] != null )
    {
      var regexp_user=/^\"?[\w-_\.]*\"?$/;
      if(splitted[1].match(regexp_user) == null) return false;
    }
    if(splitted[2] != null)
    {
      var regexp_domain=/^[\w-\.]*\.[A-Za-z]{2,4}$/;
      if(splitted[2].match(regexp_domain) == null) 
      {
	    var regexp_ip =/^\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\]$/;
	    if(splitted[2].match(regexp_ip) == null) return false;
      }// if
      return true;
    }
return false;
}



function validateform1()
{
	try
	{
	//alert("in validation");
	//var reportname=document.incident.ReportName.value;
	// var username=document.incident.UserName.value;
	 var emailid=document.incident.EmailID.value;
	 var number=document.getElementById("Number").value;
      var desc=document.getElementById("search-text").value;

    // alert(document.getElementById("imageDiv").innerHTML.length);
     
	//	alert("report name:",reportname);
	// alert(username);
		//alert(emailid);
	//alert(number);
	 
	
	// if(document.getElementById("tr1").style.display=="" || document.getElementById("tr5").style.display=="" || document.getElementById("tr7").style.display=="" || document.getElementById("tr9").style.display=="" || document.getElementById("tr11").style.display=="" || document.getElementById("tr13").style.display=="" || document.getElementById("tr15").style.display=="" || document.getElementById("tr17").style.display=="" || document.getElementById("tr19").style.display=="" || document.getElementById("tr21").style.display=="")
	//{
		//alert("in if");	
	//}else
	 var cnt=document.incident.counter.value;
	//alert("Count "+cnt);
	//if(cnt>0)
	//{
		//alert(document.incident.Filename1.value);
		/*if(document.incident.Filename1.value == "" || document.incident.Filename2.value=="" || document.incident.Filename3.value=="" || document.incident.Filename4.value=="" || document.incident.Filename5.value=="" || document.incident.Filename6.value=="" || document.incident.Filename7.value=="" || document.incident.Filename8.value=="" || document.incident.Filename9.value=="" || document.incident.Filename10.value=="")
		{
			alert("Please attach the file");
			return false;
		}*/
//alert(cnt);
		//alert(document.getElementById("imageDiv").innerHTML.length);
		/*if(document.getElementById("tr1").style.display=="" && document.getElementById("f1").innerHTML.length==0)
		{
			alert("Please attach the file");
			return false;
		}
		if(document.getElementById("tr5").style.display=="" && document.getElementById("f2").innerHTML.length==0)
		{
			alert("Please attach the file");
			return false;
		}
		if(document.getElementById("tr7").style.display=="" && document.getElementById("f3").innerHTML.length==0)
		{
			alert("Please attach the file");
			return false;
		}
		if(document.getElementById("tr9").style.display=="" && document.getElementById("f4").innerHTML.length==0)
		{
			alert("Please attach the file");
			return false;
		}
		if(document.getElementById("tr11").style.display=="" && document.getElementById("f5").innerHTML.length==0)
		{
			alert("Please attach the file");
			return false;
		}
		if(document.getElementById("tr13").style.display=="" && document.getElementById("f5").innerHTML.length==0)
		{
			alert("Please attach the file");
			return false;
		}
		if(document.getElementById("tr15").style.display=="" && document.getElementById("f7").innerHTML.length==0)
		{
			alert("Please attach the file");
			return false;
		}
		if(document.getElementById("tr17").style.display=="" && document.getElementById("f8").innerHTML.length==0)
		{
			alert("Please attach the file");
			return false;
		}
		if(document.getElementById("tr19").style.display=="" && document.getElementById("f9").innerHTML.length==0)
		{
			alert("Please attach the file");
			return false;
		}
		if(document.getElementById("tr21").style.display=="" && document.getElementById("f10").innerHTML.length==0)
		{
			alert("Please attach the file");
			return false;
		}*/
	//}
	 if(null==desc || desc.length==0)
     {
         alert("Please enter the Description!!");
         return false;
     }
    
	//if(document.getElementById("tr1").style.display=="" || document.getElementById("tr5").style.display=="" || document.getElementById("tr7").style.display=="" || document.getElementById("tr9").style.display=="" || document.getElementById("tr11").style.display=="" || document.getElementById("tr13").style.display=="" || document.getElementById("tr15").style.display=="" || document.getElementById("tr17").style.display=="" || document.getElementById("tr19").style.display=="" || document.getElementById("tr21").style.display=="")
	if(cnt==0)
	{
		//alert("count");
		if(document.incident.Filename1.value=="" || document.incident.Filename2.value=="" || document.incident.Filename3.value=="" || document.incident.Filename4.value=="" || document.incident.Filename5.value=="" || document.incident.Filename6.value=="" || document.incident.Filename7.value=="" || document.incident.Filename8.value=="" || document.incident.Filename9.value=="" || document.incident.Filename10.value=="")
		{
		//alert("in if");	
	    
		//alert("in else");	
		
		
		document.incident.Filename1.value="";
		document.incident.Filename2.value="";
		document.incident.Filename3.value="";
		document.incident.Filename4.value="";
		document.incident.Filename5.value="";
		document.incident.Filename6.value="";
		document.incident.Filename7.value="";
		document.incident.Filename8.value="";
		document.incident.Filename9.value="";
	    document.incident.Filename10.value="";
		
		
	     }
	 
	}  
    /*if(reportname=="")
    {
      alert("Please enter Report Name");
      return false;
     }*/
    /*else if(username=="")
    {
      alert("Please enter User Name");
      return false;
     }*/
    
   /* else if((document.getElementById("tr3").style.display).equalsIgnoreCase(""))
	{
    	alert("if yes");
    	if(number=="")
		{
			alert("Please enter Number");
			return false;
		}
    	else if(isNaN(number))
    		{
    			alert("Please enter Numeric Value");
    			return false;
    		}
    	else if ((number.length < 8)  || (number.length >12)){
            alert("Please enter valid Mobile Number"); return false;
        }
		
	}*/

     if(emailid!="")
    {
      /*alert("Please enter valid Email ID");
      return false;
     }
    else
	{*/
	        //emai=document.getElementById("email").value;
        var temp=new Array();
        temp=emailid.split(",");
        for(var i=0;i<temp.length;i++)
        {
		var sss=validateEmail(temp[i]);
		//alert(temp[i]);
		if(!sss)
			{
			    //alert(sss);
				alert("Please enter valid Email Id");
				return false;
			} 
        }
	}

	var elems = document.getElementsByName("browser");
	for(var i=0;i<elems.length;i++)
	{
		if(elems[i].checked==true)
		{
			//alert("if yes");
	    	if(number=="")
			{
				alert("Please enter Number");
				return false;
			}
	    	 if(isNaN(number))
	    		{

	    	    	//var n1=document.getElementById("no").value;
	    			var n2=number.match("#");
	    			var n4 = number.match("-");
	    			var n3=number.match("[+]");
	    			var splitted3=number.match("[A-Za-z!@$%^&*()_,.<>;:]");
	    			if((n2!=null || n4!=null || n3!=null) && null==splitted3)
	    			{
	    			if(n2=="#" && (number.charAt(0))!="#")
	    				{
	    					alert("Invalid number!!");
	    					return false;
	    				}
	    			else
	    				{
	    				    for(var i=1;i<=number.length;i++)
	    				    	{
	    			 		   	   if(number.charAt(i)=="#")
	    			    			   {
	    			    			        alert("Invalid number!!");
	    			    			        return false;
	    			    			   }
	    			    		}
	    				}
	    		
	    			
	    		//alert(n1.match("[+]"));
	    		if(n3=="+" && (number.charAt(0))!="+")
	    			{
	    				alert("Invalid number!!");
	    			}
	    		else
	    			{
	    			    for(var i=1;i<=number.length;i++)
	    			    	{
	    			    	   if(number.charAt(i)=="+")
	    			    		   {
	    			    		        alert("Invalid number!!");
	    			    		        return false;
	    			    		   }
	    			    	}
	    			}
	    		
	    		
	    		var cnt=1;
	    		//alert(n1.match("-"));
	    		if(number.charAt(0)=="-")
	    			{
	    			 alert("Invalid number!!");
	    			 return false;
	    			}
	    		else
	    			{
	    		 for(var i=1;i<=number.length;i++)
	    			    	{
	    			    	   if(number.charAt(i)=="-")
	    			    		   {
	    			    		   if(cnt>2)
	    			    			   {
	    			    		        alert("Invalid number!!");
	    			    		        return false;
	    			    			   }
	    			    		   cnt++;
	    			    		   }
	    			    	   
	    			    	}
	    			}
	    			}
	    			else
	    			{
	    		    	alert("Please enter Numeric Value");
		    			return false;
	    			}
	    		   
	    		    }
	    	 if((number.length < 4)  || (number.length >15))
	 	    	{
	 	    	//alert("Hii");
	            alert("Please enter valid Mobile Number"); return false;
	            }
			
		}
	
       // alert(number.length);
    return true;
	}
	}catch(e)
	{
		//alert(e);
		return false;
	}
    
	//var lnam=document.userinfo.lname.value;
  //  var mob=document.userinfo.mobno.value;
}


function getradio()
{
	//alert("Hii in radio 1");
	var elems = document.getElementsByName("browser");
	for(var i=0;i<elems.length;i++)
	{
		if(elems[i].checked==true)
		{
			document.incident.Number.value="";
		       document.getElementById("tr3").style.display="";   
		}
		else
			if(elems[i].checked==false)
		{
				document.incident.Number.value="";
			       document.getElementById("tr3").style.display="none"; 
		}
	}
	
}
function getradio1()
{
	//alert("Hii");
	
       document.getElementById("tr3").style.display="none";   	
}
function attach()
{
	try{
	//alert("Hii");
	//alert("in attach ");
	
		
var cnt=document.incident.counter.value;
//alert("351 count "+cnt);
if(cnt>0)
{
	//alert("count "+cnt);
}
else 
{
cnt=1;
var flagvalue=document.incident.flagvalue.value;
flagvalue++;
document.incident.flagvalue.value=flagvalue;
//alert(cnt);
document.incident.counter.value=cnt;

       document.getElementById("tr1").style.display="";   	
       document.incident.Filename1.style.display="";
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
	var cnt=document.incident.counter.value;
	cnt++;
	//alert(cnt);
	document.incident.counter.value=cnt;
	//alert("in attach1 ");
	
	document.getElementById("tr5").style.display="";  
	document.incident.Filename2.style.display="";
	//document.getElementById("imageDiv1").innerHTML="";
    document.getElementById("imageDiv1").style.display="none" 	
    document.getElementById("tr2").style.display="none"; 
    document.getElementById("tr6").style.display="";  
}
function attach2()
{
	var cnt=document.incident.counter.value;
	cnt++;
	//alert(cnt);
	document.incident.counter.value=cnt;
	//alert("in attach2 ");
	document.getElementById("tr7").style.display="";   
	document.incident.Filename3.style.display="";
	//document.getElementById("imageDiv2").innerHTML="";
    document.getElementById("imageDiv2").style.display="none"	
    document.getElementById("tr6").style.display="none"; 
    document.getElementById("tr8").style.display="";  
}
function attach3()
{
	var cnt=document.incident.counter.value;
	cnt++;
	//alert(cnt);
	document.incident.counter.value=cnt;
	//alert("in attach3 ");
	document.getElementById("tr9").style.display="";   
	document.incident.Filename4.style.display="";
	//document.getElementById("imageDiv3").innerHTML="";
    document.getElementById("imageDiv3").style.display="none"	
    document.getElementById("tr8").style.display="none"; 
    document.getElementById("tr10").style.display="";  
}
function attach4()
{
	var cnt=document.incident.counter.value;
	cnt++;
	//alert(cnt);
	document.incident.counter.value=cnt;
	//alert("in attach4 ");
	document.getElementById("tr11").style.display="";
	document.incident.Filename5.style.display="";
	//document.getElementById("imageDiv4").innerHTML="";
    document.getElementById("imageDiv4").style.display="none"   	
    document.getElementById("tr10").style.display="none"; 
    document.getElementById("tr12").style.display="";  
   // document.write("<tr align='center' id='tr23' style='' bgcolor='#FFF6F7'><td><div id='imageDiv' align='center'><font color='maroon' size='2'><b></b></font></div></td><td><input type='file' cols='40' name='Filename' value=''></td></tr>");
}
function attach5()
{
	var cnt=document.incident.counter.value;
	cnt++;
//	alert(cnt);
	document.incident.counter.value=cnt;
	//alert("in attach5 ");
	document.getElementById("tr13").style.display="";  
	document.incident.Filename6.style.display="";
	//document.getElementById("imageDiv5").innerHTML="";
    document.getElementById("imageDiv5").style.display="none" 	
    document.getElementById("tr12").style.display="none"; 
    document.getElementById("tr14").style.display="";  
   // document.write("<tr align='center' id='tr23' style='' bgcolor='#FFF6F7'><td><div id='imageDiv' align='center'><font color='maroon' size='2'><b></b></font></div></td><td><input type='file' cols='40' name='Filename' value=''></td></tr>");
}
function attach6()
{
	var cnt=document.incident.counter.value;
	cnt++;
	//alert(cnt);
	document.incident.counter.value=cnt;
	//alert("in attach6 ");
	document.getElementById("tr15").style.display="";   
	document.incident.Filename7.style.display="";
	//document.getElementById("imageDiv6").innerHTML="";
    document.getElementById("imageDiv6").style.display="none"	
    document.getElementById("tr14").style.display="none"; 
    document.getElementById("tr16").style.display="";  
   // document.write("<tr align='center' id='tr23' style='' bgcolor='#FFF6F7'><td><div id='imageDiv' align='center'><font color='maroon' size='2'><b></b></font></div></td><td><input type='file' cols='40' name='Filename' value=''></td></tr>");
}
function attach7()
{
	var cnt=document.incident.counter.value;
	cnt++;
	//alert(cnt);
	document.incident.counter.value=cnt;
	//alert("in attach7 ");
	document.getElementById("tr17").style.display="";  
	document.incident.Filename8.style.display="";
	//document.getElementById("imageDiv7").innerHTML="";
    document.getElementById("imageDiv7").style.display="none" 	
    document.getElementById("tr16").style.display="none"; 
    document.getElementById("tr18").style.display="";  
   // document.write("<tr align='center' id='tr23' style='' bgcolor='#FFF6F7'><td><div id='imageDiv' align='center'><font color='maroon' size='2'><b></b></font></div></td><td><input type='file' cols='40' name='Filename' value=''></td></tr>");
}
function attach8()
{
	var cnt=document.incident.counter.value;
	cnt++;
	//alert(cnt);
	document.incident.counter.value=cnt;
	//alert("in attach8 ");
	document.getElementById("tr19").style.display="";   
	document.incident.Filename9.style.display="";
	//document.getElementById("imageDiv8").innerHTML="";
    document.getElementById("imageDiv8").style.display="none"	
    document.getElementById("tr18").style.display="none"; 
    document.getElementById("tr20").style.display="";  
   // document.write("<tr align='center' id='tr23' style='' bgcolor='#FFF6F7'><td><div id='imageDiv' align='center'><font color='maroon' size='2'><b></b></font></div></td><td><input type='file' cols='40' name='Filename' value=''></td></tr>");
}
function attach9()
{
	var cnt=document.incident.counter.value;
	
	cnt++;
	//alert(cnt);
	document.incident.counter.value=cnt;
	//alert("in attach9 ");
	document.getElementById("tr21").style.display="";  
	document.incident.Filename10.style.display="";
	//document.getElementById("imageDiv9").innerHTML="";
    document.getElementById("imageDiv9").style.display="none" 	
    document.getElementById("tr20").style.display="none"; 
    
   // document.write("<tr align='center' id='tr23' style='' bgcolor='#FFF6F7'><td><div id='imageDiv' align='center'><font color='maroon' size='2'><b></b></font></div></td><td><input type='file' cols='40' name='Filename' value=''></td></tr>");
}

function upload()
{
	try{
	var file1=document.incident.Filename1.value;
	//alert(file1);
	
	document.incident.Filename1.style.display="none";
	document.getElementById("imageDiv").style.display="";
	document.getElementById("f1").innerHTML=file1;
	//document.incident.Upload.style.display="none";
	
	}catch(e)
	{
		alert(e);
	}
}

function upload1()
{
	try{
		var file1=document.incident.Filename2.value;
		//alert(file1);
		
		document.incident.Filename2.style.display="none"
		document.getElementById("imageDiv1").style.display="";
		document.getElementById("f2").innerHTML=file1;
		//document.incident.Upload.style.display="none";
		
		
		}catch(e)
		{
			alert(e);
		}
}

function upload2()
{
	try{
		var file1=document.incident.Filename3.value;
		//alert(file1);
		
		document.incident.Filename3.style.display="none"
		document.getElementById("imageDiv2").style.display="";
		document.getElementById("f3").innerHTML=file1;
		//document.incident.Upload.style.display="none";
		
		
		}catch(e)
		{
			alert(e);
		}
}

function upload3()
{
	try{
		var file1=document.incident.Filename4.value;
		//alert(file1);
		
		document.incident.Filename4.style.display="none"
		document.getElementById("imageDiv3").style.display="";
		document.getElementById("f4").innerHTML=file1;
		//document.incident.Upload.style.display="none";
		
		
		}catch(e)
		{
			alert(e);
		}
}

function upload4()
{
	try{
		var file1=document.incident.Filename5.value;
		//alert(file1);
		
		document.incident.Filename5.style.display="none"
		document.getElementById("imageDiv4").style.display="";
		document.getElementById("f5").innerHTML=file1;
		//document.incident.Upload.style.display="none";
		
		
		}catch(e)
		{
			alert(e);
		}
}

function upload5()
{
	try{
		var file1=document.incident.Filename6.value;
		//alert(file1);
		
		document.incident.Filename6.style.display="none"
		document.getElementById("imageDiv5").style.display="";
		document.getElementById("f6").innerHTML=file1;
		//document.incident.Upload.style.display="none";
		
		
		}catch(e)
		{
			alert(e);
		}
}

function upload6()
{
	try{
		var file1=document.incident.Filename7.value;
		//alert(file1);
		
		document.incident.Filename7.style.display="none"
		document.getElementById("imageDiv6").style.display="";
		document.getElementById("f7").innerHTML=file1;
		//document.incident.Upload.style.display="none";
		
		
		}catch(e)
		{
			alert(e);
		}
}

function upload7()
{
	try{
		var file1=document.incident.Filename8.value;
		//alert(file1);
		
		document.incident.Filename8.style.display="none"
		document.getElementById("imageDiv7").style.display="";
		document.getElementById("f8").innerHTML=file1;
		//document.incident.Upload.style.display="none";
		
		
		}catch(e)
		{
			alert(e);
		}
}

function upload8()
{
	try{
		var file1=document.incident.Filename9.value;
		//alert(file1);
		
		document.incident.Filename9.style.display="none"
		document.getElementById("imageDiv8").style.display="";
		document.getElementById("f9").innerHTML=file1;
		//document.incident.Upload.style.display="none";
		
		
		}catch(e)
		{
			alert(e);
		}
}

function upload9()
{
	try{
		var file1=document.incident.Filename10.value;
		//alert(file1);
		
		document.incident.Filename10.style.display="none"
		document.getElementById("imageDiv9").style.display="";
		document.getElementById("f10").innerHTML=file1;
		//document.incident.Upload.style.display="none";
		
		
		}catch(e)
		{
			alert(e);
		}
}

function cancel()
{
	//alert("in cancel");
	var cnt=document.incident.counter.value;
   
    cnt--;
   // alert(cnt);
    if(cnt==0)
    {
    	document.incident.counter.value=cnt;
 		cleareall();
 		document.getElementById("f1").innerHTML=""; 	
 		
    }
    else
    {

    document.incident.counter.value=cnt;
	 document.incident.Filename1.value="";

	 document.incident.Filename2.value="";
	     document.getElementById("tr1").style.display="none";   
       document.getElementById("tr2").style.display="none"; 
       document.getElementById("f1").innerHTML=""; 	
}
}
function cancel1()
{//alert("in cancel 1");
	var cnt=document.incident.counter.value;
   
    cnt--;
  // alert(cnt);
    if(cnt==0)
    {
    	document.incident.counter.value=cnt;
		cleareall();
		document.getElementById("f2").innerHTML=""; 
    }
    else
    {

    document.incident.counter.value=cnt;
	
		  document.incident.Filename2.value="";
	       document.getElementById("tr5").style.display="none";   
	       document.getElementById("f2").innerHTML=""; 
}
}
function cancel2()
{//alert("in cancel 2");
	var cnt=document.incident.counter.value;
   
    cnt--;
   // alert(cnt);
    if(cnt==0)
    {
    	document.incident.counter.value=cnt;
		cleareall();
		document.getElementById("f3").innerHTML=""; 
    }
    else
    {
 
    document.incident.counter.value=cnt;
	
	 document.incident.Filename3.value="";
	document.getElementById("tr7").value=""; 
       document.getElementById("tr7").style.display="none"; 
       document.getElementById("f3").innerHTML=""; 
}
}
function cancel3()
{//alert("in cancel 3");
	var cnt=document.incident.counter.value;

    cnt--;
  // alert(cnt);
    if(cnt==0)
    {
    	document.incident.counter.value=cnt;
		cleareall();
		document.getElementById("f4").innerHTML=""; 
    }
    else
    {

    document.incident.counter.value=cnt;
	
	 document.incident.Filename4.value="";
	document.getElementById("tr9").value=""; 
    document.getElementById("tr9").style.display="none";
    document.getElementById("f4").innerHTML=""; 
   
}
}
function cancel4()
{//alert("in cancel 4");
	var cnt=document.incident.counter.value;

    cnt--;
   //alert(cnt);
    if(cnt==0)
    {
    	document.incident.counter.value=cnt;
		cleareall();
		document.getElementById("f5").innerHTML=""; 
    }
    else
    {

    document.incident.counter.value=cnt;
	
	 document.incident.Filename5.value="";
	document.getElementById("tr11").value=""; 
       document.getElementById("tr11").style.display="none";  
       document.getElementById("f5").innerHTML=""; 
  	
}
}
function cancel5()
{//alert("in cancel 5");
	var cnt=document.incident.counter.value;

    cnt--;
//  alert(cnt);
    if(cnt==0)
    {
    	document.incident.counter.value=cnt;
		cleareall();
		document.getElementById("f6").innerHTML=""; 
    }
    else
    {
  
    document.incident.counter.value=cnt;
	
	 document.incident.Filename6.value="";
       document.getElementById("tr13").style.display="none"; 
       document.getElementById("f6").innerHTML=""; 
}
}
function cancel6()
{//alert("in cancel 6");
	var cnt=document.incident.counter.value;

    cnt--;
  //  alert(cnt);
    if(cnt==0)
    {
    	document.incident.counter.value=cnt;
		cleareall();
		document.getElementById("f7").innerHTML=""; 
    }
    else
    {

    document.incident.counter.value=cnt;
	
	 document.incident.Filename7.value="";
       document.getElementById("tr15").style.display="none";  
       document.getElementById("f7").innerHTML=""; 
}
}
function cancel7()
{//alert("in cancel 7");
	var cnt=document.incident.counter.value;

    cnt--;
   // alert(cnt);
    if(cnt==0)
    {
    	document.incident.counter.value=cnt;
		cleareall();
		document.getElementById("f8").innerHTML=""; 
    }
    else
    {

    document.incident.counter.value=cnt;
	
	 document.incident.Filename8.value="";
       document.getElementById("tr17").style.display="none"; 
       document.getElementById("f8").innerHTML=""; 
}
}
function cancel8()
{//alert("in cancel 8");
	var cnt=document.incident.counter.value;
   
    cnt--;
  //  alert(cnt);
    if(cnt==0)
    {
    	document.incident.counter.value=cnt;
		cleareall();
		document.getElementById("f9").innerHTML=""; 
    }
    else
    {

    document.incident.counter.value=cnt;
	
	 document.incident.Filename9.value="";
       document.getElementById("tr19").style.display="none";  
       document.getElementById("f9").innerHTML=""; 
}
}
function cancel9()
{//alert("in cancel 9");
	var cnt=document.incident.counter.value;

    cnt--;
   // alert(cnt);
    if(cnt==0)
    {
    	document.incident.counter.value=cnt;
		cleareall();
		document.getElementById("f10").innerHTML=""; 
    }
    else
    {
  
    document.incident.counter.value=cnt;
	
	 document.incident.Filename10.value="";
     document.getElementById("tr21").style.display="none";  
     document.getElementById("f10").innerHTML=""; 
}
}




</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body style="background-color: #F5F5F5">
<%
try
{
  //System.out.println("\n\n in try");
 //String user=session.getAttribute("user").toString();
 String PageName="";
 String Msg=request.getParameter("Msg");
 System.out.println("******** " +Msg);
 String desc="";
 String EmailID="";
 String Number="";
 String category="";
 String priority="";
	if(Msg!=null && Msg.equalsIgnoreCase("1"))
	{
		  System.out.println("Msg "+Msg);
		     desc=request.getParameter("desc");
		     PageName=request.getParameter("PageName1");
		      EmailID=request.getParameter("email");
		      Number=request.getParameter("Number");
		      category=request.getParameter("Category");
		      priority=request.getParameter("Priority");
		   if(EmailID.equalsIgnoreCase("-"))
		   {
			   EmailID="";
		   }
		   System.out.println("Number "+Number);
		     System.out.println("desc "+desc);
		     System.out.println("PageName "+PageName);
		     System.out.println("EmailID "+EmailID);
		     
	     %>
	     <script type="text/javascript">
	     try{
	      alert("Error was occured while inserting the complaint. Please reattach your attachments and resubmit  your complaint.....");
	     }catch(e)
	     {
		     alert(e);
	     }
	     </script>
	     <%
	}
	else
	{
 PageName=request.getParameter("PageName");
 System.out.println("########### "+PageName);
 desc="";
 EmailID="";
	}
	System.out.println("$$$$$$$$$$$  "+desc);
	System.out.println("$$$$$$$$$$$  "+EmailID);
 String ReportName="-";
 //System.out.println("\n\n session id-->>"+session.getId().toString()); 
 String fname=(String)session.getAttribute("EmpName");
 String email=(String)session.getAttribute("EmpEmail");
 
 System.out.println("%%%%%%%   1040");
    Class.forName(DB_Driver1); 
	conn = DriverManager.getConnection(DB_NAME1,DB_USERNAME1,DB_PASSWORD1);
	Statement s = conn.createStatement();
	Statement s1 = conn.createStatement();
	
	Statement s3 = conn.createStatement();
	///////////**********************connection for complaint are different created by v_abhang(vikram) 06 jun 12
	Class.forName(DB_Driver); 
	con = DriverManager.getConnection(DB_NAME,DB_USERNAME,DB_PASSWORD);
	Statement s2 = con.createStatement();
	String sql2="select * from "+session.getAttribute("CompanyMasterID").toString()+"reportnumber where PageName='"+PageName+"'";
	ResultSet rs3=s2.executeQuery(sql2);
	if(rs3.next())
	{
		ReportName = rs3.getString("ReportName");
	}
	
	
	
    //System.out.println("\n\n sql-->>"+sql1);
    int counter=0;
   
    
	%>


	
		<form name="incident" style="background: #F5F5F5;" method="post"  onsubmit="return validateform1();"  action="ComplaintInsert.jsp" enctype="multipart/form-data">
		
	<div
		style="background: #E6E6E6; font-size: 1.5em; text-align: center; font-family: Arial; color: Red; width: 50%; margin-left: 25%;">
	Complaint Registration Form</div>
	<table align="center"  style="background: #F5F5F5;width: 55%; margin-left: 25%;">
	<tr>
	<td align="right">
	<table align="right"  style="background: #F5F5F5">
	<tr>
	<td colspan="5" align="right" style="width: 100%;font-family: Arial;">
	<div align="right"><font size="2" color="black">
	  <b><br><%=fname %>
	 <br><%=email %></b></font>
	 </div>
	</td>
	</tr>
	</table>
	</td>
	</tr>
	<tr>
	<td>
	<table align="center" style="background: #F5F5F5">

		<tr><td valign="top"><font  color="#990000" size="2">*</font></td>
			<td valign="top" align="left"><font color="black" size="2" face="Arial">Description : </font></td>
			<td >
			<%
			
			%>
				<textarea  name="desc" rows="3" id="search-text"  style='width: 230px; height: auto; border-color: activeborder;'><%=desc %></textarea>
				
				<input type="hidden" name="PageName" id="PageName" value="<%=PageName %>"/>
			</td>
		</tr>
			<tr><td valign="top"><font  color="#990000"></font></td>
			
			<td valign="top" align="left" ><font color="black" size="2" face="Arial">Report Name: </font></td>
			<td>
			    <font color="black" size="2" face="Arial"> <%=ReportName %></font>
				<input type="hidden" name="ReportName" id="ReportName" style="width:230px; height: auto; border-color: white;"  value="<%=ReportName %>" readonly /> 
			</td>
			</tr>
		<tr><td valign="top"><font  color="#990000" size="2">*</font></td>
			<td valign="top" align="left"><font color="black" size="2" face="Arial">Category :</font></td>
			<td align="left"><font color="black" size="2" face="Arial">
			 <select name="Category" id="Category" style="
				  	width: 87px; height:20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;"
						>
					
			 	<%
			 	try
			 	{
                    String sqlcomplaint="select * from "+session.getAttribute("CompanyMasterID").toString()+"complaintcategory";
			 	    ResultSet rsc=s1.executeQuery(sqlcomplaint);
			 	   System.out.println("sqlcomplaint   "+sqlcomplaint);
			 	    while(rsc.next())
			 	    {
			 	    	
			 	     %>
			 	       <option><%=rsc.getString("category") %></option>
			 	 	<%} 
			 	 	}
			 	 	catch(Exception e)
			 	 	{
			 	 		System.out.println("**********    "+e);
			 	 		e.printStackTrace();
			 	 	}%>
			 </select></font>
			</td>
		 
			</tr>
			<tr><td valign="top"><font  color="#990000" size="2">*</font></td>
			<td valign="top" align="left"><font color="black" size="2" face="Arial">Priority :</font></td>
			<td align="left"><font color="black" size="2" face="Arial">
			 <select name="Priority" id="Priority" style="
				  	width: 87px; height:20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;"
						>
			 	<option value="Low">Low</option>
			 	<option value="High">High</option>
			 	
			 </select></font>
			</td>
		</tr>
			<!-- <tr><td valign="top"><font  color="#990000">*</font></td>
		
			<td valign="top" align="left"><font color="black"><b>User Name : </b></font></td>
			<td>
				<input type="text" name="UserName" id="UserName" style="width:230px; border-color: activeborder;" autocomplete="off"  value=""  /> 
			</td>
			</tr>-->
		<tr><td valign="top"><font  color="#990000"></font></td>
			
			<td valign="top" align="left"><font color="black" size="2" face="Arial">Add Email recepients : </font></td>
			<td>
			<%
			System.out.println("^^^^^^^^^^^ "+EmailID);
			%>
				<input  type="text"  name="EmailID"  value="<%=EmailID%>"  id="EmailID"  style="width:230px; border-color: activeborder;" autocomplete="off" /> 
				<br><font size="1" face="Arial">Please enter comma separated email ids.</font>
			</td>
			</tr>
			<!-- </table>
			<table align="center" border="0" cellpadding="3" width="40%" style="background: #F5F5F5">-->
			
			<tr><td valign="top"><font  color="#990000"></font></td>
			<td valign="top" align="left" colspan="1"><font color="black" size="2" face="Arial">Call me back</font>
			<!-- <td>
			<input type="radio" name="browser" value="No"   onclick="getradio1();" checked >No
            <input type="radio" name="browser" value="Yes"  onclick="getradio();">Yes
              </td>-->
              
              &nbsp;&nbsp;&nbsp;<input type="checkbox" name="browser" id="browser"  value="1"  onclick="getradio();"><font size="1" face="Arial">Yes </font>
              </td>
              <td  align="left" style="display: none;" id="tr3"> <input type="text" name="Number" id="Number" style="width:230px; border-color: activeborder;" autocomplete="off"  value="" /><input type="hidden" name="Number1" id="Number1" ></td>
              </tr></table>
			
              <!--  <div id="div2" position="absolute" style="width: 40%; margin-left: 50%">
		              <table align="center" border="0" cellpadding="3" width="40%" style="background: #F5F5F5">
			         <tr align="center" id="tr3" style="display: none;" bgcolor="#F5F5F5">
		    			   <td  align="center"> <font   size="2" color="black"> <b>Number: </b></font> </td>
			 			   <td  align="center"> <input type="text" name="Number" id="Number" style="width:230px; border-color: activeborder;" autocomplete="off"  value="" /><input type="hidden" name="Number1" id="Number1" ></td>
		     			</tr>
		     			</table>
		     			</div>-->
		     			
		     			  
			<table align="center" style="background: #F5F5F5">
			
		<tr>
			<input type="hidden"  name="counter" id="counter" value="<%=counter%>"></input>
			<input type="hidden"  name="flagvalue" id="flagvalue" value="<%=counter%>"></input>
			<td valign="top" align="left" colspan="1"><b>&nbsp;&nbsp; <a href="#" onclick="attach();"><font size="2" face="Arial">Attach File</font></a>
		</b>
		                <div><font size="1" color="black" face="Arial">&nbsp;&nbsp;(You can attach a screen shot of the error page <br>&nbsp;&nbsp;or a file which you would like to link with this complaint entry.)</font> </div>
			           <div id="div2" position="absolute" style="width: 30%;" align="center">
		                <table border="0" align="center" >
		       			<tr align="center" id="tr1" style="display: none;">
		       		    <input type="hidden" id="ip1" name="ip1" value=""></input>
		       		    
		       			<!-- <td><div id="imageDiv" align="center"><font color="maroon" size="2"><b></b></font></div></td>-->
                       <td align="right">&nbsp;&nbsp;<input type="file" cols="40" name="Filename1" value="" onchange="upload();"/></td>
                      <td style="display: none;width: 20%;" id="imageDiv" align="left" colspan="2"><font size="2" face="Arial" color="black" id="f1"></font></td>
                       <td>&nbsp;&nbsp;&nbsp;<b><a href="#" onclick="cancel();"><font size="2" face="Arial">Remove</font></a></b></td>
                        </tr>
                       
                        <tr align="center" id="tr2" style="display: none;" >                        
                        <td valign="top" align="left"><b> &nbsp;&nbsp;<a href="#" onclick="attach1();"><font size="2" face="Arial">AttachMoreFiles </font></a></td></tr>
		               <tr align="center" id="tr5" style="display: none;" >
		               <!--<td><div id="imageDiv" align="center"><font color="maroon" size="2"><b></b></font></div></td>-->
                        <td>&nbsp;&nbsp;<input type="file" cols="40" name="Filename2" value="" onchange="upload1();"/></td>
                       <td style="display: none;width: 20%;" id="imageDiv1" align="left" colspan="2"><font size="2" face="Arial" color="black" id="f2"></font></td>
                       <td>&nbsp;&nbsp;&nbsp; <b><a href="#" onclick="cancel1();"><font size="2" face="Arial">Remove</font></a></b></td>
                        </tr>
                        
                         <tr align="center" id="tr6" style="display: none;" >                        
                        <td valign="top" align="left"><b>&nbsp;&nbsp; <a href="#" onclick="attach2();"><font size="2" face="Arial">AttachMoreFiles </font></a></td></tr>
		               <tr align="center" id="tr7" style="display: none;" >
		               <!--<td><div id="imageDiv" align="center"><font color="maroon" size="2"><b></b></font></div></td>-->
                        <td>&nbsp;&nbsp;<input type="file" cols="40" name="Filename3" value="" onchange="upload2();"/></td>
                        <td style="display: none;width: 20%;" id="imageDiv2" align="left" colspan="2"><font size="2" face="Arial" color="black" id="f3"></font></td>
                        <td>&nbsp;&nbsp;&nbsp;<b><a href="#" onclick="cancel2();"><font size="2" face="Arial">Remove</font></a></b></td>
                        </tr>
                         
                         
                         <tr align="center" id="tr8" style="display: none;" >                        
                        <td valign="top" align="left"><b>&nbsp;&nbsp; <a href="#" onclick="attach3();"><font size="2" face="Arial">AttachMoreFiles </font></a></td></tr>
		               <tr align="center" id="tr9" style="display: none;" >
		               <!--<td><div id="imageDiv" align="center"><font color="maroon" size="2"><b></b></font></div></td>-->
                        <td>&nbsp;&nbsp;<input type="file" cols="40" name="Filename4" value="" onchange="upload3();"/></td>
                         <td style="display: none;width: 20%;" id="imageDiv3" align="left" colspan="2"><font size="2" face="Arial" color="black" id="f4"></font></td>
                        <td>&nbsp;&nbsp;&nbsp;<b><a href="#" onclick="cancel3();"><font size="2" face="Arial">Remove</font></a></b></td>
                        </tr>
                          
                           <tr align="center" id="tr10" style="display: none;" >                        
                        <td valign="top" align="left"><b>&nbsp;&nbsp; <a href="#" onclick="attach4();"><font size="2" face="Arial">AttachMoreFiles </font></a></td></tr>
		               <tr align="center" id="tr11" style="display: none;" >
		               <!--<td><div id="imageDiv" align="center"><font color="maroon" size="2"><b></b></font></div></td>-->
                        <td>&nbsp;&nbsp;<input type="file" cols="40" name="Filename5" value="" onchange="upload4();"/></td>
                         <td style="display: none;width: 20%;" id="imageDiv4" align="left" colspan="2"><font size="2" face="Arial" color="black" id="f5"></font></td>
                       <td>&nbsp;&nbsp;&nbsp;<b><a href="#" onclick="cancel4();"><font size="2" face="Arial">Remove</font></a></b></td>
                        </tr>  
                        
                          <tr align="center" id="tr12" style="display: none;" >                        
                        <td valign="top" align="left"><b>&nbsp;&nbsp; <a href="#" onclick="attach5();"><font size="2" face="Arial">AttachMoreFiles </font></a></td></tr>
		               <tr align="center" id="tr13" style="display: none;" >
		               <!--<td><div id="imageDiv" align="center"><font color="maroon" size="2"><b></b></font></div></td>-->
                        <td>&nbsp;&nbsp;<input type="file" cols="40" name="Filename6" value="" onchange="upload5();"/></td>
                         <td style="display: none;width: 20%;" id="imageDiv5" align="left" colspan="2"><font size="2" face="Arial" color="black" id="f6"></font></td>
                       <td>&nbsp;&nbsp;&nbsp;<b><a href="#" onclick="cancel5();"><font size="2" face="Arial">Remove</font></a></b></td>
                        </tr>  
                        
                          <tr align="center" id="tr14" style="display: none;" >                        
                        <td valign="top" align="left"><b> &nbsp;&nbsp;<a href="#" onclick="attach6();"><font size="2" face="Arial">AttachMoreFiles </font></a></td></tr>
		               <tr align="center" id="tr15" style="display: none;" >
		             <!--  <td><div id="imageDiv" align="center"><font color="maroon" size="2"><b></b></font></div></td>-->
                        <td>&nbsp;&nbsp;<input type="file" cols="40" name="Filename7" value="" onchange="upload6();"/></td>
                         <td style="display: none;width: 20%;" id="imageDiv6" align="left" colspan="2"><font size="2" face="Arial" color="black" id="f7"></font></td>
                       <td>&nbsp;&nbsp;&nbsp; <b><a href="#" onclick="cancel6();"><font size="2" face="Arial">Remove</font></a></b></td>
                        </tr>  
                        
                          <tr align="center" id="tr16" style="display: none;" >                        
                        <td valign="top" align="left"><b>  &nbsp;&nbsp;<a href="#" onclick="attach7();"><font size="2" face="Arial">AttachMoreFiles </font></a></td></tr>
		               <tr align="center" id="tr17" style="display: none;" >
		               <!--<td><div id="imageDiv" align="center"><font color="maroon" size="2"><b></b></font></div></td>-->
                        <td>&nbsp;&nbsp;<input type="file" cols="40" name="Filename8" value="" onchange="upload7();"/></td>
                         <td style="display: none;width: 20%;" id="imageDiv7" align="left" colspan="2"><font size="2" face="Arial" color="black" id="f8"></font></td>
                          <td>&nbsp;&nbsp;&nbsp;<b><a href="#" onclick="cancel7();"><font size="2" face="Arial">Remove</font></a></b></td>
                        </tr>  
                        
                          <tr align="center" id="tr18" style="display: none;" >                        
                        <td valign="top" align="left"><b> &nbsp;&nbsp;<a href="#" onclick="attach8();"><font size="2" face="Arial">AttachMoreFiles </font></a></td></tr>
		               <tr align="center" id="tr19" style="display: none;" >
		               <!--<td><div id="imageDiv" align="center"><font color="maroon" size="2"><b></b></font></div></td>-->
                        <td>&nbsp;&nbsp;<input type="file" cols="40" name="Filename9" value="" onchange="upload8();"/></td>
                         <td style="display: none;width: 20%;" id="imageDiv8" align="left" colspan="2"><font size="2" face="Arial" color="black" id="f9"></font></td>
                       <td>&nbsp;&nbsp;&nbsp; <b><a href="#" onclick="cancel8();"><font size="2" face="Arial">Remove</font></a></b></td>
                        </tr>  
                        
                          <tr align="center" id="tr20" style="display: none;" >                        
                        <td valign="top" align="left"><b> &nbsp;&nbsp;<a href="#" onclick="attach9();"><font size="2" face="Arial">AttachMoreFiles</font> </a></td></tr>
		               <tr align="center" id="tr21" style="display: none;" >
		               <!-- <td><div id="imageDiv" align="center"><font color="maroon" size="2"><b></b></font></div></td>-->
                        <td>&nbsp;&nbsp;<input type="file" cols="40" name="Filename10" value="" onchange="upload9();"/></td>
                        <td style="display: none;width: 20%;" id="imageDiv9" align="left" colspan="2"><font size="2" face="Arial" color="black" id="f10"></font></td>
                        <td>&nbsp;&nbsp;&nbsp; <b><a href="#" onclick="cancel9();"><font size="2" face="Arial">Remove</font></a></b></td>
                        </tr>  
                                             
                      
		                
                        </table>
                        </div>
			
			</td>
		</tr>
		</table>
			<table align="center" border="0" cellpadding="3" width="40%" style="background: #F5F5F5; margin-left: 18%;">
			
		<tr><td> </td></tr><tr><td> </td></tr>
		<tr>
			<td valign="bottom" align="center" colspan="2">
			<div><input type="submit" id="submit" name="submit" value="Submit" /></div>
			</td>
		</tr>
 
<%
if(Msg!=null && Msg.equalsIgnoreCase("1"))
{
	if(!(Number.equalsIgnoreCase("")) && !(Number.equalsIgnoreCase("-")))
	{
		System.out.println("in number "+Number);
		%>
		<input type="hidden" id="Number2" value="<%=Number %>"></input>
		
		<script>
		try
		{
		
		var elems = document.getElementsByName("browser");
		 	for(var i=0;i<elems.length;i++)
		 	{
		 		elems[i].checked=true;
		 	}
		 	document.getElementById("tr3").style.display="";
		 	//alert("Number2 "+document.getElementById("Number2").value);
		 
		 	document.getElementById("Number").value=document.getElementById("Number2").value;
		 	
		 	//alert("Number "+document.getElementById("Number").value);
		}catch(e)
		{
			alert(e);
		}
		</script>
		<%
		System.out.println("in number1");
	}
	%>
	<input type="hidden" id="Category1" value="<%=category %>"></input>
		<input type="hidden" id="priority1" value="<%=priority %>"></input>
		<script>
		//alert("Category1 "+document.getElementById("Category1").value);
	 //	alert("priority1 "+document.getElementById("priority1").value);
		document.getElementById("Category").value=document.getElementById("Category1").value;
	 	document.getElementById("Priority").value=document.getElementById("priority1").value;
		</script>
	<%
}

%>
 
	</table>
	</td></tr>
	</table>
<br>
	<br>
	<br>
	
	</form>

	
	
	
	<%


    
    
}
catch(Exception e)
{
	e.printStackTrace();
}
 %></body>
	</html>


