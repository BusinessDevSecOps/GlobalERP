package com.erp.beans;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;

import com.erp.beans.ExcelFollowupReader;
import com.erp.beans.DisplayData;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class FileUpload {

	private HashMap<String, String> formValues;
	private String fileNameDb;
	ArrayList<DisplayData> dispList;
	@SuppressWarnings("unchecked")
	public ArrayList<DisplayData> uploadFile(HttpServletRequest request,String directory)  throws Exception,org.apache.commons.fileupload.FileUploadBase.FileSizeLimitExceededException 
	{
		
		try{
			
			System.out.println("IN FILEUPLOAD PAGE     >>>  ");
			// Check that we have a file upload request
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			if(!isMultipart){
				System.out.println("Request not multipart/form-data.");
			}

			// Create a factory for disk-based file items
			DiskFileItemFactory factory = new DiskFileItemFactory();

			// Set factory constraints
			factory.setSizeThreshold(4096);
			factory.setRepository(new File(directory+"/"));

			// Create a new file upload handler
			ServletFileUpload upload = new ServletFileUpload(factory);

			// Set overall request size constraint
			upload.setSizeMax(5192000);


			// Parse the request
			List<FileItem> items;
			items = upload.parseRequest(request);

			if(items != null
					&& !items.isEmpty()){
				formValues = new HashMap<String, String>();
				// Process the uploaded items
				Iterator<FileItem> iter = items.iterator();
				while (iter.hasNext()) {
					FileItem item = (FileItem) iter.next();


					// Process a regular form field
					if (item.isFormField()) {

					}
					// Process a file upload
					else {
						//String fieldName = item.getFieldName();
						String firstpart=null,lastpart=null;
						String fileName = item.getName();
						StringTokenizer st=new StringTokenizer(fileName,".");
						if(st.hasMoreTokens()){
						firstpart=st.nextToken();
					    System.out.println("fistpart"+firstpart);
						lastpart=st.nextToken();
						 System.out.println("lastpart"+lastpart);
						 if(lastpart.contains("xls")){
							 System.out.println("xls file is uploaded");
						 }else{
							 System.out.println("wrong file format");
						 }
						}
						System.out.println("filename==&>"+fileName);
						
						//String contentType = item.getContentType();
						//boolean isInMemory = item.isInMemory();
						//long sizeInBytes = item.getSize();//
						//edit fileName
						if(lastpart.contains("xls")){
						if(fileName.length()>0 && !fileName.equalsIgnoreCase("null")){
							fileName = fileName.substring(fileName.lastIndexOf("\\") + 1, fileName.length());
							fileNameDb = new String("/uploadedExcelFiles/" + fileName);
							String fileNameUpload = new String(directory +"/"+ fileName);

							item.write(new File(fileNameUpload));
							ExcelFollowupReader followupExample = new ExcelFollowupReader ();
							String  xlsPath    = fileNameUpload;
                 
						 dispList=followupExample.displayFromExcel (xlsPath);
						 System.out.println("display list################>"+dispList);
						 fileNameDb="xls file format";
						}
						else {
							fileNameDb = "No Image Selected";
						}
						}else{
							fileNameDb="Wrong file format";
							System.out.println("fileNameDb"+fileNameDb);
						//	request.setAttribute("FileFormat",fileNameDb);
						}
					}
				}
			}
		}catch (Exception e) {
			fileNameDb = "error while uploading file";
			e.printStackTrace();
		}
		
		return dispList;
	}

	public String getString(String str) {
		String value = null;
		if(formValues != null && !formValues.isEmpty()){
			value = formValues.get(str);
		}
		return value;
	}

}