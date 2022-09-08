package com.ContentsCon;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.T_contentsDAO;
import com.FrontController.Command;

public class notLikeCon2 implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		int articleNum = Integer.parseInt(request.getParameter("articleNum"));
		int article = Integer.parseInt(request.getParameter("article"));
		T_contentsDAO dao = new T_contentsDAO();
		
		int cnt = dao.notLikes(articleNum);
		if(cnt>0) {
			System.out.println("좋아요취소 성공");
		}
		
		return "blog.jsp?article="+article;
		
		
	}

}
