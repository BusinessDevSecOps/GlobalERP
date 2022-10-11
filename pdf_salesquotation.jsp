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
	
	String todaysDate=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new java.util.Date());
	String todaysTime=new SimpleDateFormat(" HH:mm:ss").format(new java.util.Date());
		
	String a="",b="",c="",h="",u="",m="",n="",o="",p="",q="";
	NumberFormat nf = new DecimalFormat("#0.00");
	String salesquono=request.getParameter("salesQuotation");
	System.out.println(salesquono);
	try {
	conn = erp.ReturnConnection();
	st = conn.createStatement();
	st2 = conn.createStatement();
	st1 = conn.createStatement();
	st3 = conn.createStatement();
	st4 = conn.createStatement();
	} catch (Exception e) {
		e.printStackTrace();
	}

	%>
	
<%	

response.setContentType("application/pdf");
String filename="SalesQuotation.pdf";
response.addHeader("Content-Disposition", "attachment;filename="+filename);

///Font catFont = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD);

Document document = new Document();
try{
ByteArrayOutputStream buffer = new ByteArrayOutputStream();
PdfWriter writer=PdfWriter.getInstance(document, buffer);
	
Font catFont = new Font(Font.TIMES_ROMAN,12,Font.BOLD);
Font NormalFont = new Font(Font.TIMES_ROMAN,8);
Font underline=new Font(Font.TIMES_ROMAN,10,Font.UNDERLINE);
Font Fontforname = new Font(Font.TIMES_ROMAN,9,Font.BOLD);
Font forterms = new Font(Font.TIMES_ROMAN,9,Font.BOLD);
Font smallfont = new Font(Font.TIMES_ROMAN,6,Font.BOLD);
Font headFont = new Font(Font.TIMES_ROMAN,13,Font.BOLD);
Font fortotal=new Font(Font.BOLD,10,Font.UNDERLINE);
document.open();


//Image image1 = Image.getInstance("/home/sumedh/Desktop/UKAS BSI Logo.bmp");
//Image image1 = Image.getInstance("/home/r_kunjir/Desktop/homepage.jpg");
 //Image image1 = Image.getInstance("/usr/share/tomcat6/webapps/ERP/images/UKAS BSI Logo.bmp");

//image1.setWidthPercentage(40f);
//image1.setDpi(50,50);

SimpleTable table321 = new SimpleTable();
table321.setWidthpercentage(100f);
table321.setBorder(Rectangle.NO_BORDER);
SimpleCell row = new SimpleCell(SimpleCell.ROW);
SimpleCell cellforname = new SimpleCell(SimpleCell.CELL);

String companydata="select * from CompanyMaster where companymid="+session.getAttribute("CompanyMasterID").toString();
ResultSet rsdata=st.executeQuery(companydata);
rsdata.next();
String companyname=rsdata.getString("Companyname");
String address=rsdata.getString("address");
String phone=rsdata.getString("phone");
String mail=rsdata.getString("emailid");
String website=rsdata.getString("website");
String fax=rsdata.getString("fax");


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



document.add(Chunk.NEWLINE);

Paragraph preface = new Paragraph();
document.add(preface);
document.add(Chunk.NEWLINE);

/*Paragraph preface = new Paragraph();
preface.add(new Paragraph("Tansworld Compressor Technologies Limited",catFont));
preface.setAlignment("center");
preface.add(new Paragraph("C-3/8, Rakshalekha,Koregaon Park, Pune 411001, India",NormalFont));
preface.setAlignment("center");
preface.add(new Paragraph("020-41215555/020-26131676 020-41265555/020-26139599",NormalFont));
preface.setAlignment("center");
preface.add(new Paragraph("sales@transworld-compressor.com www.transworld-compressor.com",NormalFont));
preface.setAlignment("center");

document.add(preface);*/




	String SqlQuoDet="SELECT * from "+session.getAttribute("CompanyMasterID").toString()+"salesquo_det WHERE SalesQuoNo='"+salesquono+"' ";
 	System.out.println(">>>>>>>>>>>      "+SqlQuoDet);
 	ResultSet rsQuoDet=st4.executeQuery(SqlQuoDet);
 		if(rsQuoDet.next()){
 			totalAmount=rsQuoDet.getString("Total");
 			totalAmountInWords=rsQuoDet.getString("TotalinWords");
 			termsconditions=rsQuoDet.getString("TermsAndConditions");

	
	PdfPTable tableFirst = new PdfPTable(2);

	tableFirst.setWidthPercentage(100);
	tableFirst.getDefaultCell().setBorder(Rectangle.NO_BORDER);
	tableFirst.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
	tableFirst.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);


	PdfPCell firstcell = new PdfPCell();
	firstcell.setFixedHeight(80f);
	firstcell.addElement(new Paragraph("Ref NO : "+rsQuoDet.getString("TWSalesRefNo")+" " ,Fontforname));
	firstcell.addElement(new Paragraph(""+rsQuoDet.getString("CompanyName") +"",Fontforname));
	firstcell.addElement(new Paragraph(""+(rsQuoDet.getString("Address")).trim()+" ",NormalFont));
	firstcell.addElement(new Paragraph(""+rsQuoDet.getString("city")+" - "+rsQuoDet.getString("zip")+"",NormalFont));
	//firstcell.addElement(new Paragraph(""+rsQuoDet.getString("zip")+" ",NormalFont));
	
	tableFirst.addCell(firstcell);

	PdfPCell firstcell1 = new PdfPCell();
	firstcell1.setFixedHeight(80f);

	firstcell1.addElement(new Paragraph("Date : "+new SimpleDateFormat(
	"dd-MMM-yyyy")
	.format(new SimpleDateFormat( 
			"yyyy-MM-dd")
			.parse(rsQuoDet.getString("SalesQuoDate")))+"   ",NormalFont ));
	firstcell1.addElement(new Paragraph("Kind Attn :  "+rsQuoDet.getString("ContactPerson")+"      " ,NormalFont));
	firstcell1.addElement(new Paragraph("Phone : "+((rsQuoDet.getString("Phone")!=null) ? rsQuoDet.getString("Phone") : "-") +"    ",NormalFont));

	tableFirst.addCell(firstcell1);

	document.add(tableFirst);
	
	
	
	Paragraph Subject = new Paragraph();
	Subject.add(new Paragraph("SUB:QUOTATION",underline));
	Subject.setAlignment("Center");
	document.add(Subject);
	
	
	Paragraph para2 = new Paragraph();
	para2.add(new Paragraph("Dear Sir, ",NormalFont));
	para2.add(new Paragraph("We thank you for your valuable enquiry forwarded to us. Kindly find enclosed our lowest quote for the same;",NormalFont));
	document.add(para2);
	//addEmptyLine(preface, 2);
	document.add( Chunk.NEWLINE );
	
	
	
	
	PdfPTable table = new PdfPTable(11);
	table.setWidthPercentage(100);
	// t.setBorderColor(BaseColor.GRAY);
	// t.setPadding(4);
	// t.setSpacing(4);
	// t.setBorderWidth(1);
	
	PdfPCell c1;


	c1 = new PdfPCell(new Phrase("Sr No",NormalFont));
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
	table.addCell(c1);

	c1 = new PdfPCell(new Phrase("Part No",NormalFont));
	c1.setHorizontalAlignment(Element.ALIGN_CENTER);
	table.addCell(c1);


	c1 = new PdfPCell(new Phrase("Quantity",NormalFont));
	c1.setHorizontalAlignment(Element.ALIGN_CENTER);
	table.addCell(c1);

	c1 = new PdfPCell(new Phrase("Unit Price",NormalFont));
	c1.setHorizontalAlignment(Element.ALIGN_CENTER);
	table.addCell(c1);
	
	c1 = new PdfPCell(new Phrase("Discount(%)",NormalFont));
	c1.setHorizontalAlignment(Element.ALIGN_CENTER);
	table.addCell(c1);
	
	c1 = new PdfPCell(new Phrase("Tax(%)",NormalFont));
	c1.setHorizontalAlignment(Element.ALIGN_CENTER);
	table.addCell(c1);
	
	c1 = new PdfPCell(new Phrase("Amount",NormalFont));
	c1.setHorizontalAlignment(Element.ALIGN_CENTER);
	table.addCell(c1);

	float[] columnWidths = new float[] {15f, 30f, 30f, 30f,30f, 30f, 20f, 30f,30f, 30f, 30f};
    table.setWidths(columnWidths);
	
	
 	double tax=0,discount=0.00 ,total=0.00;

	String sqlQuoItems="SELECT * FROM  "+session.getAttribute("CompanyMasterID").toString()+"salesquo_items WHERE SalesQuoNo='"+salesquono+"'";
	System.out.println(sqlQuoItems);
	ResultSet rsQuoItems=st1.executeQuery(sqlQuoItems);
	i=1;
		while(rsQuoItems.next())
		{
			groupName="";makeName="";refMakeNameTable="";
			groupCode=rsQuoItems.getInt("TheGroup");
			makeCode=rsQuoItems.getInt("Make");
			itemCode=rsQuoItems.getString("ItemCode");
			  
			String  sqlGroup="SELECT TheGroupName from "+session.getAttribute("CompanyMasterID").toString()+"tbl_groupmaster WHERE TheGroupCode='"+groupCode+"'";
			System.out.println(sqlGroup);
			ResultSet rsGroup=st2.executeQuery(sqlGroup);
			if(rsGroup.next())
			groupName=rsGroup.getString("TheGroupName");
			if(groupCode<5)
			{
				refMakeNameTable="tbl_"+groupName.substring(0,5)+"makemaster";
				String sqlMakename="SELECT MakeName FROM "+refMakeNameTable.toLowerCase()+"  WHERE makecode='"+makeCode+"' ";
				System.out.println(sqlMakename);
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
	  	document.getElementById('makeTop').value='<%=makeName%>';
	  </script>
			<%
			ResultSet rsDisplayDesc=st3.executeQuery(sqlDisplayDesc);
			System.out.println("*****************************************************************888");
			if(rsDisplayDesc.next())
			{
				System.out.println("IN IF   ");

		    
		    a=rsDisplayDesc.getString("Partno");
			System.out.println(a);
	    	b=rsDisplayDesc.getString("Description") ;
			System.out.println(b);
		    c=rsQuoItems.getString("Quantity") ;
			System.out.println(c);
		   	h=rsQuoItems.getString("SellingPrice") ;
			System.out.println(h);
		    u=rsQuoItems.getString("DiscountPercent");
			System.out.println(u);
		    m=rsQuoItems.getString("STPercent");
			System.out.println(m);
			

			 double sp=rsQuoItems.getDouble("SellingPrice");
				      double dp=rsQuoItems.getDouble("DiscountPercent");
				      double stper=rsQuoItems.getDouble("STPercent");
				      double qty=rsQuoItems.getInt("Quantity");
				      double disval=(sp-((dp/100)*sp));
				      System.out.println("disc value-->"+disval);
				      double tot1=((sp-((dp/100)*sp))+((stper/100)*disval))*qty;
				      double tot = (double) Math.round(tot1 * 100) / 100;
				      System.out.println("(("+sp+"-(("+dp+"/100)*"+sp+"))+(("+stper+"/100)*"+sp+"))*"+qty+"====>"+tot);
				    
				      /*
		    n=nf.format((rsQuoItems.getDouble("SellingPrice")-((rsQuoItems.getDouble("DiscountPercent")/100)*rsQuoItems.getDouble("SellingPrice"))
				    +((rsQuoItems.getDouble("STPercent")/100)*rsQuoItems.getDouble("SellingPrice")))*rsQuoItems.getInt("Quantity"));
				      
				      */
			System.out.println(n);
		    o=makeName;
			System.out.println(o);
		    p=groupName;
			System.out.println(p);
		    q=rsDisplayDesc.getString("Model");
			System.out.println(q);
		    
		    
		    

			c1 = new PdfPCell(new Phrase(""+ i++ +"", FontFactory.getFont(FontFactory.TIMES_ROMAN, 8)));
			c1.setHorizontalAlignment(Element.ALIGN_RIGHT); /* Align Center */
		    table.addCell(c1);  
			
		    c1 = new PdfPCell(new Phrase(""+ p +"", FontFactory.getFont(FontFactory.TIMES_ROMAN, 8)));
		    c1.setHorizontalAlignment(Element.ALIGN_LEFT); /* Align Center */
		    table.addCell(c1);
		    
		    c1 = new PdfPCell(new Phrase(""+ o +"", FontFactory.getFont(FontFactory.TIMES_ROMAN, 8)));
		    c1.setHorizontalAlignment(Element.ALIGN_LEFT); /* Align Center */
		    table.addCell(c1);
		    
		    c1 = new PdfPCell(new Phrase(""+ q +"", FontFactory.getFont(FontFactory.TIMES_ROMAN, 8)));
		    c1.setHorizontalAlignment(Element.ALIGN_LEFT); /* Align Center */
		    table.addCell(c1);
		    
		    c1 = new PdfPCell(new Phrase(""+ b +"", FontFactory.getFont(FontFactory.TIMES_ROMAN, 8)));
		    c1.setHorizontalAlignment(Element.ALIGN_LEFT); /* Align Center */
		    table.addCell(c1);
		    
		    c1 = new PdfPCell(new Phrase(""+ a +"", FontFactory.getFont(FontFactory.TIMES_ROMAN, 8)));
		    c1.setHorizontalAlignment(Element.ALIGN_LEFT); /* Align Center */
		    table.addCell(c1);
		    
		    c1 = new PdfPCell(new Phrase(""+ c +"", FontFactory.getFont(FontFactory.TIMES_ROMAN, 8)));
		    c1.setHorizontalAlignment(Element.ALIGN_RIGHT); /* Align Center */
		    table.addCell(c1);
		    
		    c1 = new PdfPCell(new Phrase(""+ h +"", FontFactory.getFont(FontFactory.TIMES_ROMAN, 8)));
		    c1.setHorizontalAlignment(Element.ALIGN_RIGHT); /* Align Center */
		    table.addCell(c1);
		    
		    c1 = new PdfPCell(new Phrase(""+ u +"", FontFactory.getFont(FontFactory.TIMES_ROMAN, 8)));
		    c1.setHorizontalAlignment(Element.ALIGN_RIGHT); /* Align Center */
		    table.addCell(c1);   
		    
		    c1 = new PdfPCell(new Phrase(""+ m +"", FontFactory.getFont(FontFactory.TIMES_ROMAN, 8)));
		    c1.setHorizontalAlignment(Element.ALIGN_RIGHT); /* Align Center */
		    table.addCell(c1);   
		    
		    c1 = new PdfPCell(new Phrase(""+ nf.format(tot) +"", FontFactory.getFont(FontFactory.TIMES_ROMAN, 8)));
		    c1.setHorizontalAlignment(Element.ALIGN_RIGHT); /* Align Center */
		    table.addCell(c1);     
		   }
			
		   }

		document.add(table);

		
Paragraph paratotalInWords=new Paragraph();
paratotalInWords.add(new Paragraph(" "+totalAmountInWords+" ",NormalFont));
paratotalInWords.setAlignment("Left");
document.add(paratotalInWords);


Paragraph paratotal=new Paragraph();
paratotal.add(new Paragraph(" Total:(Rs)  "+totalAmount+" ",fortotal));
paratotal.add(new Paragraph(" Total value rounded off ",smallfont));
paratotal.setAlignment("Right");
document.add(paratotal);


Paragraph terms=new Paragraph();
terms.add(new Paragraph("  TERMS & CONDITIONS :",forterms));
terms.add(new Paragraph(""+termsconditions+" ",NormalFont));
terms.setAlignment("Left");
document.add(terms);



Paragraph parathanks=new Paragraph();
parathanks.add(new Paragraph("We hope our offer falls in the line of your requirement & look forward to the pleasure of receiving your valuable purchase order .",NormalFont));
parathanks.add(new Paragraph("Thanking You",NormalFont));

parathanks.setAlignment("Left");
document.add(parathanks);


Paragraph parabottom1=new Paragraph();
parabottom1.add(new Paragraph("For " +companyname ,NormalFont));
parabottom1.setAlignment("Right");
document.add(parabottom1);

Paragraph signature=new Paragraph();
signature.add(new Paragraph(" "+rsQuoDet.getString("TWEmpName")+" ",NormalFont));

signature.setAlignment("Right");
document.add(signature);

Paragraph parabottom2=new Paragraph();
parabottom2.add(new Paragraph("(Authorised Signature)",NormalFont));
parabottom2.setAlignment("Right");
document.add(parabottom2);


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