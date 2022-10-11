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



<%@page import="com.lowagie.text.Rectangle"%><jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">
 
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
    Statement st = null, st1 = null,st2=null,st3=null,st4=null;

	int groupCode=0,makeCode=0;
	int d=0;

	int i=0;
	String groupName="",makeName="",itemCode="",stpercent="";
	String refMakeNameTable="",fromdate="";
	String pfi="",frieght="",grandTotal="";
	String frieghtType="",grandtotal="";
	String sqlDisplayDesc=" ",totalAmount="",totalAmountInWords="",termsconditions="",salesQuoNumber="",status="",statusTD="";
	NumberFormat nf = new DecimalFormat("#0.00");
	String todaysDate=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new java.util.Date());
	String todaysTime=new SimpleDateFormat(" HH:mm:ss").format(new java.util.Date());
		
	String a="",b="",c="",h="",u="",m="",n="",o="",p="",q="";
	
	String invoicerefno=request.getParameter("transactionId");
	System.out.println(invoicerefno);
	try {
	conn = erp.ReturnConnection();
	st = conn.createStatement();
	st2 = conn.createStatement();
	st1 = conn.createStatement();
	st3 = conn.createStatement();
	st4 = conn.createStatement();
	} catch (Exception e) {
	}

%>
	
<%	

response.setContentType("application/pdf");
String filename="SalesInvoice.pdf";
response.addHeader("Content-Disposition", "attachment;filename="+filename);

///Font catFont = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD);

