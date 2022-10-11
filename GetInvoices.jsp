
<%@page import="com.sun.org.apache.xalan.internal.xsltc.compiler.sym"%><%@ include file="conn.jsp" %>

<%!
Connection con1;
%>

<% 
try {
 
Class.forName(DB_Driver);
con1 = DriverManager.getConnection(DB_NAME,DB_USERNAME,DB_PASSWORD);
Statement stmt1=con1.createStatement();
ResultSet rs1=null;
String sql1="";
boolean flag=false;
String company=request.getParameter("company").replace("ampers","&");
System.out.println("company --->>"+request.getParameter("company"));
StringBuffer InvList=new StringBuffer("(");


String sqlCustomerCode="SELECT CustomerCode from "+session.getAttribute("CompanyMasterID").toString()+"customerdet where CompanyName='"+company+"'";
ResultSet rsCustomerCode=stmt1.executeQuery(sqlCustomerCode);
rsCustomerCode.next();
String customerCode=rsCustomerCode.getString(1);
rsCustomerCode=null;

String sqlInvList="SELECT InvRefNo from "+session.getAttribute("CompanyMasterID").toString()+"custpymtagainstinv where CustomerCode ="+customerCode+" " ;
ResultSet rsInvList=stmt1.executeQuery(sqlInvList);
while(rsInvList.next())
	InvList.append("'"+rsInvList.getString(1)+"',");
InvList.append("'0')");

  sql1="SELECT *  from "+session.getAttribute("CompanyMasterID").toString()+"customerledgeraccount where CustomerCode ="+customerCode+"  "+
  "  and TransactionType='Invoice' and "+
  "  TransactionDetail  not in "+InvList+" order by TransactionDate ASC ";
  rs1=stmt1.executeQuery(sql1);

 String buffer="<table style='background-color: #E1F3F3; font-family:verdana; font-size:xx-small; border: thin solid; border-color: #2077DA; border-collapse:collapse; border-style:outset;' >"; //cellspacing='0' cellpadding='0'
 buffer=buffer+"<tr style='border: thin solid; border-color: #2077DA;'>"+
 		"<th style='border: thin solid; border-color: #2077DA; background-color: #0EBEF8;'>Check</th>"+
 		"<th style='border: thin solid; border-color: #2077DA;background-color: #0EBEF8;'>Inv No</th>"+
 		"<th style='border: thin solid; border-color: #2077DA;background-color: #0EBEF8;'>Inv Date</th>"+
 		"<th style='border: thin solid; border-color: #2077DA;background-color: #0EBEF8;'>Inv Value</th>"+
 		"<th style='border: thin solid; border-color: #2077DA;background-color: #0EBEF8;'>Balance</th>"+
 		"<th style='border: thin solid; border-color: #2077DA;background-color: #0EBEF8;'>Amt against Invoice</th>"+
 		"<th style='border: thin solid; border-color: #2077DA;background-color: #0EBEF8;'>Sign</th>"+
 		"</tr>";
 
   int i=1;
   while(rs1.next())
   {
      flag=true;
      
    	buffer=buffer+"<tr style='border: thin solid; border-color:#2077DA;' id=tr"+i+"><td style='border: thin solid; border-color: #2077DA;'><input type='checkbox' name='check"+i+"' id='check"+i+"' value='"+rs1.getString("TransactionDetail")+"' onclick='tallyInvoice("+i+")'></td>"+
    	"<td style='border: thin solid; border-color: #2077DA;'>"+rs1.getString("TransactionDetail")+"</td>"+
    	"<td style='border: thin solid; border-color: #2077DA;'>"+new SimpleDateFormat(
		"dd-MMM-yyyy")
		.format(new SimpleDateFormat(
				"yyyy-MM-dd")
				.parse(rs1.getString("TransactionDate")))+"<input type='hidden' name='TransactionDate"+i+"' id='TransactionDate"+i+"' value='"+rs1.getString("TransactionDate")+"' /></td>"+
    	"<td align='right' style='border: thin solid; border-color: #2077DA;'>"+rs1.getString("DebitAmount")+"<input type='hidden' name='invoiceValue"+i+"' id='invoiceValue"+i+"' value='"+rs1.getString("DebitAmount")+"' /></td>"+
    	"<td align='right' id=tdBalance"+i+" style='border: thin solid; border-color: #2077DA;'>"+rs1.getString("Balance")+"</td>"+
    	"<td align='right' id=tdAmountAgainstInvoice"+i+" style='border: thin solid; border-color: #2077DA;'></td>"+
    	"<td style='border: thin solid; border-color: #2077DA;'>"+rs1.getString("EmpName")+" <input type='hidden' name='amt"+i+"' id='amt"+i+"' value='0' /></td>"+
    	"</tr>";
        i++;
   } 
  buffer+="<input type='hidden' name='checktotal' id='checktotal' value='"+i+"'>";
   buffer+="</table></div>";
out.println(buffer);

} catch(Exception e) { System.out.print(e); }
finally
{
	con1.close();
}
%>
