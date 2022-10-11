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


String Selectuser=request.getParameter("Selectuser");
String UserName=request.getParameter("UserName");
String UserLevel=request.getParameter("UserLevel");
String Department=request.getParameter("Department");
String UserLevelAccess=request.getParameter("UserLevelAccess");
String EmpCode=request.getParameter("EmpCode");
String TALevel=request.getParameter("TALevel");

String mobileno=request.getParameter("mobileno");
String email=request.getParameter("email");

String ActiveStatus=request.getParameter("ActiveStatus");
String hod=request.getParameter("hod");
System.out.println("STATUS     "+ActiveStatus);
System.out.println(">>>>>>>>Fullname:"+Selectuser+"\n>>>>>>>>Username:"+UserName+" \n>>>>>>>>Userlevel:"+UserLevel+"\n>>>>>>>>Dept:"+Department+"\n>>>>>>>>ULAccess:"+UserLevelAccess+"\n>>>>>>>>Empcode:"+EmpCode+"\n>>>>>>>>TALevel:"+TALevel+"\n>>>>>>>>Mobno:"+mobileno+"\n>>>>>>>>Email:"+email+"\n.....status"+ActiveStatus);

//String select="select *from "+session.getAttribute("CompanyMasterID").toString()+"security where EmpName='"+Fullname+"'";
//ResultSet rs=st1.executeQuery(select);

//if(rs.next())
//{
	//response.sendRedirect("alertGoTo.jsp?msg=User already exists &goto=AddNewUser.jsp");

//}
//else
//{
	
	
	
	
	
	
	
String update="update "+session.getAttribute("CompanyMasterID").toString()+"security set UserName='"+UserName +"',UserLevel='"+UserLevel+"',Dept='"+Department+"',CompanyCode='"+UserLevelAccess+"',EmpCode='"+EmpCode+"',TALevel='"+TALevel+"',mobileno='"+mobileno+"',email='"+email+"', ActiveStatus='"+ActiveStatus+"',HodReport='"+hod+"' where UserName='"+ UserName +"'";
System.out.println(">>>>>>>>Update:"+update); 
int cnt=st1.executeUpdate(update);
System.out.println(">>>>>>>>cnt:"+cnt);

String update1="update UserMaster set UserName='"+UserName +"',UserLevel='"+UserLevel+"',Dept='"+Department+"',CompanyCode='"+UserLevelAccess+"',EmpCode='"+EmpCode+"',TALevel='"+TALevel+"',mobileno='"+mobileno+"',email='"+email+"', ActiveStatus='"+ActiveStatus+"',HodReport='"+hod+"' where UserName='"+ UserName +"'";
System.out.println(">>>>>>>>Update:"+update1);
int cnt1=stmt2.executeUpdate(update1);
System.out.println(">>>>>>>>cnt:"+cnt1);


htmlstring.append("<br><h4 align=center> ERP Account Edit Details....  </h4>" +
		"<table align=center border=1 cellpadding=0 cellspacing=0>" +
			"<tr>" +
			"<th><b>User Name</b></th>" +
		    "<th><b>Email-id</b></th>" +
			"<th><b>Department</b></th>" +
			"<th><b>User Level</b></th></tr>");


htmlstring.append("<tr>"+
	              "<td>"+UserName+"</td>"+
	              "<td>"+email+"</td>"+
	              "<td>"+Department+"</td>"+
	              "<td>"+UserLevel+"</td></tr></table>");			


String EMPName=session.getAttribute("EmpName").toString();

String Emailid="select email from "+session.getAttribute("CompanyMasterID").toString()+"security where UserName='"+UserName+"'";

ResultSet rsEmailid=stmt2.executeQuery(Emailid);

if(rsEmailid.next())
{
	adminmail=rsEmailid.getString("email");
	 System.out.println("-------admin name:"+adminmail); 

}


String SqlSendingMail="Insert into db_gps.t_allpendingmailtable(MailName,Description,MailBody,subjectline,Toid,Tocc,EntryDateTime,MailStatus,SendDateTime,SenderName)values('ERP Account Edit Details','-','Hi,"+UserName+","+htmlstring+"<br>Thanks & Regards,<br>Transworld Team','ERP User Edit Details.','"+email+"','"+adminmail+"','"+todaysDateTime+"','Pending','"+todaysDateTime+"','"+EMPName+"')";
System.out.println(">>>>>>>>SqlSendingMail:"+SqlSendingMail);
stmt1.executeUpdate(SqlSendingMail);
out.println("#Yes");


String Sendhistory="Insert into "+session.getAttribute("CompanyMasterID").toString()+"Adminhistory(AdminUserName,UserName,UpdatedDateTime,Action,ActiveStatus)values('"+EMPName+"','"+Selectuser+"','"+todaysDateTime+"','Edit','"+ActiveStatus+"')";
System.out.println("------------"+Sendhistory);
stmt1.executeUpdate(Sendhistory);
out.println("#Yes");


response.sendRedirect("alertGoTo.jsp?msg=User Updated SuccessFully &goto=AdminModuleMaster.jsp");
}
//}
catch(Exception e)
{
	System.out.println(">>>>>>>>>>>>Exception:e"+e);
}
%>




