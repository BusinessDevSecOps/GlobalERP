<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict/aaa/EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="header.jsp"%>
<%@ page language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" 
%>
<%@
page import="javax.*,java.awt.*,

 com.lowagie.text.Chunk,  
 com.lowagie.text.Document,  
 com.lowagie.text.DocumentException,  
com.lowagie.text.Font, 
com.lowagie.text.FontFactory,  
com.lowagie.text.HeaderFooter,  
com.lowagie.text.Image,  
com.lowagie.text.PageSize,  
com.lowagie.text.Paragraph,  
com.lowagie.text.Phrase,
 com.lowagie.text.pdf.BaseFont,  
 com.lowagie.text.pdf.PdfContentByte,  
 com.lowagie.text.pdf.PdfImportedPage,  
com.lowagie.text.pdf.PdfLayer,  
com.lowagie.text.pdf.PdfReader,  
com.lowagie.text.pdf.PdfStamper,  
com.lowagie.text.pdf.PdfString,  
com.lowagie.text.pdf.PdfWriter,  
java.io.FileOutputStream,
java.io.*,
java.util.*,
java.awt.*,
java.awt.geom.Rectangle2D,
com.lowagie.text.pdf.*,
com.lowagie.text.pdf.PdfPCellEvent,
com.lowagie.text.*,
com.lowagie.text.Image,
org.jfree.chart.ChartFactory,
org.jfree.chart.JFreeChart,
org.jfree.chart.plot.PlotOrientation,
org.jfree.data.DefaultCategoryDataset,
org.jfree.data.DefaultPieDataset,
org.jfree.chart.ChartFrame,
org.jfree.chart.renderer.BarRenderer,
org.jfree.chart.plot.CategoryPlot,
org.jfree.chart.plot.PiePlot3D"%>



<%@page import="com.lowagie.text.Rectangle"%>
<%@page import="org.apache.poi.hssf.util.HSSFColor.MAROON"%><jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">
 
	<script src="dropdown.js" type="text/javascript"></script>
	<script src="dynamic.js" type="text/javascript"></script>

	
	<script type="text/javascript">
	</script>
	
	
	<body>
	
	 
 <%
	erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
 %>
 <%
 	Connection conn = null;
 	Statement st = null, st1 = null, st3 = null, st4 = null, st5 = null;
 	Statement st2 = null;
 	String selectedName;
 	String FollowUpType = ""; 
 	//Font catFont = new Font(Font.FontFamily.TIMES_ROMAN, 18,	Font.BOLD);
 %>
  <%!	String tgrp="",tmake="",tmodel=""; %>
 <%
 	String fromDateCal = "", toDateCal = "", sql = "";
 	String todaysTime = new SimpleDateFormat(" HH:mm:ss")
 				.format(new java.util.Date());
 	NumberFormat nf = new DecimalFormat("#0.00");
 	Date tdy = new Date();
 	Date tomorrow = new Date();
 	Calendar cal = Calendar.getInstance();
 	Calendar now = Calendar.getInstance();
 	cal.setTime(tdy);
 	String todaysDate = new SimpleDateFormat("dd-MMM-yyyy")
 				.format(tdy);
 	cal.add(Calendar.DAY_OF_MONTH, -1);
 	Date YesterdaysDateAsDate = cal.getTime();
 	String yesterdaysDate = new SimpleDateFormat("dd-MMM-yyyy")
 				.format(YesterdaysDateAsDate);

 	fromDateCal = toDateCal = new SimpleDateFormat("dd-MMM-yyyy")
 				.format(new java.util.Date());
 	try {
 			conn = erp.ReturnConnection();
 			st = conn.createStatement();
 			st1 = conn.createStatement();
 			st2 = conn.createStatement();
 			st3 = conn.createStatement();
 			st4 = conn.createStatement();
 			st5 = conn.createStatement();
 		}
 		catch (Exception e) 
 		{
 		}
 	%>
	
	
	<%
String a="",b="",c="",d="",f="";
	response.setContentType("application/pdf");
String filename="PurchaseOrder.pdf";
response.addHeader("Content-Disposition", "attachment;filename="+filename);

