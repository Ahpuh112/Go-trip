package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.VO.T_commentVO;
import com.VO.T_contentsVO;

public class T_commentDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	T_commentVO vo = null;
	int cnt;
	
	
	public void getConn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 동적로딩
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String dbid = "gjai_5_1_0822";
			String dbpw = "smhrd1";
			conn = DriverManager.getConnection(url, dbid, dbpw);
			// DB연결
			System.out.println("db연결성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e2) {
			e2.printStackTrace();
		}

	}
	public int setComment(int pageNum, String comment, String nick) {
		int result = 0;
		
		try {
			getConn(); // 연결
			
			String sql = "insert into t_comment values (t_comment_seq.nextval, ?, ?, current_date, ?)";
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, pageNum);
			psmt.setString(2, comment);
			psmt.setString(3, nick);
			
			
			result = psmt.executeUpdate();
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		
		return result;
			
	}
	public ArrayList<T_commentVO> getCommentList(int articleNum) {

		ArrayList<T_commentVO> list = new ArrayList<>();

		try {
			getConn(); // 연결

			
			String sql = "select * from t_comment where article_seq = ? order by cmt_seq desc";

			psmt = conn.prepareStatement(sql); // sql준비

			psmt.setInt(1, articleNum);
			

			
			rs = psmt.executeQuery(); // sql문 실행

			while (rs.next()) {
				// 한바퀴 회전당 VO를 하나씩 생성
				vo = new T_commentVO();

				vo.setCommentNum(rs.getInt(1));
				vo.setPageNum(rs.getInt(2));
				vo.setComment(rs.getString(3));
				vo.setNick(rs.getString(5));
				vo.setDate(rs.getString(4));
				

				list.add(vo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}
	public int deleteComment(int commentNum) {
		int result = 0;
		
		try {
			getConn(); // 연결
			
			String sql = "delete t_comment where cmt_seq = ?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, commentNum);
			
			
			
			result = psmt.executeUpdate();
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	public int getTotal(int pageNum) {
		int result = 0;

		try {
			getConn();

			String sql = "select count(*) from t_comment where article_seq = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, pageNum);
			
			rs = psmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt("count(*)");
			}

			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return result;
	}
	
	
	
}
