package com.erp.beans;
import java.awt.Color;
import java.io.ByteArrayOutputStream;
import java.io.DataOutput;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.lowagie.text.Chunk;
import com.lowagie.text.Document;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.Rectangle;
import com.lowagie.text.SimpleCell;
import com.lowagie.text.SimpleTable;
import com.lowagie.text.pdf.PdfContentByte;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import java.sql.*;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServlet;

public class PdfGeneration extends HttpServlet{

	static Connection conn1=null;
	public	static Statement st=null;
	static Statement st1=null;
	static Statement st2=null;
	static Statement st3=null;
	static Statement st4=null;
	static Statement st5=null;
	public	static Statement st6=null;
	static Statement st7=null;
	static Statement st8=null;
	static Statement st9=null;
	static Statement st10=null;
	static Statement st11=null;
	static Statement st12=null;
	static Statement st13=null;
	static Statement st14=null;
	static Statement st_update=null;


	static Statement st15=null;
	static Statement st16=null;
	static Statement st17=null;
	static Statement st18=null;
	static Statement st19=null;
	public static Connection con=null;
	//	public static Statement st11=null;
	static String sql="";
	static String sql1="";
	static String sql2="";
	static String sql3="";
	static String sql4="";
	static String sql5="";
	static String sql6="";
	static String sql7="";
	static String sql8="";
	static String sql9="";
	static String sql10="";
	static String sql11="";
	static String sql12="";
	static String sql13="";
	static	String filepath1="";

