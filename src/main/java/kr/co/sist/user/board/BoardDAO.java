package kr.co.sist.user.board;

import java.io.BufferedReader;
import java.io.IOError;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConnection;
import kr.co.sist.util.BoardUtil;

/**
 * 게시판의 리스트, 상세조회, 추가, 삭제, 변경 업무
 */
public class BoardDAO {
	
	private static BoardDAO bDAO;
	
	private BoardDAO() {
	}
	
	public static BoardDAO getInstance() {
		if(bDAO == null) {
			bDAO = new BoardDAO();
		}//if
		return bDAO;
	}//getInstance()
	
	/**
	 * 총 게시물 수 검색
	 * @param sVO
	 * @return 게시물의 수
	 * @throws SQLException
	 */
	public int selectTotalCount(SearchVO sVO) throws SQLException{
		int totalCount = 0;
		
		//1. JNDI 사용객체 생성
		//2. DBCP에서 DataSource 얻기
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			//3. Connection 얻기
			con = dbCon.getConn();
			
			//4. 쿼리문 생성객체 얻기
			StringBuilder selectCount = new StringBuilder();
			selectCount.append("	select count(num) cnt ")
						.append("	from board ");
			
			//dynamic query: 검색 키워드를 판단 기준으로 where절이 동적 생성돼야 함
			if(sVO.getKeyword() != null && !"".equals(sVO.getKeyword())) {
				selectCount.append("where instr(")
							.append(BoardUtil.numToField(sVO.getField()))
							.append(",?) != 0");
			}//if
			
			//System.out.println(selectCount);
			
			pstmt = con.prepareStatement(selectCount.toString());
			
			//5. 바인드 변수에 값설정
			if(sVO.getKeyword() != null && !"".equals(sVO.getKeyword())) {
				pstmt.setString(1, sVO.getKeyword());
			}//if
			
			//6. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				totalCount = rs.getInt("cnt");
			}//if
			
		} finally {
			//7. 연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		}
		return totalCount;
	}//selectTotalCount(SearchVO sVO)
	
	public List<BoardVO> selectBoard(SearchVO sVO) throws SQLException {
		List<BoardVO> boardList = new ArrayList<BoardVO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbConnection dbCon = DbConnection.getInstance();
		try {
			//connection 얻기
			con = dbCon.getConn();
			
			//쿼리문 생성 객체 얻기
			StringBuilder selectBoard = new StringBuilder();
			selectBoard.append("	select	num, subject, writer, input_date, ip	")
						.append("	from	(select	num, subject, writer, input_date, ip,	")
						.append("			row_number() over(order by input_date desc) rnum	")
						.append("	from	board	");
			
			//dynamic query: 검색 키워드를 판단 기준으로 where절이 동적 생성돼야 함
			if(sVO.getKeyword() != null && !"".equals(sVO.getKeyword())) {
				selectBoard.append("where instr(")
							.append(BoardUtil.numToField(sVO.getField()))
							.append(",?) != 0");
			}//if
			
			selectBoard.append("	)where	rnum between ? and ?	");
			
			System.out.println(selectBoard);
			
			pstmt = con.prepareStatement(selectBoard.toString());
			
			//바인드 변수에 값설정
			int bindIndex = 0;
			
			if(sVO.getKeyword() != null && !"".equals(sVO.getKeyword())) {	//검색키워드 존재
				pstmt.setString(++bindIndex, sVO.getKeyword());
			}//if
			
			pstmt.setInt(++bindIndex, sVO.getStartNum());
			pstmt.setInt(++bindIndex, sVO.getEndNum());
			
			//쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();
			
			BoardVO bVO = null;
			while(rs.next()) {
				bVO = new BoardVO();
				bVO.setNum(rs.getInt("num"));
				bVO.setSubject(rs.getString("subject"));
				bVO.setWriter(rs.getString("writer"));
				bVO.setInput_date(rs.getDate("input_date"));
				bVO.setIp(rs.getString("ip"));
				
				boardList.add(bVO);
			}//w
			
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		}//try~fi
		return boardList;
	}//selectBoard(SearchVO sVO)
    
    public void insertBoard(BoardVO bVO) throws SQLException {
    	
    	Connection con = null;
    	PreparedStatement pstmt = null;
    	DbConnection dbCon = DbConnection.getInstance();
    	
    	try {
    		//connection 얻기
    		con = dbCon.getConn();
    		
    		//쿼리문 생성
    		StringBuilder insertBoard = new StringBuilder();
    		insertBoard.append("insert into board(num,subject,content,writer,ip)")
    					.append("values( seq_board.nextval,?,?,?,?)"); 
    		
    		pstmt = con.prepareStatement(insertBoard.toString());
    		
    		//바인드 변수에 값 설정
    		pstmt.setString(1, bVO.getSubject());
    		pstmt.setString(2, bVO.getContent());
    		pstmt.setString(3, bVO.getWriter());
    		pstmt.setString(4, bVO.getIp());
    		
    		//쿼리문 수행 후 결과 얻기
    		pstmt.executeUpdate();
    		
    	} finally {
    		//연결끊기
    		dbCon.dbClose(null, pstmt, con);
    	}//try~fi
    }//insertBoard(BoardVO bVO)
    
	/**
	 * 입력된 글번호에 해당하는 글 하나 조회
	 * @param num
	 * @return
	 * @throws SQLException
	 */
	public BoardVO selectDetailBoard(int num) throws SQLException {
		BoardVO bVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbConnection dbCon = DbConnection.getInstance();
		try {
			//connection 얻기
			con = dbCon.getConn();
			
			//쿼리문 생성 객체 얻기
			StringBuilder selectOneBoard = new StringBuilder();
			selectOneBoard.append("	select	num, subject, content, writer, input_date, ip	")
						.append("	from	board	")
						.append("	where	num=?	");
			
			pstmt = con.prepareStatement(selectOneBoard.toString());
			
			//바인드 변수에 값설정
			pstmt.setInt(1, num);
			
			//쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bVO = new BoardVO();
				bVO.setNum(num);
				bVO.setSubject(rs.getString("subject"));
				bVO.setWriter(rs.getString("writer"));
				bVO.setInput_date(rs.getDate("input_date"));
				bVO.setIp(rs.getString("ip"));
				
				//CLOB 데이터를 읽어들이기 위해서 별도의 stream을 연결
				BufferedReader br = new BufferedReader(rs.getClob("content").getCharacterStream());
				
				StringBuilder content = new StringBuilder();
				String temp;	//한줄 읽어들인 데이터를 저장할 변수
				
				try {
					while ((temp = br.readLine()) != null) {
						//한 줄 읽어들여 content에 저장
						content.append(temp).append("\n");
					}//w
					//모든 줄을 읽어들여 저장한 변수를 BoardVO객체에 설정
					bVO.setContent(content.toString());
					
				} catch (IOException ie) {
					ie.printStackTrace();
				}//try~ca
			}//if
			
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		}//try~fi
		
		return bVO;
	}//selectDetailBoard(int num)
	
	/**
	 * 글번호와 아이디에 해당하는 글의 내용을 변경
	 * @param bVO
	 * @return
	 * @throws SQLException
	 */
	public int updateBoard(BoardVO bVO) throws SQLException{
		int rowCnt = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			//connection 얻기
			con = dbCon.getConn();
			
			//쿼리문 생성
			StringBuilder updateBoard = new StringBuilder();
			updateBoard.append("	update	board	")
						.append("	set		content=?	")
						.append("	where	num=? and writer=?	"); 
         
			pstmt = con.prepareStatement(updateBoard.toString());

			// 바인드 변수에 값 설정
			pstmt.setString(1, bVO.getContent());
	 		pstmt.setInt(2, bVO.getNum());
	 		pstmt.setString(3, bVO.getWriter());
	 		
	 		//쿼리문 수행 후 결과 얻기
	 		rowCnt = pstmt.executeUpdate();
	 		
		} finally {
			//연결끊기
			dbCon.dbClose(null, pstmt, con);
			}//try~fi
		
		return rowCnt;
	}//updateBoard(BoardVO bVO)
	
	public int deleteBoard(BoardVO bVO) throws SQLException{
		int rowCnt = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			//connection 얻기
			con = dbCon.getConn();
			
			//쿼리문 생성
			StringBuilder deleteBoard = new StringBuilder();
			/*	//댓글이 존재하지 않으면 삭제하면 됨
			 * 	//모든 댓글의 소유권이 작성자에게 있으면, 테이블 생성 시 on delete cascade 옵션을 사용
			deleteBoard.append("	delete from board	")
						.append("	where	num=? and writer=?	");
			*/ 
			
			//댓글의 소유권이 원글 작성자에게 없으면, update 수행
			deleteBoard.append("	update	board	")
						.append("	set		subject='삭제된 글입니다.', content='사용자에 의해 삭제된 글입니다.', writer='NA'	")
						.append("	where	num=? and writer=?	");
         
			pstmt = con.prepareStatement(deleteBoard.toString());

			// 바인드 변수에 값 설정
	 		pstmt.setInt(1, bVO.getNum());
	 		pstmt.setString(2, bVO.getWriter());
	 		
	 		//쿼리문 수행 후 결과 얻기
	 		rowCnt = pstmt.executeUpdate();
	 		
		} finally {
			//연결끊기
			dbCon.dbClose(null, pstmt, con);
			}//try~fi
		
		return rowCnt;
	}//deleteBoard(BoardVO bVO)
	
}//c