Document document = new Document();
try{
ByteArrayOutputStream buffer = new ByteArrayOutputStream();
PdfWriter writer=PdfWriter.getInstance(document, buffer);
	

Font catFont = new Font(Font.TIMES_ROMAN,12,Font.BOLD);
Font NormalFont = new Font(Font.TIMES_ROMAN,8);
Font underline=new Font(Font.TIMES_ROMAN,10,Font.UNDERLINE);

String sql11 ="select Companyname, address, phone, emailid, godownaddress from CompanyMaster where companymid="+session.getAttribute("CompanyMasterID").toString() ;
ResultSet rsexe=st5.executeQuery(sql11);
//System.out.println(sql1);
rsexe.next();
String s1=rsexe.getString(1);
String s2=rsexe.getString(2);
String s3=rsexe.getString(3);
String s4=rsexe.getString(4);
String s5=rsexe.getString(5);
System.out.println(sql11);
System.out.println(s1+","+s2+","+s3+","+s4+","+s5);

document.open();


Paragraph preface = new Paragraph();
preface.add(new Paragraph(s1,catFont));
preface.setAlignment("center");
preface.add(new Paragraph(s2,NormalFont));
preface.setAlignment("center");
preface.add(new Paragraph(s3,NormalFont));
preface.setAlignment("center");
preface.add(new Paragraph(s4,NormalFont));
preface.setAlignment("center");

document.add(preface);


String ordrefno=request.getParameter("PurOrderNumber");
System.out.println("REF NO I S      "+ordrefno);
String SqlEnqDet = "SELECT * from "+session.getAttribute("CompanyMasterID").toString()+"purchaseorder WHERE PONo='"+ordrefno+"' ";
System.out.println(">>>>>>>>>>>      " + SqlEnqDet);
ResultSet rsEnqDet = st4.executeQuery(SqlEnqDet);
if (rsEnqDet.next()) {
String suppliercode=rsEnqDet.getString("SupplierCode");	
String podate=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsEnqDet.getString("PODate")));
String total=rsEnqDet.getString("Total");
String grandtot=rsEnqDet.getString("GrandTotal");
String discount=rsEnqDet.getString("DiscountPercent");
String totalwords=rsEnqDet.getString("TotalinWords");
String termsconditions=rsEnqDet.getString("Terms");
String currencytype=rsEnqDet.getString("CurrType");

String sql1="select * from "+session.getAttribute("CompanyMasterID").toString()+"supplierdet where SupplierCode='"+suppliercode+"'";	
ResultSet rssql=st.executeQuery(sql1);
rssql.next();
String suppliername=rssql.getString("SupplierName");
String add=rssql.getString("Address");
String stat=rssql.getString("State");
String count=rssql.getString("Country");
String zip=rssql.getString("Zip");
String contact=rssql.getString("ContactPerson");
String phn=rssql.getString("Phone");
String fx=rssql.getString("Fax");

Paragraph PurchseOrdNo = new Paragraph();
PurchseOrdNo.add(new Paragraph("Purchase Order No :  "+ordrefno+" ",catFont));
PurchseOrdNo.setAlignment("Center");
document.add(PurchseOrdNo);

PdfPTable tableFirst = new PdfPTable(2);

tableFirst.setWidthPercentage(100);
tableFirst.getDefaultCell().setBorder(Rectangle.NO_BORDER);
tableFirst.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
tableFirst.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);

PdfPCell firstcell = new PdfPCell();
firstcell.setFixedHeight(70f); 

firstcell.addElement(new Paragraph(" To,",NormalFont));
firstcell.addElement(new Paragraph(" "+suppliername+" ",NormalFont )); 
firstcell.addElement(new Paragraph(" "+add+" ",NormalFont ));  
firstcell.addElement(new Paragraph(" Kind Attn : "+contact+" ",NormalFont )); 
tableFirst.addCell(firstcell);

PdfPCell firstcell1 = new PdfPCell();
firstcell1.setFixedHeight(70f); 

firstcell1.addElement(new Paragraph("Our PO Details : ",NormalFont));
firstcell1.addElement(new Paragraph("PO No: "+ordrefno+"  ",NormalFont));
firstcell1.addElement(new Paragraph("PO Date: "+podate+" ",NormalFont));
tableFirst.addCell(firstcell1);

document.add(tableFirst);

//addEmptyLine(preface, 1);

Paragraph para2 = new Paragraph();
para2.add(new Paragraph("Dear Sir, ",NormalFont));
para2.add(new Paragraph("We request you to please deliver us the following:- ",NormalFont));
document.add(para2);
//addEmptyLine(preface, 2);


document.add(Chunk.NEWLINE );
PdfPTable table = new PdfPTable(9);
table.setWidthPercentage(100);

//t.setBorderColor(BaseColor.GRAY);
//t.setPadding(4);
//t.setSpacing(4);
//t.setBorderWidth(1);

