package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.VO.T_InformationVO;
import com.VO.T_contentsVO;

public class T_InformationDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	T_InformationVO vo = null;

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
	
	// 전체페이지 어레이리스트 가져오기
		public ArrayList<T_InformationVO> getInformationList(int locNum, int start, int end) {

			ArrayList<T_InformationVO> list = new ArrayList<>();

			try {
				getConn(); // 연결

				if (locNum==36) {
					String sql = "SELECT * FROM (SELECT ROWNUM NUM, t_information.* FROM t_information) WHERE num >= ? and num <= ?";
					

					psmt = conn.prepareStatement(sql); // sql준비

					psmt.setInt(1, start);
					psmt.setInt(2, end);

				} else {

					String sql = "select * from (SELECT ROWNUM NUM, t_information.* FROM t_information where locationnum=?) where num >= ? and num <= ?";

					psmt = conn.prepareStatement(sql); // sql준비
					psmt.setInt(1, locNum);
					psmt.setInt(2, start);
					psmt.setInt(3, end);

				}
				rs = psmt.executeQuery(); // sql문 실행

				while (rs.next()) {
					// 한바퀴 회전당 VO를 하나씩 생성
					vo = new T_InformationVO();
					
					vo.setLocationNum(rs.getInt(2));
					vo.setLocation(rs.getString(3));
					vo.setPlaceName(rs.getString(4));
					vo.setPlaceUrl(rs.getString(5));
					vo.setImgUrl(rs.getString(6));
					vo.setSomeMBTI(null);
					vo.setPlaceNum(rs.getInt(8));

					list.add(vo);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}

			return list;
		}

		

		// DB에 있는 총페이지를 세는 메소드
		public int getTotal() {
			int result = 0;

			try {
				getConn();

				String sql = "select count(*) from t_information";

				psmt = conn.prepareStatement(sql);

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

		public int getCateTotal(int locNum) {
			int result = 0;

			try {
				getConn();

				String sql = "select count(*) from t_information where locationnum = ?";

				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, locNum);

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
