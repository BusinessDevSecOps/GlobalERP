<%@page import="java.util.Date"%>
<%@ include file="conn.jsp"%>

<%
	Connection con=null ;
	DecimalFormat twoDForm = new DecimalFormat("#.##");
	Statement st=null,st1=null,st2=null,st3=null;
	String todaysDate=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	String todaysTime=new SimpleDateFormat(" HH:mm:ss").format(new java.util.Date());
	int i=0;
%>		
		
<%		
	try	
	{	
		Class.forName(DB_Driver);
		con = DriverManager.getConnection(DB_NAME,DB_USERNAME,DB_PASSWORD);
		st=con.createStatement();
		st1=con.createStatement();
		st2=con.createStatement();
		st3=con.createStatement();
		
		int count=Integer.parseInt(request.getParameter("count").toString());
		String invcrefno=request.getParameter("invoicerefno");
		String custcode=request.getParameter("customercode");
		String invcdate=request.getParameter("invoicedate");
		
		String invctime=request.getParameter("invoicetime");
		String groupCode=request.getParameter("groupCode");
		String total=request.getParameter("total");
		String pfi=request.getParameter("pfi");
		String frieght=request.getParameter("frieght");
		String grandtotal=request.getParameter("grandTotal");
		String terms=request.getParameter("termsconditions");
		String amountinwords=request.getParameter("rupees");
		String pono=request.getParameter("pono");
		String PODate=request.getParameter("podate");
		String friType=request.getParameter("frieghtType");
		String paymentmode=request.getParameter("paymentMode");
		String insurance=request.getParameter("insurance");
		String shipby=request.getParameter("shipBy");
		String docketfill=request.getParameter("docketfilledby");
		String deskchekedby=request.getParameter("checkedBy");
		String packslipby=request.getParameter("packingSlipCheckedBy");
		System.out.println("VALUE   *****   "+docketfill);
		String SESQnumber=request.getParameter("SESQrefno");
		String time=request.getParameter("invoicetime");
		
		String shipmentDate="";
		String abc=request.getParameter("dateOfShipment");
		System.out.println("DATE IS  DATE     IS     "+abc);
		if(abc=="")
		{
		   shipmentDate="0000:00:00";	
		}
		else 
		{
		shipmentDate=new SimpleDateFormat(
		"yyyy-MM-dd")
		.format(new SimpleDateFormat(
				"dd-MMM-yyyy")
				.parse(abc));
		}
		System.out.println("DATE IS  DATE     IS     "+shipmentDate);
	    
		String invoiceraisedby=request.getParameter("SIRaisedBy");
	    String salesorno=request.getParameter("SOno");
	    String addcode=request.getParameter("addresscode");
		String company=request.getParameter("company");
		String contactperson=request.getParameter("contact");
		String address=request.getParameter("address");
		String city=request.getParameter("city");
		String zip=request.getParameter("zip");
		String state=request.getParameter("state");
		String country=request.getParameter("country");
		String phone=request.getParameter("phone");
		String fax=request.getParameter("fax");
		String group=request.getParameter("group");
	    System.out.println("TYPE TYPE  "+addcode);
				
		String sqlUpdate="Update "+session.getAttribute("CompanyMasterID").toString()+"performainvoicedet set InvoiceCancelled=1 where invoiceRefNo='"+invcrefno+"' 	";
		System.out.println(sqlUpdate);	
		st.executeUpdate(sqlUpdate);
		
		int SINumber;
		String sqlOrderno="SELECT MAX(InvoiceNo) from "+session.getAttribute("CompanyMasterID").toString()+"performainvoicedet ";
		ResultSet rs=st.executeQuery(sqlOrderno);
		rs.next();  
			SINumber=rs.getInt(1);
		SINumber++;
		
		String SIRefNumber="";
		java.text.DecimalFormat df = new java.text.DecimalFormat("000");
		try{
			Date today = new Date();
			SIRefNumber="SP";
      		String date =  new SimpleDateFormat("ddMMyy").format(new Date());
			String sql3="SELECT invoiceRefNo  from "+session.getAttribute("CompanyMasterID").toString()+"invoicedet  where invoiceRefNo like ('"+SIRefNumber+""+date+"%') ORDER BY invoiceRefNo DESC LIMIT 1";
			    rs=st1.executeQuery(sql3);
			  if(rs.next())
				  SIRefNumber=rs.getString(1).substring(0,rs.getString(1).length()-3)+df.format(Integer.parseInt(rs.getString(1).substring(rs.getString(1).length()-3, rs.getString(1).length()))+1);
			  else
				  SIRefNumber+=date+"001";
			  
     	}catch(Exception e)
     	{
		      e.printStackTrace();		
		}
     	
     	String sqlDet = "SELECT * from "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det WHERE SalesOrderNo='"+ request.getParameter("SOno") + "' ";
     	System.out.println("ORDER NO QUERYT   "+sqlDet);
		ResultSet rsDet = st1.executeQuery(sqlDet);
		rsDet.next();
     			
		String sqlInsert="Insert into "+session.getAttribute("CompanyMasterID").toString()+"performainvoicedet (InvoiceNo ,CustomerCode ,InvoiceDate, TheGroup ,Total ," +
		"	Discount ,CST ,PFI ,FreightAmt ,GrandTotal, " +
		"	Terms, TotalInWords, 	PONo 	,PODate ,	DespatchMode ," +
		"	FreightType ,	PaymentMode ,	Insurance, ShippedBy ,ShipmentDate ," +
		"	DespCheckListCheckedBy ,PackingSlipCheckedBy ,DocketFilledBy,InvoiceCancelled ,	RevofInvoiceNo ," +
		"	NoofRevisions ,	ReasonForCancelling ,SEandSQRefNo,InvoiceTime,InvoiceRaisedby," +
		"	CurrType,CurrValue,TWSalesOrderNo ,DebitNote,TWEmpName, "+
		"	AddressCode,CompanyName,ContactPerson,Address,city," +
		"	Zip,State,country,Phone ,Fax, "+
		"	invoiceRefNo, TWSalesorderRefNo ,RevOfinvoiceRefNo ,InvoiceType ,InvoicePrinted ) "+
		
		"   Values ('"+SINumber+"','"+custcode+"','"+invcdate+"','"+groupCode+"','"+total+"', "+
		"  '0.00','0.00','"+pfi+"','"+frieght+"','"+grandtotal+"', "+ 
		"  '"+terms+"','"+amountinwords+"','"+pono+"','"+PODate+"','-',"+
		"  '"+friType+"','"+paymentmode+"','"+insurance+"','"+shipby+"','"+shipmentDate+"', "+
		"  '"+deskchekedby+"','"+packslipby+"','"+docketfill+"','0','0',"+
		"  '0','-','"+SESQnumber+"','"+time+"','"+invoiceraisedby+"',"+
		"  'Rupees','1','"+salesorno+"','-','"+session.getAttribute("EmpName")+"',"+
		"  '"+addcode+"','"+company+"','"+contactperson+"','"+address+"','"+city+"', "+
		"  '"+zip+"','"+state+"','"+country+"','"+phone+"','"+fax+"',"+ 
		"  '"+SIRefNumber+"' ,'"+rsDet.getString("SalesorderRefNo")+"','-','OldTaxInvoice','NO') ";
				
		System.out.println(sqlInsert);
		st2.executeUpdate(sqlInsert);
		
		for(i=0;i<count;i++)
		{
			
			System.out.println(" IN LOOPPPPP ");
			
			String gcode=request.getParameter("groupcode"+i);
			String mcode=request.getParameter("makecode"+i);
			
			int no=Integer.parseInt(gcode);
			String tableToBeAccessed="";
			if(no< 5)
			{
				tableToBeAccessed="tbl_"+group.substring(0,5).toLowerCase()+"im_make"+mcode+"";
		
			}else 
				tableToBeAccessed=""+session.getAttribute("CompanyMasterID").toString()+"tbl_otherim_group"+gcode;	
			
		
			String icode=request.getParameter("itemcode"+i);
			String quant=request.getParameter("quantity"+i);
			String tax1=request.getParameter("stpercent"+i);
			String discount1=request.getParameter("discount"+i);
			String sellingprice=request.getParameter("sellingprice"+i);
			String descrp=request.getParameter("description"+i);
			String amount=request.getParameter("amount"+i);
			
		    String sqlIn="Insert into "+session.getAttribute("CompanyMasterID").toString()+"performainvoice_items(InvoiceNo,TheGroup ,Make ,ItemCode ,Quantity ,SellingPrice ,DiscountPercent ,"+
				   " TheTableToBeAccessed ,SoNo ,STPercent ,ItemSrno , ItemDescription ,TaxType) "+
					 
				   " Values('"+SINumber+"','"+gcode+"','"+mcode+"','"+icode+"','"+quant+"','"+sellingprice+"','"+discount1+"', "+
				   " '"+tableToBeAccessed+"', '"+salesorno+"','"+tax1+"','"+ i+1 +"','"+descrp+"','NIL')";
		    System.out.println(sqlIn);
		    st3.executeUpdate(sqlIn);
		
		}
			
		String sql="UPDATE "+session.getAttribute("CompanyMasterID").toString()+"salesorder_det set InvoiceGenerated='1' where SalesOrderNo='"+salesorno+"' limit 1  ";
		System.out.println(sql);
		st.executeUpdate(sql);
				
		response.sendRedirect("alertGoTo.jsp?msg=Sales ProForma Invoice Has Been Revised Successfully &goto=home.jsp");
	}
	catch(Exception e)
	{
		System.out.println( "Exception ::"+e );
		e.printStackTrace();
		response.sendRedirect("alertGoTo.jsp?msg=!!!! ERROR Inserting Record.Please try again. \n\n \n\n   "+e.toString().replace("'"," --")+"&goto=javascript:history.back()");
	}
	finally
	{
		con.close();
	}
%>	