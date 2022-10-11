<%@page import="java.io.*" import="java.sql.*" %>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@ include file="header.jsp"%>

<jsp:useBean id="ERP" class="com.erp.beans.ERP" scope="page">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Change Password</title>
</head>
<body>
<script>
function cancelbutton()
{
	
	document.changepassword.action ="home.jsp";
	
}

</script>
<%
	System.out.println("allo");
    String mUsername=session.getAttribute("user").toString();
	String mPassword="",mcode="";
    if (request.getQueryString()!=null)
	{
		try
	    {
			ERP.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
	    	Connection conn = null;
	    	Statement st = null;
	    	Statement st1 = null;
	    	conn = ERP.ReturnConnection();
	        st = conn.createStatement();
	        st1 = conn.createStatement();
	        String sql="";
	        String sql1="";
	    	sql="select * from "+session.getAttribute("CompanyMasterID").toString()+"security where username='"+mUsername+"' limit 1";
	    	sql1="select * from UserMaster where username='"+mUsername+"'";
	    	System.out.println(sql);
	    	ResultSet rs=st.executeQuery(sql);
	        while (rs.next())
	        {
	        	mPassword=rs.getString("password");
	        	mcode=rs.getString("EmpCode");
	        }
	        System.out.println(" mUsername >>"+mUsername + " mPassword >>"+mPassword+" mcode>>"+mcode);
	        	
	    }
	    catch (Exception e)
	    {
	    e.printStackTrace();
	    }

	    String mOldpassword=request.getParameter("oldpassword").trim();
		String mNewpassword=request.getParameter("newpassword").trim();
		String mConfirmpassword=request.getParameter("confirmpassword").trim();
		
		System.out.println(".......old password+ "+mOldpassword+"... new password ..."+mNewpassword+" confirm password "+mConfirmpassword);
		System.out.println(".......old password... not matching ..."+mOldpassword+"-"+mPassword);
		if (!(mOldpassword.equals(mPassword.trim())))
		{
	    	System.out.println("old password... not matching ..."+mOldpassword+"-"+mPassword);
	    %>
	    	<script>
	    	alert("old password... not matching ...");
	    	location = "ChangePassword.jsp";
	    	//window.location.reload();
	    	</script>
	    	
	    <%
	    //response.sendRedirect("home.jsp");
		}
		else
		{
		%>
	    	
	    	
		<%
			System.out.println("new password... not matching with confirm password......"+mNewpassword+"-"+mConfirmpassword);
			if (!(mNewpassword.equals(mConfirmpassword)))
			{
				System.out.println("new password... not matching with confirm password......"+mNewpassword+"-"+mConfirmpassword);
				%>
		    	<script>alert("new password... not matching with confirm password......");
		    	location = "ChangePassword.jsp";
		    	</script>
		    	<%
		  //      response.sendRedirect("home.jsp");
			}
			else
			{
				if (mNewpassword==null || mConfirmpassword==null  || mNewpassword=="" || mConfirmpassword=="")
				{
					System.out.println("password should not be blank....");
					%>
			    	<script>alert("Password should not be blank...");
			    	location = "ChangePassword.jsp";
			    	//window.location.reload();
			    	</script>
			    	<%
			//    	response.sendRedirect("home.jsp");
				}
			    else
			    {
	    			try
            		{
	    				ERP.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
            			Connection conn = null;
            			Statement st = null;
            			conn = ERP.ReturnConnection();
    	        		st = conn.createStatement();
            			String sql="";
            			String sql1="";
	            		sql="UPDATE "+session.getAttribute("CompanyMasterID").toString()+"security set password='"+mNewpassword+"' where username='"+mUsername+"' limit 1";
	            		sql1="UPDATE UserMaster set password='"+mNewpassword+"' where username='"+mUsername+"' limit 1";
    	        		System.out.println(sql);
        	        	st.executeUpdate(sql);
        	        	st.executeUpdate(sql1);
        	        	System.out.println("password change sucessfully");
        	        	System.out.println(session.getAttribute("EmpCode"));
        	        	
        	        	if(session.getAttribute("department").equals("Marketing"))
        	        	{
        	        		System.out.println("IN IFFF   ");
        	        		String sqlUpdate="Update "+session.getAttribute("CompanyMasterID").toString()+"marketingrepmaster SET Password = '"+mNewpassword+"' WHERE MarketingRepCode ='"+mcode+"'	  LIMIT 1 ;";
        	        		System.out.println(sqlUpdate);
        	        		st.executeUpdate(sqlUpdate);
        	        	}	
        	        	%>
    		    		<script>
    		    		alert("Password changed sucessfully.....");
    		    		location = "home.jsp";
    		    		</script>
    		    		<%
    		           // response.sendRedirect("home.jsp");
            		}
            		catch (Exception e)
            		{
		            	e.printStackTrace();
		            //	 response.sendRedirect("home.jsp");
    	        	}
    			}
			}	
		}
	}

	if (request.getQueryString()==null)
	{
%>
<form name="changepassword" method="get" action="" autocomplete="off">
<div style="font-family: arial;font-size:16px;border-color: #C6DEFF;" align="Center"><a>Change Password</a></div> 

    	<div style="margin-top:5%; margin-left:30%; border:thin solid; width:35%;height:155;  ">
       <table>
	   <tr>
       <td><b><a>User Name :</a></b></td>
       <td><input type="text" name="username" id="username" value="<%=mUsername%>" readonly="readonly"  style="width : 170px; padding: 4px 5px 2px 5px;
	               border: 1px solid black; background: #FFFFFF;	font: normal 14px Arial, Helvetica, sans-serif;
	               color: #000000;"/></td></tr>
        <tr>
        <td><b><a>
         Old Password :</a></b>
        </td>
        <td><input type="password" name="oldpassword" id="oldpassword" value="" style="width : 170px; padding: 4px 5px 2px 5px;
	               border: 1px solid black; background: #FFFFFF;	font: normal 14px Arial, Helvetica, sans-serif;
	               color: #000000;" onclick="validate()"  />
        </td>
        </tr>
        <tr>
        <td><b><a>
         New Password :</a></b>
        </td>
        <td><input type="password" name="newpassword" id="newpassword" value="" style="width : 170px; padding: 4px 5px 2px 5px;
	               border: 1px solid black; background: #FFFFFF;	font: normal 14px Arial, Helvetica, sans-serif;
	               color: #000000;"/>
        </td>
        </tr>
        <tr>
        <td><b><a>
        Confirm Password :</a></b>
        </td>
        <td><input type="password" name="confirmpassword" id="confirmpassword" value="" style="width : 170px; padding: 4px 5px 2px 5px;
	               border: 1px solid black; background: #FFFFFF;	font: normal 14px Arial, Helvetica, sans-serif;
	               color: #000000;" />
        </td>
        </tr>
        <tr><td></td><td></td></tr>
        <tr>
        <td></td>
        <td>
        <table>
        <tr>
        <td>
        <input type="submit" name="Ok" id="ok" value="Ok"  style="border: outset;width:80px;  background-color: #C6DEFF" />
        <input type="submit" name="Cancel" id="Cancel" value="Cancel" onclick="cancelbutton()" style="border: outset;width:80px; background-color: #C6DEFF" />
        </td>
        </tr>
        </table>
         </td>
        </tr>
     </table>
     </div>
	 <br>
	 <br><br><br><br><br>
	 <br><br><br><br><br></br>
	 <div id="footer">
	 <p><a href="http://www.myfleetview.com"> Copyright &copy; 2009
           	by Transworld Compressor Technologies Ltd. All Rights Reserved.</a></p>
	</div>
</form>
  <%
  }
  %>

</body>
</html>
</jsp:useBean>