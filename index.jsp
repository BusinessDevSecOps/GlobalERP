<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-166064963-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-166064963-1');
</script>






<script language="javascript">
	function validate()
	{
		if(document.getElementById("username").value=="")
		{
				alert("Please Enter User Name");
				return false;
		}
		if(document.getElementById("pass").value=="")
		{
				alert("Please Enter password");
				return false;
		}
		return true;
	}
</script>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Transworld Technologies LTD, ERP</title>
<link rel="icon" href="images/transworld.jpg" type="image/jpg" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
<link href="css/footer.css" rel="stylesheet" type="text/css"/>

</head>
<body>
<div id="wrapper">
	<div id="header-wrapper">
		<div id="header">
			<div id="logo">
				 <a href="http://www.transworldcompressor.com/">
				<img src="images/transworld.jpg"></img>
				 </a>
			</div> 
			<div id="menu">
				<ul>
					<li class="current_page_item"><a href="#">Home</a></li>
					<li><a href="#">Blog</a></li>
					<li><a href="#">About</a></li>
					<li><a href="#">Contact</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- end #header -->
	
	<!-- end #page -->
</div>
<br></br>

<table width="100%" border="0">
<tr><td style="width: 50%;"><div align="center">
<img src="images/homepage.jpg"></img>
</div></td>

<td align="center">
                
           <form name="fleetviewlogin" action="login.jsp" method="post" onsubmit="return validate();">
			<table border="0" width="50%" align="center">
						<tr>
						<td colspan="2" align="center">
						</td>
						</tr>
			
						<tr>
						 <td colspan="2">
 		                     <img src="images/erp.jpeg" height="75" width="180"></img>
                        </td>           
                      </tr>
                      
						<tr><td colspan="2">
<%
						try{
						String msg=request.getParameter("err");
						if(msg.equals("err1"))
						{
							out.print("<font color='blue' size='2'>Please enter correct user name and password</font>");
						}		
						else if(msg.equals("err2"))
						{
							out.print("<font color='blue' size='2'><blink>Session expired, please login again.</blink></font>");
						}	
						 if(msg.equals("serverDown"))
						{
							out.print("<font color='blue' size='2'><blink>SERVER is down right now.<br> Please try after some time.</blink></font>");
						}	
							}catch(Exception a)
							{
							}			
						%>						
						</td></tr>
						<tr><td  bgcolor="#f5f5f5" align="center"><B><font size="2">User Name:</font></B></td><td><input type="text" name="username" id="username"></td></tr>
						<tr><td  bgcolor="#f5f5f5" align="center"><B><font size="2">Password:</font></B></td><td><input type="password" name="pass" id="pass"></td></tr>
						<tr><td colspan="2" align="left"><input type="submit" name="Submit" value="Submit"></td></tr>					
						</table>            					
            				</form>	
            					</td>
                     
                    </td></tr></table>




</body>
</html>
<%@include file="footer_new.jsp" %>