Document document = new Document();
try{
ByteArrayOutputStream buffer = new ByteArrayOutputStream();
PdfWriter writer=PdfWriter.getInstance(document, buffer);
	
Font catFont = new Font(Font.TIMES_ROMAN,12,Font.BOLD);
Font headFont = new Font(Font.TIMES_ROMAN,16,Font.BOLD);
Font new1=new Font(Font.TIMES_ROMAN,11,Font.BOLD);
Font new2=new Font(Font.TIMES_ROMAN,10,Font.BOLD);
Font new3=new Font(Font.TIMES_ROMAN,9,Font.BOLD);

Font NormalFont = new Font(Font.TIMES_ROMAN,10);
Font underline=new Font(Font.TIMES_ROMAN,12,Font.UNDERLINE);
Font Fontforname = new Font(Font.TIMES_ROMAN,9,Font.BOLD);
Font forterms = new Font(Font.TIMES_ROMAN,9,Font.BOLD);
Font smallfont = new Font(Font.TIMES_ROMAN,6,Font.BOLD);
Font smallfont2 = new Font(Font.TIMES_ROMAN,6);
document.open();

//Image image1 = Image.getInstance("/home/r_kunjir/Desktop/homepage.jpg");
//Image image1 = Image.getInstance("/usr/share/tomcat6/webapps/ERP/images/UKAS BSI Logo.bmp");
//image1.setWidthPercentage(35f);
//image1.setDpi(50,50);

String companydata="select * from CompanyMaster where companymid="+session.getAttribute("CompanyMasterID").toString();
ResultSet rsdata=st.executeQuery(companydata);
rsdata.next();
String companyname=rsdata.getString("Companyname");
String address=rsdata.getString("address");
String phone=rsdata.getString("phone");
String mail=rsdata.getString("emailid");
String website=rsdata.getString("website");
String fax=rsdata.getString("fax");

SimpleTable table321 = new SimpleTable();
table321.setWidthpercentage(100f);
table321.setBorder(Rectangle.NO_BORDER);
SimpleCell row = new SimpleCell(SimpleCell.ROW);
SimpleCell cellforname = new SimpleCell(SimpleCell.CELL);
cellforname.add(new Paragraph(companyname,headFont));
cellforname.add(new Paragraph(address,NormalFont));
cellforname.add(new Paragraph(phone,NormalFont));
cellforname.add(new Paragraph(mail + website + fax,NormalFont));

cellforname.setWidth(70f);
row.add(cellforname);

cellforname = new SimpleCell(SimpleCell.CELL);
//cellforname.add(image1);
cellforname.setWidth(30f);
cellforname.setWidthpercentage(50f);
cellforname.setHorizontalAlignment(Element.ALIGN_RIGHT);

row.add(cellforname);

table321.addElement(row);
document.add(table321);


Paragraph preface2 = new Paragraph();
preface2.add(new Paragraph("BILLING & DESPATCH OFFICE : Survey No. 921 Kad Vasti,Next to Raisony College,Wagholi Domkhel Road,Wagholi,Pune- 412207",new3));
preface2.setAlignment("center");

document.add(preface2);

document.add(Chunk.NEWLINE );

String SqlQuoDet="SELECT * from "+session.getAttribute("CompanyMasterID").toString()+"invoicedet WHERE invoiceRefNo='"+invoicerefno+"' ";
	System.out.println(">>>>>>>>>>>      "+SqlQuoDet);
	ResultSet rsInvDet=st4.executeQuery(SqlQuoDet);
		if(rsInvDet.next()){
			totalAmount=rsInvDet.getString("Total");
			totalAmountInWords=rsInvDet.getString("TotalinWords");
			termsconditions=rsInvDet.getString("Terms");


	
	PdfPTable tableFirst = new PdfPTable(2);

	tableFirst.setWidthPercentage(100);
	tableFirst.getDefaultCell().setBorder(Rectangle.NO_BORDER);
	tableFirst.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
	tableFirst.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
	

	PdfPCell firstcell = new PdfPCell();
	firstcell.setFixedHeight(90f);
	firstcell.addElement(new Paragraph(""+rsInvDet.getString("CompanyName") +" " ,Fontforname));
	firstcell.addElement(new Paragraph(""+rsInvDet.getString("Address")  +"",Fontforname));
	firstcell.addElement(new Paragraph("Fax: "+rsInvDet.getString("Fax") +" ",Fontforname));
	firstcell.addElement(new Paragraph("Ph: "+rsInvDet.getString("Phone") +" ",Fontforname));
	tableFirst.addCell(firstcell);

	PdfPCell firstcell1 = new PdfPCell();
	firstcell1.setFixedHeight(70f);

	firstcell1.addElement(new Paragraph("Date : "+new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsInvDet.getString("InvoiceDate")))+"   ",Fontforname ));
	firstcell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
	firstcell1.addElement(new Paragraph("PO No  :  "+rsInvDet.getString("PONO")+"      " ,Fontforname));
	firstcell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
	firstcell1.addElement(new Paragraph("PO Date : "+new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(rsInvDet.getString("PODate"))) +"    ",Fontforname));
	firstcell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
	tableFirst.addCell(firstcell1);

	document.add(tableFirst);
	
	
	
	Paragraph Subject = new Paragraph();
	Subject.add(new Paragraph("Invoice Cum Delivery Challan No. :"+rsInvDet.getString("invoiceRefNo")+" ",underline));
	Subject.setAlignment("Center");
	document.add(Subject);
	
	Paragraph contact = new Paragraph();
	contact.add(new Paragraph("Kind Attn :"+rsInvDet.getString("ContactPerson") +" ",NormalFont));
	contact.setAlignment("Center");
	document.add(contact);
	
	
	//addEmptyLine(preface, 2);
	document.add( Chunk.NEWLINE );
	
	float[] widths = {0.05f, 0.24f, 0.17f, 0.2f,0.2f,0.12f, 0.07f, 0.14f, 0.13f,0.09f,0.16f};
	PdfPTable table = new PdfPTable(widths);
	table.setWidthPercentage(100);
	// t.setBorderColor(BaseColor.GRAY);
	// t.setPadding(4);
	// t.setSpacing(4);
	// t.setBorderWidth(1);

	PdfPCell c1 = new PdfPCell(new Phrase("Sr.No",NormalFont));
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
	
	c1 = new PdfPCell(new Phrase("Description",NormalFont));
	c1.setHorizontalAlignment(Element.ALIGN_CENTER);
	//c1.setFixedWidth(); 
	table.addCell(c1);
	
	c1 = new PdfPCell(new Phrase("Part No",NormalFont));
	c1.setHorizontalAlignment(Element.ALIGN_CENTER);
	table.addCell(c1);
	
	c1 = new PdfPCell(new Phrase("Qty",NormalFont));
	c1.setHorizontalAlignment(Element.ALIGN_CENTER);
	table.addCell(c1);
	
	c1 = new PdfPCell(new Phrase("Unit Price",NormalFont));
	c1.setHorizontalAlignment(Element.ALIGN_CENTER);
	table.addCell(c1);
	
	c1 = new PdfPCell(new Phrase("Discount",NormalFont));
	c1.setHorizontalAlignment(Element.ALIGN_CENTER);
	table.addCell(c1);
	
	c1 = new PdfPCell(new Phrase("Tax",NormalFont));
	c1.setHorizontalAlignment(Element.ALIGN_CENTER);
	table.addCell(c1);
	
	c1 = new PdfPCell(new Phrase("Amount",NormalFont));
	c1.setHorizontalAlignment(Element.ALIGN_CENTER);
	table.addCell(c1);
	
 	double tax=0,discount=0.00 ,total=0.00;
 	String model="";

	String sqlInvItems="SELECT * FROM  "+session.getAttribute("CompanyMasterID").toString()+"salesinv_items WHERE InvoiceNo='"+rsInvDet.getString("InvoiceNo")+"'";
	System.out.println(sqlInvItems);
	ResultSet rsInvItems=st1.executeQuery(sqlInvItems);
	i=1;
		while(rsInvItems.next())
		{
			groupName="";makeName="";refMakeNameTable="";
			groupCode=rsInvItems.getInt("TheGroup");
			makeCode=rsInvItems.getInt("Make");
			itemCode=rsInvItems.getString("ItemCode");
			  
			String  sqlGroup="SELECT TheGroupName from "+session.getAttribute("CompanyMasterID").toString()+"tbl_groupmaster WHERE TheGroupCode='"+groupCode+"'";
			ResultSet rsGroup=st2.executeQuery(sqlGroup);
			if(rsGroup.next())
			groupName=rsGroup.getString("TheGroupName");
			if(groupCode<5)
			{
				refMakeNameTable="tbl_"+groupName.substring(0,5)+"makemaster";
				String sqlMakename="SELECT MakeName FROM "+refMakeNameTable.toLowerCase()+"  WHERE makecode='"+makeCode+"' ";
				ResultSet rsMakeName=st3.executeQuery(sqlMakename);
				if(rsMakeName.next())
				makeName=rsMakeName.getString(1);
				else
				makeName="-";
						      
				sqlDisplayDesc="SELECT * FROM tbl_"+groupName.substring(0,5).toLowerCase()+"im_make"+makeCode+" where ItemCode='"+itemCode+"'";
			}
			else{
				sqlDisplayDesc="SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"tbl_otherim_group"+groupCode+" where ItemCode='"+itemCode+"' ";
				makeName="-"  ;
			}
			%>
			<script type="text/javascript">
			document.getElementById('groupTop').value='<%=groupName%>';
			document.getElementById('MakeTop').value='<%=makeName%>';
			</script>
			<%  
			ResultSet rsDisplayDesc=st3.executeQuery(sqlDisplayDesc);
			
			if(rsDisplayDesc.next())
			{
				model=rsDisplayDesc.getString("Model");
				System.out.println("IN IF   ");

		    
		    a=rsDisplayDesc.getString("Partno");
			System.out.println(a);
	    b=rsInvItems.getString("ItemDescription") ;
		System.out.println(b);
		    c=rsInvItems.getString("Quantity") ;
			System.out.println(c);
		   h=rsInvItems.getString("SellingPrice") ;
			System.out.println(h);
		    u=rsInvItems.getString("DiscountPercent");
			System.out.println(u);
		    m=rsInvItems.getString("STPercent");
			System.out.println(m);
			//
			 double sp=rsInvItems.getDouble("SellingPrice");
				      double dp=rsInvItems.getDouble("DiscountPercent");
				      double stper=rsInvItems.getDouble("STPercent");
				      double qty=rsInvItems.getInt("Quantity");
				      double disval=(sp-((dp/100)*sp));
				      System.out.println("disc value-->"+disval);
				      double tot1=((sp-((dp/100)*sp))+((stper/100)*disval))*qty;
				      double tot = (double) Math.round(tot1 * 100) / 100;
				      System.out.println("(("+sp+"-(("+dp+"/100)*"+sp+"))+(("+stper+"/100)*"+sp+"))*"+qty+"====>"+tot);
				    
				    
			/*
		    n=nf.format((rsInvItems.getDouble("SellingPrice")-((rsInvItems.getDouble("DiscountPercent")/100)*rsInvItems.getDouble("SellingPrice"))
				    +((rsInvItems.getDouble("STPercent")/100)*rsInvItems.getDouble("SellingPrice")))*rsInvItems.getInt("Quantity"));
			*/
			System.out.println(tot);
		    o=makeName;
			System.out.println(o);
		    p=groupName;
			System.out.println(p);
		    q=rsDisplayDesc.getString("Model");
			System.out.println(q);
		    
		    table.addCell(new Phrase(""+ i++ +"", FontFactory.getFont(FontFactory.TIMES_ROMAN,10)));
		    table.addCell(new Phrase(""+ p +"", FontFactory.getFont(FontFactory.TIMES_ROMAN, 10)));
		    table.addCell(new Phrase(""+ o +"", FontFactory.getFont(FontFactory.TIMES_ROMAN, 10)));
		    table.addCell(new Phrase(""+ q +"", FontFactory.getFont(FontFactory.TIMES_ROMAN, 10)));
		    table.addCell(new Phrase(""+ b +"", FontFactory.getFont(FontFactory.TIMES_ROMAN, 10)));
		    table.addCell(new Phrase(""+ a +"", FontFactory.getFont(FontFactory.TIMES_ROMAN, 10)));
		    table.addCell(new Phrase(""+ c +"", FontFactory.getFont(FontFactory.TIMES_ROMAN, 10)));
		    table.addCell(new Phrase(""+ h +"", FontFactory.getFont(FontFactory.TIMES_ROMAN, 10)));
		    table.addCell(new Phrase(""+ u +"", FontFactory.getFont(FontFactory.TIMES_ROMAN, 10)));
		    table.addCell(new Phrase(""+ m +"", FontFactory.getFont(FontFactory.TIMES_ROMAN, 10)));
		    table.addCell(new Phrase(""+ nf.format(tot) +"", FontFactory.getFont(FontFactory.TIMES_ROMAN, 10)));
		   }
		   }

