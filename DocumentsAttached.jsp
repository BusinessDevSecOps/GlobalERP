<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict/aaa/EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page language="java" import="java.sql.*" import=" java.text.*" import="java.util.*"  import="java.util.Date" errorPage="" %>

<%@ page import="java.util.Properties,javax.mail.*,javax.mail.internet.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*"%>
<%@ page
	import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
	<%@ page import = "java.io.FileOutputStream"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.jibble.simpleftp.*"%>
<%@ page language="java"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.List"%>

<%@ page language="java" import="java.sql.*" import=" java.text.*"
	import=" java.util.*" errorPage=""%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.io.*"%>
<%@ page
	import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="javax.mail.*" import="java.util.Properties"
	import="javax.mail.internet.InternetAddress"
	import="javax.mail.internet.MimeMessage"%>
<%@ page import="javax.servlet.http.HttpServletRequest"
	import="javax.mail.internet.MimeBodyPart"
	import="javax.mail.internet.MimeMultipart"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page
	import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="javax.activation.*"%>
<%@ page import="java.net.URL"%>
   <%@ page import="java.net.*"%>
   <%@page import="org.omg.PortableInterceptor.SYSTEM_EXCEPTION"%>
  <%@page import="java.io.FileInputStream"%>  
<%@page import="java.io.IOException"%>  
<%@page import="java.net.SocketException"%>  
<%@page import="org.apache.commons.net.ftp.FTPClient"%>
<%@page import="org.apache.commons.net.ftp.FTPReply"%>
<%!Connection con, conn, conftp;

	
	%>
<%
String fname=request.getParameter("documentName");

