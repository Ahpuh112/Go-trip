package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.VO.T_contentsVO;

public class T_contentsDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	T_contentsVO vo = null;
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

	// 전체페이지 어레이리스트 가져오기
	public ArrayList<T_contentsVO> getContentList(String mbti, int start, int end) {

		ArrayList<T_contentsVO> list = new ArrayList<>();

		try {
			getConn(); // 연결

			if (mbti.equals("all")) {
				String sql = "select * from (select rownum rn, a.*, m.mbti_name from (select * from t_contents order by article_seq desc) a , t_mbti m where  a.article_seq = m.article_seq) where rn >= ? and rn <=?";

				psmt = conn.prepareStatement(sql); // sql준비

				psmt.setInt(1, start);
				psmt.setInt(2, end);

			} else {


				String sql = "select * from (select rownum rn, a.*, m.mbti_name from (select * from t_contents order by article_seq desc) a , t_mbti m where a.article_seq = m.article_seq and m.mbti_name like ?) where rn >=? and rn <=? ";

				psmt = conn.prepareStatement(sql); // sql준비
				psmt.setString(1, "%"+mbti+"%");
				psmt.setInt(2, start);
				psmt.setInt(3, end);

			}
			
			rs = psmt.executeQuery(); // sql문 실행

			while (rs.next()) {
				// 한바퀴 회전당 VO를 하나씩 생성
				vo = new T_contentsVO();

				vo.setArticleCnt(rs.getInt(1));
				vo.setArticleNum(rs.getInt(2));
				vo.setArticleTitle(rs.getString(3));
				vo.setArticleWriter(rs.getString(6));
				vo.setArticleContent(rs.getString(4));
				vo.setArticleDate(rs.getString(5));
				vo.setLikes(rs.getInt(7));
				vo.setArticleViewCnt(rs.getInt(8));
				vo.setArticleNick(rs.getString(9));
				vo.setMbtiName(rs.getString(11));
				vo.setArticlePrePic(rs.getString(10));
				

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

			String sql = "select count(*) from t_contents";

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

	public int getCateTotal(String mbti) {
		int result = 0;


		try {
			getConn();

			String sql = "select count(*) from t_contents c ,t_mbti m where c.article_seq = m.article_seq and m.mbti_name like ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, "%"+mbti+"%");

			rs = psmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return result;
	}

	public T_contentsVO getContents(int ArticleWriter) {
		String SQL = "SELECT * FROM T_CONTENTS WHERE ARTICLEWRITER = ?";
		try {
			PreparedStatement psmt = conn.prepareStatement(SQL);
			psmt.setInt(1, ArticleWriter);
			rs = psmt.executeQuery();
			if (rs.next()) {
				T_contentsVO contents = new T_contentsVO();
				contents.setArticleNick(rs.getString(1));
				contents.setArticleCnt(rs.getInt(2));
				contents.setArticleNum(rs.getInt(3));
				contents.setArticleTitle(rs.getString(4));
				contents.setArticleContent(rs.getString(5));
				contents.setArticleDate(rs.getString(6));
				contents.setArticleWriter(rs.getString(7));
				contents.setLikes(rs.getInt(8));
				contents.setArticleViewCnt(rs.getInt(9));
				return contents;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public T_contentsVO getArticle(int articleNum) {
		String sql = "select * from (select rownum rn, a.* from (select c.*,m.mbti_name from t_contents c , t_mbti m where c.article_seq = m.article_seq order by c.article_seq desc) a) where article_seq = ?";

		try {
			getConn(); // 연결

			psmt = conn.prepareStatement(sql); // sql준비
			psmt.setInt(1, articleNum);

			rs = psmt.executeQuery(); // sql문 실행

			if (rs.next()) {
				vo = new T_contentsVO();

				vo.setArticleCnt(rs.getInt(1));
				vo.setArticleNum(rs.getInt(2));
				vo.setArticleTitle(rs.getString(3));
				vo.setArticleContent(rs.getString(4));
				vo.setArticleDate(rs.getString(5));				
				vo.setArticleWriter(rs.getString(6));
				vo.setLikes(rs.getInt(7));
				vo.setArticleViewCnt(rs.getInt(8));
				vo.setArticleNick(rs.getString(9));
				vo.setArticlePrePic(rs.getString(10));
				vo.setMbtiName(rs.getString(11));


			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return vo;
	}

	public int likes(int articleNum) {
		try {
			getConn();
			String sql = "update t_contents set likes = likes + 1 where article_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, articleNum);
			cnt = psmt.executeUpdate();


			/*
			 * sql = "update t_contents set views = views - 1 where article_num = ?"; psmt =
			 * conn.prepareStatement(sql); psmt.setInt(1, articleNum); cnt =
			 * psmt.executeUpdate();
			 */

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public int notLikes(int articleNum) {
	      try {
	         getConn();
	         String sql = "update t_contents set likes = likes - 1 where article_seq = ?";
	         psmt = conn.prepareStatement(sql);
	         psmt.setInt(1, articleNum);
	         cnt = psmt.executeUpdate();


	         /*
	          * sql = "update t_contents set views = views - 1 where article_num = ?"; psmt =
	          * conn.prepareStatement(sql); psmt.setInt(1, articleNum); cnt =
	          * psmt.executeUpdate();
	          */

	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close();
	      }
	      return cnt;
	   }

	public int setWrite(String title, String content, String mem_id, String nick, String path, String mbti) {
		int result = 0;
		
		try {
			getConn(); // 연결
			
			String sql = "insert into t_contents values (t_contents_seq.nextval, ?, ?, sysdate, ?, 0, 0, ?, ?)";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setString(3, mem_id);
			psmt.setString(4, nick);
			psmt.setString(5, path);
			
			System.out.println("첫번쨰 insert");
			
			result = psmt.executeUpdate();
			
			
			String sql1 = "insert into t_mbti values(t_mbti_seq.nextval, ?, t_contents_seq.currval)";
			
			psmt = conn.prepareStatement(sql1);
			psmt.setString(1, mbti);
			
			System.out.println("두번쨰 insert");
			
			result = psmt.executeUpdate();			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		
		return result;
			
	}
	
	//카운트 카운트 딜리트 메서드 수정수정
		public void viewCnt(int articleNum) {
			try {
				getConn();
				String sql = "update t_contents set cnt = cnt + 1 where article_seq = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, articleNum);
				cnt = psmt.executeUpdate();


			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
		}
		
		public void viewDelete(int articleNum) {
			try {
				getConn();
				String sql = "update t_contents set cnt = cnt - 1 where article_seq = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, articleNum);
				cnt = psmt.executeUpdate();


			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
		}
		
		
}