document.add(table);
		
Paragraph paratotal=new Paragraph();
paratotal.add(new Paragraph(" Total:(Rs)  "+totalAmount+" ",new2));
paratotal.setAlignment("Right");
document.add(paratotal);

Paragraph parapfi=new Paragraph();
parapfi.add(new Paragraph(" P & F & I (%)  "+rsInvDet.getString("PFI")+" ",new2));
parapfi.setAlignment("Right");
document.add(parapfi);

Paragraph parafright=new Paragraph();
parafright.add(new Paragraph(" Freight Amt "+rsInvDet.getString("FreightAmt")+" ",new2));
parafright.setAlignment("Right");
document.add(parafright);

Paragraph paragtotal=new Paragraph();
paragtotal.add(new Paragraph(" Grand Total "+rsInvDet.getString("GrandTotal")+" ",new2));
paragtotal.setAlignment("Right");
document.add(paragtotal);

Paragraph paratotalInWords=new Paragraph();
paratotalInWords.add(new Paragraph(totalAmountInWords,new2));
paratotalInWords.setAlignment("Left");
document.add(paratotalInWords);

Paragraph terms=new Paragraph();
terms.add(new Paragraph("TERMS & CONDITIONS :",forterms));
terms.add(new Paragraph(""+termsconditions+" ",NormalFont));
terms.setAlignment("Left");
document.add(terms);

