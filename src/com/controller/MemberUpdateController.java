package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.entity.MemberDTO;
import com.exception.CommonException;
import com.service.BoardService;
import com.service.MemberService;

/**
 * Servlet implementation class HomeController
 */
@WebServlet("/MemberUpdateController")
public class MemberUpdateController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		// Create a factory for disk-based file items
		DiskFileItemFactory factory = new DiskFileItemFactory();

		// Configure a repository (to ensure a secure temp location is used)
		ServletContext servletContext = this.getServletConfig().getServletContext();
		File repository =  (File) servletContext.getAttribute("javax.servlet.context.tempdir");
		factory.setRepository(repository);

		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);
		ArrayList<String> list = new ArrayList<String>();
		HashMap<String, String> map = new HashMap<>();
		// Parse the request
		List<FileItem> items = null;
		try {
			items =upload.parseRequest(request);
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		////////////////////////////////////////////////
		String fieldValue = null;
		String fileName = null;
		long fileSize = 0;
		Iterator<FileItem> ite = items.iterator();
		while(ite.hasNext()){
			FileItem fileItem = ite.next();
		   if(fileItem.isFormField()){ // type="file" 아님
			   String fieldName = fileItem.getFieldName();
			    fieldValue = fileItem.getString("UTF-8");
			   // System.out.println(fieldName+"  /  "+fieldValue);	  
			    if(fieldValue == null){
			    	System.out.println("null: "+fieldValue);
			    	
			    } else {
			    	map.put(fieldName, fieldValue);
			    }
			    
		   }else{   // type="file" 
			    fileName = fileItem.getName();
			    fileSize = fileItem.getSize();
			   
			   File f = new File("c:\\temp\\upload", fileName);		   
			   
			try {
				list.add(fileItem.getName());
				if(fieldValue != null){
				fileItem.write(f);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
					   
				   }//end else
				
				}//end whiles
		/////////////////////////////////////////////////
		
		 HttpSession session = request.getSession();
		 MemberDTO mto = (MemberDTO)session.getAttribute("login");
	    MemberService service = new MemberService();
		String passwd = map.get("passwd");
		String nickname = map.get("nickname");
		String userid = mto.getUserid();
		String picture = list.get(0);        
		System.out.println();
		String target = "";
        try {
			service.upadteMember(map);
			target = "Home"; //HomeController
			session.invalidate();
		} catch (CommonException e) {
			target = "error.jsp";
			request.setAttribute("message", e.getMessage());
			request.setAttribute("link", "MemberFormController");
		}

        RequestDispatcher dis = request.getRequestDispatcher(target);
        dis.forward(request, response);
        
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
