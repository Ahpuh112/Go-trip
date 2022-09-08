package com.CommentCon;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.T_commentDAO;
import com.FrontController.Command;

public class InsertCommentCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int pageNum = Integer.parseInt(request.getParameter("articleNum"));
		String comment = request.getParameter("comment");
		String nick = request.getParameter("nick");
		
		T_commentDAO dao = new T_commentDAO();
		int result = dao.setComment(pageNum, comment, nick);

		
		return "comment.jsp?pageNum="+pageNum;
	}

}
