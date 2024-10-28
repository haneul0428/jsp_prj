package kr.co.sist.user.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.sist.dao.DbConnection;

public class MemberDAO {
	private static MemberDAO mDAO;

	private MemberDAO() {
	}

	public static MemberDAO getInstance() {
		if (mDAO == null) {
			mDAO = new MemberDAO();
		} // if
		return mDAO;
	}// getInstance()

	/**
	 * 아이디를 입력받아 DB에서 검색해 아이디가 존재하면 true, 존재하지 않으면 false 반환
	 * 
	 * @param id 중복검사할 아이디
	 * @return 사용중(id존재)-true, 미사용(id존재X)-false
	 * @throws SQLException
	 */
	public boolean selectId(String id) throws SQLException {
		boolean resultFlag = false;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// 1. JNDI 사용객체 생성
		// 2. DBCP에서 DataSource 얻기
		DbConnection dbCon = DbConnection.getInstance();

		try {
			// 3. Connection 얻기
			con = dbCon.getConn();

			// 4. 쿼리문 생성객체 얻기
			String selectId = "select id from web_member where id=?";
			pstmt = con.prepareStatement(selectId);

			// 5. 바인드 변수 값설정
			pstmt.setString(1, id);

			// 6. 쿼리문 수행 후 결과얻기
			rs = pstmt.executeQuery();

			resultFlag = rs.next(); // id 존재여부 --> id O: true, id X: false

		} finally {
			// 7. 연결끊기
			dbCon.dbClose(rs, pstmt, con);
		} // try~ca~fi

		return resultFlag;
	}// selectId(String id)

	public void insertWebMember(WebMemberVO wmVO) throws SQLException {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		//1. JNDI 사용객체 생성
		//2. DBCP에서 DataSource 얻기
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			//3. Connection 얻기
			con = dbCon.getConn();
			
			//4. 쿼리문 생성객체 얻기
			StringBuilder insertWebMember = new StringBuilder();
			insertWebMember
			.append("insert into web_member")
			.append("(ID,PASS,NAME,BIRTH,TEL,TEL_FLAG,EMAIL,GENDER,LOCATION,ZIPCODE,ADDR,ADDR2,IP) ")
			.append("values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
			
			pstmt = con.prepareStatement(insertWebMember.toString());
			
			//5. 바인드 변수에 값할당
			pstmt.setString(1, wmVO.getId());
			pstmt.setString(2, wmVO.getPass());
			pstmt.setString(3, wmVO.getName());
			pstmt.setString(4, wmVO.getBirth());
			pstmt.setString(5, wmVO.getCellphone());
			pstmt.setString(6, wmVO.getSave());
			pstmt.setString(7, wmVO.getEmail());
			pstmt.setString(8, wmVO.getGender());
			pstmt.setString(9, wmVO.getLocation());
			pstmt.setString(10, wmVO.getZipcode());
			pstmt.setString(11, wmVO.getAddr1());
			pstmt.setString(12, wmVO.getAddr2());
			pstmt.setString(13, wmVO.getIp());
			
			//6. 쿼리문 수행 후 결과얻기
			pstmt.executeUpdate();
			
			if(wmVO.getLang() != null) {	//wmVO에서 선택된 관심언어가 있을 경우
				insertLang(wmVO);	//관심언어를 DB에 추가
			}//if
			
		} finally {
			//7. 연결끊기
			dbCon.dbClose(null, pstmt, con);
		}//try~ca~fi
		
		
	}// insertWebMember(WebMemberVO wmVO)

	public int insertLang(WebMemberVO wmVO) throws SQLException {
		int cntLang = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		//1. JNDI 사용객체 생성
		//2. DBCP에서 DataSource 얻기
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			//3. Connection 얻기
			con = dbCon.getConn();
			
			//4. 쿼리문 생성객체 얻기
			String insertLang = "insert into web_member_lang(id,lang) values(?,?)";
			pstmt = con.prepareStatement(insertLang);
			
			for(String lang : wmVO.getLang()) {
				//5. 바인드 변수에 값할당
				pstmt.setString(1, wmVO.getId());
				pstmt.setString(2, lang);
				
				//6. 쿼리문 수행 후 결과얻기
				cntLang += pstmt.executeUpdate();
			}//f
			
		} finally {
			//7. 연결끊기
			dbCon.dbClose(null, pstmt, con);
		}//try~ca~fi
		
		return cntLang;
	}// insertLang(WebMemberVO wmVO)

}// c
