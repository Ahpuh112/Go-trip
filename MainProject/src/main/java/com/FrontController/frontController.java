package com.FrontController;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.CommentCon.InsertCommentCon;
import com.CommentCon.deleteCommentCon;
import com.ContentsCon.likesCon;
import com.ContentsCon.likesCon2;
import com.ContentsCon.notLikeCon;
import com.ContentsCon.notLikeCon2;
import com.ContentsCon.writeInsertCon;
import com.MemberCon.JoinCon;
import com.MemberCon.LogOutCon;
import com.MemberCon.LoginCon;
import com.MemberCon.UpdateCon;


@WebServlet("*.do")
public class frontController extends HttpServlet {
	

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("프론트 컨트롤러 실행");
		// Client가 요청한 URL주소 가져오기
		String requestURI = request.getRequestURI();
		// 컨텍스트 패스(프로젝트 명) 가져오기
		String contextPath = request.getContextPath();
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		//클라이언트 요청 구분
		String requestUrl = requestURI.substring(contextPath.length());
		PrintWriter writer = response.getWriter();
		Command command = null;
		
		if(requestUrl.equals("/LoginCon.do")){
			System.err.println("로그인 요청");
			command = new LoginCon();
		}else if(requestUrl.equals("/LogOutCon.do")) {
			System.err.println("로그아웃 요청");
			command = new LogOutCon();
			writer.println("<script>alert('이 구역에서 떠나라 애송이'); location.href='"+"blogPreview.jsp"+"';</script>"); 
			
		}else if(requestUrl.equals("/JoinCon.do")) {
			System.err.println("회원가입 요청");
			command = new JoinCon();
		}else if(requestUrl.equals("/UpdateCon.do")) {
			System.err.println("회원정보 수정요청");
			command = new UpdateCon();
		}else if (requestUrl.equals("/likesCon.do")) {
			System.err.println("좋아요 요청");
			command = new likesCon();
		}else if (requestUrl.equals("/likesCon2.do")) {
			System.err.println("좋아요2 요청");
			command = new likesCon2();
		}else if (requestUrl.equals("/writeInsertCon.do")){
			System.out.println("글쓰기 요청");
			command = new writeInsertCon();
		}
		else if (requestUrl.equals("/notLikesCon.do")) {
	        System.err.println("좋아요취소 요청");
	        command = new notLikeCon();
        }
		else if (requestUrl.equals("/notLikesCon2.do")) {
	        System.err.println("좋아요취소2 요청");
	        command = new notLikeCon2();
        }
		else if (requestUrl.equals("/insertCommentCon.do")) {
			System.err.println("댓글삽입 요청");
			command = new InsertCommentCon();
		}else if (requestUrl.equals("/deleteCommentCon.do")) {
			System.err.println("댓글삭제 요청");
			command = new deleteCommentCon();
		}
		
		
		
		String moveUrl = command.execute(request, response);
		//로그인 실패시 alert 출력을 위한 쿼리
		if(moveUrl.equals("blogPreview.jsp?S")) {
			response.sendRedirect("blogPreview.jsp");
		}else if(moveUrl.equals("blogPreview.jsp?F")) {
			writer.println("<script>alert('일치하는 ID와 패스워드가 아닙니다.'); location.href='"+"loginJoin.jsp"+"';</script>"); 
		}else if(moveUrl.equals("UpdateSuccess")) {
			writer.println("<script>alert('회원 수정이 완료되었습니다.'); location.href='"+"myInfo.jsp"+"';</script>");
		}else if(moveUrl.equals("UpdateFailed")) {
			writer.println("<script>alert('회원 수정에 실패했습니다'); location.href='"+"myInfo.jsp"+"';</script>");
		}else {
			response.sendRedirect(moveUrl);
		}
		
		
		//로그아웃시에 alert출력을 위한 쿼리
		
		
		writer.close();
	}
	

}
