package com.ContentsCon;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.T_contentsDAO;
import com.FrontController.Command;

public class likesCon2 implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		int articleNum = Integer.parseInt(request.getParameter("articleNum"));
		int article = Integer.parseInt(request.getParameter("article"));
		T_contentsDAO dao = new T_contentsDAO();
		
		int cnt = dao.likes(articleNum);
		if(cnt>0) {
			System.out.println("좋아요 성공");
		}
		
		return "blog.jsp?article="+article;
	}

}
