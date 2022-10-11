<%@page import="java.util.Date"%>
<%@page import="com.erp.beans.PdfGeneration"%>
<%@ include file="conn.jsp"%>



<%
Connection con1 = null;
%>
<%
try 
{
	System.out.println("\n>>>>>$$$$$$$$$$$$$>>>In AjaxPdfGenerate.jsp>>>>>>>>>>>>>>>>");	
Class.forName(DB_Driver);
con1 = DriverManager.getConnection(DB_NAME, DB_USERNAME,DB_PASSWORD);
Statement stmt1 = con1.createStatement();
Statement stmt2 = con1.createStatement();
Statement stmt3 = con1.createStatement();
Statement stmt4 = con1.createStatement();
ResultSet rs1 = null,rsClaimNo=null;
String buffer = "",SqlUpdate;




String SqlDeleteMaster="",SqlClaimDet="",sql="",sql1="";
String cmnycode="",empid="",salutation="-",empname="-",deptid="",empemail="",designtion="",fstname="",mddlnm="",lastname="",twempid="",empcntctno="",date_brth="",maart_stts="",DateOfAnniversary="",KidsDetails="",Child1Sex="",Child2Sex="",Child1Name="",Child2Name="",Child1DOB="",Child2DOB="",AddressEmp="",SalaryDetails="",BasicSalarary="",TDS="",	NetPay="",Allowance="",Allowance1="",Allowance2="",Allowance3="",Allowance4="",deduction="",deduction1="",deduction2="",deduction3="",deduction4="",PreviousPay="",AccNo="",BankName="",BankBranch="",IFSC="",PanNo="",	PolicyNo="",NameOfClaimCompany="", 	ExpiryDateClaim="", 	ClaimAmount="", 	ContactImeediate="",ContactNoImmediate="",AddressContact="",RelationShip="",EnterBy="", 	EnteredDateTime="", 	ModifiedBy="",EditDateTime="",DateofJoining="",ContractDate="",ContractExpDate="",MediclaimFileName="", 	ContractFileName="",Status="",Status1="";
String user=session.getAttribute("user").toString();


System.out.println("USER NAME==>"+user);
String todaysDate=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
String todaysDateTime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
System.out.println("date"+todaysDate+"time"+todaysDateTime);
String id=request.getParameter("id");
System.out.println(">>>>>>>>id:"+id);
String []arr=id.split(",");
System.out.println("arr length"+arr.length);
String year=request.getParameter("year");
String month=request.getParameter("month");


System.out.println("YEAR+++++++.....>>>>>>>"+year+"MONTH=======>>>>>>>"+month);


//PdfAutogeneration pdf =new PdfAutogeneration(); 



 PdfGeneration pdf =new PdfGeneration();








if(request.getParameter("action").equals("approve"))
{	
	System.out.println("arr val111111");
//	pdf.GetConnection();

	//String year="2014";
	//String month="09";
for(int i=1;i<arr.length;i++)
	{
		System.out.println("arr val"+arr[i]);
		
		
		
	//	 System.out.println("path==========>>"+(config.getServletContext().getRealPath("/")).toString());
		
		 pdf.PdfGenerationCustomeCode(year,month,arr[i]);
		
		System.out.println(" after Function******");

		
	}
	  
	//String SqlUpdate1="UPDATE "+session.getAttribute("CompanyMasterID").toString()+"leaveadmin SET Status ='No' WHERE EmpID='"+id+"' limit 1 ";
	//stmt2.executeUpdate(SqlUpdate1);
	out.println("Yes");
	
}

} 
catch (Exception e) {
System.out.println("AjaxGeneratePdf.jsp error  table > "+e);
out.println("NO");
} finally {
	con1.close();

}

%>