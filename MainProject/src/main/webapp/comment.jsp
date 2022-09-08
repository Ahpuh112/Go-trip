<%@page import="com.DAO.T_contentsDAO"%>
<%@page import="com.VO.T_memberVO"%>
<%@page import="com.VO.T_commentVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.T_commentDAO"%>
<%@page import="com.VO.T_contentsVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	/* String getArticleNum = String.valueOf(session.getAttribute("articleNum")); */
	T_memberVO vo = (T_memberVO)session.getAttribute("vo");
	int articleNum = Integer.parseInt(request.getParameter("pageNum"));
	T_commentDAO dao= new T_commentDAO(); 
	T_contentsDAO dao2 = new T_contentsDAO();
	
	ArrayList<T_commentVO> list = null;
	list = dao.getCommentList(articleNum);
	String thisNick = null;
	if(vo!=null){
		thisNick = vo.getNick();
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>MBTrIp - comment</title>
<link rel="stylesheet" href="assets/css/comment.css" />
<style type="text/css">


	#buttonss:hover{
		box-shadow: inset 0 0 0 1px #2ebaae;
	    color: #2ebaae !important;
	    border-color: #2ebaae !important;
	    
	    border: 0;
	}
</style>
</head>
<body>
	<%if(vo==null){%>
		<h2  style="color: #3c3b3b;">※댓글 기능은 로그인 사용자만 이용할 수 있습니다.</h2>
	<% }else{ %>
	
		<%-- <h3><%=vo.getNick() %></h3> --%>
	
		<form action="insertCommentCon.do?articleNum=<%=articleNum %>&nick=<%=vo.getNick() %>" method="post">
			<textarea name="comment" id="input1" rows="3" cols="100"  placeholder="댓글을 입력해주세요" style="width: 980px;height: 60px;resize: none; "></textarea>
			<button id="buttonss" onclick="reload()" style=" position: relative; bottom:20px; height: 50px; cursor: pointer;">
			댓글 입력
			</button>
		</form>
		<br>
	<%} %>
		<table>
	        <tr>
	            <th>내용</th>
	            <th style="text-align: center;">닉네임</th>
	            <th style="text-align: center;">날짜</th>
	            <th></th>    
	        </tr>
		<%if(list!=null){ %>
			<%for (int i = 0; i<list.size(); i++){ %>
				<tr>
					<td> ↪ <%=list.get(i).getComment() %></td>
		            <td style="width: 150px; text-align: center;"><%=list.get(i).getNick() %></td>  
		            <td style="width: 150px; text-align: center;"><%=list.get(i).getDate().substring(0, 10) %></td>
		            <td style="width: 50px; text-align: center;">
		            <%if(list.get(i).getNick().equals(thisNick)){ %>
		            <a href="deleteCommentCon.do?pageNum=<%=list.get(i).getPageNum()%>&commentNum=<%=list.get(i).getCommentNum() %>" onclick="reload()">✖</a>
		             <%} %>
		            </td>
		        </tr>
			<%} %>	
		<%} %>
	</table>
	
	
	
	
	
	<script>
		function reload() {
			window.parent.location.reload();
		}
	</script>
	


</body>
</html>