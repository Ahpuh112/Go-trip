package com.ContentsCon;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.T_contentsDAO;
import com.FrontController.Command;

public class likesCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		int articleNum = Integer.parseInt(request.getParameter("articleNum"));
		T_contentsDAO dao = new T_contentsDAO();
		
		int cnt = dao.likes(articleNum);
		if(cnt>0) {
			System.out.println("좋아요 성공");
		}
		
		return "blogPreview.jsp";
	}

}
