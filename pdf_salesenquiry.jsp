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
	String enqno="";
	String enqrefno=request.getParameter("senqrefno");
	System.out.println(enqrefno);
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
String filename="SalesEnquiry.pdf";
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
document.open();

String companydata="select * from CompanyMaster where companymid="+session.getAttribute("CompanyMasterID").toString();
ResultSet rsdata=st.executeQuery(companydata);
rsdata.next();
String companyname=rsdata.getString("Companyname");
String address=rsdata.getString("address");
String phone=rsdata.getString("phone");
String mail=rsdata.getString("emailid");
String website=rsdata.getString("website");
String fax=rsdata.getString("fax");

Paragraph preface = new Paragraph();
preface.add(new Paragraph(companyname,catFont));
preface.setAlignment("center");
preface.add(new Paragraph(address,NormalFont));
preface.setAlignment("center");
preface.add(new Paragraph(phone,NormalFont));
preface.setAlignment("center");
preface.add(new Paragraph(mail + website + fax,NormalFont));
preface.setAlignment("center");

document.add(preface);


document.add( Chunk.NEWLINE );

Paragraph Subject = new Paragraph();
Subject.add(new Paragraph("Sales Enquiry",underline));
Subject.setAlignment("Center");
document.add(Subject);



String SqlEnqDet = "SELECT * from "+session.getAttribute("CompanyMasterID").toString()+"salesenq_det WHERE SalesEnqRefNo='"+enqrefno+"' ";
System.out.println(">>>>>>>>>>>      " + SqlEnqDet);
ResultSet rsEnqDet = st4.executeQuery(SqlEnqDet);
if (rsEnqDet.next()) {
	enqno=rsEnqDet.getString("SalesEnqNo");
    
    
	
	PdfPTable tableFirst = new PdfPTable(2);

	tableFirst.setWidthPercentage(100);
	tableFirst.getDefaultCell().setBorder(Rectangle.NO_BORDER);
	tableFirst.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
	tableFirst.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);


	PdfPCell firstcell = new PdfPCell();
	firstcell.setFixedHeight(80f);
	firstcell.addElement(new Paragraph("Sales Enq NO: "+rsEnqDet.getString("SalesEnqRefNo")+" ",Fontforname));
	firstcell.addElement(new Paragraph("Enquiry Date & Time: "+new SimpleDateFormat(
	"dd-MMM-yyyy")
	.format(new SimpleDateFormat( 
			"yyyy-MM-dd")
			.parse(rsEnqDet.getString("SalesEnqDate")))   +" "+ rsEnqDet.getString("SalesEnqTime")+" ",Fontforname));
	firstcell.addElement(new Paragraph("Customer Name: "+rsEnqDet.getString("CompanyName") +" ",NormalFont));
	tableFirst.addCell(firstcell);

	document.add(tableFirst);
		
}
		
	Paragraph para2 = new Paragraph();
	preface.add(new Paragraph("Dear Sir, ",NormalFont));
	preface.add(new Paragraph("As per Your order,we are sending you the required material.",NormalFont));
	document.add(para2);
	//addEmptyLine(preface, 2);
	document.add( Chunk.NEWLINE );
	
	PdfPTable table = new PdfPTable(6);
	table.setWidthPercentage(100);
	// t.setBorderColor(BaseColor.GRAY);
	// t.setPadding(4);
	// t.setSpacing(4);
	// t.setBorderWidth(1);

	PdfPCell c1 = new PdfPCell(new Phrase("Sr No",NormalFont));
	c1.setHorizontalAlignment(Element.ALIGN_CENTER);
	table.addCell(c1);

	c1 = new PdfPCell(new Phrase("Make",NormalFont));
	c1.setHorizontalAlignment(Element.ALIGN_CENTER);
	table.addCell(c1);

	c1 = new PdfPCell(new Phrase("Part No",NormalFont));
	c1.setHorizontalAlignment(Element.ALIGN_CENTER);
	table.addCell(c1);

	c1 = new PdfPCell(new Phrase("Description",NormalFont));
	c1.setHorizontalAlignment(Element.ALIGN_CENTER);
	table.addCell(c1);

	c1 = new PdfPCell(new Phrase("Quantity",NormalFont));
	c1.setHorizontalAlignment(Element.ALIGN_CENTER);
	table.addCell(c1);

	c1 = new PdfPCell(new Phrase("Unit Price",NormalFont));
	c1.setHorizontalAlignment(Element.ALIGN_CENTER);
	table.addCell(c1);
	
	double tax = 0, discount = 0.00, total = 0.00;

	String sqlEnqItems = "SELECT * FROM  "+session.getAttribute("CompanyMasterID").toString()+"salesenq_items WHERE SalesEnqNo='"+enqno+"'";
	System.out.println(sqlEnqItems);
	ResultSet rsEnqItems = st1.executeQuery(sqlEnqItems);
	i = 1;
	while (rsEnqItems.next())
		{
			groupName = "";
			makeName = "";
			refMakeNameTable = "";
			groupCode = rsEnqItems.getInt("TheGroup");
			makeCode = rsEnqItems.getInt("Make");
			itemCode = rsEnqItems.getString("ItemCode");
	
			String sqlGroup = "SELECT TheGroupName from "+session.getAttribute("CompanyMasterID").toString()+"tbl_groupmaster WHERE TheGroupCode='"
					+ groupCode + "'";
			ResultSet rsGroup = st2.executeQuery(sqlGroup);
			if (rsGroup.next())
				groupName = rsGroup.getString("TheGroupName");
			if (groupCode < 5) {
				refMakeNameTable = session.getAttribute("CompanyMasterID").toString()+"tbl_" + groupName.substring(0, 5)
						+ "makemaster";
				String sqlMakename = "SELECT MakeName FROM "
						+ refMakeNameTable.toLowerCase()
						+ "  WHERE makecode='" + makeCode + "' ";
				ResultSet rsMakeName = st3.executeQuery(sqlMakename);
				if (rsMakeName.next())
					makeName = rsMakeName.getString(1);
				else
					makeName = "-";
				sqlDisplayDesc = "SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"tbl_"
						+ groupName.substring(0, 5).toLowerCase()
						+ "im_make" + makeCode + " where ItemCode='"
						+ itemCode + "'";
			} else {
				sqlDisplayDesc = "SELECT * FROM "+session.getAttribute("CompanyMasterID").toString()+"tbl_otherim_group"
						+ groupCode + " where ItemCode='" + itemCode
						+ "' ";
				makeName = "-";
			}
	        System.out.println(sqlDisplayDesc);
			ResultSet rsDisplayDesc = st3.executeQuery(sqlDisplayDesc);
	
			if (rsDisplayDesc.next())
			{
				    
			    a=makeName;
				System.out.println(a);
		        b=rsDisplayDesc.getString("Partno");
		      	System.out.println(b);
			    c=rsDisplayDesc.getString("Description");
				System.out.println(c);
			    h=rsEnqItems.getString("Quantity") ;
				System.out.println(h);
			    u=rsDisplayDesc.getString("SellingPrice");
				System.out.println(u);
			    
			    table.addCell(new Phrase(""+ i++ +"", FontFactory.getFont(FontFactory.TIMES_ROMAN, 8)));
			    table.addCell(new Phrase(""+ a +"", FontFactory.getFont(FontFactory.TIMES_ROMAN, 8)));
			    table.addCell(new Phrase(""+ b +"", FontFactory.getFont(FontFactory.TIMES_ROMAN, 8)));
			    table.addCell(new Phrase(""+ c +"", FontFactory.getFont(FontFactory.TIMES_ROMAN, 8)));
			    table.addCell(new Phrase(""+ h +"", FontFactory.getFont(FontFactory.TIMES_ROMAN, 8)));
			    table.addCell(new Phrase(""+ u +"", FontFactory.getFont(FontFactory.TIMES_ROMAN, 8)));
			   
			}
				
		}

		document.add(table);

		
Paragraph paratotal=new Paragraph();
paratotal.add(new Paragraph(" For Sales Dept. ",NormalFont));
paratotal.setAlignment("Right");
document.add(paratotal);

document.close();

DataOutput dataOutput = new DataOutputStream(response.getOutputStream());
byte[] bytes = buffer.toByteArray();
response.setContentLength(bytes.length);
for(int l = 0; l < bytes.length; l++)
{
dataOutput.writeByte(bytes[l]);
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