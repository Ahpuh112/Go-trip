package com.MemberCon;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.T_memberDAO;
import com.FrontController.Command;

public class UpdateCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		String result= null;
		
		String id = request.getParameter("id");
		String pw = request.getParameter("newPw");
		
		String mbti = request.getParameter("newMbti");
		
		T_memberDAO dao = new T_memberDAO();
		
		int cnt = dao.update(id, pw, mbti);
		
		if(cnt>0) {
			System.err.println("수정 성공");
			result = "UpdateSuccess";
		}else {
			System.err.println("수정 실패");
			result = "UpdateFailed";
		}
		
		return result;
	}

}