PdfPCell c1 = new PdfPCell(new Phrase("Sr No",NormalFont));
c1.setHorizontalAlignment(Element.ALIGN_CENTER);
table.addCell(c1);


c1 = new PdfPCell(new Phrase("Group",NormalFont));
c1.setHorizontalAlignment(Element.ALIGN_CENTER);
table.addCell(c1);

c1 = new PdfPCell(new Phrase("Make",NormalFont));
c1.setHorizontalAlignment(Element.ALIGN_CENTER);
table.addCell(c1);

c1 = new PdfPCell(new Phrase("Model",NormalFont));
c1.setHorizontalAlignment(Element.ALIGN_CENTER);
table.addCell(c1);

c1 = new PdfPCell(new Phrase("Part No",NormalFont));
c1.setHorizontalAlignment(Element.ALIGN_CENTER);
table.addCell(c1);


c1 = new PdfPCell(new Phrase("Description",NormalFont));
c1.setHorizontalAlignment(Element.ALIGN_CENTER);
table.addCell(c1);

c1 = new PdfPCell(new Phrase("Rate/Unit",NormalFont));
c1.setHorizontalAlignment(Element.ALIGN_CENTER);
table.addCell(c1);

c1 = new PdfPCell(new Phrase("Quantity",NormalFont));
c1.setHorizontalAlignment(Element.ALIGN_CENTER);
table.addCell(c1);

c1 = new PdfPCell(new Phrase("Amount",NormalFont));
c1.setHorizontalAlignment(Element.ALIGN_CENTER);
table.addCell(c1);

System.out.println("PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPpppp");
		
	int i=1;String z="",o="";
	String refMakeNameTable="",sqlDisplayDesc="";
		String sqlPurDet = "SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"purchaseorder_items WHERE PONo ='"+ ordrefno + "'  ";
	
				ResultSet rsPurDet = st.executeQuery(sqlPurDet);
				System.out.println("TTTTTTTTTTTTTTTTTTTTTTTT     "+sqlPurDet);
				while (rsPurDet.next()) {
						String makeCode = "", itemCode = "",  quantity="", makeName = "",groupName="";
						int groupCode=0;
						makeCode = rsPurDet.getString("Make");
						itemCode = rsPurDet.getString("ItemCode");
						groupCode = rsPurDet.getInt("TheGroup");
						quantity = rsPurDet.getString("Quantity");
						
						String Groupsql = "SELECT TheGroupName FROM "+session.getAttribute("CompanyMasterID").toString()+"tbl_groupmaster WHERE TheGroupCode='"+ groupCode + "'  ";
						ResultSet rsGroup = st1.executeQuery(Groupsql);
						System.out.println(">>>>>>>>>>>          "+Groupsql );
						if(rsGroup.next()) 
						{
							groupName=rsGroup.getString("TheGroupName");
						
						}
						if(groupCode<5)
						{
							refMakeNameTable="tbl_"+groupName.substring(0,5)+"makemaster";
							   	  	
							String sqlMakename="SELECT MakeName FROM "+refMakeNameTable.toLowerCase()+"  WHERE makecode='"+makeCode+"' ";
							ResultSet rsMakeName=st3.executeQuery(sqlMakename);
							System.out.println("********>>>>            "+sqlMakename );
							if(rsMakeName.next())
							makeName=rsMakeName.getString(1);
							else
							makeName="-";
									      
							
							sqlDisplayDesc="SELECT * FROM tbl_"+groupName.substring(0,5).toLowerCase()+"im_make"+makeCode+" where ItemCode='"+itemCode+"'";
						}
						
						
						
						else
						{
							sqlDisplayDesc="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"tbl_otherim_group"+groupCode+" where ItemCode='"+itemCode+"' ";
							makeName="-"  ;
						}
						ResultSet rsSql=st3.executeQuery(sqlDisplayDesc);
						System.out.println("********>>>>            "+sqlDisplayDesc);
						while(rsSql.next())
						{
						
							a=rsSql.getString("Model");
							b=rsSql.getString("PartNo");
							c=rsSql.getString("Description");
							d=rsPurDet.getString("UnitPrice");
							f=rsPurDet.getString("Quantity");
							z=groupName;
							o=makeName;
//table.setHeaderRows(1);
//table.addCell(" "+ i++ +"");
table.addCell(new Phrase(""+ i++ +"", FontFactory.getFont(FontFactory.TIMES_ROMAN, 8)));
table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_RIGHT);
table.addCell(new Phrase(""+z+"", FontFactory.getFont(FontFactory.TIMES_ROMAN, 8)));
table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
table.addCell(new Phrase(""+o+"", FontFactory.getFont(FontFactory.TIMES_ROMAN, 8)));
table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
table.addCell(new Phrase(""+a+"", FontFactory.getFont(FontFactory.TIMES_ROMAN, 8)));
table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
table.addCell(new Phrase(""+b+"", FontFactory.getFont(FontFactory.TIMES_ROMAN, 8)));
table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
table.addCell(new Phrase(""+c+"", FontFactory.getFont(FontFactory.TIMES_ROMAN, 8)));
table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
table.addCell(new Phrase(""+d+"", FontFactory.getFont(FontFactory.TIMES_ROMAN, 8)));
table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_RIGHT);
table.addCell(new Phrase(""+f+"", FontFactory.getFont(FontFactory.TIMES_ROMAN, 8)));
table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_RIGHT);
table.addCell(new Phrase(""+(nf.format(Double.parseDouble(d)*Double.parseDouble(f)))+"", FontFactory.getFont(FontFactory.TIMES_ROMAN, 8)));
table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_RIGHT);
						}
			}
