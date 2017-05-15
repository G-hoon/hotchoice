package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

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

import com.entity.BoardDTO;
import com.entity.MemberDTO;
import com.entity.VoteDTO;
import com.service.BoardService;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/BoardWriteServlet")
public class BoardWriteServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		String title = map.get("title");
		String author = map.get("author");
		String content = map.get("content");
		////
		
		String vcontent1 = map.get("content1");
		String vcontent2 = map.get("content2");
		String vcontent3 = map.get("content3");
		String vcontent4 = map.get("content4");
		String vcontent5 = map.get("content5");
		//
		////////////////
		BoardDTO dto = new BoardDTO();
		dto.setTitle(title);
		dto.setAuthor(author);
		dto.setContent(content); 
		////////////////////////////////////
		//////////////////////////////
		HttpSession session = request.getSession();
		MemberDTO mDTO =  (MemberDTO)session.getAttribute("login");
		dto.setUserid(mDTO.getUserid()); 
		//vto.setUserid(mDTO.getUserid());
		////////////////////// 
		
		//////////////////////////////////////////////////
		System.out.println("list : "+list);
		String vimage1 = list.get(0);
		String vimage2 = list.get(1);
		String vimage3 = list.get(2);
		String vimage4 = list.get(3);
		String vimage5 = list.get(4);
		/////////////////////////
		BoardService service = new  BoardService();
	
		ArrayList<VoteDTO> vto2 = new  ArrayList<>();
		vto2.add(new VoteDTO(dto.getNum(), mDTO.getUserid(), vcontent1, vcontent2, vcontent3, vcontent4, vcontent5, 
				vimage1, vimage2, vimage3, vimage4, vimage5));
		service.boardWrite(dto);
		service.voteWrite(vto2);
		//////////////////////////
		response.sendRedirect("BoardListServlet");
		
		
		
	}

}