	public  Connection GetConnection() { 
		try {
			String MM_dbConn_DRIVER = "org.gjt.mm.mysql.Driver";
			String MM_dbConn_USERNAME = "fleetview";
			String MM_dbConn_PASSWORD = "1@flv";



		//	String MM_dbConn= "jdbc:mysql://164.68.105.216/twsql_twalldata";

			String MM_dbConn= "jdbc:mysql://164.68.105.216/db_GlobalERP";



			Class.forName(MM_dbConn_DRIVER);
			conn1 = DriverManager.getConnection(MM_dbConn,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
			st =  conn1.createStatement();
			st1 =  conn1.createStatement();
			st2 =  conn1.createStatement();
			st3 =  conn1.createStatement();
			st4 =  conn1.createStatement();
			st5 =  conn1.createStatement();
			st6 =  conn1.createStatement();
			st7 =  conn1.createStatement();
			st8 =  conn1.createStatement();
			st9 =  conn1.createStatement();
			st10 =  conn1.createStatement();
			st11 =  conn1.createStatement();
			st12 =  conn1.createStatement();
			st13 =  conn1.createStatement();
			st14 =  conn1.createStatement();
			st15 =  conn1.createStatement();






			System.out.println("DONE WITH  connection.**************..");
		} catch (Exception e) {
			System.out.println("GetConnection Exception ---->" + e);
			//GetConnection();
		}
		return conn1;
	}

	public  void CloseConnection() { 
		try {
			st.close();

			st1.close();
			st2.close();
			st3.close();
			st4.close(); 
			st5.close();
			st6.close();
			st7.close();
			st8.close();
			st9.close();
			st10.close();
			st11.close();
			st12.close();
			st13.close();
			st14.close();
			st15.close();
			


			conn1.close();
		} catch (Exception e) {
			System.out.print("CloseConnection Exception---->" + e);
		}

	}
	
	/************************************************************ End of rupees conversion Logic**************************************************************/	
	private static final String[] lowNames = {
		   "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten",
		   "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"};

		private static final String[] tensNames = {
		   "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"};

		private static final String[] bigNames = {
		   "thousand", "million", "billion"};

		/**
		* Converts an integer number into words (american english).
		* @author Christian d'Heureuse, Inventec Informatik AG, Switzerland, www.source-code.biz
		**/
		public static String convertNumberToWords (int n) {
		   if (n < 0) {
		      return "minus " + convertNumberToWords(-n); }
		   if (n <= 999) {
		      return convert999(n); }
		   String s = null;
		   int t = 0;
		   while (n > 0) {
		      if (n % 1000 != 0) {
		         String s2 = convert999(n % 1000);
		         if (t > 0) {
		            s2 = s2 + " " + bigNames[t-1]; }
		         if (s == null) {
		            s = s2; }
		          else {
		            s = s2 + ", " + s; }}
		      n /= 1000;
		      t++; }
		   return s; }

		// Range 0 to 999.
		private static String convert999 (int n) {
		   String s1 = lowNames[n / 100] + " hundred";
		   String s2 = convert99(n % 100);
		   if (n <= 99) {
		      return s2; }
		    else if (n % 100 == 0) {
		      return s1; }
		    else {
		      return s1 + " " + s2; }}

		// Range 0 to 99.
		private static String convert99 (int n) {
		   if (n < 20) {
		      return lowNames[n]; }
		   String s = tensNames[n / 10 - 2];
		   if (n % 10 == 0) {
		      return s; }
		   return s + "-" + lowNames[n % 10]; }
		
		/************************************************************ End of rupees conversion Logic**************************************************************/

	//createAnnexture.jsp?cust=<%=rsData.getString("CustomerCode") %>&name=<%=strcustomer %>&year=<%=year %>&month=<%=month %>&group=<%=strgroupname %>&vehiclenos=<%=rsData.getString("NoofVehicles") %>&rateperveh=<%=rsData.getString("Rate") %>&jrmcount=<%=rsData.getString("jrmvehcount") %>&billtype=<%=rsData.getString("BillType") %>&slacount=<%=rsData.getString("SLAPer") %>&billdays=<%=rsData.getString("TotalBilledDays")
	public  void PdfGenerationCall(String customer,String custname,String year,String month,String groupname,String vehiclenos,String ratepervehicle,String jrmcountNo,String billtype,String slacount,String billdaysAll) { 
		try {

			//	PdfGeneration getConn=new PdfGeneration();

			System.out.println("Inside PdfGenerationCall");


			Connection conn = null;
		//	Statement st = null, st1 = null, st3 = null, st4 = null;
		//	Statement st2 = null;
			String selectedName;
			String FollowUpType = "";
			Font cat = new Font();
			String tgrp="",tmake="",tmodel="";String a="",b="",c="",j="",m="",n="";

			String fromDateCal = "", toDateCal = "", sql = "";
			String todaysTime = new SimpleDateFormat(" HH:mm:ss")
			.format(new java.util.Date());

			Date tdy = new Date();
			Date tomorrow = new Date();
			Calendar cal = Calendar.getInstance();
			Calendar now = Calendar.getInstance();
			cal.setTime(tdy);

			cal.setTime(tdy);
			Date tendays=new Date();
			cal.add(Calendar.DAY_OF_MONTH, +10);
			tendays=cal.getTime();
			String tendaysformat1=new SimpleDateFormat("yyyy-MM-dd").format(tendays);
			String tendaysInMMM=new SimpleDateFormat("dd-MMM-yyyy").format(tendays);

			String todaysDate = new SimpleDateFormat("dd-MMM-yyyy")
			.format(tdy);
			cal.add(Calendar.DAY_OF_MONTH, -1);
			Date YesterdaysDateAsDate = cal.getTime();
			String yesterdaysDate = new SimpleDateFormat("dd-MMM-yyyy")
			.format(YesterdaysDateAsDate);

			fromDateCal = toDateCal = new SimpleDateFormat("dd-MMM-yyyy")
			.format(new java.util.Date());
			DecimalFormat nf=new DecimalFormat("#.##");

			DecimalFormat nfNew=new DecimalFormat("#.##");
		
		//	System.out.println("Customername before conversion"+custname);
			custname = custname.replace("^","&");
		//	System.out.println("Customername after conversion"+custname);
			
		//	System.out.println(year);
			
		//	System.out.println(month);
			
		//	System.out.println("groupname before conversion is"+groupname);
			groupname = groupname.replace("^","&");
		//	System.out.println("groupname after conversion is"+groupname);
			
		//	System.out.println(vehiclenos);
			
			float flratepervehicle = Float.parseFloat(ratepervehicle);
			System.out.println("no of veh  =======>"+vehiclenos);
			//		int jrmcount=0;

			int jrmcount=Integer.parseInt(jrmcountNo);
			//		System.out.println(request.getParameter("jrmcount"));
			/*	if(jrmcount==null)// || rmcount.equals("null"))
				 	{
				 	jrmcount="0";
				 	}
				 	else 

				jrmcount=Integer.parseInt(jrmcount);

			 */
			System.out.println("jrm count =========> "+jrmcount); 	
			//String billtype=request.getParameter("billtype");
			int salcount=Integer.parseInt(slacount);
			int billdays=Integer.parseInt(billdaysAll);
			String lastdayofmonth="";

			if(month.equals("01") || month.equals("03") || month.equals("05") ||month.equals("07") || month.equals("08") || month.equals("10") || month.equals("12") || month.equals("12"))
			{
				lastdayofmonth=year+"-"+month+"-31";	
			}

			if(month.equals("04") || month.equals("06") || month.equals("09") ||month.equals("11"))
			{
				lastdayofmonth=year+"-"+month+"-30";
			}

			if(month.equals("02"))
			{
				lastdayofmonth=year+"-"+month+"-28";
			}

			System.out.println(custname+""+customer+""+year+""+month+""+groupname+""+vehiclenos+""+ratepervehicle+" "+flratepervehicle);
		/*	try {
				//conn = erp.ReturnConnection();

				//conn = getConn.GetConnection();
				st = conn1.createStatement();
				st1 = conn1.createStatement();
				st2 = conn1.createStatement();
				st3 = conn1.createStatement();
				st4 = conn1.createStatement();
				st5 = conn1.createStatement();
			}
			catch (Exception e) 
			{
			}
*/
			/*  ****************************************** logic for invoice no  ******************************************  */

			Document document = new Document();
			
			try{
				
				
				
				
				ByteArrayOutputStream buffer = new ByteArrayOutputStream();
				
				
				int SINumber;


				String sqldate="select DATEDIFF('"+lastdayofmonth+"','"+year+"-"+month+"-01')";
				ResultSet rsDate=st1.executeQuery(sqldate);
				//System.out.println(sqldate);
				rsDate.next();
				int daysinmonth=rsDate.getInt(1);
				daysinmonth=daysinmonth+1;
				System.out.println("DAys in MONTH ARE  "+daysinmonth);

				String sqlOrderno="SELECT MAX(InvoiceNo) from t_invoicedet ";
				ResultSet rsNew=st.executeQuery(sqlOrderno);
				System.out.println(sqlOrderno);
				rsNew.next();  
				SINumber=rsNew.getInt(1);
				SINumber++;
				System.out.println("&&&&****&& N "+SINumber);

				String SIRefNumber="";
				java.text.DecimalFormat df = new java.text.DecimalFormat("000");

				try{

					Date today = new Date();

					SIRefNumber="SI";

					String date =  new SimpleDateFormat("ddMMyy").format(new Date());

					String sql3="SELECT invoiceRefNo  from t_invoicedet  where invoiceRefNo like ('"+SIRefNumber+""+date+"%') ORDER BY invoiceRefNo DESC LIMIT 1";
					ResultSet rs=st2.executeQuery(sql3);
					// System.out.println(sql3);     
					if(rs.next())
						SIRefNumber=rs.getString(1).substring(0,rs.getString(1).length()-3)+df.format(Integer.parseInt(rs.getString(1).substring(rs.getString(1).length()-3, rs.getString(1).length()))+1);
					else
						SIRefNumber+=date+"001";

				}catch(Exception e){
					e.printStackTrace();		
				}
				
				System.getProperty("user.home");
				File file = new File(".");
				System.out.println("CURRENT FILE PATH=============>"+file.getCanonicalPath());
				
				File currentDirectory = new File(new File("").getAbsolutePath());
				String FilePath=currentDirectory.getAbsolutePath();
				
				
				
				String PdfNameNew="/home/r_kunjir/Desktop/RKINV/"+custname+"-"+SIRefNumber+".pdf";
				
			
				
				
				System.out.println("Path============================================================================>"+FilePath);
				
				
			//	String prefix = getServletContext().getRealPath("/");
				
				
			//	System.out.println("Path=============================================FILE PATHHHHHHHHHHHHHHHH@&@&@&@&===============================>"+prefix);
				
			//	ServletConfig config = getServletConfig();
				
			//	System.out.println("path==========>>"+(config.getServletContext().getRealPath("/")).toString());
				
				String jprgFilePath="/home/javaprg/";
				
				String RKFilePath="/home/r_kunjir/";
				
				jprgFilePath+="/AutogeneratedInvoice"+year+"_"+month+"";
				
				RKFilePath+="/AutogeneratedInvoice"+year+"_"+month+"";
				
				FilePath+="/AutogeneratedInvoice"+year+"_"+month+"";
				
				String FileNewP="AutogeneratedInvoice"+year+"_"+month+"";
				
				String PdfNameServer="/home/javaprg/"+FileNewP+"/"+custname+"-"+SIRefNumber+".pdf";
				
				System.out.println("Path==============================Current Machine==============================================>"+FilePath);
				
				System.out.println("Path=================================Javaprg Path===========================================>"+jprgFilePath);
				
				System.out.println("Path======================RK Machine======================================================>"+RKFilePath);
				
				File dir = new File(jprgFilePath);
		       // dir.mkdir();
		        
		        if (!dir.exists()) {
		    		if (dir.mkdir()) {
		    			System.out.println("Directory is created!");
		    		} else {
		    			System.out.println("Failed to create directory!");
		    		}
		    	}
		        
		        
		        String PdfNameMonthly=jprgFilePath+"/"+custname+"-"+SIRefNumber+".pdf";
				
				String PdfName=FilePath+"/"+custname+"-"+SIRefNumber+".pdf";
				PdfWriter writer=PdfWriter.getInstance(document,new FileOutputStream(PdfNameMonthly));
				
				
				System.out.println("PDF Name=====================WITH PATH=======================================================>"+PdfName);
				
				System.out.println("PDF Name=================Rk ====WITH PATH=======================================================>"+PdfNameMonthly);
				
				
				
				
				document.setPageSize(PageSize.A4);
				document.setMargins(20,20,10,10);
				document.setMarginMirroring(false);

				Font catFont = new Font(Font.TIMES_ROMAN,10,Font.BOLD);
				Font headerFont = new Font(Font.TIMES_ROMAN,9,Font.BOLD);
				Font NormalFont = new Font(Font.TIMES_ROMAN,8,Font.NORMAL);
				Font underline=new Font(Font.TIMES_ROMAN,10,Font.UNDERLINE);
				Font Fontforname = new Font(Font.TIMES_ROMAN,9,Font.BOLD);
				Font Fontfortable = new Font(Font.TIMES_ROMAN,7,Font.BOLD);
				Font smallfont = new Font(Font.TIMES_ROMAN,6,Font.BOLD);
				Font smallfont2 = new Font(Font.TIMES_ROMAN,8,Font.BOLD);
				Font InvAmtFont= new Font(Font.TIMES_ROMAN,8,Font.BOLD,new Color(13,0,255));


				document.open();

				double invcamount=0;

				
				
				
			

	/*       ******************************************        end of invoice ref no. logic   **************************************************    */


	/*       ******************************************          start of logic for opening balance  ********************************************  */
				String sqlupdate="";
				String sqlBalance="SELECT * FROM  t_customerledgeraccount where CustomerCode="+customer+" order by TransactionDate ASC";

				ResultSet rsbalance=st1.executeQuery(sqlBalance);
				System.out.println("sql"+sqlBalance);
				double balance = 0;
				double debitamount=0;
				double creditamount=0;
				double transactionid=0;
				while(rsbalance.next())
				{
					transactionid=rsbalance.getDouble("transactionid");
					debitamount=rsbalance.getDouble("debitamount");
					creditamount=rsbalance.getDouble("creditamount");
				

					balance = balance + debitamount-creditamount;
					//System.out.println(balance);
					sqlupdate = "UPDATE t_customerledgeraccount set balance="+balance+" where transactionid="+transactionid;
					st2.executeUpdate(sqlupdate);
					
				}



  /*   ***************************************           end of opening balance logic  ***************************************************************  */
				
				
  /*   ***************************************          Pdf for adding Header  ***********************************************************************  */
				
				

				Paragraph preface = new Paragraph();
				preface.add(new Paragraph("Transworld Compressor Technologies Limited",catFont));
				preface.setAlignment("center");
				preface.add(new Paragraph("Survey No. 921 Kad Vasti,Next to Raisoni Collage,Wagholi Domkhel Road,Wagholi,Pune- 412207",NormalFont));
				preface.setAlignment("center");
				preface.add(new Paragraph("Tel:020-41215555 Fax:020-41265555 sales@transworld-compressor.com www.transworld-compressor.com",NormalFont));
				preface.setAlignment("center");

				document.add(preface);
				
				document.add( Chunk.NEWLINE );
			


				SimpleTable table3211 = new SimpleTable();
				table3211.setWidthpercentage(100f);
				table3211.setBorder(Rectangle.NO_BORDER);
				SimpleCell row1 = new SimpleCell(SimpleCell.ROW);
				SimpleCell cellforname1 = new SimpleCell(SimpleCell.CELL);
				SimpleCell cellforname2 = new SimpleCell(SimpleCell.CELL);

				cellforname1 = new SimpleCell(SimpleCell.CELL);
				cellforname2 = new SimpleCell(SimpleCell.CELL);

				Paragraph Subject12 = new Paragraph();
				Subject12.add(new Paragraph("Tax Invoice : "+SIRefNumber+" ",catFont));
				Subject12.setAlignment("Left");


				cellforname1.add(Subject12);

				Paragraph Subject21 = new Paragraph();
				Subject21.add(new Paragraph("Date : "+todaysDate+" ",catFont));
				Subject21.setAlignment("Right");

				cellforname2.add(Subject21);
				
				

				cellforname1.setWidth(30f);
				cellforname1.setWidthpercentage(50f);
				cellforname1.setHorizontalAlignment(Element.ALIGN_RIGHT);
				row1.add(cellforname1);
				row1.add(cellforname2);
				table3211.addElement(row1);
				document.add(table3211); 

				

			document.add( Chunk.NEWLINE );
			
				String address="",country="",zip="",contactperson="",phone="",State="",AddressCode="",BillingCity="";

				String sqldata="select * from t_custaddrdet where CustomerCode='"+customer+"'";
				ResultSet rsdata=st12.executeQuery(sqldata);
				System.out.println(sqldata);
				if(rsdata.next())
				{
					address=rsdata.getString("BillingAddress");
					country=rsdata.getString("BillingCountry");
					zip=rsdata.getString("BillingZip");
					contactperson=rsdata.getString("ContactPerson");
					phone=rsdata.getString("BillingPhone");
					State=rsdata.getString("BillingState");
					AddressCode=rsdata.getString("AddressCode");
					BillingCity=rsdata.getString("BillingCity");
				}
				else
				{
				}

				PdfPTable tableFirst = new PdfPTable(2);

				tableFirst.setWidthPercentage(100);
				tableFirst.getDefaultCell().setBorder(Rectangle.BOX);
				tableFirst.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
				tableFirst.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);


				PdfPCell firstcell = new PdfPCell();
				firstcell.setFixedHeight(90f);
				firstcell.addElement(new Paragraph(""+custname+" " ,smallfont2));
				firstcell.addElement(new Paragraph(""+address+" " ,NormalFont));
				firstcell.addElement(new Paragraph(""+country+"",NormalFont));
				firstcell.addElement(new Paragraph(""+zip+"",NormalFont));
				firstcell.addElement(new Paragraph(""+phone+"  "+contactperson+"",NormalFont));
				tableFirst.addCell(firstcell);

				PdfPCell firstcell1 = new PdfPCell();
				firstcell1.setFixedHeight(90f);
				firstcell1.addElement(new Paragraph(""+custname+"",smallfont2 ));
				firstcell1.addElement(new Paragraph(""+address+"",NormalFont ));
				firstcell1.addElement(new Paragraph(""+country+"" ,NormalFont));
				firstcell1.addElement(new Paragraph(""+zip+"",NormalFont ));
				firstcell1.addElement(new Paragraph(""+phone+"  "+contactperson+"" ,NormalFont));
				tableFirst.addCell(firstcell1);
				document.add(tableFirst);
				document.add( Chunk.NEWLINE );

				/*   ************************************* LOGIC TO CALCULATE INVOICE BALANACE  ********************************************** */

				
				
				double grandtotalnew=Integer.parseInt(vehiclenos) * flratepervehicle;
				double BillAmtnew1 =  0;
				BillAmtnew1 =Integer.parseInt(vehiclenos)*flratepervehicle;
				
				if(jrmcount>0)
				{
					BillAmtnew1 = BillAmtnew1 + (jrmcount * 100);
					grandtotalnew=grandtotalnew+ (jrmcount * 100);
					
				}

				
				String Sqldata11 ="";
				double CapTot1 = 0, OffTot1 = 0,ToTDays1 = 0;
				double diff1=0,Rate11=0;
				if(billtype=="Combined" || billtype.equals("Combined"))
				{
					Sqldata11 = "Select t_billingdetails"+year+"_"+month+".VehRegno,instdate,t_billingdetails"+year+"_"+month+".Transporter,TotalYes as CapturedDays ,TotalYesStar,TotalYes+TotalYesStar,TotalNo,TotalDays from t_billingdetails"+year+"_"+month+"  ,t_fv_erp_relation"+year+"_"+month+"  where t_billingdetails"+year+"_"+month+".vehid=t_fv_erp_relation"+year+"_"+month+".vehid and t_fv_erp_relation"+year+"_"+month+".ERPCode='"+customer+"'  and GroupName='"+groupname+"' and t_billingdetails"+year+"_"+month+".BillTransporter='Yes' and t_fv_erp_relation"+year+"_"+month+".BillTransporter='Yes' and month1='"+year+"-"+month+"-01'";
				}
				else 
				{
					Sqldata11="Select t_billingdetails"+year+"_"+month+" .VehRegno,instdate,t_billingdetails"+year+"_"+month+".Transporter,TotalYes as CapturedDays ,TotalYesStar,TotalYes+TotalYesStar,TotalNo,TotalDays,jrm from t_billingdetails"+year+"_"+month+" ,t_fv_erp_relation"+year+"_"+month+" where t_billingdetails"+year+"_"+month+".vehid=t_fv_erp_relation"+year+"_"+month+".vehid and t_fv_erp_relation"+year+"_"+month+".ERPCode='"+customer+"'  and GroupName='"+groupname+"' and  t_billingdetails"+year+"_"+month+".BillTransporter='Yes'  and t_fv_erp_relation"+year+"_"+month+" .BillTransporter='Yes' and TotalYes+TotalYesStar >=(TotalDays/100)*("+salcount+") and month1='"+year+"-"+month+"-01'"; 
				}	

				ResultSet rsSql11=st1.executeQuery(Sqldata11);
				System.out.println(Sqldata11);	
				while(rsSql11.next())
				{
					CapTot1 = CapTot1 + rsSql11.getDouble("CapturedDays");
					OffTot1 = OffTot1 + rsSql11.getDouble("TotalYesStar");
					ToTDays1 = ToTDays1 + rsSql11.getDouble("totalDays");
				}

				System.out.println(CapTot1 +"  "+OffTot1+"====>  "+ToTDays1);
				System.out.println("value  "+(billdays)*(Integer.parseInt(vehiclenos)));
				if((ToTDays1!=(billdays)*(Integer.parseInt(vehiclenos))) && billdays!=0 )
				{
					System.out.println("IN IFF ");
					diff1=(billdays*Integer.parseInt(vehiclenos)) - ToTDays1;
			//		System.out.println(" EXCEPTIotototototottoootototo "+flratepervehicle+"boooooooo"+billdays);
					Rate11 = flratepervehicle / billdays;
					System.out.println(diff1+" diff and rate "+Rate11);
					
				//	System.out.println("AFTERRRRRRRRR EXCEPTIotototototottoootototo ");
				}
				
			//	System.out.println("AFTERRRRRRRRR EXCEPTIotototototottoootototo  without IF LOOP*&*&*&*&*&*&*");

				
				if(billtype=="Combined" || billtype.equals("Combined"))
				{
					BillAmtnew1 = BillAmtnew1 - (diff1*Rate11);
					grandtotalnew=grandtotalnew+(diff1*Rate11);
					System.out.println("bill at adjustment  "+BillAmtnew1);

				}
				
				System.out.println("VALUE OF ======>salcount#$#$#$#$#$#$#$$##$#"+salcount);

				double shortfalldays1=0;
				if(salcount != 0)
				{

					if (CapTot1 + OffTot1 >= ToTDays1 * salcount / 100)
					{
						shortfalldays1 = 0;
					}
					else
					{
						shortfalldays1 = (ToTDays1 * salcount / 100) - (CapTot1 + OffTot1);
					}

					if((shortfalldays1 > 0) && billdays!=0)
					{

						Rate11 = Integer.parseInt(vehiclenos)/billdays;
					}

					BillAmtnew1 = BillAmtnew1 - (shortfalldays1 * Rate11);
					grandtotalnew=grandtotalnew+(shortfalldays1*Rate11);
					System.out.println("Bill amount at volun SLA  "+BillAmtnew1);
			//		String insert3="Insert Into t_salesinv_items (InvoiceNo,TheGroup,Make,ItemCode,Quantity,SellingPrice,DiscountPercent,SONo,TheTableToBeAccessed,TheOptionNo,InsertOR,ItemSRNo,STPercent,ItemDescription,TaxType) values ('')";
					//st2.executeUpdate(insert3);
				}

			//	System.out.println("@#$@#@$@$#@$@#$@$@$AFTER SLA COUNT CALC@#$@#$$@#$@#@$@#$@$@$@$@$");
				String sqltax1="select * from t_fv_erp_relation"+year+"_"+month+" where GroupName='"+groupname+"'";
				ResultSet rstax1=st3.executeQuery(sqltax1);
				System.out.println(sqltax1);
				rstax1.next();
				int servicetax1=rstax1.getInt("ST");
				int servicecharge1=rstax1.getInt("SC");

				double InvAmtnew1 = BillAmtnew1;
				System.out.println("INVOICE AMOUNT AT START  "+InvAmtnew1);
				if(servicetax1 > 0)

				{


					InvAmtnew1 = InvAmtnew1 + (BillAmtnew1 * 12 / 100);

					grandtotalnew=grandtotalnew+ BillAmtnew1*12/100;


					InvAmtnew1 = InvAmtnew1+ ((BillAmtnew1 * 12 / 100) * 2 / 100);
					grandtotalnew=grandtotalnew+((BillAmtnew1*12)/100 * 0.2);
				


					InvAmtnew1 = InvAmtnew1 + ((BillAmtnew1 * 12 / 100) * 1 / 100);
					grandtotalnew=grandtotalnew+((BillAmtnew1*12)/100 * 0.1);

				

				}



				if(servicecharge1 > 0)
				{


					InvAmtnew1 = InvAmtnew1 + BillAmtnew1 * 12.36 / 100;
					grandtotalnew=grandtotalnew+(BillAmtnew1 * 12.36 / 100);



				}

				/* ********************************************* END LOGIC TO CALCULATE INVOICE BALANACE  ************************************************* */

				PdfContentByte canvas1 = writer.getDirectContent();
				Rectangle rect1 = new Rectangle(10, 10, 583, 830);
				rect1.setBorder(Rectangle.BOX);
				rect1.setBorderWidth(1);
				canvas1.rectangle(rect1);

				PdfPTable tableNew = new PdfPTable(6);
				tableNew.setWidthPercentage(100);
				PdfPCell cNew = new PdfPCell(new Phrase("Opening Balance",headerFont));
				cNew.setHorizontalAlignment(Element.ALIGN_CENTER);
				tableNew.addCell(cNew);

				cNew = new PdfPCell(new Phrase("Credits",headerFont));
				cNew.setHorizontalAlignment(Element.ALIGN_CENTER);
				tableNew.addCell(cNew);

				cNew = new PdfPCell(new Phrase("Charges",headerFont));
				cNew.setHorizontalAlignment(Element.ALIGN_CENTER);
				tableNew.addCell(cNew);

				cNew = new PdfPCell(new Phrase("This Invoice",headerFont));
				cNew.setHorizontalAlignment(Element.ALIGN_CENTER);
				tableNew.addCell(cNew);

				cNew = new PdfPCell(new Phrase("Amount Due",headerFont));
				cNew.setHorizontalAlignment(Element.ALIGN_CENTER);
				tableNew.addCell(cNew);

				cNew = new PdfPCell(new Phrase("Due Date",headerFont));
				cNew.setHorizontalAlignment(Element.ALIGN_CENTER);
				tableNew.addCell(cNew);

				cNew = new PdfPCell(new Phrase(""+nf.format( balance)+"",NormalFont));
				cNew.setHorizontalAlignment(Element.ALIGN_RIGHT);
				tableNew.addCell(cNew);

				cNew = new PdfPCell(new Phrase("0.00",NormalFont));
				cNew.setHorizontalAlignment(Element.ALIGN_RIGHT);
				tableNew.addCell(cNew);

				cNew = new PdfPCell(new Phrase("0.00",NormalFont));
				cNew.setHorizontalAlignment(Element.ALIGN_RIGHT);
				tableNew.addCell(cNew);

				cNew = new PdfPCell(new Phrase(""+nf.format(grandtotalnew)+"",NormalFont));
				cNew.setHorizontalAlignment(Element.ALIGN_RIGHT);
				tableNew.addCell(cNew);

				cNew = new PdfPCell(new Phrase(""+nf.format((balance+grandtotalnew))+"",NormalFont));
				cNew.setHorizontalAlignment(Element.ALIGN_RIGHT);
				tableNew.addCell(cNew);

				cNew = new PdfPCell(new Phrase(""+tendaysInMMM+"",NormalFont));
				cNew.setHorizontalAlignment(Element.ALIGN_LEFT);
				tableNew.addCell(cNew);

				document.add(tableNew);
				document.add( Chunk.NEWLINE );

				Paragraph title = new Paragraph();
				title.add(new Paragraph("Last 3 Transactions",catFont));
				title.setAlignment("LEFT");
				document.add(title);

				PdfPTable table = new PdfPTable(6);
				table.setWidthPercentage(100);
				PdfPCell c1 = new PdfPCell(new Phrase("Tr.Date",headerFont));
				c1.setHorizontalAlignment(Element.ALIGN_CENTER);
				table.addCell(c1);

				c1 = new PdfPCell(new Phrase("Tr.Details",headerFont));
				c1.setHorizontalAlignment(Element.ALIGN_CENTER);
				table.addCell(c1);

				c1 = new PdfPCell(new Phrase("Tr.Type",headerFont));
				c1.setHorizontalAlignment(Element.ALIGN_CENTER);
				table.addCell(c1);

				c1 = new PdfPCell(new Phrase("Cr.",headerFont));
				c1.setHorizontalAlignment(Element.ALIGN_CENTER);
				table.addCell(c1);


				c1 = new PdfPCell(new Phrase("Db.",headerFont));
				c1.setHorizontalAlignment(Element.ALIGN_CENTER);
				table.addCell(c1);

				c1 = new PdfPCell(new Phrase("Balance",headerFont));
				c1.setHorizontalAlignment(Element.ALIGN_CENTER);
				table.addCell(c1);


				String sql1 = "SELECT TransactionDate,TransactionDetail,TransactionType,CreditAmount,DebitAmount,Balance FROM  t_customerledgeraccount where CustomerCode='"
					+ customer
					+ "' ORDER BY  concat(TransactionDate , TransactionId ) Desc limit 3";
				ResultSet rs1=st13.executeQuery(sql1);
				while(rs1.next())
				{
					c1 = new PdfPCell(new Phrase(""+  new SimpleDateFormat("dd-MMM-yyyy")
					.format(new SimpleDateFormat(
					"yyyy-MM-dd").parse(rs1
							.getString(1))) +"",NormalFont));
					c1.setHorizontalAlignment(Element.ALIGN_LEFT);
					table.addCell(c1);


					c1 = new PdfPCell(new Phrase(""+ rs1.getString(2) +"",NormalFont));
					c1.setHorizontalAlignment(Element.ALIGN_LEFT);
					table.addCell(c1);

					c1 = new PdfPCell(new Phrase(""+ rs1.getString(3) +"",NormalFont));
					c1.setHorizontalAlignment(Element.ALIGN_LEFT);
					table.addCell(c1);

					c1 = new PdfPCell(new Phrase(""+ rs1.getString(4) +"",NormalFont));
					c1.setHorizontalAlignment(Element.ALIGN_RIGHT);
					table.addCell(c1);

					c1 = new PdfPCell(new Phrase(""+ rs1.getString(5) +"",NormalFont));
					c1.setHorizontalAlignment(Element.ALIGN_RIGHT);
					table.addCell(c1);


					c1 = new PdfPCell(new Phrase(""+ rs1.getString(6) +"",NormalFont));
					c1.setHorizontalAlignment(Element.ALIGN_RIGHT);
					table.addCell(c1);


				}

				document.add(table);

				document.add( Chunk.NEWLINE );
				int count=0;
				double grandtotal=0;

				float[] widths1 = {0.05f, 0.40f, 0.15f, 0.15f,0.15f};
				PdfPTable table3 = new PdfPTable(widths1);
				table3.setWidthPercentage(100);
				PdfPCell c3= new PdfPCell(new Phrase("Sr No",headerFont));
				c3.setHorizontalAlignment(Element.ALIGN_CENTER);
				table3.addCell(c3);

				c3 = new PdfPCell(new Phrase("Description",headerFont));
				c3.setHorizontalAlignment(Element.ALIGN_CENTER);
				table3.addCell(c3);

				c3 = new PdfPCell(new Phrase("Quantity",headerFont));
				c3.setHorizontalAlignment(Element.ALIGN_CENTER);
				table3.addCell(c3);
				c3 = new PdfPCell(new Phrase("Rate",headerFont));
				c3.setHorizontalAlignment(Element.ALIGN_CENTER);
				table3.addCell(c3);
				c3 = new PdfPCell(new Phrase("Amount",headerFont));
				c3.setHorizontalAlignment(Element.ALIGN_CENTER);
				table3.addCell(c3);

				/*String sqlcheck="Select * from t_billingcrossschecking where month1='"+year+"-"+month+"-01' and BillGroup='"+groupname+"'";
				ResultSet rsSqlchk=st3.executeQuery(sqlcheck);*/

				c3 = new PdfPCell(new Phrase(""+ ++count +"",NormalFont));
				c3.setHorizontalAlignment(Element.ALIGN_RIGHT);
				table3.addCell(c3);

				c3 = new PdfPCell(new Phrase("Monthly Billing Charges",NormalFont));
				c3.setHorizontalAlignment(Element.ALIGN_LEFT);
				table3.addCell(c3);


				c3 = new PdfPCell(new Phrase(""+vehiclenos+"",NormalFont));
				c3.setHorizontalAlignment(Element.ALIGN_RIGHT);
				table3.addCell(c3);

				c3 = new PdfPCell(new Phrase(""+flratepervehicle+"",NormalFont));
				c3.setHorizontalAlignment(Element.ALIGN_RIGHT);
				table3.addCell(c3);

				c3 = new PdfPCell(new Phrase(""+(Integer.parseInt(vehiclenos) * flratepervehicle)  +"",NormalFont));
				c3.setHorizontalAlignment(Element.ALIGN_RIGHT);
				table3.addCell(c3);


				grandtotal=(Integer.parseInt(vehiclenos) * flratepervehicle);

				String sqlInsert1="Insert Into t_salesinv_items (InvoiceNo,TheGroup,Make,ItemCode,Quantity,SellingPrice,TheTableToBeAccessed,ItemSRNo,STPercent,ItemDescription) values ('"+SINumber+"','3','26','24','"+vehiclenos+"','"+flratepervehicle+"','tbl_digitim_make26','"+count+"','0.0','Monthly Billing Charges')";
			    st1.executeUpdate(sqlInsert1);
				
				System.out.println("sqlInsert1=====>"+sqlInsert1);

				//count ++;
				double BillAmtnew =  0;
				BillAmtnew =Integer.parseInt(vehiclenos)*flratepervehicle;
				System.out.println("BILL AMONUT 111  "+BillAmtnew);


				if(jrmcount>0)
				{

					c3 = new PdfPCell(new Phrase(""+ ++count +"",NormalFont));
					c3.setHorizontalAlignment(Element.ALIGN_RIGHT);
					table3.addCell(c3);

					c3 = new PdfPCell(new Phrase("JRM - Monthly Road Risk Data Flat Charges",NormalFont));
					c3.setHorizontalAlignment(Element.ALIGN_LEFT);
					table3.addCell(c3);

					c3 = new PdfPCell(new Phrase(""+jrmcount+"",NormalFont));
					c3.setHorizontalAlignment(Element.ALIGN_RIGHT);
					table3.addCell(c3);

					c3 = new PdfPCell(new Phrase(""+jrmcount+"",NormalFont));
					c3.setHorizontalAlignment(Element.ALIGN_RIGHT);
					table3.addCell(c3);

					c3 = new PdfPCell(new Phrase(""+(jrmcount * 100)  +"",NormalFont));
					c3.setHorizontalAlignment(Element.ALIGN_RIGHT);
					table3.addCell(c3);

					BillAmtnew = BillAmtnew + (jrmcount * 100);
					grandtotal=grandtotal+ (jrmcount * 100);
					System.out.println("BIll amount at jrm  "+BillAmtnew);
					String sqlInsert2="Insert into t_salesinv_items (InvoiceNo,TheGroup,Make,ItemCode,Quantity,SellingPrice,TheTableToBeAccessed,ItemSRNo,STPercent,ItemDescription) values ('"+SINumber+"','3','26','2319','"+jrmcount+"','100','tbl_digitim_make26','"+count+"','0.0','JRM - Monthly Road Risk Data Flat Charges')";
			    	st2.executeUpdate(sqlInsert2);
					System.out.println("sqlInsert2======>"+sqlInsert2);

				}

				String Sqldata1 ="";
				double CapTot = 0, OffTot = 0,ToTDays = 0;
				double diff=0,Rate1=0;
				if(billtype=="Combined" || billtype.equals("Combined"))
				{
					Sqldata1 = "Select t_billingdetails"+year+"_"+month+".VehRegno,instdate,t_billingdetails"+year+"_"+month+".Transporter,TotalYes as CapturedDays ,TotalYesStar,TotalYes+TotalYesStar,TotalNo,TotalDays from t_billingdetails"+year+"_"+month+"  ,t_fv_erp_relation"+year+"_"+month+"  where t_billingdetails"+year+"_"+month+".vehid=t_fv_erp_relation"+year+"_"+month+".vehid and t_fv_erp_relation"+year+"_"+month+".ERPCode='"+customer+"'  and GroupName='"+groupname+"' and t_billingdetails"+year+"_"+month+".BillTransporter='Yes' and t_fv_erp_relation"+year+"_"+month+".BillTransporter='Yes' and month1='"+year+"-"+month+"-01'";
				}
				else 
				{
					Sqldata1="Select t_billingdetails"+year+"_"+month+" .VehRegno,instdate,t_billingdetails"+year+"_"+month+".Transporter,TotalYes as CapturedDays ,TotalYesStar,TotalYes+TotalYesStar,TotalNo,TotalDays,jrm from t_billingdetails"+year+"_"+month+" ,t_fv_erp_relation"+year+"_"+month+" where t_billingdetails"+year+"_"+month+".vehid=t_fv_erp_relation"+year+"_"+month+".vehid and t_fv_erp_relation"+year+"_"+month+".ERPCode='"+customer+"'  and GroupName='"+groupname+"' and  t_billingdetails"+year+"_"+month+".BillTransporter='Yes'  and t_fv_erp_relation"+year+"_"+month+" .BillTransporter='Yes' and TotalYes+TotalYesStar >=(TotalDays/100)*("+salcount+") and month1='"+year+"-"+month+"-01'"; 
				}	

				ResultSet rsSql1=st1.executeQuery(Sqldata1);
				System.out.println(Sqldata1);	
				while(rsSql1.next())
				{
					CapTot = CapTot + rsSql1.getDouble("CapturedDays");
					OffTot = OffTot + rsSql1.getDouble("TotalYesStar");
					ToTDays = ToTDays + rsSql1.getDouble("totalDays");
				}

				System.out.println(CapTot +"  "+OffTot+"  "+ToTDays);
				System.out.println("value  "+(billdays)*(Integer.parseInt(vehiclenos)));
				if((ToTDays!=(billdays)*(Integer.parseInt(vehiclenos))) && billdays !=0)
				{
					System.out.println("IN IFF ");
					diff=(billdays*Integer.parseInt(vehiclenos)) - ToTDays;
					Rate1 = flratepervehicle / billdays;
					System.out.println(diff+" diff and rate "+Rate1);
				}
/*
				if(billtype=="Combined" || billtype.equals("Combined"))
				{


					c3 = new PdfPCell(new Phrase(""+ count++ +"",NormalFont));
					c3.setHorizontalAlignment(Element.ALIGN_RIGHT);
					table3.addCell(c3);

					c3 = new PdfPCell(new Phrase("Adjustment in Bill Days",NormalFont));
					c3.setHorizontalAlignment(Element.ALIGN_LEFT);
					table3.addCell(c3);

					c3 = new PdfPCell(new Phrase("",NormalFont));
					c3.setHorizontalAlignment(Element.ALIGN_LEFT);
					table3.addCell(c3);

					c3 = new PdfPCell(new Phrase("",NormalFont));
					c3.setHorizontalAlignment(Element.ALIGN_LEFT);
					table3.addCell(c3);

					c3 = new PdfPCell(new Phrase(""+nf.format((diff*Rate1))+"",NormalFont));
					c3.setHorizontalAlignment(Element.ALIGN_RIGHT);
					table3.addCell(c3);



					BillAmtnew = BillAmtnew - (diff*Rate1);
					grandtotal=grandtotal+(diff*Rate1);
					System.out.println("bill at adjustment  "+BillAmtnew);
					String insert2="Insert into t_salesinv_items() value()";
					//st.executeUpdate(insert2);
				}

		*/		
				
				

				
				
				
				double shortfalldays=0;
				if(salcount != 0)
				{


					if (CapTot + OffTot >= ToTDays * salcount / 100)
					{
						shortfalldays = 0;
					}
					else
					{
						shortfalldays = (ToTDays * salcount / 100) - (CapTot + OffTot);
					}

					if((shortfalldays > 0) && billdays!=0)
					{

						Rate1 = Integer.parseInt(vehiclenos)/billdays;
					}

					
					double shortfallCalcdays=0.0;
					
					if( CapTot + OffTot >= ToTDays * salcount / 100)
						shortfallCalcdays = 0;
					else
						shortfallCalcdays = (ToTDays * salcount / 100) - (CapTot + OffTot);
					
					
					
					double short_fallslaNEW=flratepervehicle/daysinmonth*shortfallCalcdays;
					
					System.out.println("VAL_____________==============>>>>"+shortfallCalcdays);
					
					if(shortfallCalcdays !=0)
					{
					
					c3 = new PdfPCell(new Phrase(""+ ++count +"",NormalFont));
					c3.setHorizontalAlignment(Element.ALIGN_RIGHT);
					table3.addCell(c3);

					c3 = new PdfPCell(new Phrase("Voluntary SLA Adjustment",NormalFont));
					c3.setHorizontalAlignment(Element.ALIGN_LEFT);
					table3.addCell(c3);

					
					
					c3 = new PdfPCell(new Phrase(""+shortfallCalcdays+"",NormalFont));
					c3.setHorizontalAlignment(Element.ALIGN_LEFT);
					table3.addCell(c3);
					c3 = new PdfPCell(new Phrase(""+nf.format(flratepervehicle/daysinmonth)+"",NormalFont));
					c3.setHorizontalAlignment(Element.ALIGN_LEFT);
					table3.addCell(c3);
					double ratefll=flratepervehicle/daysinmonth;
					//String ratefllnew=  ratefll;
					
					c3 = new PdfPCell(new Phrase(""+nf.format((short_fallslaNEW))+"",NormalFont));
					c3.setHorizontalAlignment(Element.ALIGN_RIGHT);
					table3.addCell(c3);

					BillAmtnew = BillAmtnew - (short_fallslaNEW);
					grandtotal=grandtotal-(short_fallslaNEW);
					System.out.println("Bill amount at volun SLA  "+BillAmtnew);
					String sqlInsert3="Insert into t_salesinv_items (InvoiceNo,TheGroup,Make,ItemCode,Quantity,SellingPrice,TheTableToBeAccessed,ItemSRNo,STPercent,ItemDescription) values ('"+SINumber+"','3','26','2247','"+shortfallCalcdays+"','"+ratefll+"','tbl_digitim_make26','"+count+"','0.0','Voluntary SLA Adjustment')";
					st3.executeUpdate(sqlInsert3);
					System.out.println("sqlInsert3======>"+sqlInsert3);
					}
					
				}
				
				
				System.out.println("grandtotal AFTER SHORT FALL IN SLAAAA==>"+grandtotal);
				
				

				String sqltax="select * from t_fv_erp_relation"+year+"_"+month+" where GroupName='"+groupname+"'";
				ResultSet rstax=st3.executeQuery(sqltax);
				System.out.println(sqltax);
				rstax.next();
				int servicetax=rstax.getInt("ST");
				int servicecharge=rstax.getInt("SC");

				double InvAmtnew = BillAmtnew;
				System.out.println("INVOICE AMOUNT AT START  "+InvAmtnew);
				if(servicetax > 0)
				{

					c3 = new PdfPCell(new Phrase(""+ ++count +"",NormalFont));
					c3.setHorizontalAlignment(Element.ALIGN_RIGHT);
					table3.addCell(c3);

					c3 = new PdfPCell(new Phrase("Basic ST 12%",NormalFont));
					c3.setHorizontalAlignment(Element.ALIGN_LEFT);
					table3.addCell(c3);

					c3 = new PdfPCell(new Phrase("",NormalFont));
					c3.setHorizontalAlignment(Element.ALIGN_RIGHT);
					table3.addCell(c3);

					c3 = new PdfPCell(new Phrase("",NormalFont));
					c3.setHorizontalAlignment(Element.ALIGN_RIGHT);
					table3.addCell(c3);

					c3 = new PdfPCell(new Phrase(""+nf.format((BillAmtnew*12)/100)+"",NormalFont));
					c3.setHorizontalAlignment(Element.ALIGN_RIGHT);
					table3.addCell(c3);

					double stval=(BillAmtnew*12)/100;

					InvAmtnew = InvAmtnew + (BillAmtnew * 12 / 100);

					grandtotal=grandtotal+ stval;
					String sqlInsert4="Insert into t_salesinv_items (InvoiceNo,TheGroup,Make,ItemCode,Quantity,SellingPrice,TheTableToBeAccessed,ItemSRNo,STPercent,ItemDescription) values ('"+SINumber+"','3','26','2289','1','"+nf.format((BillAmtnew*12)/100)+"','tbl_digitim_make26','"+count+"','0.0','Basic ST 12%')";
					st4.executeUpdate(sqlInsert4);
					System.out.println("sqlInsert4======>"+sqlInsert4);


					c3 = new PdfPCell(new Phrase(""+ ++count +"",NormalFont));
					c3.setHorizontalAlignment(Element.ALIGN_RIGHT);
					table3.addCell(c3);

					c3 = new PdfPCell(new Phrase("Edu.Cess 2% on Basic ST",NormalFont));
					c3.setHorizontalAlignment(Element.ALIGN_LEFT);
					table3.addCell(c3);

					c3 = new PdfPCell(new Phrase("",NormalFont));
					c3.setHorizontalAlignment(Element.ALIGN_RIGHT);
					table3.addCell(c3);

					c3 = new PdfPCell(new Phrase("",NormalFont));
					c3.setHorizontalAlignment(Element.ALIGN_RIGHT);
					table3.addCell(c3);
					
					double eduCess=(stval*2)/100;

					c3 = new PdfPCell(new Phrase(""+nf.format(eduCess)+"",NormalFont));
					c3.setHorizontalAlignment(Element.ALIGN_RIGHT);
					table3.addCell(c3);



					InvAmtnew = InvAmtnew + ((BillAmtnew * 12 / 100) * 2 / 100);
					//grandtotal=grandtotal+((BillAmtnew*12)/100 * 0.2);
					
					grandtotal=grandtotal+eduCess;
					String sqlInsert5="Insert into t_salesinv_items (InvoiceNo,TheGroup,Make,ItemCode,Quantity,SellingPrice,TheTableToBeAccessed,ItemSRNo,STPercent,ItemDescription) values ('"+SINumber+"','3','26','2249','1','"+nf.format(eduCess)+"','tbl_digitim_make26','"+count+"','0.0','Edu.Cess 2% on Basic ST')";
					st5.executeUpdate(sqlInsert5);
					System.out.println("sqlInsert5======>"+sqlInsert5);


					c3 = new PdfPCell(new Phrase(""+ ++count +"",NormalFont));
					c3.setHorizontalAlignment(Element.ALIGN_RIGHT);
					table3.addCell(c3);

					c3 = new PdfPCell(new Phrase("High Edu. Cess 1% on Basic ST",NormalFont));
					c3.setHorizontalAlignment(Element.ALIGN_LEFT);
					table3.addCell(c3);

					c3 = new PdfPCell(new Phrase("",NormalFont));
					c3.setHorizontalAlignment(Element.ALIGN_RIGHT);
					table3.addCell(c3);

					c3 = new PdfPCell(new Phrase("",NormalFont));
					c3.setHorizontalAlignment(Element.ALIGN_RIGHT);
					table3.addCell(c3);

					double HighEduCess=(stval*1)/100;
					c3 = new PdfPCell(new Phrase(""+nf.format((HighEduCess))+"",NormalFont));
					c3.setHorizontalAlignment(Element.ALIGN_RIGHT);
					table3.addCell(c3);



					InvAmtnew = InvAmtnew + ((BillAmtnew * 12 / 100) * 1 / 100);
					//grandtotal=grandtotal+((BillAmtnew*12)/100 * 0.1);
					grandtotal=grandtotal+HighEduCess;

					String sqlInsert6="Insert into t_salesinv_items (InvoiceNo,TheGroup,Make,ItemCode,Quantity,SellingPrice,TheTableToBeAccessed,ItemSRNo,STPercent,ItemDescription) values ('"+SINumber+"','3','26','2250','1','"+nf.format((HighEduCess))+"','tbl_digitim_make26','"+count+"','0.0','High Edu. Cess 1% on Basic ST')";
			     	st6.executeUpdate(sqlInsert6);
					System.out.println("sqlInsert6======>"+sqlInsert6);

				}



				if(servicecharge > 0)
				{

					c3 = new PdfPCell(new Phrase(""+ ++count +"",NormalFont));
					c3.setHorizontalAlignment(Element.ALIGN_RIGHT);
					table3.addCell(c3);

					c3 = new PdfPCell(new Phrase("Service Charge 12.36%",NormalFont));
					c3.setHorizontalAlignment(Element.ALIGN_LEFT);
					table3.addCell(c3);

					c3 = new PdfPCell(new Phrase("",NormalFont));
					c3.setHorizontalAlignment(Element.ALIGN_RIGHT);
					table3.addCell(c3);

					c3 = new PdfPCell(new Phrase("",NormalFont));
					c3.setHorizontalAlignment(Element.ALIGN_RIGHT);
					table3.addCell(c3);

					c3 = new PdfPCell(new Phrase(""+nf.format( BillAmtnew * 12.36 / 100)+"",NormalFont));
					c3.setHorizontalAlignment(Element.ALIGN_RIGHT);
					table3.addCell(c3);


					InvAmtnew = InvAmtnew + BillAmtnew * 12.36 / 100;
				  grandtotal=grandtotal+(grandtotal * 12.36 / 100);
				  String sqlInsert7="Insert into t_salesinv_items (InvoiceNo,TheGroup,Make,ItemCode,Quantity,SellingPrice,TheTableToBeAccessed,ItemSRNo,STPercent,ItemDescription) values ('"+SINumber+"','3','26','2290','1','"+nf.format( BillAmtnew * 12.36 / 100)+"','tbl_digitim_make26','"+count+"','0.0','Service Charge 12.36%')";
					
					System.out.println("sqlInsert7======>"+sqlInsert7);
					
			    	st7.executeUpdate(sqlInsert7);


				}

				document.add(table3);
				
				grandtotal =	Math.round(grandtotal);
				
				System.out.println("FINAL grandtotal=================%$%$%$%$%$%$%&&&&&&grandtotal"+grandtotal);

				Paragraph totalvalue=new Paragraph();
				totalvalue.add(new Paragraph("Grand Total : "+nf.format(grandtotal)+"",smallfont2));
				totalvalue.setAlignment("Right");
				document.add(totalvalue);

				
				
				invcamount=grandtotal;
				
				 String sqlInsert8="Insert into t_salesinv_items (InvoiceNo,TheGroup,Make,ItemCode,Quantity,SellingPrice,TheTableToBeAccessed,ItemSRNo,STPercent) values ('"+SINumber+"','3','26','24','1','"+invcamount+"','tbl_digitim_make26','1','10.0')";
				 
				System.out.println("sqlInsert8======>"+sqlInsert8);
				
				st8.executeUpdate(sqlInsert8);
				
				
				
				
				
				
				float invamt=(float) invcamount;
				
				int rsAmt=(int) invamt;
				
				String Amt_Rs=PdfGeneration.convertNumberToWords(rsAmt);
				
				Amt_Rs+=" Only";
				
				System.out.println("FINAL grandtotal=================%$%$%$%$%$%$%&&&&&&RUPEES VALUE==================>"+Amt_Rs);
				

				Paragraph totalvalueInRs=new Paragraph();
				totalvalueInRs.add(new Paragraph("Grand Total(In word) : "+Amt_Rs+"",smallfont2));
				totalvalueInRs.setAlignment("Right");
				document.add(totalvalueInRs);


				Paragraph terms=new Paragraph();
				terms.add(new Paragraph("Terms & Conditions :-",smallfont2));
				terms.setAlignment("Left");
				document.add(terms);
				
				String trmAndCondition="";

				if(servicetax!=0)
				{
					Paragraph terms1=new Paragraph();
					terms1.add(new Paragraph("1. Service Tax 12.36 %.",smallfont));
					terms1.add(new Paragraph("2. Payment - 100 % within 10 days from the Invoice date." ,smallfont));
					terms1.add(new Paragraph("3. Monthly Rental Charges for the Period 01-"+month+"-"+year+" To 31-"+month+"-"+year+" " ,smallfont));
					terms1.add(new Paragraph("4. Usage charges will be billed seperately if any." ,smallfont));
					terms1.add(new Paragraph("5. Applicable Taxes Included." ,smallfont));
					terms1.setAlignment("Left");
					document.add(terms1);
					
					trmAndCondition="1. Service Tax 12.36 %.\n 2. Payment - 100 % within 10 days from the Invoice date. \n3. Monthly Rental Charges for the Period 01-"+month+"-"+year+" To 31-"+month+"-"+year+" \n 4. Usage charges will be billed seperately if any. \n 5. Applicable Taxes Included.";

				}
				else  if(servicecharge != 0)
				{
					Paragraph terms2=new Paragraph();
					terms2.add(new Paragraph("1. Service Charge 12.36 %.",smallfont));
					terms2.add(new Paragraph("2. Payment - 100 % within 10 days from the Invoice date." ,smallfont));
					terms2.add(new Paragraph("3. Monthly Rental Charges for the Period 01-"+month+"-"+year+" To 31-"+month+"-"+year+" " ,smallfont));
					terms2.add(new Paragraph("4. Usage charges will be billed seperately if any." ,smallfont));
					terms2.add(new Paragraph("5. Applicable Taxes Included." ,smallfont));
					terms2.setAlignment("Left");
					document.add(terms2);
					
					trmAndCondition="1. Service Charge 12.36 %. \n2. Payment - 100 % within 10 days from the Invoice date.\n 3. Monthly Rental Charges for the Period 01-"+month+"-"+year+" To 31-"+month+"-"+year+" \n4. Usage charges will be billed seperately if any.\n 5. Applicable Taxes Included. ";

				}	
				else 
				{
					Paragraph terms3=new Paragraph();
					terms3.add(new Paragraph("1. Payment - 100 % within 10 days from the Invoice date." ,smallfont));
					terms3.add(new Paragraph("2. Monthly Rental Charges for the Period 01-"+month+"-"+year+" To 31-"+month+"-"+year+" " ,smallfont));
					terms3.add(new Paragraph("3. Usage charges will be billed seperately if any." ,smallfont));
					terms3.add(new Paragraph("4. Applicable Taxes Included." ,smallfont));
					terms3.setAlignment("Left");
					document.add(terms3);
					
					trmAndCondition="1. Payment - 100 % within 10 days from the Invoice date.\n 2. Monthly Rental Charges for the Period 01-"+month+"-"+year+" To 31-"+month+"-"+year+" \n 3. Usage charges will be billed seperately if any. \n 4. Applicable Taxes Included.";

				}





				Paragraph para1=new Paragraph();
				para1.add(new Paragraph("For TRANSWORLD COMPRESSOR TECHNOLOGIES LTD. , ",smallfont2));
				//	para1.add(new Paragraph("",smallfont2));
				para1.setAlignment("Right");
				document.add(para1);

				Paragraph parabottom5=new Paragraph();
				parabottom5.add(new Paragraph("Subject to Pune Jurisdiction ",smallfont2));
				parabottom5.setAlignment("Left");
				document.add(parabottom5);

				Paragraph parabottom6=new Paragraph();
				parabottom6.add(new Paragraph("BST No 412207/S/352/WEF 11/4/2000 CST No 412207/C/241/WEF 5/6/2000",smallfont));
				parabottom6.add(new Paragraph("PAN No AABCT4318G Service Tax no AABCT 4318G ST001 Service Category - Business Auxiliary Services" ,smallfont));
				parabottom6.setAlignment("Left");
				document.add(parabottom6);

				Paragraph parabottom3=new Paragraph();
				parabottom3.add(new Paragraph("We are a Small Enterprise Under the Micro Medium and Small Enterprise Act 2006. Govt. of India",smallfont));
				parabottom3.add(new Paragraph("Queries regarding this Invoice to be addressed to sales@transworld-compressor.com Tel 020 41265555",smallfont));
				parabottom3.setAlignment("Left");
				document.add(parabottom3);

				document.add( Chunk.NEXTPAGE );
				
				PdfContentByte canvas2 = writer.getDirectContent();
				Rectangle rect2 = new Rectangle(10, 10, 583, 830);
				rect2.setBorder(Rectangle.BOX);
				rect2.setBorderWidth(1);
				canvas2.rectangle(rect2);
				
				trmAndCondition+="We are a Small Enterprise Under the Micro Medium and Small Enterprise Act 2006. Govt. of India \n Summary of Bill as per Annexure - I attached for 18 Units.";
				
				
				
				Paragraph para2=new Paragraph();
				para2.add(new Paragraph("Day Wise Bill Report For "+month+"-"+year+" of "+custname+" ",smallfont2));
				para2.setAlignment("Left");
				document.add(para2);

				Paragraph para3=new Paragraph();
				para3.add(new Paragraph("Bill Period 01-"+month+"-"+year+" to "+daysinmonth+"-"+month+"-"+year+" ",smallfont2));
				para3.setAlignment("Left");
				document.add(para3);

				Paragraph annexturetoinvc=new Paragraph();
				annexturetoinvc.add(new Paragraph("Annexture To Invoice "+SIRefNumber+"",smallfont2));
				annexturetoinvc.setAlignment("Left");
				document.add(annexturetoinvc);

				
				float[] widthsveh = {0.03f, 0.10f, 0.10f, 0.05f,0.05f,0.05f,0.03f, 0.10f, 0.10f, 0.05f,0.05f,0.05f};
				PdfPTable tableData = new PdfPTable(widthsveh);
				tableData.setWidthPercentage(100);
				

				PdfPCell celldata= new PdfPCell(new Phrase("Sr No",Fontfortable));
				celldata.setFixedHeight(0.45f);
				celldata.setBorder(Rectangle.NO_BORDER);
				celldata.setHorizontalAlignment(Element.ALIGN_CENTER);
				tableData.addCell(celldata);

				celldata = new PdfPCell(new Phrase("Veh Reg No",Fontfortable));
				celldata.setBorder(Rectangle.NO_BORDER);
				celldata.setHorizontalAlignment(Element.ALIGN_CENTER);
				tableData.addCell(celldata);

				celldata = new PdfPCell(new Phrase("Inst Dt",Fontfortable));
				celldata.setBorder(Rectangle.NO_BORDER);
				celldata.setHorizontalAlignment(Element.ALIGN_CENTER);
				tableData.addCell(celldata);

				celldata = new PdfPCell(new Phrase("Captured",Fontfortable));
				celldata.setBorder(Rectangle.NO_BORDER);
				celldata.setHorizontalAlignment(Element.ALIGN_CENTER);
				tableData.addCell(celldata);

				celldata = new PdfPCell(new Phrase("Ing. Off",Fontfortable));
				celldata.setBorder(Rectangle.NO_BORDER);
				celldata.setHorizontalAlignment(Element.ALIGN_CENTER);
				tableData.addCell(celldata);

				celldata = new PdfPCell(new Phrase("Total",Fontfortable));
				celldata.setBorder(Rectangle.NO_BORDER);
				celldata.setHorizontalAlignment(Element.ALIGN_CENTER);
				tableData.addCell(celldata);
				
				celldata = new PdfPCell(new Phrase("Sr No",Fontfortable));
				celldata.setBorder(Rectangle.NO_BORDER);
				celldata.setHorizontalAlignment(Element.ALIGN_CENTER);
				tableData.addCell(celldata);

				celldata = new PdfPCell(new Phrase("Veh Reg No",Fontfortable));
				celldata.setBorder(Rectangle.NO_BORDER);
				celldata.setHorizontalAlignment(Element.ALIGN_CENTER);
				tableData.addCell(celldata);

				celldata = new PdfPCell(new Phrase("Inst Dt",Fontfortable));
				celldata.setBorder(Rectangle.NO_BORDER);
				celldata.setHorizontalAlignment(Element.ALIGN_CENTER);
				tableData.addCell(celldata);

				celldata = new PdfPCell(new Phrase("Captured",Fontfortable));
				celldata.setBorder(Rectangle.NO_BORDER);
				celldata.setHorizontalAlignment(Element.ALIGN_CENTER);
				tableData.addCell(celldata);

				celldata = new PdfPCell(new Phrase("Ing. Off",Fontfortable));
				celldata.setBorder(Rectangle.NO_BORDER);
				celldata.setHorizontalAlignment(Element.ALIGN_CENTER);
				tableData.addCell(celldata);

				celldata = new PdfPCell(new Phrase(" ",Fontfortable));
				celldata.setBorder(Rectangle.NO_BORDER);
				celldata.setHorizontalAlignment(Element.ALIGN_CENTER);
				tableData.addCell(celldata);
				
				
				

				int srnoforveh=1;
				int totaldays=0;
				String sqlVehdata="Select t_billingdetails"+year+"_"+month+".VehRegno,instdate,t_billingdetails"+year+"_"+month+".Transporter,TotalYes as CapturedDays ,TotalYesStar,TotalYes+TotalYesStar,TotalNo,TotalDays from t_billingdetails"+year+"_"+month+"  ,t_fv_erp_relation"+year+"_"+month+"  where t_billingdetails"+year+"_"+month+".vehid=t_fv_erp_relation"+year+"_"+month+".vehid and t_fv_erp_relation"+year+"_"+month+".ERPCode='"+customer+"'  and GroupName='"+groupname+"' and t_billingdetails"+year+"_"+month+".BillTransporter='Yes' and t_fv_erp_relation"+year+"_"+month+".BillTransporter='Yes' and month1='"+year+"-"+month+"-01'";
				ResultSet rsveh=st14.executeQuery(sqlVehdata);
				System.out.println("=======VEHICLE COUNT QUERY==========>"+sqlVehdata);
				//rsveh.isBeforeFirst();
				while(rsveh.next()){

					int count2=1;
					celldata = new PdfPCell(new Phrase(""+ srnoforveh +"",Fontfortable));
					celldata.setBorder(Rectangle.NO_BORDER);
					celldata.setHorizontalAlignment(Element.ALIGN_CENTER);
					tableData.addCell(celldata);

					celldata = new PdfPCell(new Phrase(""+ rsveh.getString("VehRegno") +"",Fontfortable));
					celldata.setBorder(Rectangle.NO_BORDER);
					celldata.setHorizontalAlignment(Element.ALIGN_CENTER);
					tableData.addCell(celldata);

					celldata = new PdfPCell(new Phrase(""+new Phrase(""+ new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsveh.getString("InstDate")))) +"",Fontfortable));
					celldata.setBorder(Rectangle.NO_BORDER);
					celldata.setHorizontalAlignment(Element.ALIGN_CENTER);
					tableData.addCell(celldata);

					celldata = new PdfPCell(new Phrase(""+ rsveh.getString("CapturedDays")  +"",Fontfortable));
					celldata.setBorder(Rectangle.NO_BORDER);
					celldata.setHorizontalAlignment(Element.ALIGN_CENTER);
					tableData.addCell(celldata);
					
					celldata = new PdfPCell(new Phrase(""+ rsveh.getString("TotalYesStar")  +"",Fontfortable));
					celldata.setBorder(Rectangle.NO_BORDER);
					celldata.setHorizontalAlignment(Element.ALIGN_CENTER);
					tableData.addCell(celldata);

					

					celldata = new PdfPCell(new Phrase(""+ rsveh.getString("TotalDays")  +"",Fontfortable));
					celldata.setBorder(Rectangle.NO_BORDER);
					celldata.setHorizontalAlignment(Element.ALIGN_CENTER);
					tableData.addCell(celldata);	



					srnoforveh ++;
					totaldays=totaldays+Integer.parseInt(rsveh.getString("TotalDays"));

				}

				document.add(tableData);
				document.add( Chunk.NEWLINE);
				Paragraph total=new Paragraph();
				total.add(new Paragraph("Total : "+totaldays+" ",headerFont));
				total.setAlignment("Right");
				document.add(total);


				Paragraph para4=new Paragraph();
				para4.add(new Paragraph("SUMMARY OF BILL   ",headerFont));
				para4.setAlignment("Left");
				document.add(para4);


				Paragraph para5=new Paragraph();
				para5.add(new Paragraph("Amount per vehicle="+nf.format(flratepervehicle)+"   ",headerFont));
				para5.setAlignment("Left");
				document.add(para5);

				Paragraph para6=new Paragraph();
				para6.add(new Paragraph("Days in Bill Period ="+daysinmonth+"   ",headerFont));
				para6.setAlignment("Left");
				document.add(para6);


				Paragraph para7=new Paragraph();
				para7.add(new Paragraph("Amount For 1 Day ="+nf.format(flratepervehicle/daysinmonth)+"   ",headerFont));
				para7.setAlignment("Left");
				document.add(para7);
				
				
				trmAndCondition+="a.Amount per vehicle="+nf.format(flratepervehicle)+"\n Days in Bill Period ="+daysinmonth+" \n Amount For 1 Day ="+nf.format(flratepervehicle/daysinmonth)+" \n";

				/*Paragraph para8=new Paragraph();
				para8.add(new Paragraph("SLA=75%   ",headerFont));
				para8.setAlignment("Left");
				document.add(para8);
				
				*/

				/*        ********************************* start of calculations for SLA  ****************************************   */
				
				double shortfall = 0;
				if(salcount != 0)
				{

					Paragraph para9=new Paragraph();
					para9.add(new Paragraph("SLA="+salcount+"%   ",headerFont));
					para9.setAlignment("Left");
					document.add(para9);

/*
					Paragraph para10=new Paragraph();
					para10.add(new Paragraph("No of Total Days(TD) in "+month+"-"+year+" ="+totaldays+"  ",headerFont));
					para10.setAlignment("Left");
					document.add(para10);
*/

					Paragraph para11=new Paragraph();
					para11.add(new Paragraph("NO Of Captured Days(CD) for all vehicles (Captured Days+Ignition Off Days)= "+(CapTot+OffTot)+"  ",headerFont));
					para11.setAlignment("Left");
					document.add(para11);


					Paragraph para12=new Paragraph();
					para12.add(new Paragraph("SLA Days=  "+(ToTDays * salcount/ 100)+"",headerFont));
					para12.setAlignment("Left");
					document.add(para12);


					
					if( CapTot + OffTot >= ToTDays * salcount / 100)
						shortfall = 0;
					else
						shortfall = (ToTDays * salcount / 100) - (CapTot + OffTot);
					//shortfall=nf.format(shortfall);

					Paragraph para13=new Paragraph();
					para13.add(new Paragraph("Short fall in SLA Days =(CD-SLA Days) or (SLA Days-CD) = "+nf.format(shortfall)+" ",headerFont));
					para13.setAlignment("Left");
					document.add(para13);
					
					trmAndCondition+="SLA="+salcount+"%  \n NO Of Captured Days(CD) for all vehicles (Captured Days+Ignition Off Days)= "+(CapTot+OffTot)+" SLA Days=  "+(ToTDays * salcount/ 100)+" \n";

				}

				/*        ********************************* start of calculations for SLA  ****************************************   */


				Paragraph td=new Paragraph();
				td.add(new Paragraph("No Of Total Days(TD) in "+month+"-"+year+" = "+totaldays+"",headerFont));
				td.setAlignment("Left");
				document.add(td);


				double ExpTotAmt=(flratepervehicle/daysinmonth) * totaldays;
				Paragraph para14=new Paragraph();
				para14.add(new Paragraph("Expected Total Amount= ("+flratepervehicle+"/"+daysinmonth+") * "+totaldays+" = "+ (flratepervehicle/daysinmonth) * totaldays+"  ",headerFont));
				para14.setAlignment("Left");
				document.add(para14);
				
				
				double short_fallsla=flratepervehicle/daysinmonth*shortfall;
				Paragraph para15=new Paragraph();
				para15.add(new Paragraph("Short fall in SLA Amount=("+flratepervehicle/daysinmonth+"*"+shortfall+") ="+short_fallsla+"  ",headerFont));
				para15.setAlignment("Left");
				document.add(para15);
				
				trmAndCondition+="No Of Total Days(TD) in "+month+"-"+year+" = "+totaldays+"\n Expected Total Amount= ("+flratepervehicle+"/"+daysinmonth+") * "+totaldays+" = "+ (flratepervehicle/daysinmonth) * totaldays+" \n Short fall in SLA Amount=("+flratepervehicle/daysinmonth+"*"+shortfall+") ="+short_fallsla+"\n Expected Total Amount= ("+flratepervehicle+"/"+daysinmonth+") * "+totaldays+" = "+ (flratepervehicle/daysinmonth) * totaldays+"";

				double JRM_Monthly=0.0;
				if(jrmcount>0)
				{	
					Paragraph para16=new Paragraph();
					para16.add(new Paragraph("JRM - Monthly Road Risk Data Flat Charges = "+ jrmcount*100+"  ",headerFont));
					para16.setAlignment("Left");
					document.add(para16);
					JRM_Monthly=jrmcount*100;
					trmAndCondition+="JRM - Monthly Road Risk Data Flat Charges = "+ jrmcount*100+"\n";
				}
				else//jrmcount=0
				{
					Paragraph para17=new Paragraph();
					para17.add(new Paragraph("JRM - Monthly Road Risk Data Flat Charges = Not Applicable"+"  ",headerFont));
					para17.setAlignment("Left");
					document.add(para17);
					trmAndCondition+="JRM - Monthly Road Risk Data Flat Charges = Not Applicable\n";
				}

				float ttlamt = ((flratepervehicle/daysinmonth) * totaldays);

				float nba = (ttlamt+(jrmcount*100));
				double NetBillAmt=ExpTotAmt-short_fallsla+JRM_Monthly;
				String NetBillAmtNew=nf.format(NetBillAmt);
				
				NetBillAmt=Math.round(NetBillAmt);

				Paragraph para18=new Paragraph();
				para18.add(new Paragraph("Net Bill Amount = "+NetBillAmtNew+"  ",headerFont));
				para18.setAlignment("Left");
				document.add(para18);

				
				double netbillamt=(NetBillAmt+(12.36/100)*NetBillAmt);
				
				netbillamt=Math.round(netbillamt);

				Paragraph para19=new Paragraph();
				para19.add(new Paragraph("Invoice Amount = Net Bill Amt * 12.36 Service Charge = "+ nf.format((netbillamt))+" ",InvAmtFont));
				para19.setAlignment("Left");
				document.add(para19);
				
				trmAndCondition+="Net Bill Amount = "+NetBillAmtNew+"\n Invoice Amount = Net Bill Amt * 12.36 Service Charge = "+ nf.format((netbillamt))+"";
				
				//Amt_Rs="test";


				String PDate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(todaysDate));
				String InvDate=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
				
