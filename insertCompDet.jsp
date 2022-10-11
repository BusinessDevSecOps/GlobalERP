<%@page import="java.util.Date"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.io.output.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>

<%@ page import="java.util.*"%>

<%@include file="conn.jsp" %>
 <% System.out.println("\n********===== insertCompDet.jsp ====*********");
 
 Class.forName(DB_Driver);	
 Connection conn = DriverManager.getConnection(DB_NAME,DB_USERNAME,DB_PASSWORD);
 Connection conn1 = DriverManager.getConnection(DB_NAME1,DB_USERNAME,DB_PASSWORD);
 
 Statement st=conn.createStatement();
 Statement st1=conn.createStatement();
 Statement st2=conn.createStatement();
 Statement st3=conn.createStatement();
 Statement stchkun=conn.createStatement();
 Statement stun=conn.createStatement();
 
 
 Statement newST=conn1.createStatement();
 Statement stexe=conn.createStatement();
 Statement stCompID=conn.createStatement();
 
 
 String  action="",companyName="",empName="",compGdAdd="",compAdd="",compCst="",compBst="",phno="",faxno="",
		 email="",website="",panno="",date="",sendMsg="",sessionUserName="", uProperty="", adn="", uadn="", adnemail="", password="";
 int compCode=0;
 byte[] itemName=null;
 String Sysdate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
 boolean isMultipart = ServletFileUpload.isMultipartContent(request);
 if (!isMultipart)
 {
 }
 else
 {
   FileItemFactory factory = new DiskFileItemFactory();
   ServletFileUpload upload = new ServletFileUpload(factory);
   List items = null;
   try
   {
           items = upload.parseRequest(request);
   }
   catch (FileUploadException e)
   {
           e.printStackTrace();
   }
   Iterator itr = items.iterator();     //this will create iterator object from list..used for traversing the data.
   
   
   while (itr.hasNext())
   {
       FileItem item = (FileItem) itr.next();
     
       if (item.isFormField())   //checking if its normal field then we read as normal. no need to store in disc
        {
                    String name = item.getFieldName();
                   String value = item.getString();
                                       
                   if(name.equals("compName"))
                   {
                	   companyName=value;
                          
                    }
                   
                   if(name.equals("phNo"))
                   {
                	   phno=value;
                          
                    }
                   if(name.equals("compAdd"))
                   {
                	   compAdd=value;
                          
                    }
                   
                   if(name.equals("compGdAdd"))
                   {
                	   compGdAdd=value;
                          
                    }
                   
                   if(name.equals("compCstno"))
                   {
                	   compCst=value;
                          
                    }
                   
                   if(name.equals("compBstno"))
                   {
                	   compBst=value;
                          
                    }
                   
                   if(name.equals("faxNo"))
                   {
                	   faxno=value;
                          
                    }
                   
                   if(name.equals("email"))
                   {
                	   email=value;
                          
                    }
                   
                   if(name.equals("website"))
                   {
                	   website=value;
                          
                    }
                   
                   if(name.equals("uadn"))
                   {
                	   uadn=value;
                          
                    }
                   
                   if(name.equals("adn"))
                   {
                	   adn=value;
                          
                    }
                   if(name.equals("adnemail"))
                   {
                	   adnemail=value;
                   }
                            
        }
   
        else                                      //this else part for process about PDF file
         {
            try
            {
   
                itemName = item.get();    //this will return the pdf file name
               
               System.out.println("b==="+itemName);
              
            /* {
                   b = itemName.getBytes();
                   System.out.println("b==="+b);
               }*/
                   
            
            }catch(Exception ste)
            {
                out.println(ste);
            }
          }
      }
   
      
   }
	 	 
	 System.out.println("Admin User Name===="+adn);
	 System.out.println("User Name===="+uadn);
	 System.out.println("Admin Email ID===="+adnemail);		
	 byte[] b=null;
 	try
	 { 	
 		System.out.println("Checking Company Name and User Name ..."); 
 		String sqlchk="select * from CompanyMaster where Companyname='"+ companyName +"'";
 		String sqlchkun="select * from UserMaster where UserName='"+ adn +"'";
 		ResultSet rschkun=stchkun.executeQuery(sqlchkun);
 		ResultSet rschk=st1.executeQuery(sqlchk);
 		
 		if(rschk.next())
 		{
 			sendMsg="Company already exist";
 			response.sendRedirect("createComp.jsp?sendMsg="+sendMsg);
 		}
 		else if(rschkun.next())
 		{
 			sendMsg="User already exist";
 			response.sendRedirect("createComp.jsp?sendMsg="+sendMsg);
 		}
 		else
 		{
 		  System.out.println("Comapny Creating.....!");	  
 		  System.out.println("after image input ");

 		  String sql="insert into CompanyMaster (Companyname, address, godownaddress, phone, fax, emailid, website, cstno, bstno, logo) values(?,?,?,?,?,?,?,?,?,?)";
 		  System.out.println(sql);
 		  PreparedStatement pre=conn.prepareStatement(sql);
 		  pre.setString(1,companyName);
 		  pre.setString(2,compAdd);
 		  pre.setString(3,compGdAdd);
 		  pre.setString(4,phno);
  	 	  pre.setString(5,faxno);
   		  pre.setString(6,email);
  		  pre.setString(7,website);
   		  pre.setString(8,compCst);
  		  pre.setString(9,compBst);
  	 	  pre.setBytes(10,itemName);
 		  pre.executeUpdate();
 		  System.out.println("Company Added Successfully!");
 		  pre.close();
 	  
 		  
 		String sqlCompid="select companymid from CompanyMaster where Companyname='"+companyName+"'";
 		
 		ResultSet rsCompID=stCompID.executeQuery(sqlCompid);
 		
 		String CompanyID="";
 		while(rsCompID.next())
 		{
 			CompanyID=rsCompID.getString(1);
 		}
 		
 		  System.out.println("Adding Admin User......");
		  String aun="insert into UserMaster (UserName, Password, UserLevel, Dept, companymasterid, EmpName, email, ActiveStatus) values (?,?,?,?,?,?,?,?)";
		  System.out.println(aun);
		  password=adn;
		  PreparedStatement preaun=conn.prepareStatement(aun);
		  preaun.setString(1,adn);
		  preaun.setString(2,password);
		  preaun.setString(3,"Level5");
		  preaun.setString(4,"Accounts");
		  preaun.setString(5,CompanyID);
		  preaun.setString(6,uadn);
		  preaun.setString(7,adnemail);
		  preaun.setString(8,"Yes");
		  
		  preaun.executeUpdate();
		  preaun.close();
		  
		  System.out.println("Admin User Added Successfully!");
 		
    	System.out.println("Tables Copying......");
  		System.out.println("New Comapny Id" + CompanyID);
 		String OldDataBaseName="db_GlobalERP";
 		String NewDataBaseName="NewBlankERP";
 		String sqlshow="show tables";
 		ResultSet rsshow= newST.executeQuery(sqlshow);
 		while(rsshow.next())
 		{
 			String col=rsshow.getString(1);
 			String sqlCreate="CREATE TABLE "+ OldDataBaseName + "."+CompanyID+col+ " like "+ NewDataBaseName+"."+col;
 			System.out.println(sqlCreate);
 			stexe.executeUpdate(sqlCreate);
 		}
 		System.out.println("Tables Copyied......");
 		
 		System.out.println("Records Inserting into "+CompanyID+"security table......");
 		String aun1="insert into "+CompanyID+"security (UserName, Password, UserLevel, Dept, EmpName, email, ActiveStatus) values (?,?,?,?,?,?,?)";
 		PreparedStatement preaun1=conn.prepareStatement(aun1);
		  preaun1.setString(1,adn);
		  preaun1.setString(2,password);
		  preaun1.setString(3,"Level5");
		  preaun1.setString(4,"Accounts");
		  preaun1.setString(5,uadn);
		  preaun1.setString(6,adnemail);
		  preaun1.setString(7,"Yes");
		  
		  preaun1.executeUpdate();
		  preaun1.close();
		  System.out.println("Records Inserted......");

 		System.out.println("All Process Done");

 		sendMsg="Company Added successfully and Comapany Id="+ CompanyID;
 		
 		response.sendRedirect("alertGoTo.jsp?msg="+sendMsg+"&goto=createComp.jsp");
 		}
 	}
	catch(Exception e)
	{ 
		  System.out.println("****** Exception ******* "+e);
	  } 
%>