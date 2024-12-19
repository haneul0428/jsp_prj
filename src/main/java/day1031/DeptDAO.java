package day1031;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConnection;

public class DeptDAO {
	private static DeptDAO dDAO;
	
	private DeptDAO() {
	}
	
	public static DeptDAO getInstance() {
		if(dDAO == null) {
			dDAO = new DeptDAO();
		}//if
		return dDAO;
	}//getInstance()
	
	public List<DeptVO> selectAllDept() throws SQLException{
		List<DeptVO> list = new ArrayList<DeptVO>();
		
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = dbCon.getConn();
			
			String selectDept = "select deptno,dname,loc,status from dept";
			pstmt = con.prepareStatement(selectDept);
			rs = pstmt.executeQuery();
			
			DeptVO dVO = null;
			while(rs.next()) {
				dVO = new DeptVO(rs.getInt("deptno"), rs.getString("dname"), 
								rs.getString("loc"), rs.getString("status"));
				list.add(dVO);
			}//w
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		}
		
		return list;
	}//selectAllDept()
	
	public int updateDept(DeptVO dVO) throws SQLException{
		int rowCnt = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			//connection 얻기
			con = dbCon.getConn();
			
			//쿼리문 생성
			StringBuilder updateDept = new StringBuilder();
			updateDept.append("	update	dept	")
					.append("	set		dname=?,loc=?,status=?	")
					.append("	where	deptno=?	"); 
         
			pstmt = con.prepareStatement(updateDept.toString());

			// 바인드 변수에 값 설정
			pstmt.setString(1, dVO.getDname());
	 		pstmt.setString(2, dVO.getLoc());
	 		pstmt.setString(3, dVO.getStatus());
	 		pstmt.setInt(4, dVO.getDeptno());
	 		
	 		//쿼리문 수행 후 결과 얻기
	 		rowCnt = pstmt.executeUpdate();
	 		
		} finally {
			//연결끊기
			dbCon.dbClose(null, pstmt, con);
			}//try~fi
		
		return rowCnt;
	}//updateDept(BoardVO bVO)
	
	public List<EmpVO> selectDeptEmp(int deptno) throws SQLException{
		List<EmpVO> list = new ArrayList<EmpVO>();
		
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = dbCon.getConn();
			
			StringBuilder selectEmp = new StringBuilder();
			selectEmp.append("	select	empno,ename,job,mgr,hiredate,sal	")
					.append("	from	emp	")
					.append("	where	deptno=?	");
			
			pstmt = con.prepareStatement(selectEmp.toString());
			
			pstmt.setInt(1, deptno);
			
			rs = pstmt.executeQuery();
			
			EmpVO eVO = null;
			
			while(rs.next()) {
				eVO = new EmpVO(rs.getInt("empno"), rs.getString("ename"), 
						rs.getString("job"), rs.getInt("mgr"), 
						rs.getDate("hiredate"), rs.getInt("sal") );
				list.add(eVO);
			}//w
			
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		}
		
		return list;
	}//selectDeptEmp(int deptno)
}