document.add(table);
Paragraph totalAmnt=new Paragraph(("Total : "+total+" "),NormalFont);
totalAmnt.setAlignment(Element.ALIGN_RIGHT);
document.add(totalAmnt);
Paragraph disc=new Paragraph(("Discount : "+discount+" "), NormalFont ); 
disc.setAlignment(Element.ALIGN_RIGHT);
document.add(disc);
Paragraph grndtot=new Paragraph(("Grand Total("+currencytype+") : "+grandtot+" "), NormalFont); 
grndtot.setAlignment(Element.ALIGN_RIGHT);
document.add(grndtot);

Paragraph reply=new Paragraph();
reply.add(new Paragraph( "("+totalwords+" )",NormalFont));
reply.setAlignment("Left");
document.add(reply);

Paragraph terms=new Paragraph();
terms.add(new Paragraph("TERMS : ",catFont));
terms.setAlignment("Left");

Paragraph trm=new Paragraph();
trm.add(new Paragraph(" "+termsconditions+" ",NormalFont));
terms.setAlignment("Left");

document.add(terms);
document.add(trm);
document.add(Chunk.NEWLINE );


Paragraph address=new Paragraph();
address.add(new Paragraph("Despatch to the Following Address",NormalFont));
address.setAlignment("Left");
address.add(new Paragraph("Transworld Compressor Technologies Ltd.",NormalFont));
address.setAlignment("Left");
address.add(new Paragraph("Survey No. 921 Kad Vasti,Next to Raisony Collage,Wagholi Domkhel Road,Wagholi,Pune- 412207 ",NormalFont));
address.setAlignment("Left");

address.add(new Paragraph("Thank You ",NormalFont));
address.setAlignment("Left");
document.add(address);


Paragraph parabottom1=new Paragraph();
parabottom1.add(new Paragraph("For Transworld Compressor Technologies Ltd.",catFont));
parabottom1.setAlignment("Right");
document.add(parabottom1);

Paragraph signature=new Paragraph();
signature.add(new Paragraph(" "+session.getAttribute("EmpName")+" ",NormalFont));
signature.setAlignment("Right");
document.add(signature);

Paragraph parabottom2=new Paragraph();
parabottom2.add(new Paragraph("(Authorised Signature)",NormalFont));
parabottom2.setAlignment("Right");
document.add(parabottom2);


Paragraph bottomLines=new Paragraph();
bottomLines.add(new Paragraph("VAT TIN NO - 27530091079 V Pan No- AABCT4318G Service Category - Business Auxiliary Services ",NormalFont));
bottomLines.setAlignment("left");
bottomLines.add(new Paragraph("CST TIN NO - 27530091079 C Service Tax No.- AABCT4318GST001 ",NormalFont));
bottomLines.setAlignment("left");
document.add(bottomLines);

}
document.close();

DataOutput dataOutput = new DataOutputStream(response.getOutputStream());
byte[] bytes = buffer.toByteArray();
response.setContentLength(bytes.length);
for(int i = 0; i < bytes.length; i++)
{
dataOutput.writeByte(bytes[i]);
}

}catch(Exception e){
	e.printStackTrace();
	}
	finally
	{
		response.getOutputStream().close();
	}	
	
	
	
	

%>
	
	
	
	
	
	
	
	
	
	
</jsp:useBean>	