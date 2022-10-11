

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="connectionIndex.jsp" %>

<%@page import="sun.security.util.Password"%><jsp:useBean id="ERP" class="com.erp.beans.ERP" scope="page">

<% ERP.getConnection(DB_Driver,DB_NAME,DB_USERNAME,DB_PASSWORD); %>
<%!
Connection conn;
%>
<%
try{
conn=ERP.ReturnConnection();

System.out.println("connection status:"+conn);
Statement st1=conn.createStatement();
Statement st2=conn.createStatement();
Statement st3=conn.createStatement();
int UserTypeCode=0;
String username=request.getParameter("username");
String pass=request.getParameter("pass");
String sessionid=session.getId().toString();
String updated=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
String 	clientip=request.getRemoteAddr();
/* 
String sql="select * from UserMaster where UserName='?' and binary password='?' and ActiveStatus='?' ";
System.out.println(sql); */
PreparedStatement pst=conn.prepareStatement("select * from UserMaster where UserName="+"?"+" and binary password="+"?"+"and ActiveStatus="+"?"+"");
pst.setString(1,username);
pst.setString(2,pass);
pst.setString(3,"Yes");
System.out.println("Entry");
ResultSet rst=pst.executeQuery();
System.out.println("resultset main:"+rst);
if(rst.next())
{
	UserTypeCode=Integer.parseInt(rst.getString("UserTypeCode"));
	session.setAttribute("user",username);
	session.setAttribute("userLevel",rst.getString("UserLevel"));
	session.setAttribute("role",rst.getString("Role"));
	session.setAttribute("EMP_FullNAME",rst.getString("EmpName"));
	session.setAttribute("CompanyMasterID", rst.getString("companymasterid"));
	session.setAttribute("flag","flag");
	session.setAttribute("department",rst.getString("dept"));
	
	System.out.println("usertypecode:"+Integer.parseInt(rst.getString("UserTypeCode")));
	System.out.println("userLevel:"+rst.getString("UserLevel"));
	System.out.println("role:"+rst.getString("Role"));
	
	try{
		String sqlDeatils13="select * from db_GlobalERP.UserTypeMaster as a, db_GlobalERP.AccesControlList as b where a.UserTypeCode="+UserTypeCode+" and a.AccessCode=b.AccessCode";
		System.out.println("*********"+sqlDeatils13);
		ResultSet rsDetails123=st3.executeQuery(sqlDeatils13);
		if(rsDetails123.next())
		{
					session.setAttribute("SuperAdmin",rsDetails123.getString("SuperAdmin"));
					session.setAttribute("Admin",rsDetails123.getString("Admin"));
					session.setAttribute("Sales",rsDetails123.getString("Sales"));
					session.setAttribute("Purchase",rsDetails123.getString("Purchase"));
					session.setAttribute("Claim",rsDetails123.getString("Claim"));
					session.setAttribute("Account",rsDetails123.getString("Account"));
					session.setAttribute("Collection",rsDetails123.getString("Collection"));
					session.setAttribute("SalesAdmin",rsDetails123.getString("SalesAdmin"));
					session.setAttribute("PurchaseAdmin",rsDetails123.getString("PurchaseAdmin"));
					session.setAttribute("ClaimAdmin",rsDetails123.getString("ClaimAdmin"));
					session.setAttribute("AccountAdmin",rsDetails123.getString("AccountAdmin"));
					session.setAttribute("CollectionAdmin",rsDetails123.getString("CollectionAdmin"));
					session.setAttribute("HRModule",rsDetails123.getString("HRModule"));
		}
		}catch(Exception e)
		{
			
		}
	
	
	try{
	String sqlDeatils1="SELECT * FROM CompanyMaster where companymid="+rst.getString("companymasterid")+"";
	System.out.println("*********((((((((((((    "+sqlDeatils1);
	ResultSet rsDetails12=st2.executeQuery(sqlDeatils1);
	if(rsDetails12.next()){
		
		System.out.println("Tally SID======"+rsDetails12.getString("TallySID"));
		System.out.println("Tally PID======"+rsDetails12.getString("TallyPID"));
		session.setAttribute("TallySID",rsDetails12.getString("TallySID"));
		session.setAttribute("TallyPID",rsDetails12.getString("TallyPID"));
		session.setAttribute("website",rsDetails12.getString("website"));
		session.setAttribute("CompanyType",rsDetails12.getString("CompanyType"));
		
	}
	}catch(Exception e)
	{
		
	}
	
	
	String sqlDeatils="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"marketingrepmaster where UserName='"+username+"' and Password='"+pass+"' ";
	System.out.println("*********((((((((((((    "+sqlDeatils);
	ResultSet rsDetails=st1.executeQuery(sqlDeatils);
	if(rsDetails.next()){
		session.setAttribute("EmpName",rsDetails.getString("MarketingRepName"));
		session.setAttribute("EmpCode",rsDetails.getString("MarketingRepCode"));
		session.setAttribute("EmpEmail",rsDetails.getString("MarketingRepEMail"));
		if(rsDetails.getString("MarketingRepPhNo").length()>8)
			session.setAttribute("EmpMobileNumber",rsDetails.getString("MarketingRepPhNo"));
		else if(!(rst.getString("mobileno").equalsIgnoreCase("-")))
			session.setAttribute("EmpMobileNumber",rst.getString("mobileno"));
		else
			session.setAttribute("EmpMobileNumber","Mobile number not available in system");
		session.setAttribute("isMarketingRepresentive",true);
		
	}
	else
	{
		  if(!(rst.getString("mobileno").equalsIgnoreCase("-")))
			session.setAttribute("EmpMobileNumber",rst.getString("mobileno"));
		else
			session.setAttribute("EmpMobileNumber","Mobile number not available in system");

		session.setAttribute("EmpName",rst.getString("EmpName"));
		session.setAttribute("EmpCode",rst.getString("EmpCode"));
		session.setAttribute("EmpEmail",rst.getString("email"));
	}
	if(username.equalsIgnoreCase("Puri")){
		session.setAttribute("EmpMobileNumber","9890639379");
		System.out.print("MOB NO ()()()()()()()()("+username);
	}
	
	
	try{	
	String sqlLogin="insert into "+session.getAttribute("CompanyMasterID").toString()+"logindetails (UserName,SessionId,Updated,LogInDetails,UserIp) values ('"+username+"','"+sessionid+"','"+updated+"','"+updated+"','"+clientip+"')";
	st1.executeUpdate(sqlLogin);
	System.out.println("LOGIN QUERy  "+sqlLogin);
	}catch(Exception e){e.printStackTrace();}	
	
	
	
	
	System.out.println(""+session.getAttribute("isMarketingRepresentive"));

	if(session.getAttribute("department").equals("Marketing")  || session.getAttribute("EmpName").equals("Nilesh Doshi") )
	{
		
	System.out.println("   "+session.getAttribute("EmpName"));	
	System.out.println("IN IF  ");	
	response.sendRedirect("DashBoardForMarkt.jsp");
	}
	else if(session.getAttribute("department").equals("Claim") ) 
	{
		System.out.println("IN Claim    ");
		response.sendRedirect("claimReport.jsp?action=view");
			
	}
	
	else 
	{
		System.out.println("IN ELSE    ");
		response.sendRedirect("home.jsp");
			
	}
	return;
}
else
{
	response.sendRedirect("index.jsp?err=err1");
	return;
}
}catch(Exception e)
{
	out.print("Exception--->"+e);
	//response.sendRedirect("Error.jsp");
	response.sendRedirect("home.jsp");
}
//finally{
//	conn.close();
//}
%>

<%ERP.closeConnection(); %>
</body>
</jsp:useBean>