System.out.println("File NAme---->"+fname);
	
	String serverid = "", usernm = "", passwd = "";
	String f123 = "";
	String itemName = "", docPath = "", allfilename = "", DocumentName = "";
	int fileCount = 0;
	int doc_count = 0;
	int file_count = 0;
	String doctype1 = "", doctype2 = "", doctype3 = "", doctype4 = "", doctype5 = "", doctype6 = "", totaldocs = "";
	String resendMsg = "", customername = "", customercode = "", customerCity = "", customerContactPerson = "", filename = "";
	String paymentFolloywup = "", reply = "", fromdate1 = "", todate1 = "", comments = "", code = "", followUpStatus = "", followUptype = "", city = "", conperson = "", company = "", doctype = "";
	String preparation = "", followuptime = "", nextfollowuptime = "", nextfollowuptype = "", hrs = "", mins = "", inout = "";
	String spokento = "", expectedamnt = "", subject = "", tocc = "", expectedon = "", remarks = "", expdate = "", selectedEmail1 = "", selectedEmail2 = "", selectedEmail = "", fname1 = "", fname2 = "", fname3 = "", fname4 = "", fname5 = "", assignedwith = "";
	String sqlassign = "";
	String FileUploadPath = "";
	String meetingTime1="00:00:00",meetingTime2="00:00:00";
	String mailIDofLogger = (String) session.getAttribute("EmpEmail");
	File savedFile;
	String itemNames = "";
	int count1 = 0, count2 = 0, filecount = 0, count4 = 0, count5 = 0, complaintID = 0;
	String[] strpath = new String[5];
	String[] strtype = new String[5];//http://164.68.105.216:8080/Transworld/IwrdScanReport.jsp?data=20-Jan-2012&data1=27-Mar-2014&submit=Go
	
	int sendmsg = 0;
	String savefilestring = "", savefilename = "", savefilename1[] = null;
	String CurrentDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
			.format(new java.util.Date());
	String[] filename11 = new String[10];

	String[] filepath = new String[3];
	String[] filename1 = new String[3];

	/////  connection to ftp
	try {
		System.out.println("Inside FTP COnnection");
		//conftp = DriverManager.getConnection(DB_NAME, DB_USERNAME,DB_PASSWORD);
		Statement stmtftp1 = conftp.createStatement();

		//String sqlftp = "select * from "+session.getAttribute("CompanyMasterID").toString()+"ftpconnection";
		//ResultSet rsftp = stmtftp1.executeQuery(sqlftp);
		//rsftp.next();
		serverid = "192.168.2.55";//rsftp.getString("ServerID");
		usernm ="sumedh";//rsftp.getString("Username");
		passwd ="789&*(medh";//rsftp.getString("Password");
		System.out.println("IP:" + serverid + "Uname" + usernm
				+ "Passwd" + passwd);

	} catch (Exception e) {
		System.out.println("excee");
	}
	///
	//boolean flg = false; for FTP UP 
	
		//=====Copy 2 FTP===============================================================================================
		try {
			System.out.println("Inside COpy FTPPP" );
			
			//String ftpServerFilePath="/test/Quotation.pdf";
			//String ftpServerFilePath="/test/"+fname;
			String ftpServerFilePath="/ERPDocuments/"+fname;
			
			
				// get an ftpClient object  
				FTPClient ftpClient = new FTPClient();
				FileInputStream inputStream = null;
				try
				{
					ftpClient.connect("192.168.2.55");	
				}catch(Exception e)
				{
					System.out.println("client"+e.toString());
				}
				
				System.out.println("client");
				//// pass username and password, returned true if authentication is +usernm+":"+passwd+"@"+serverid+" 
				// successful  
				boolean login = ftpClient.login("sumedh","789&*(medh");
				System.out.println("LOGINSTATUS===>" + login);
				
				String Path=System.getProperty("user.home");// + "/Desktop";
				String dirName="INwardDocsRk";
				 final File homeDir = new File(System.getProperty("user.home"));
				    final File dir = new File(homeDir, dirName);
				    if (!dir.exists() && !dir.mkdirs()) {
				    	System.out.println("Dir"+dirName);
				        throw new IOException("Unable to create " + dir.getAbsolutePath());
				    }
				
				
				
				System.out.println("Path of Local Machine=====>"+Path+"Path of ftp server===>"+ftpServerFilePath+"PATH FOR STORING FILE ON LOCAL MAC"+Path+"/"+dirName+"/"+fname);

					if (login) {
						//File localFile = new File("/home/r_kunjir/Desktop/RK/"+fname+"");
						File localFile = new File(Path+"/"+dirName+"/"+fname);
						FileOutputStream fout = new FileOutputStream(localFile);
						System.out.println("===>"+localFile);
						boolean success = ftpClient.retrieveFile(ftpServerFilePath, fout);
						
						System.out.println("File STATUS===>" + success);
						if (success) {
							try
							{
										ServletContext ctx = getServletContext();
								        InputStream fis = new FileInputStream(localFile);
								        String mimeType = ctx.getMimeType(localFile.getAbsolutePath());
								        response.setContentType(mimeType != null? mimeType:"application/octet-stream");
								        response.setContentLength((int) localFile.length());
								        response.setHeader("Content-Disposition", "attachment; filename=\"" + fname + "\"");
								 
								        ServletOutputStream os       = response.getOutputStream();
								        
								        
								        
								        byte[] bufferData = new byte[1024];
								        	        int read=0;
								        	        while((read = fis.read(bufferData))!= -1){
								        	            os.write(bufferData, 0, read);
								        	        }
								        	        os.flush();
								        	        os.close();
								        	        fis.close();
								        	       System.out.println("File downloaded at client successfully");
							}catch(Exception e)
							{
								System.out.println("EXCCCCPTT123"+e.toString());
							}
							
							
							
							
						    fout.flush();
						    fout.close();
						    System.out.println("File downloaded at client successfully1111");
						//    response.sendRedirect("alertGoTo.jsp?msg=File Downloaded successfully On Path"+Path+"/"+dirName+" &goto=IwrdScanReport.jsp");
						} else {
						    System.out.println("Reterive failure");
						   response.sendRedirect("alertGoTo.jsp?msg=Error in downloading File &goto=home.jsp");
						}
							}

					
					
					//====Check If File Exist=================================================
					
					//========================================================================
				
		} catch (Exception e) {
			System.out.println("Exception Copy File to FTP----------->>"
							+ e + "ftppp");
			
			//response.sendRedirect("alertGoTo.jsp?msg=Exception in downloading File &goto=IwrdScanReport.jsp");
			
		

	}
%>
</body>
</html>