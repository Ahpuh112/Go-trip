package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.eclipse.jdt.internal.compiler.apt.model.AnnotationMemberValue;

import com.VO.T_memberVO;

public class T_memberDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;
	T_memberVO vo = null;
	
	public void getConn() {
		try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		// 동적로딩
		String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
		String dbid= "gjai_5_1_0822";
		String dbpw= "smhrd1";
		conn = DriverManager.getConnection(url, dbid, dbpw);
		//DB연결
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
	
	public T_memberVO login(String id, String pw) {
		

		try {
			// 1.DB연결
			getConn();
			// 2.SQL & PSTMT
			String sql = "select * from t_member where mem_id = ? and mem_pw = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			// 3.실행 -> rs -> 데이터처리
			rs = psmt.executeQuery();
			if (rs.next()) {
				String getEmail = rs.getString(1);
				String getNick = rs.getString(3);
				int getBirthYear = rs.getInt(4);
				String getMbti = rs.getString(5);
				String getMemType = rs.getString(7);
				
				vo = new T_memberVO(getEmail, getNick,getBirthYear, getMbti, getMemType);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally { // 4.자원해제
			close();
		}
		return vo;
	}// idCheck메서드 닫음

	
	public int join(String id, String pw, String nick, int birthYear, String mbti) {
		
		try {
			getConn();
			
			String sql = "insert into t_member values (?, ?, ?, ?, ?,sysdate,'M')";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			psmt.setString(3, nick);
			psmt.setInt(4, birthYear);
			psmt.setString(5, mbti);
			
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	public int update(String id, String pw, String mbti) {
		try {
			getConn();
			
			String sql = "update t_member set mem_pw = ?, mem_mbti = ?  where mem_id = ?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, pw);
			psmt.setString(2, mbti);
			psmt.setString(3, id);
			
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	}
	
	
	
	
	
	
}
