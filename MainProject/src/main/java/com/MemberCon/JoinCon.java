package com.MemberCon;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.T_memberDAO;
import com.FrontController.Command;

public class JoinCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		String nick = request.getParameter("name");
		int birthYear =  Integer.parseInt(request.getParameter("birthyy"));  
		String mbti = request.getParameter("mbti");
		
		T_memberDAO dao = new T_memberDAO();
		
		int cnt = dao.join(id, pw, nick, birthYear, mbti);
		
		if(cnt>0) {
			System.err.println("회원가입 성공");
		}else {
			System.err.println("회원가입 성공");
		}
		
		
		return "loginJoin.jsp";
	}

}
