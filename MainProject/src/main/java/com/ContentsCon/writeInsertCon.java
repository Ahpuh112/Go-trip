package com.ContentsCon;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.T_contentsDAO;
import com.FrontController.Command;
import com.VO.T_memberVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class writeInsertCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		T_memberVO vo = (T_memberVO)session.getAttribute("vo");
		
		String path ="C:\\Users\\Administrator\\Desktop\\imgs";
		
		MultipartRequest mr;
		try {
			mr = new MultipartRequest(request, path, 1024*1024*1024, "utf-8", new DefaultFileRenamePolicy());
			System.out.println("저장되는 경로(실제 서버) : "+path);
			String fileName = mr.getFilesystemName("image");
			System.out.println("사진 이름 : "+fileName);
			
		    String title = mr.getParameter("title");
			String content = mr.getParameter("content");
			String mbti = mr.getParameter("mbti");		
			String mem_id = vo.getId();
			String nick = vo.getNick();
			path = "/tomcatImg/"+fileName;
			
			T_contentsDAO dao = new T_contentsDAO();
			
			int result = dao.setWrite(title, content, mem_id, nick, path, mbti);
			
			if(result>0) {
				System.out.println("글쓰기 전송 성공");
			}else {
				System.out.println("글쓰기 전송 실패");
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}

	    return "blogPreview.jsp";

	}

}
