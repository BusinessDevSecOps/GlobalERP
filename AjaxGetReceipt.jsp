 <%@ include file="conn.jsp" %>
 <%@page import="java.io.*" import="java.sql.*" %>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>

<%@page import="java.util.Date"%><jsp:useBean id="tally" class="com.tally.beans.TALLY" scope="page">
<%!
Connection con1;
%>
<% 
try
{
		Class.forName(DB_Driver);
		con1 = DriverManager.getConnection(DB_NAME,DB_USERNAME,DB_PASSWORD);
		Statement stmt1=con1.createStatement();
		Statement stmt2=con1.createStatement();
		DecimalFormat twoDForm = new DecimalFormat("#.##");
		String deductiondesc="0",deductionPer="0";
		String paymentMode="",paymentAmount="",ddNumber="-";
		String todaysDate=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
		String todaysDateTime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
		String deductionvalue="0";
		ResultSet rs1=null;
		ResultSet rs2=null;
		String sql1="";
		boolean flag=false;
		boolean isInvoiceSelected=false;
		String invoiceNumber="",amountAgainstInvoice="",invoiceValue="";;
        String todaydate="";
        todaydate=new SimpleDateFormat("dd/MM/yyyy").format(new java.util.Date());
        String modiflag = request.getParameter("modiflag");
		String mPayment_id=request.getParameter("id");
		String myaction = request.getParameter("action");
		String msend_data = request.getParameter("mydata");
		String mCustomercode="0";
        String buffer="";
		String mAccountname="",name="";
		int mmoneyreceiptno=0;
		if (modiflag.contains("C") && myaction.contains("GET") )
		{
		    sql1="select * from "+session.getAttribute("CompanyMasterID").toString()+"collection as a inner join "+session.getAttribute("CompanyMasterID").toString()+"customerdet as b on a.customercode=b.customercode where moneyreceiptno="+mPayment_id+" limit 1";
		    rs1=stmt1.executeQuery(sql1);
		   
        	while(rs1.next())
			{
        		buffer+="zz"+rs1.getString("a.paymentvoucherno");
        		String mPayment_date =new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs1.getString("a.paymentdate")));
    			String mCheque_date =new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs1.getString("a.chorddorcreditnotedate")));
  				buffer+="zz"+mPayment_date;
  				buffer+="zz"+rs1.getString("b.companyname");
  				buffer+="zz"+rs1.getString("a.chorddorcreditnoteno");
  				buffer+="zz"+mCheque_date;
  				buffer+="zz"+rs1.getString("a.amountpaid");
  				buffer+="zz"+rs1.getString("a.invoiceno");
  				buffer+="zz"+rs1.getString("a.bankname");
  				buffer+="zz"+rs1.getString("a.branchname");
  				buffer+="zz"+rs1.getString("a.city");
  				buffer+="zz"+rs1.getString("a.remarks");
  				buffer+="zz"+rs1.getString("a.moneyreceiptno");
  				buffer+="zz"+rs1.getString("a.customercode");
  				buffer+="zz"+rs1.getString("a.paymentmode");
  				buffer+="zz"+rs1.getString("a.tallyrefno");
  				buffer+="zz"+rs1.getString("a.auth_by");
  				buffer+="zz"+rs1.getString("a.Auth_on");
  				buffer+="zz"+rs1.getString("a.Inserdt");
  				buffer+="zz"+rs1.getString("a.twempname");
  				buffer+="zz"+rs1.getString("a.ded_type");
  				buffer+="zz"+rs1.getString("a.ded_amount");
  			} 
        	out.println(buffer);
		}
		if (modiflag.contains("N") && myaction.contains("POST") )
		{
			String received_data[]  = msend_data.split("zz",22);
			String mcustomername=received_data[3].replace("ampers","&");
            sql1="select * from "+session.getAttribute("CompanyMasterID").toString()+"customerdet where companyname='"+mcustomername+"' limit 1";
            System.out.println("DATA---->>>>"+sql1);
		    rs2=stmt2.executeQuery(sql1);
		    while(rs2.next())
			{
	    	   mCustomercode=rs2.getString("customercode");   
			}
	    	String mPayment_date =new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(received_data[2]));
			String mCheque_date =new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(received_data[5]));
			String mTallyrefno = received_data[15];
			String mauth_on = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());//received_data[16];
			String mauth_by ="";//session.getAttribute("user").toString();
			String minserdt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
			String mtwempname="";
			if (session.getAttribute("department").toString().contains("Accounts"))
			{
				mauth_by = session.getAttribute("user").toString();
				mauth_on = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
			}
			else
			{
				mtwempname=session.getAttribute("user").toString();
			}
		    try
		    {
				sql1="INSERT into "+session.getAttribute("CompanyMasterID").toString()+"collection (paymentvoucherno,paymentdate,chorddorcreditnoteno,"+
      					"chorddorcreditnotedate,amountpaid,invoiceno,bankname,branchname,city,"+
      					"remarks,customercode,paymentmode,tallyrefno,auth_by,auth_on,inserdt,twempname,ded_type,ded_amount)"+
		    	        "VALUES ('"+received_data[1]+"','"+mPayment_date+"','"+received_data[4]+
		    	        "','"+mCheque_date+"','"+received_data[6]+"',"+received_data[7]+",'"+
		    	        received_data[8]+"','"+received_data[9]+"','"+received_data[10]+"','"+
		    	        received_data[11]+"',"+mCustomercode+",'"+received_data[14]+"','"+received_data[15]+
		    	        "','"+mauth_by+"','"+mauth_on+"','"+minserdt+"','"+mtwempname+"','"+received_data[20]+"',"+received_data[21]+")";
                System.out.println("insert query---->>"+sql1);
				int numRows = stmt1.executeUpdate(sql1,Statement.RETURN_GENERATED_KEYS);
      			ResultSet rsnos=stmt1.getGeneratedKeys();
      			if (rsnos.next())
      			{
      			    mmoneyreceiptno= rsnos.getInt(1);
      			}
      			
      			System.out.println("----->>>>>"+sql1+"----"+numRows+"======"+mmoneyreceiptno);
      			// if(request.getParameter("invoice").toString().equalsIgnoreCase("invoice") )
         		//{
     			//	System.out.println("**FOR Specific invoices...");
         		//}
      			buffer="##"+todaydate+"#"+received_data[3]+"##"+todaydate+"#0######"+mmoneyreceiptno+"#########";
    			out.println(buffer);
      		}
		    catch(Exception e)
            {
		    	e.printStackTrace();
            }
		}
		if (modiflag.contains("C") && myaction.contains("POST") )
		{
           
			String received_data[]  = msend_data.split("zz",22);
			String mcustomername=received_data[3].replace("ampers","&");
			sql1="select * from "+session.getAttribute("CompanyMasterID").toString()+"customerdet where companyname='"+mcustomername+"' limit 1";
			rs2=stmt2.executeQuery(sql1);
		    while(rs2.next())
			{
	    	   mCustomercode=rs2.getString("customercode");   
			}
	    	String mPayment_date =new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(received_data[2]));
			String mCheque_date =new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(received_data[5]));
			String mTallyrefno = received_data[15];
			String mauth_on = received_data[17];
			String mauth_by =received_data[16];
			String minserdt =received_data[18];
			String mtwempname=received_data[19];
			System.out.println("mtallyrefno"+mTallyrefno);
			System.out.println("session>>>>"+session.getAttribute("department")+"<<<<<");
			String mCurrentUser=session.getAttribute("user").toString();
			if (session.getAttribute("department").toString().contains("Accounts") || session.getAttribute("department").toString().contains("All"))
			{
				mauth_by = session.getAttribute("user").toString();
				mauth_on = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
			}
			else
			{
				mtwempname=session.getAttribute("user").toString();
			}
			try
		    {
				String paymentVoucher="-";
				String creditnoteVoucher="-";
				paymentAmount=received_data[6];
				paymentMode = received_data[14];
				Double mDedamount=Double.parseDouble(received_data[21]);
				System.out.println("deduction amount"+mDedamount);
				java.text.DecimalFormat df = new java.text.DecimalFormat("000");
				String date =  new SimpleDateFormat("ddMMyy").format(new Date());
				if (session.getAttribute("department").toString().contains("Accounts") || session.getAttribute("department").toString().contains("All"))
				{
					paymentVoucher="SMR";
					sql1="SELECT PaymentVoucherNo from "+session.getAttribute("CompanyMasterID").toString()+"allpaymentdetails  where PaymentVoucherNo like ('"+paymentVoucher+""+date+"%') ORDER BY PaymentVoucherNo DESC LIMIT 1";
	    			ResultSet rs=stmt2.executeQuery(sql1);
					if(rs.next())
					{
						  paymentVoucher=rs.getString(1).substring(0,rs.getString(1).length()-3)+df.format(Integer.parseInt(rs.getString(1).substring(rs.getString(1).length()-3, rs.getString(1).length()))+1);
					}
					else
					{
						  paymentVoucher+=date+"001";
					}

					if (mDedamount>0)
					{
						creditnoteVoucher="SCN";
						sql1="SELECT PaymentVoucherNo from "+session.getAttribute("CompanyMasterID").toString()+"allpaymentdeductiondetails  where PaymentVoucherNo like ('"+creditnoteVoucher+""+date+"%') ORDER BY PaymentVoucherNo DESC LIMIT 1";
		    			rs=stmt2.executeQuery(sql1);
						if(rs.next())
						{
							creditnoteVoucher=rs.getString(1).substring(0,rs.getString(1).length()-3)+df.format(Integer.parseInt(rs.getString(1).substring(rs.getString(1).length()-3, rs.getString(1).length()))+1);
						}
						else
						{
							creditnoteVoucher+=date+"001";
						}
					}
				}
				// ADDED FOR HISTORYLOG ----------->>>>
				
			    sql1="UPDATE "+session.getAttribute("CompanyMasterID").toString()+"collection set paymentvoucherno='"+paymentVoucher+"', paymentdate='"+mPayment_date+"',chorddorcreditnoteno='"+received_data[4]+"',chorddorcreditnotedate='"+mCheque_date+"', amountpaid='"+received_data[6]+"',invoiceno='"+received_data[7]+"', bankname='"+received_data[8]+"', branchname='"+received_data[9]+"', city='"+received_data[10]+"', remarks='"+received_data[11]+"', customercode="+mCustomercode+", paymentmode='"+received_data[14]+"', tallyrefno='"+mTallyrefno+"', auth_by='"+mauth_by+"', auth_on='"+mauth_on+"', inserdt='"+minserdt+"', twempname='"+mtwempname+"', ded_type='"+received_data[20]+"', ded_amount="+received_data[21]+" where moneyreceiptno="+mPayment_id;
				System.out.println("paymentvoucherno"+paymentVoucher+"paymentamount"+paymentAmount+"SQL:"+sql1);
				stmt1.executeUpdate(sql1);	
				if ((session.getAttribute("department").toString().contains("Accounts") || session.getAttribute("department").toString().contains("All")) && !mTallyrefno.equalsIgnoreCase(""))
				{
				    sql1="INSERT into "+session.getAttribute("CompanyMasterID").toString()+"allpaymentdetails (paymentvoucherno,paymentdate,chorddorcreditnoteno,"+
  					        "chorddorcreditnotedate,amountpaid,invoiceno,bankname,branchname,city,"+
  				        	"remarks,customercode,paymentmode,tallyrefno,twempname)"+
	    	                "VALUES ('"+paymentVoucher+"','"+mPayment_date+"','"+received_data[4]+
	    	                "','"+mCheque_date+"','"+received_data[6]+"',"+received_data[7]+",'"+
	    	                received_data[8]+"','"+received_data[9]+"','"+received_data[10]+"','"+
	    	                received_data[11]+"',"+mCustomercode+",'"+received_data[14]+"','"+mTallyrefno+"','"+mtwempname+"')";
					System.out.println(sql1);
					stmt1.executeUpdate(sql1);
					// insert into Invoice Details  
					sql1="SELECT * from "+session.getAttribute("CompanyMasterID").toString()+"collectioninv where moneyreceiptno="+mPayment_id;
	    			ResultSet rs=stmt2.executeQuery(sql1);
					while(rs.next())
					{
					      sql1="INSERT INTO "+session.getAttribute("CompanyMasterID").toString()+"custpymtagainstinv (CustomerCode,PaymentVoucherNo,InvNo,InvValue,AmountPaidAgainstThisInvoice,CustSpecifiedInvoice,InvRefNo) VALUES"+
	       			              "('"+rs.getString("Customercode")+"','"+paymentVoucher+"','"+rs.getString("InvNo")+"','"+rs.getString("InvValue")+"','"+rs.getString("AmountPaidAgainstThisInvoice")+"','Yes','"+rs.getString("InvRefNo")+"')";
	    				  System.out.println(sql1);
	    				  stmt1.executeUpdate(sql1);
					}
					// ADDED for deduction details 
					if (mDedamount>0)
					{
						String sqlDeductionDesc="SELECT DeductionDesc,DeductionPer FROM "+session.getAttribute("CompanyMasterID").toString()+"paymentdeductiontypes "+
	    				" WHERE DeductionCode ='TDS' ";
						ResultSet rsDesc=stmt2.executeQuery(sqlDeductionDesc);
	    				deductiondesc="-";deductionPer="-";
	    				if(rsDesc.next())
	    				{
	    					deductiondesc=rsDesc.getString("DeductionDesc");
	    					deductionPer=rsDesc.getString("DeductionPer");
	    				}
	    				String sqlDeduction="INSERT INTO "+session.getAttribute("CompanyMasterID").toString()+"allpaymentdeductiondetails(PaymentVoucherNo,CustomerCode,"+
	    				" DeductionCode,DeductionDesc,DeductionBaseAmt,DeductionPer,DeductionAmt,Remarks,EntryDateTime,EnteredBy,Datavalid) "+
	    				" VALUES ('"+creditnoteVoucher+"','"+mCustomercode+"','"+request.getParameter("deductionOptions")+"','"+deductiondesc+"',"+
	    				" '"+deductionvalue+"','"+deductionPer+"','"+mDedamount+"','"+received_data[11]+"','"+todaysDateTime+"','"+session.getAttribute("EmpName")+"','1')";
	    				System.out.println("sqldeduction"+sqlDeduction);
	    				stmt2.executeUpdate(sqlDeduction);
					 }
					 String sqlLedger="Select balance from  "+session.getAttribute("CompanyMasterID").toString()+"customerledgeraccount  where CustomerCode='"+mCustomercode+"' ORDER BY TransactionId  desc limit 1";
		    		 double  balance=0;
		    		 ResultSet rsLedger=stmt2.executeQuery(sqlLedger);
		    		 if (rsLedger.next())
		    		 {
		    			 System.out.println("bal "+rsLedger.getDouble("Balance"));
		    			 balance=Double.valueOf(twoDForm.format(rsLedger.getDouble("Balance")-Double.parseDouble(paymentAmount)));// deduct TDS from this
		    			 
		    		 }
		    		 System.out.println("deduction val::::"+mDedamount);
		    		 System.out.println("Balance ::"+balance);
		    		 sqlLedger="INSERT INTO "+session.getAttribute("CompanyMasterID").toString()+"customerledgeraccount (CustomerCode, 	TransactionType,TransactionDetail ,TransactionDate,"+
							 "DebitAmount ,CreditAmount,Balance ,EmpName ,PaymentVoucherNo ,DebitParty ,CreditParty) VALUES "+
							 " ('"+mCustomercode+"','"+paymentMode+"','"+ddNumber+"','"+todaysDate+"','0.00','"+paymentAmount+"','"+balance+"','"+session.getAttribute("EmpName")+"','"+paymentVoucher+"','Cash Amt','"+mCustomercode+"')";
					         System.out.println(sqlLedger);
		   
		   		 	 stmt2.executeUpdate(sqlLedger);
		   		 	 if (mDedamount>0)
		   		 	 {
		   		 		 balance=balance-mDedamount;
			    		 sqlLedger="INSERT INTO "+session.getAttribute("CompanyMasterID").toString()+"customerledgeraccount (CustomerCode, 	TransactionType,TransactionDetail ,TransactionDate,"+
						 "DebitAmount ,CreditAmount,Balance ,EmpName ,PaymentVoucherNo ,DebitParty ,CreditParty) VALUES "+
						 " ('"+mCustomercode+"','Credit Note','-','"+todaysDate+"','0.00','"+mDedamount+"','"+balance+"','"+session.getAttribute("EmpName")+"','"+creditnoteVoucher+"','Sales Dept','"+mCustomercode+"')";
				         System.out.println(sqlLedger);
	     	   		 	 stmt2.executeUpdate(sqlLedger);
		   		 	 }
		   		}			
			}
		    catch(Exception e)
            {
		    	e.printStackTrace();
            }
        }
		
		if (modiflag.contains("N") && myaction.contains("GET"))
		{
            buffer="##"+todaydate+"###"+todaydate+"#0#############";
			out.println(buffer);
		}
		if (modiflag.contains("D") && myaction.contains("GET"))
		{
            buffer="#null#null#null#null#null#0#null#null#null#null#null#null#null#null#null#null#null#null#null#null#null";
            sql1="DELETE from "+session.getAttribute("CompanyMasterID").toString()+"collection where moneyreceiptno="+mPayment_id+" limit 1";
            try
            {
            	stmt1.executeUpdate(sql1);
            
            }
            catch(Exception e)
            {
            	
            }
            sql1="DELETE from "+session.getAttribute("CompanyMasterID").toString()+"collectioninv where moneyreceiptno="+mPayment_id;
            try
            {
            	stmt1.executeUpdate(sql1);
            
            }
            catch(Exception e)
            {
            	
            }
        }
}
catch(Exception e)
{
	out.print("#noting");
}
finally
{
	con1.close();
}
%>
</jsp:useBean>