				System.out.println("DATE=====================>>"+PDate);
				
				//PDate+=" 00:00:00";
				
				/****************************************Start of inserting invoice and customer ledger Details Logic *************************************************/
				
				
								String sqlmain="INSERT INTO t_invoicedet " +
				    			"(InvoiceNo ,CustomerCode ,InvoiceDate, TheGroup ,Total ,Discount ,CST ,PFI ,FreightAmt ,GrandTotal,Terms,TotalInWords,PONo,PODate ,DespatchMode ," +
				    			"	FreightType ,PaymentMode ,Insurance, ShippedBy ,ShipmentDate ," +
				    			"	DespCheckListCheckedBy ,PackingSlipCheckedBy ,DocketFilledBy,InvoiceCancelled ,RevofInvoiceNo ," +
				    			"	NoofRevisions ,ReasonForCancelling ,InvoiceRaisedby," +
				    			"	CurrType,CurrValue,TWEmpName,"+
				    			"	AddressCode,CompanyName,ContactPerson,Address,city," +
				    			"	Zip,State,country,Phone ,Fax,invoiceRefNo)Values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

							 java.sql.PreparedStatement stmt = conn1.prepareStatement( sqlmain );
						
							
							 stmt.setString(1,Integer.toString(SINumber));
							 stmt.setString(2,customer);
							 stmt.setString(3,InvDate);
							 stmt.setString(4,"3");
							 stmt.setFloat(5,invamt);
							 stmt.setString(6,"0");
							 stmt.setString(7,"0");
							 stmt.setString(8,"0");
							 stmt.setString(9,"0");
							 stmt.setFloat(10,invamt);
							 stmt.setString(11,trmAndCondition);
							 stmt.setString(12,Amt_Rs);
							 stmt.setString(13,"Verbel");
							 stmt.setString(14,InvDate);
							 stmt.setString(15,"Surface");
							 stmt.setString(16,"Collect To Pay");
							 stmt.setString(17,"Ins.Cert. Enclosed");
							 stmt.setString(18,"-");
							 stmt.setString(19,"-");
							 stmt.setString(20,"0000-00-00");
							 stmt.setString(21,"-");
							 stmt.setString(22,"-");
							 stmt.setString(23,"-");
							 stmt.setString(24,"0");
							 stmt.setString(25,"0");
							 stmt.setString(26,"0");
							 stmt.setString(27,"0");
							 stmt.setString(28,"Transworld Compressor Technologies Ltd.");
							 stmt.setString(29,"Rupees");
							 stmt.setString(30,"1");
							 stmt.setString(31,"Autogenerated");
							 stmt.setString(32,AddressCode);
							 stmt.setString(33,custname);
							 stmt.setString(34,contactperson);
							 stmt.setString(35,address);
							 stmt.setString(36,BillingCity);
							 stmt.setString(37,zip);
							 stmt.setString(38,State);
							 stmt.setString(39,country);
							 stmt.setString(40,phone);
							 stmt.setString(41,phone);
							 stmt.setString(42,SIRefNumber);
							 
							 
							 
