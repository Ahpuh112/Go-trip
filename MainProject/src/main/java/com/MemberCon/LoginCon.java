package com.MemberCon;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.T_memberDAO;
import com.FrontController.Command;
import com.VO.T_memberVO;

public class LoginCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String id = request.getParameter("email");
		String pw = request.getParameter("pw");
		
		T_memberDAO dao = new T_memberDAO();
		T_memberVO vo = dao.login(id, pw);
		
		if(vo!=null) {
			System.err.println("로그인 성공");
			HttpSession session = request.getSession();
			session.setAttribute("vo", vo);
			return "blogPreview.jsp?S";
		}else {
			System.err.println("로그인 실패");
			return "blogPreview.jsp?F";
		}
		
		
	}

}
