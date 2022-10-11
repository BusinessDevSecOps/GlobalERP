<%@page import="java.util.Date"%>
<%@ include file="conn.jsp"%>
<%
Connection con=null ;
try
{
Class.forName(DB_Driver);
con = DriverManager.getConnection(DB_NAME,DB_USERNAME,DB_PASSWORD);
Statement st1=null;
st1=con.createStatement();


Statement stmt1 = con.createStatement();
Statement stmt2= con.createStatement();

String subject="",mailid="",adminmail="";

subject=request.getParameter("subject");

mailid=request.getParameter("mailid");

String todaysDateTime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());


StringBuffer htmlstring=new StringBuffer("");


String Fullname=request.getParameter("FullName");
String Username=request.getParameter("UserName");
String Password=request.getParameter("Password");
String Userlevel=request.getParameter("UserLevel");
String Dept=request.getParameter("Department");
String ULAccess=request.getParameter("UserLevelAccess");
String Empcode=request.getParameter("EmpCode");
String TALevel=request.getParameter("TALevel");
String Mobno=request.getParameter("Mobno");
String Email=request.getParameter("emailid");
String Status=request.getParameter("ActiveStatus");
String hod=request.getParameter("hod");
System.out.println("status      "+Status);

System.out.println(">>>>>>>>Fullname:"+Fullname+"\n>>>>>>>>Username:"+Username+"\n>>>>>>>>Password:"+Password+"\n>>>>>>>>Userlevel:"+Userlevel+"\n>>>>>>>>Dept:"+Dept+"\n>>>>>>>>ULAccess:"+ULAccess+"\n>>>>>>>>Empcode:"+Empcode+"\n>>>>>>>>TALevel:"+TALevel+"\n>>>>>>>>Mobno:"+Mobno+"\n>>>>>>>>Email:"+Email+"\n"+Status);


	

String select="select * from UserMaster where UserName='"+Username+"'";
ResultSet rs=st1.executeQuery(select);

if(rs.next())
{
	response.sendRedirect("alertGoTo.jsp?msg=User Name already exists &goto=AddNewUser.jsp");

}
else
{
String Add="insert into "+session.getAttribute("CompanyMasterID").toString()+"security(EmpName,UserName,Password,UserLevel,Dept,CompanyCode,EmpCode,TALevel,mobileno,email,ActiveStatus,HodReport)values('"+Fullname+"','"+Username+"','"+Password+"','"+Userlevel+"','"+Dept+"','"+ULAccess+"','"+Empcode+"','"+TALevel+"','"+Mobno+"','"+Email+"','"+Status+"','"+hod+"')";
//Amit implement to add record in UserMaster
String Ad="insert into UserMaster(EmpName,UserName,Password,UserLevel,Dept,CompanyCode,EmpCode,TALevel,mobileno,email,ActiveStatus,HodReport,companymasterid)values('"+Fullname+"','"+Username+"','"+Password+"','"+Userlevel+"','"+Dept+"','"+ULAccess+"','"+Empcode+"','"+TALevel+"','"+Mobno+"','"+Email+"','"+Status+"','"+hod+"','"+session.getAttribute("CompanyMasterID").toString()+"')";
System.out.println(">>>>>>>>Add:"+Add); 
int cnt=st1.executeUpdate(Add);
//Amitimplement to add record
int cnt1=st1.executeUpdate(Ad);
System.out.println(">>>>>>>>Add:"+Ad); 

System.out.println(">>>>>>>>cnt:"+cnt);


htmlstring.append("<br><h4 align=center> ERP New User Account Details....  </h4>" +
		"<table align=center border=1 cellpadding=0 cellspacing=0>" +
			"<tr>" +
			"<th><b>User Name</b></th>" +
			"<th><b>Password</b></th>" +
			"<th><b>Email-id</b></th>" +
			"<th><b>Department</b></th>" +
			"<th><b>User Level</b></th></tr>");


htmlstring.append("<tr>"+
	              "<td>"+Username+"</td>"+
	              "<td>"+Password+"</td>"+
	              "<td>"+Email+"</td>"+
	              "<td>"+Dept+"</td>"+
	              "<td>"+Userlevel+"</td></tr></table>");			


String EMPName=session.getAttribute("EmpName").toString();

String Emailid="select email from "+session.getAttribute("CompanyMasterID").toString()+"security where EmpName='"+EMPName+"'";

ResultSet rsEmailid=stmt2.executeQuery(Emailid);

if(rsEmailid.next())
{
	adminmail=rsEmailid.getString("email");
	 System.out.println("-------admin name:"+adminmail); 

}


String SqlSendingMail="Insert into db_gps.t_allpendingmailtable(MailName,Description,MailBody,subjectline,Toid,Tocc,EntryDateTime,MailStatus,SendDateTime,SenderName)values('ERP New User Accounts Details','-','Hi, "+Username+","+htmlstring+"<br>Thanks & Regards,<br>Transworld Team','ERP New User Added Details.','"+Email+"','"+adminmail+"','"+todaysDateTime+"','Pending','"+todaysDateTime+"','"+EMPName+"')";
System.out.println(">>>>>>>>SqlSendingMail:"+SqlSendingMail);
stmt1.executeUpdate(SqlSendingMail);
out.println("#Yes");

String Sendhistory="Insert into "+session.getAttribute("CompanyMasterID").toString()+"Adminhistory(AdminUserName,UserName,UpdatedDateTime,Action,ActiveStatus)values('"+EMPName+"','"+Fullname+"','"+todaysDateTime+"','Add','"+Status+"')";
System.out.println("------------"+Sendhistory);
stmt1.executeUpdate(Sendhistory);
out.println("#Yes");



response.sendRedirect("alertGoTo.jsp?msg=User Added SuccessFully &goto=AdminModuleMaster.jsp");
}
}


catch(Exception e)
{
	System.out.println(">>>>>>>>>>>>Exception:e"+e);
}
%>




