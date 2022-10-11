<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@page import="java.util.Date.*"%>
<%@page import="java.util.Calendar"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.*"%>
<%@ page
	import="java.util.Properties,javax.mail.*,javax.mail.internet.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFDateUtil"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@ page import="java.io.FileNotFoundException"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import="java.io.IOException"%>
<%@ page import="javax.activation.*"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.math.BigDecimal"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.StringTokenizer"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<script>
function Redirect(Shipment)
{
	
	
	location.assign("UploadAttendance.jsp?msg="+Shipment);


   
	
}

function Redirect1()
{
	
	
	alert("Please Upload Standard Format!!");
	
	location.assign("UploadAttendance.jsp");


   
	
}

</script>
<%
	String file1 = "";
	int saveflag = 1;
	File savedFile = null;
	String[] filepath = new String[10];
	String[] filename = new String[10];
	int count2 = 0, filecount = 0;
	String ShipmentNumber = "";
	String ShipmentNumber1 = "";

	int count = 1;
	String savefilestring = "";
	String uploadedBy = "";

	String user = session.getValue("dispalyname").toString();

	int count1 = 0;
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	System.out.println("\n\n ismultipart-->>" + isMultipart);
	if (!isMultipart) {
		System.out.println("\n\nin multipart..");
	} else {
		System.out.println("\n\n in else with  multipart..");
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		List items = null;
		try {
			items = upload.parseRequest(request);
			//      System.out.print("\n\n items==>"+items);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		Iterator itr = items.iterator();

		while (itr.hasNext()) {
			FileItem item = (FileItem) itr.next();
			if (item.isFormField()) {
				String name1 = item.getFieldName();
				System.out.print("\n name==>" + name1);
				String value = item.getString();
				System.out.print("\n value==>" + value);

			} else {
				try {

					String itemName = item.getName();
					System.out.print("\n\nitemName==>" + itemName);
					file1 = itemName;
					if (itemName.equalsIgnoreCase("")) {
					} else {

						// savedFile = new File("/home/user/Desktop/TaskReport/"+itemName);  
						savedFile = new File("/home/twtech/" + itemName);

						System.out.print("\n\nsavedFile==>" + savedFile);
						item.write(savedFile);
						filepath[filecount] = "" + savedFile;

						filename[filecount] = itemName;
						filecount++;
						if (saveflag == 1) {
							savefilestring = "" + savedFile;
							saveflag++;
						} else
							savefilestring = savefilestring + "," + savedFile;
						//out.print("successfully saved the file");
						//File file = new File(savedFile);
						String screenshot = savedFile.getAbsolutePath();
						// System.out.println("\n\nscreenshot--->>>"+screenshot);
					}

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

	}
	//=============================excel reading code========================
	try {

		//get connection
		Connection conne = null;
		Statement stat = null, stat1 = null, stat2 = null;
		String userid = "";

		String MM_dbConn_DRIVER = "org.gjt.mm.mysql.Driver";
		String MM_dbConn_USERNAME = "fleetview";
		String MM_dbConn_PASSWORD = "1@flv";
		//String MM_dbConn_STRING = "jdbc:mysql://173.234.153.82:3306/db_gps";
		String MM_dbConn_STRING = "jdbc:mysql://localhost/db_gps";

		try {
			Class.forName(MM_dbConn_DRIVER);

			Connection con2 = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME,
					MM_dbConn_PASSWORD);
			stat = con2.createStatement();
			stat1 = con2.createStatement();
			stat2 = con2.createStatement();

		} catch (Exception e) {
			e.printStackTrace();
		}

		//select the taskowner and task creator

		String fname = "/home/twtech/" + file1;
		//String fname = "/home/user/Desktop/TaskReport/"+file1;

		System.out.println("The filename is :" + file1);
		System.out.println("The filepath is :" + fname);

		List sheetData = new ArrayList();
		FileInputStream fis = null;
		try {

			fis = new FileInputStream(fname);
			HSSFWorkbook workbook = new HSSFWorkbook(fis);
			HSSFSheet sheet = workbook.getSheetAt(0);
			Iterator rows = sheet.rowIterator();
			while (rows.hasNext()) {
				HSSFRow row = (HSSFRow) rows.next();
				Iterator cells = row.cellIterator();

				List data = new ArrayList();
				while (cells.hasNext()) {
					HSSFCell cell = (HSSFCell) cells.next();
					data.add(cell);

				}

				sheetData.add(data);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (fis != null) {
				fis.close();
			}
		}
		//show excel data=====
		//	System.out.println("The >>>>>>>>>>>>is :");

		int cnt = 0;
		boolean msgpgflg = false;
		ArrayList al = new ArrayList();
		String rjtask = "";
		String seventhdt = "";
		// Iterates the data and print it out to the console.	
		for (int i = 1; i < sheetData.size(); i++) {
			//cnt++;
			String row = "";
			List list = (List) sheetData.get(i);

			try {
				//System.out.println( "IN ntry   ");
				for (int j = 0; j < list.size(); j++) {
					HSSFCell cell = (HSSFCell) list.get(j);

					System.out.println("The cell type is :" + cell.getCellType());

					if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
						System.out.println("IN IFFFFFFFFF    ");
						if (HSSFDateUtil.isCellDateFormatted(cell)) {
							System.out.print(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
									.format(cell.getDateCellValue()));
							System.out.println("hibhihihihih>>>>" + cell.getDateCellValue());
							if (row.equals("")) {
								//System.out.println( "IN another iff ");
								row = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
										.format(cell.getDateCellValue());
							} else {
								row = row + "$" + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
										.format(cell.getDateCellValue());
							}
						} else {
							//	System.out.println( "INanothsr    ELS SSSSSSS ");
							System.out.print(new BigDecimal(cell.getNumericCellValue()).toString());
							if (row.equals("")) {
								row = new BigDecimal(cell.getNumericCellValue()).toString();
							} else {
								row = row + "$" + new BigDecimal(cell.getNumericCellValue()).toString();
							}
						}

					}

					else {
						//System.out.println( "IN mainn     ELS SSSSSSS ");
						System.out.print(cell.toString());
						if (row.equals("")) {
							row = cell.toString();
						} else {
							row = row + "$" + cell.toString();
						}
					}

				}
			} catch (Exception ioe) {
				System.out.println("The exception is :" + ioe);
				ioe.printStackTrace();
			}
			//code for row
			System.out.println("\nThe row is >>  " + row);

			//Insert Row into database
			String ShipmentDate = "", RouteDescription = "", task = "", ContainerId = "",
					status = "", comletionDate = "";
			String task_duration = "", duration = "";
			String Description = "";
			DecimalFormat twoDForm1 = new DecimalFormat("##.##");
			int countFeild = 0;
			try {

				StringTokenizer stringTokenizer = new StringTokenizer(row, "$");
				System.out.println("The total no. of tokens generated :  " + stringTokenizer.countTokens());
				countFeild = stringTokenizer.countTokens();

				
				
				if (stringTokenizer.countTokens() == 4) {
					System.out.println("INN");

					ContainerId = stringTokenizer.nextToken();
					ShipmentNumber = stringTokenizer.nextToken();
					Description = stringTokenizer.nextToken();
					ShipmentDate = stringTokenizer.nextToken();
					

					System.out.println("The Contract ID  is **:" + ContainerId);

					System.out.println("The DateTime  is **:" + ShipmentNumber);
					
					System.out.println("The Status is :**" + ShipmentDate);
				}
				
				//Trim the  white space
				
				ShipmentNumber = ShipmentNumber.trim();
				Description = Description.trim();
				ShipmentDate = ShipmentDate.trim();
				
				ContainerId = ContainerId.trim();

				if(ShipmentDate.equalsIgnoreCase("I"))
						{
					ShipmentDate="In";
						}else if(ShipmentDate.equalsIgnoreCase("O"))
						{
							ShipmentDate="Out";
						}
				
				try {
				//	ShipmentDate = ShipmentDate.replaceAll("/", "-");
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

					Calendar cal = Calendar.getInstance();
					/* String today = dateFormat.format(cal.getTime());
					System.out.println("today::"+today); */
					String sql1 = "",Username="";
					cnt++;
					String sql3 = "Select uname,ReportTime,Exittime from db_leaveapplication.t_leaveadmin where empid='" + ContainerId + "'";
                    System.out.println("sql2-->" + sql3);
                    final ResultSet rs3 = stat.executeQuery(sql3);
                    if (rs3.next()) {
                        Username = rs3.getString("uname");
                    }
                    status = "Approved";

					String ssql = "select * from db_leaveapplication.t_checkinout where empid='"+ContainerId+"' and checkindatetime='"+ShipmentNumber+"' and checkintype='"+ShipmentDate+"'";
					
					System.out.println("ssqllllllllllllll:"+ssql);
					ResultSet rst = stat1.executeQuery(ssql);

					if (rst.next()) {
						
//update 
System.out.println("Attendace Data Exists :");
						 
						msgpgflg = true;

					} else {

						//insert 
						String InData="insert into db_leaveapplication.t_checkinout (empid,empname,checkindatetime,checkdate,checktime,Office,Status,checkintype) values ('" + ContainerId + "','" + Username + "','" + ShipmentNumber + "',DATE('" + ShipmentNumber + "'),TIME('" + ShipmentNumber + "'),'Attendece Machine','" + status + "','"+ShipmentDate+"') ";
						
						System.out.println("Attendace Data Insertion :"+InData);
						
						stat2.executeUpdate(InData);
						msgpgflg = true;
					}

					

				} catch (Exception e) {
					System.out.println("Exception " + e);
					e.printStackTrace();
				}
			} catch (Exception e) {
				System.out.println("exceptionnnn===>>" + e);
			}

		} //end of for loop of show excel data

		System.out.println("The total number of records in the excel sheet :" + cnt);

		

		
		if (msgpgflg == false) {
			//session.setAttribute("al",al);
			//response.sendRedirect("alertGoTo.jsp?msg=Tasks with from dates "+rjtask+" were rejected&goto=uploadTask.jsp");
			//response.sendRedirect("alertGoTo.jsp?msg=Please Upload Standard Format!!&goto=UploadShipment.jsp");
			//out.println("<script>  Redirect('"+ShipmentNumber1+"');</script>");
		}
		else
		{
			ShipmentNumber1="Done";
			out.println("<script>  Redirect('"+ShipmentNumber1+"');</script>");
			

		}
	} catch (Exception e) {
		System.out.println("Th exception is >>>>>" + e);

	}
%>