<%@page import="java.util.Date"%>
<%@ include file="conn.jsp"%>


<%
	Connection con=null ;
	DecimalFormat twoDForm = new DecimalFormat("#.##");
	Statement st=null,st1=null,st2=null,st3=null,st4=null;
	String todaysDate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
	String todaysTime=new SimpleDateFormat(" HH:mm:ss").format(new java.util.Date());
	
	
	Date today = new Date();
	Calendar cal = Calendar.getInstance();
	cal.add(Calendar.DAY_OF_MONTH, +4);
	Date fourdayslaterAsDate = cal.getTime();
	String fourdayslaterDate=new SimpleDateFormat("yyyy-MM-dd").format(fourdayslaterAsDate);
	System.out.println("$$$$$$$$$$$$$$$$$$$$$$$           %%%%%%%%%%%%   "+fourdayslaterDate);
%>

<%
	
try{	
	
	System.out.println("chk     ."+request.getParameter("checkedNumber").toString()+".");
	Class.forName(DB_Driver);
	con = DriverManager.getConnection(DB_NAME,DB_USERNAME,DB_PASSWORD);
	st=con.createStatement();
	st1=con.createStatement();
	st2=con.createStatement();
	st3=con.createStatement();
	st4=con.createStatement();
	
	String sellingprice1="" ,priceAccepted="",custrefno="",twsalesorderno="";				
	String QuoExpirydate="",paymentterms="",group="",quantity1=""; 
	String discount1="",tax1="",amount="",total="",salesquono="";
	String amountInWords="",supcode="";
	String enqtime="",salesquodate1="";
	int i=0,j=0;
	
	String pqno=request.getParameter("pquono");
	String acode=request.getParameter("addresscode");
	String company1=request.getParameter("company");
	supcode=request.getParameter("suppliercode");
	String terms=request.getParameter("termsconditions");
	String pfi=request.getParameter("pfi");	
	String frieght=request.getParameter("frieght");
 	total=request.getParameter("total");
 	String grandtotal=request.getParameter("grandTotal");
 	salesquodate1=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
 	String remarks=request.getParameter("remarks");
	amountInWords=request.getParameter("rupees");
	String expirydate=new SimpleDateFormat(
	"yyyy-MM-dd")
	.format(new SimpleDateFormat(
			"dd-MMM-yyyy")
			.parse(request.getParameter("fromdate")));
	int number=Integer.parseInt(request.getParameter("checkedNumber").toString());
	//group=request.getParameter("group");
	String deliverydate=new SimpleDateFormat(
	"yyyy-MM-dd")
	.format(new SimpleDateFormat(
			"dd-MMM-yyyy")
			.parse(request.getParameter("deliverydate")));
	System.out.println("DELIVERY DATE  IIS  ***   "+deliverydate);
	
	
	int porderno;
	String sqlorderno="SELECT MAX(PONo) from "+session.getAttribute("CompanyMasterID").toString()+"purchaseorder";
	ResultSet rs=st1.executeQuery(sqlorderno);
	rs.next();
	porderno=rs.getInt(1);
	porderno++;
	System.out.println(porderno);
	
	String sqlInsert="INSERT INTO "+session.getAttribute("CompanyMasterID").toString()+"purchaseorder (PONo ,PurQuoNo ,PODate ,POTime ,Terms ,POCancelled ,RevOfPOno ,NoOfRev, "+
					 "ReasonForCancelling ,Total ,DiscountPercent ,GrandTotal ,TotalinWords ,SentBy , SupplierCode ,POReference ,"+	
			         "despatchAddress ,PORaisedByCompany ,PendingPODetails ,PODueDate ,ReasonforPendingPO ,DeliveryDate ,CurrType ,CurrValue)"+
			
					 "VALUES ('"+porderno+"','"+pqno+"','"+todaysDate+"','"+todaysTime+"','"+terms+"','0','0','0' ,"+
					 "'-','"+total+"','0.00','"+grandtotal+"','"+amountInWords+"','"+session.getAttribute("EmpName")+"', '"+supcode+"','PO Generated from the Quotation No "+pqno+" ',"+
					 "'Transworld Compressor Technologies Ltd.Survey No. 921 Kad Vasti,Next to Raisony Collage,Wagholi Domkhel Road,Wagholi,Pune- 412207','Transworld Compressor Technologies Ltd.',"+
					 " '-','"+expirydate+"','-','"+deliverydate+"','Rupees','1')";			
	
	System.out.println(sqlInsert);	
	st2.executeUpdate(sqlInsert);
	
	for(i=0;i<number;i++)
	{
	 		
		String description1=request.getParameter("description"+i);
		discount1=request.getParameter("discount"+i);
		tax1=request.getParameter("tax"+i);
		quantity1=request.getParameter("quantity"+i);
		sellingprice1=request.getParameter("sellingPrice"+i);
		String make=request.getParameter("make"+i);
		String itemcode=request.getParameter("icode"+i);
		String gcode=request.getParameter("gcode"+i);
		String mcode=request.getParameter("mcode"+i);
		
		System.out.println(request.getParameter("gcode"+i)+" ************");
		group=request.getParameter("groupname");
		System.out.println(group+"GRUOP IS  ");
		
		int no=Integer.parseInt(request.getParameter("gcode"+i));
		String tableToBeAccessed="";
		if(no< 5)
		{System.out.println("IN IF    ");
		
			tableToBeAccessed="tbl_"+group.substring(0,5).toLowerCase()+"im_make"+mcode+"";
		}else {
			System.out.println("IN ELSR     ");
			
			tableToBeAccessed=""+session.getAttribute("CompanyMasterID").toString()+"tbl_otherim_group"+gcode;
		}
		String sql="INSERT INTO "+session.getAttribute("CompanyMasterID").toString()+"purchaseorder_items (PONo ,TheGroup ,Make ,ItemCode ,Quantity ,UnitPrice ,TheTableToBeAccessed)"+
				   
				   "VALUES ('"+porderno+"','"+gcode+"','"+mcode+"','"+itemcode+"','"+quantity1+"','"+sellingprice1+"','"+tableToBeAccessed+"')";
		System.out.println(sql);
		st3.executeUpdate(sql);
		
		String sqlUpdate="UPDATE "+session.getAttribute("CompanyMasterID").toString()+"purchasequo SET POGenerated='1',QuoReceived='1' WHERE PurQuoNo='"+pqno+"'";
		System.out.println(sqlUpdate);
		st4.executeUpdate(sqlUpdate);
		
	}
	
	response.sendRedirect("alertGoTo.jsp?msg=Purchase Order Successfully Saved.&goto=home.jsp");
	}
	catch(Exception e)
	{
	System.out.println( "Exception in INSERT QUOTATION ::"+e );
	e.printStackTrace();
	response.sendRedirect("alertGoTo.jsp?msg=!!!! ERROR Inserting Record.Please try again.&goto=javascript:history.back()");
	}
	finally
	{
	con.close();
	}
%>