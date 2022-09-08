package com.CommentCon;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.T_commentDAO;
import com.FrontController.Command;

public class deleteCommentCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		int commentNum = Integer.parseInt(request.getParameter("commentNum"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		T_commentDAO dao = new T_commentDAO();
		int result = dao.deleteComment(commentNum);
		
		return "comment.jsp?pageNum="+pageNum ;
	}

}