							 System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& =======>"+sqlmain); 
					        stmt.executeUpdate();
					
					/*
					
					String sqlmain="INSERT INTO t_invoicedet " +
				    			"(InvoiceNo ,CustomerCode ,InvoiceDate, TheGroup ,Total ,Discount ,CST ,PFI ,FreightAmt ,GrandTotal,Terms,TotalInWords,PONo,DespatchMode ,FreightType ,PaymentMode ,Insurance, ShippedBy ,ShipmentDate ,DespCheckListCheckedBy ,PackingSlipCheckedBy ,DocketFilledBy,InvoiceCancelled ,RevofInvoiceNo ,NoofRevisions ,ReasonForCancelling ,InvoiceRaisedby,CurrType,CurrValue,TWEmpName,AddressCode,CompanyName,ContactPerson,Address,city,Zip,State,country,Phone ,Fax,invoiceRefNo)"+
				    			"   Values("+Integer.toString(SINumber)+","+customer+","+InvDate+",'3',"+invamt+",'0','0','0','0',"+invamt+",'terms','rs in word','Verbel','Surface','CollectTo Pay','Ins.Cert. Enclosed','-','-','0000-00-00','-','-','-','0','0','0','0','Transworld Compressor Technologies Ltd.','Rupees','1','Autogenerated',"+AddressCode+","+custname+","+contactperson+","+address+","+BillingCity+","+zip+","+State+","+country+","+phone+","+phone+","+SIRefNumber+")";
					
					 System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& =======>"+sqlmain);
					st15.executeUpdate(sqlmain);
					
					
					*/
					String TransDate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(todaysDate));
								
								int transactionId;
								String transactionNo="select MAX(TransactionId) from t_customerledgeraccount";
								ResultSet rsNo=st2.executeQuery(transactionNo);
								rsNo.next();
									transactionId=rsNo.getInt(1);
								transactionId++;
								System.out.println("TRAN   ID   IS "+transactionId);
								System.out.println("+++++++++++++++++++++++++++++++++                 =======================================");
								
							String 	sqlAddition="INSERT INTO t_customerledgeraccount(TransactionId,CustomerCode,TransactionType,TransactionDetail,TransactionDate,DebitAmount, "+
											" CreditAmount,Balance,EmpName,PaymentVoucherNo,DebitParty,CreditParty) "+
											
											" VALUES ("+transactionId+",'"+customer+"','Invoice','"+SIRefNumber+"','"+TransDate+"','"+invcamount+"', "+
											" '0','0','Autogenerated','-','"+custname+"' ,'Sales Account' )";
							
							  //  System.out.println(sqlAddition);
								st15.executeUpdate(sqlAddition);
								System.out.println("sqlAddition=======>"+sqlAddition);
				/****************************************Start of inserting invoice and customer ledger Details Logic *************************************************/


				
				
				
				document.close();

				//	DataOutput dataOutput = new DataOutputStream(response.getOutputStream());
				byte[] bytes = buffer.toByteArray();
				//	response.setContentLength(bytes.length);
				for(int l = 0; l < bytes.length; l++)
				{
					//	    dataOutput.writeByte(bytes[l]);
				}

			}catch(Exception e)
			{
				e.printStackTrace();
			}
			finally
			{
				//response.getOutputStream().close();
			}	


		} catch (Exception e) {
			System.out.print("PdfGeneration Exception---->" + e);
		}

	}

	public  void PdfGenerationCustomeCode(String year,String month,String cust_id) {
		
		System.out.println("Customer Id====>"+cust_id);

		try {
			PdfGeneration pdfCall =new PdfGeneration();

			PdfGeneration getConn=new PdfGeneration();

			conn1 = getConn.GetConnection();

			//	String year="2014";
			//	String month="06";

			System.out.println(year+"  "+month);
			int monthdays=0;
			if(month.equals("01") || month.equals("03") || month.equals("05") ||month.equals("07") || month.equals("08") || month.equals("10") || month.equals("12") )
			{monthdays=31;}

			if(month.equals("04") || month.equals("06") || month.equals("09") ||month.equals("11"))
			{monthdays=30;}

			if(month.equals("02"))
			{monthdays=28;}

			int smonth = Integer.parseInt(month);
			System.out.println("Selected month in int is "+smonth);
			int syear = Integer.parseInt(year);
			System.out.println("Selected year in int is "+syear);
			int spreviousyear, spreviousmonth;
			if(smonth==1)
			{
				System.out.println("Selected month is 1"); 	 
				spreviousyear=syear-1;
				spreviousmonth=12;
				System.out.println("Selected previous year "+spreviousyear+"Selected previous month"+spreviousmonth);
				//	 	currentmonthcount=12;
			}
			else 
			{
				spreviousyear=syear;
				System.out.println("selected month  is "+smonth);
				spreviousmonth = smonth-1;
				System.out.println("Selected previous year is "+spreviousyear+"selected previous month is "+spreviousmonth);
			}




			Statement sterp = null, sterp1 = null, stgps = null, stgps1 = null,stgps2=null;
			Statement sterp2 = null;
			Statement sterp3=null,sterp4=null,sterp5=null,sterp6=null,sterp7=null,stchk=null, stqr=null;
			String selectedName,fpreviousmonth="";
			String FollowUpType = "",Group="", strcustomer = "", strgroupname = "";

			DecimalFormat twoDForm = new DecimalFormat("#.##");
			String fromDateCal = "", toDateCal = "", sql1 = "",sql2="",sql3="";
			String todaysTime = new SimpleDateFormat(" HH:mm:ss").format(new java.util.Date());
			int i=1;
			int vehid=0;
			int k=2000;
			Date tdy = new Date();
			Date tomorrow = new Date();
			Calendar cal = Calendar.getInstance();
			Calendar now = Calendar.getInstance();
			cal.setTime(tdy);
			String todaysDate1 = new SimpleDateFormat("yyyy-MM-dd").format(tdy);
			String todaysDate = new SimpleDateFormat("dd-MMM-yyyy").format(tdy);
			cal.add(Calendar.DAY_OF_MONTH, -1);
			Date YesterdaysDateAsDate = cal.getTime();
			String yesterdaysDate = new SimpleDateFormat("dd-MMM-yyyy").format(YesterdaysDateAsDate);

			fromDateCal = toDateCal = new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());




			String customer="";
			String custname="";
			String yearNew="";
			String monthNew="";
			String groupname="";
			String vehiclenos="";
			String ratepervehicle="";
			String jrmcountNo="";
			String billtype="";
			String slacount="";
			String billdaysAll="";


			stchk=conn1.createStatement();

			sterp=conn1.createStatement();




			String checktb = "show tables like 't_billingdetails"+year+"_"+month+"'";
			System.out.println("Query is"+checktb);
			ResultSet rschk=stchk.executeQuery(checktb);
			//System.out.println("Resultset"+rschk.toString());
			//System.out.println("Resultset is"+rschk.next());
			System.out.println("After rschk"+rschk.next());
			//if(rschk.next())
			//	{

			// String sqldata= Select CustomerNameinERP as Customer,CustomerCodeinERP as CusromerCode,SLA,Amount,Amount/"+monthdays+" as ChargeperDay,count(vehid) as NoofVehicles,sum(VehAddedThisMonth) as VehcileAdded,sum(vehRemovedThisMonth) as VehcileRemoved,sum(TotalYes) as CapturedDays,Sum(TotalYesStar) as DisconnectedDays,sum(TotalNo) as NotCaptured,sum(TotalDays) as TotalDays,Sum(TotalYesStar)+sum(TotalYes) as TotalBilledDays from t_transporterbilldetailsnew  where month1='"+year+"-"+month+"-01' and t_billingdetails.Transporter = t_transporterbilldetailsnew.Ownername group by  t_billingdetails.Transporter;


			//  String sqldata="Select CustomerNameinERP as Customer,CustomerCodeinERP as CusromerCode,SLA,Amount,Amount/"+monthdays+" as ChargeperDay,count(db_gps.t_billingdetails.VehId) as NoofVehicles,sum(VehAddedThisMonth) as VehcileAdded,sum(vehRemovedThisMonth) as VehcileRemoved,sum(TotalYes) as CapturedDays,Sum(TotalYesStar) as DisconnectedDays,sum(TotalNo) as NotCaptured,sum(TotalDays) as TotalDays,Sum(TotalYesStar)+sum(TotalYes) as TotalBilledDays from db_gps.t_transporterbilldetailsnew  where month1='"+year+"-"+month+"-01' and db_gps.t_billingdetails.Transporter = db_gps.t_transporterbilldetailsnew.Ownername group by  db_gps.t_billingdetails.Transporter";

/*
			String sqldata="Select ERPCustName as Customer,ERPCode as CustomerCode,SLAPer,Rate,Rate/"+monthdays+" as ChargeperDay,"+
			"count(t_billingdetails"+year+"_"+month+".vehID) as NoofVehicles,sum(VehAddedThisMonth) as VehcileAdded,"+
			"sum(vehRemovedThisMonth) as VehcileRemoved,sum(TotalYes) as CapturedDays,Sum(TotalYesStar) as DisconnectedDays,"+
			"sum(TotalNo) as NotCaptured,sum(TotalDays) as TotalDays,Sum(TotalYesStar)+sum(TotalYes) as TotalBilledDays ,"+
			"GroupName,BillType,sum(jrm) as jrmvehcount from t_fv_erp_relation"+year+"_"+month+" ,t_billingdetails"+year+"_"+month+" "+
			"where month1='"+year+"-"+month+"-01' and  t_fv_erp_relation"+year+"_"+month+".vehID = t_billingdetails"+year+"_"+month+".VehID  and "+
			"t_fv_erp_relation"+year+"_"+month+".BillTransporter='Yes' group by   t_fv_erp_relation"+year+"_"+month+".ERPCustName,t_fv_erp_relation"+year+"_"+month+".groupcode limit 2";
			System.out.println("QUERY=====>"+sqldata);
			
			*/
			

			String sqldata="Select ERPCustName as Customer,ERPCode as CustomerCode,SLAPer,Rate,Rate/"+monthdays+" as ChargeperDay,"+
			"count(t_billingdetails"+year+"_"+month+".vehID) as NoofVehicles,sum(VehAddedThisMonth) as VehcileAdded,"+
			"sum(vehRemovedThisMonth) as VehcileRemoved,sum(TotalYes) as CapturedDays,Sum(TotalYesStar) as DisconnectedDays,"+
			"sum(TotalNo) as NotCaptured,sum(TotalDays) as TotalDays,Sum(TotalYesStar)+sum(TotalYes) as TotalBilledDays ,"+
			"GroupName,BillType,sum(jrm) as jrmvehcount from t_fv_erp_relation"+year+"_"+month+" ,t_billingdetails"+year+"_"+month+" "+
			"where month1='"+year+"-"+month+"-01' and  t_fv_erp_relation"+year+"_"+month+".vehID = t_billingdetails"+year+"_"+month+".VehID  and "+
			"t_fv_erp_relation"+year+"_"+month+".BillTransporter='Yes' and t_fv_erp_relation"+year+"_"+month+".ERPCode='"+cust_id+"' group by   t_fv_erp_relation"+year+"_"+month+".ERPCustName,t_fv_erp_relation"+year+"_"+month+".groupcode";
			System.out.println("QUERY===############==>"+sqldata);
			
		
		
			ResultSet rsData=sterp.executeQuery(sqldata);
			


			while(rsData.next())
			{

				customer=rsData.getString("CustomerCode");
				strcustomer = rsData.getString("Customer");
				System.out.println("Customer before conversion is"+strcustomer);
				/*trptr = trptr.replace("&","^");*/
				strcustomer = strcustomer.replace("&","^");
				System.out.println("Customer after conversion is"+strcustomer);
				strgroupname = rsData.getString("GroupName");
				System.out.println("groupname before conversion is"+strgroupname);
				strgroupname = strgroupname.replace("&","^");
				System.out.println("groupname after conversion is"+strgroupname);
				custname=strcustomer;
				yearNew=year;
				monthNew=month;
				groupname=strgroupname;
				vehiclenos=rsData.getString("NoofVehicles");
				ratepervehicle=rsData.getString("Rate");
				jrmcountNo=rsData.getString("jrmvehcount");
				billtype=rsData.getString("BillType");
				slacount=rsData.getString("SLAPer");
				billdaysAll=rsData.getString("TotalBilledDays");
				
				System.out.println("VEH COUNTTT===>"+vehiclenos);

				pdfCall.PdfGenerationCall(customer, custname, yearNew, monthNew, groupname, vehiclenos, ratepervehicle, jrmcountNo, billtype, slacount, billdaysAll);

			}

		//	pdfCall.CloseConnection();


			//	}


			System.out.println("Calling Function");
			//pdfCall.PdfGeneration(customer, custname, yearNew, monthNew, groupname, vehiclenos, ratepervehicle, jrmcountNo, billtype, slacount, billdaysAll);


		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/*
	public static void main(String[] args) {

		PdfGeneration getConn=new PdfGeneration();

		conn1 = getConn.GetConnection();



		PdfGeneration pdf =new PdfGeneration();

		String year="2014";
		String month="09";
		pdf.PdfGenerationCustomeCode(year,month);

		getConn.CloseConnection();



	}
	*/

}