Paragraph parathanks=new Paragraph();
parathanks.add(new Paragraph("Thanking you for your order.",NormalFont));

parathanks.setAlignment("Left");
document.add(parathanks);

Paragraph parabottom1=new Paragraph();
parabottom1.add(new Paragraph("For Transworld Compressor Technologies Ltd.",new1));
parabottom1.setAlignment("Right");
document.add(parabottom1);

Paragraph signature=new Paragraph();
signature.add(new Paragraph(" "+rsInvDet.getString("TWEmpName")+" ",new1));
signature.setAlignment("Right");
document.add(signature);

Paragraph parabottom2=new Paragraph();
parabottom2.add(new Paragraph("(Authorised Signature)",new1));
parabottom2.setAlignment("Right");
document.add(parabottom2);

Paragraph parabottom3=new Paragraph();
parabottom3.add(new Paragraph("*  Brand names & Trademarks belongs to their respective owners only. The use of original manufacturer part numbers and names quoted are provided",smallfont2));
parabottom3.add(new Paragraph("for reference purpose only. It is not intended to imply that Transworld parts are supplied by the original equipment manufacturer nor indeed is this the case.",smallfont2));
parabottom3.setAlignment("Left");
document.add(parabottom3);

document.add( Chunk.NEWLINE );

Paragraph parabottom4=new Paragraph();
parabottom4.add(new Paragraph("I/We hereby certify that my/our registration certificate under the Maharashtra Value Added Tax Act 2002 is in force on the date on which ",smallfont2));
parabottom4.add(new Paragraph("the sales of the goods specified in this tax invoice is made by me/us and that this transaction of sales covered by this tax invoice has been ",smallfont2));
parabottom4.add(new Paragraph("effected by me /us and is shall be accounted for in the turnover of sales while filling of return and the due tax.If any payable on the sales",smallfont2));
parabottom4.add(new Paragraph("has been paid or shall be paid.  ",smallfont2));
parabottom4.setAlignment("Left");
document.add(parabottom4);

document.add( Chunk.NEWLINE );

Paragraph parabottom5=new Paragraph();
parabottom5.add(new Paragraph("Subject to Pune Jurisdiction ",smallfont2));
parabottom5.setAlignment("Left");
document.add(parabottom5);

Paragraph parabottom6=new Paragraph();
parabottom6.add(new Paragraph("VAT TIN NO.: 27530091079 V             Pan No.: AABCT4318G               Service Category:Busines Auxiliary Services.  ",smallfont2));
parabottom6.add(new Paragraph("CST TIN NO.: 27530091079 C            Service Tax No.: AABCT4318GST001  " ,smallfont2));
parabottom6.setAlignment("Left");
document.add(parabottom6);

document.close();

DataOutput dataOutput = new DataOutputStream(response.getOutputStream());
byte[] bytes = buffer.toByteArray();
response.setContentLength(bytes.length);
for(int l = 0; l < bytes.length; l++)
{
dataOutput.writeByte(bytes[l]);
}
 		}
}catch(Exception e){
	e.printStackTrace();
	}
	finally
	{
		response.getOutputStream().close();
	}	
	
%>
	</body>
	</html>
</jsp:useBean>