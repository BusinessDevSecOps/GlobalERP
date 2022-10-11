<%@ include file="conn.jsp"%>

<%!Connection con1;%>

<%
	System.out.println("in AjaxGETTransaction.jsp##############################");
String cust=request.getParameter("cctype");

System.out.println("###sust#################" +cust);


	if (cust.equalsIgnoreCase("Prospect")) {
		System.out.println("*******Prosp*******");
		try {
			String buffer="";			
			Class.forName(DB_Driver);
			con1 = DriverManager.getConnection(DB_NAME, DB_USERNAME,
					DB_PASSWORD);
			Statement stmt1 = con1.createStatement();
			Statement stmt3 = con1.createStatement();
			Statement stmt2 = con1.createStatement();
			ResultSet rs1 = null;
			ResultSet rs3 = null;

			String repcode="",enteredby="";
			String Company = request.getParameter("company");

			
			String sql1 = "SELECT leadRef,Assighnedby from "+session.getAttribute("CompanyMasterID").toString()+"prospectivecustmaster WHERE CompanyName='"
					+ request.getParameter("companyName") + "' limit 1";
			
			
			String sql3 = "SELECT COUNT(*) as count from "+session.getAttribute("CompanyMasterID").toString()+"contactdet WHERE customercode='"+Company+"' AND salesCustomerCode = 0 and mobileno <> 'null'";
			
			
			System.out.println("query****************" + sql3);
			
			
			ResultSet rs = stmt1.executeQuery(sql1);
                      rs3 = stmt3.executeQuery(sql3);			
 			int count = 0;
			
 			
 			if(rs3.next())
			{
				count = rs3.getInt("count");
			}
			
		

			sql1 = "SELECT FollowUpDate,FollowUpType,NextFollowUpDate,Comments,MarketingRepcode FROM "+session.getAttribute("CompanyMasterID").toString()+"followup where ProspCustName='"
					+ request.getParameter("companyName")
					+ "' and FollowUpType <> 'Assigned'  "
					+ " ORDER BY FollowUpDate Desc limit 3";

			rs1 = stmt1.executeQuery(sql1);
			 buffer = "<table border='1' cellspacing='0' cellpadding='0' width='90%'>";
			buffer += "<tr><th align='center'>Date</th><th align='center'>Id</th><th align='center'>Credit</th><th align='center'>Debit</th><th align='center'>Balence</th></tr>";
			buffer += "</table>#";

			buffer +="<br><table border='1'  style='background-color: white;' cellspacing='0' cellpadding='0' width='90%'>";
			buffer +="<tr><th align='center'>Follow up date</th><th align='center'>Type</th><th align='center'>Next Follow up</th><th align='center'>Comments</th><th align='center'>EnteredBy</th></tr>";
			
			
			
			while (rs1.next()) {
				
				repcode= rs1.getString(5);
				System.out.println("  "+repcode);
				
				String sql="Select EmpName from "+session.getAttribute("CompanyMasterID").toString()+"security where EmpCode='"+repcode+"' and ActiveStatus='Yes' ";
				ResultSet rsSql=stmt2.executeQuery(sql);
				System.out.println("EMP NAME   "+sql);
				rsSql.next();
				
				enteredby=rsSql.getString(1);
				
				buffer +="<tr><td align=right>&nbsp;&nbsp;"
						+ new SimpleDateFormat("dd-MMM-yyyy")
								.format(new SimpleDateFormat(
										"yyyy-MM-dd").parse(rs1
										.getString(1)))
						+ "&nbsp;</td><td>&nbsp;&nbsp;"
						+ rs1.getString(2)
						+ "&nbsp;</td> "
						+ " <td align=right>&nbsp;&nbsp;"
						+ new SimpleDateFormat("dd-MMM-yyyy")
								.format(new SimpleDateFormat(
										"yyyy-MM-dd").parse(rs1
										.getString(3)))
						+ "&nbsp;</td><td>&nbsp;&nbsp;"
						+ rs1.getString(4)
						+ "&nbsp;</td><td align=left >"
						+ enteredby
						+ "</td></tr>";
			}
			
			out.println(buffer + "#assigned by" + "#"+count+"#");

			//out.println(buffer);
			con1.close();
		} catch (Exception e) {
			System.out.print(" ajaxtrdet.jsp err>> " + e);
			//out.print("#-#-#--NA--");
			e.printStackTrace();
		}
	}

	else {
		System.out.println("*******Comp*******");
		try {

			Class.forName(DB_Driver);
			con1 = DriverManager.getConnection(DB_NAME, DB_USERNAME,DB_PASSWORD);
			Statement stmt1 = con1.createStatement();
			Statement stmt3 = con1.createStatement();
			Statement stmt2 = con1.createStatement();
			ResultSet rs1 = null;
			ResultSet rs3 = null;
			String sql1 = "";
			boolean flag = false;
			String enteredby1="",repcode1="";
			String Company = request.getParameter("company");
			

			sql1 = "SELECT TransactionDate,TransactionDetail,CreditAmount,DebitAmount,Balance FROM  "+session.getAttribute("CompanyMasterID").toString()+"customerledgeraccount where CustomerCode='"
					+ Company
					+ "' ORDER BY  concat(TransactionDate , TransactionId ) Desc limit 3";

			String sql3 = "SELECT COUNT(*) as count from "+session.getAttribute("CompanyMasterID").toString()+"contactdet WHERE salesCustomerCode='"+Company+"' AND customercode = 0 and mobileno <> 'null'";
			
			System.out.println("sql statement for company*****" + sql3);
            rs3 = stmt3.executeQuery(sql3);
			rs1 = stmt1.executeQuery(sql1);
			String buffer = "<table border='1' cellspacing='0' cellpadding='0' width='90%'>";
			buffer += "<tr><th align='center'>Date</th><th align='center'>Id</th><th align='center'>Credit</th><th align='center'>Debit</th><th align='center'>Balence</th></tr>";
			int i = 1;
			String credit = "";
			while (rs1.next()) {
				credit = rs1.getString(3);
				if (credit == null)
					credit = "0.00";
				buffer += "<tr><td align=right>"
						+ new SimpleDateFormat("dd-MMM-yyyy")
								.format(new SimpleDateFormat(
										"yyyy-MM-dd").parse(rs1
										.getString(1))) + "</td><td>"
						+ rs1.getString(2) + "</td><td align=right>"
						+ credit + "</td><td align=right>"
						+ rs1.getString(4) + "</td><td align=right>"
						+ rs1.getString(5) + "</td></tr>";
				i++;
			}

			rs1 = null;
			buffer += "</table>#";

			
			
			sql1 = "SELECT FollowUpDate,FollowUpType,NextFollowUpDate,Comments,MarketingRepcode FROM "+session.getAttribute("CompanyMasterID").toString()+"followup where ProspCustName='"
					+ request.getParameter("companyName")
					+ "' and FollowUpType <> 'Assigned' "
					+ " ORDER BY FollowUpDate Desc limit 3";

			rs1 = stmt1.executeQuery(sql1);
			buffer += "<table border='1' cellspacing='0' cellpadding='0' width='90%'>";
			buffer += "<tr><th align='center' >Follow up date</th><th align='center'>Type</th><th align='center'>Next Follow up</th><th align='center'>Comments</th><th align='center'>EnteredBy</th></tr>";
			while (rs1.next()) {
				
				repcode1= rs1.getString(5);
				System.out.println("  "+repcode1);
				
				//String sql0="Select EmpName from "+session.getAttribute("CompanyMasterID").toString()+"security where EmpCode='"+repcode1+"'";
				String sql0="Select EmpName from "+session.getAttribute("CompanyMasterID").toString()+"security where EmpCode='"+repcode1+"' and ActiveStatus='Yes' ";
				ResultSet rsSql1=stmt2.executeQuery(sql0);
				System.out.println("EMP NAME ****************  "+sql0);
				if(rsSql1.next())
				{	
				enteredby1=rsSql1.getString(1);
				}
				System.out.println("*************  "+enteredby1);
				buffer += "<tr><td align=right>"
						+ new SimpleDateFormat("dd-MMM-yyyy")
								.format(new SimpleDateFormat(
										"yyyy-MM-dd").parse(rs1
										.getString(1)))
						+ "</td><td>"
						+ rs1.getString(2)
						+ "</td> "
						+ " <td align=right>"
						+ new SimpleDateFormat("dd-MMM-yyyy")
								.format(new SimpleDateFormat(
										"yyyy-MM-dd").parse(rs1
										.getString(3))) + "</td><td>&nbsp;&nbsp;"
										+ rs1.getString(4)
										+ "&nbsp;</td><td align=left >"
										+enteredby1
										+ "</td></tr>";
			}
		 
		int count = 0;
	     if(rs3.next())
		 {
		     count = rs3.getInt("count");
		 }
			//out.println(buffer + "#assigned by" + "#lead referesnce#");
			out.println(buffer + "#assigned by" + "#"+count+"#");
			/*new SimpleDateFormat(
			 "dd-MMM-yyyy")
			 .format(new SimpleDateFormat(
			 "yyyy-MM-dd")
			 .parse(  */
		} catch (Exception e) {
			out.println(e);

			e.printStackTrace();
		} finally {
			con1.close();
		}
	}
%>
