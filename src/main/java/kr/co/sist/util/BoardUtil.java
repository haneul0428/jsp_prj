package kr.co.sist.util;

import kr.co.sist.user.board.SearchVO;

public class BoardUtil {
	private static String[] columnName = {"subject", "content", "writer"};
	
	public static String numToField(String fieldNum) {
		
		return columnName[Integer.parseInt(fieldNum)];
	}//numToField(String fieldNum)
	
	/**
	 * pagination을 사용할려면 매개변수로 입력되는 객체의 
	 * 현재페이지번호(currentPage), 총페이지수(totalPage), 총게시물의수(totalCount) 가 있어야 하고
	 * 검색을 수행하면 field 값, keyword, url 이 반드시 입력돼야 함
	 * @param sVO
	 * @return
	 */
	public String pagination(SearchVO sVO) {
		StringBuilder pagination = new StringBuilder();
		
		if(sVO.getTotalCount() != 0) {
			//1. 한 화면에 보여줄 페이지 인덱스 수	[1] [2] [3]
			int pageNumber = 3;
			
			//2. 화면에 보여줄 시작페이지 번호(123 --> 1, 456 --> 4) 구하기
			int startPage = ((sVO.getCurrentPage()-1)/pageNumber) * pageNumber + 1;
			
			//3. 화면에 보여줄 마지막페이지 번호 구하기
			int endPage = startPage + pageNumber - 1;	//(((starPage-1)+pageNumber)/pageNumber)*pageNumber;
			
			//4. 총 페이지 수가 연산된 페이지 수보다 작다면 총 페이지 수가 마지막 페이지 수로 설정
			if(sVO.getTotalPage() <= endPage){
				endPage = sVO.getTotalPage();
			}//if
			
			//5. 첫 페이지가 인덱스 화면이 아닌 경우 ([1]이 아닌 경우 == 3보다 큰 경우)
			int movePage = 0;
			StringBuilder prevMark = new StringBuilder();
			prevMark.append("[&lt;&lt;]");	//이전으로
			
			if(sVO.getCurrentPage() > pageNumber){	//현재 페이지가 pagination 보다 큰 경우
				prevMark.delete(0, prevMark.length());
				
				//이전으로가기 링크를 생성함
				movePage = startPage - 1 ;	//예) [4][5][6] 이면 --> 3이 되는데 시작페이지번호를 구하면 ==> 1이됨
				prevMark.append("[<a href=\"")
						.append(sVO.getUrl())
						.append("?currentPage=")
						.append(movePage);
				
				//검색 키워드가 존재할 경우
				if(sVO.getKeyword()!=null && !"".equals(sVO.getKeyword())) {
					prevMark.append("&field=")
							.append(sVO.getField())
							.append("&keyword=")
							.append(sVO.getKeyword());
				}//if
				
				prevMark.append("\">&lt;&lt;</a>]");
			}//if
			prevMark.append(" ... ");
			
			pagination.append(prevMark);
			
			//6. 시작페이지 번호부터 끝페이지 번호까지 화면에 출력
			movePage = startPage;
			StringBuilder pageLink = new StringBuilder();
			
			while(movePage <= endPage){
				if(movePage == sVO.getCurrentPage()){	//현재페이지는 링크를 설정하지 X
					pageLink.append("[")
							.append(movePage)
							.append("]");
				} else {	//현재페이지가 아니면 링크를 설정
					pageLink.append("[<a href='")
							.append(sVO.getUrl())
							.append("?currentPage=")
							.append(movePage);
					
					//검색 키워드가 존재할 경우
					if(sVO.getKeyword()!=null && !"".equals(sVO.getKeyword())) {
						pageLink.append("&field=")
								.append(sVO.getField())
								.append("&keyword=")
								.append(sVO.getKeyword());
					}//if
					
					pageLink.append("'>")
							.append(movePage)
							.append("</a>]");
				}//if~el
				
				movePage++;
			}//w
			
			pagination.append(pageLink);
			pagination.append(" ... ");
			
			//7. 뒤에 페이지가 더 있는 경우
			StringBuilder nextMark = new StringBuilder();
			nextMark.append("[&gt;&gt;]");
			
			if(sVO.getTotalPage() > endPage){
				nextMark.delete(0, nextMark.length());
				movePage = endPage + 1;
				nextMark.append("[<a href='")
						.append(sVO.getUrl())
						.append("?currentPage=")
						.append(movePage);
				
				//검색 키워드가 존재할 경우
				if(sVO.getKeyword()!=null && !"".equals(sVO.getKeyword())) {
					nextMark.append("&field=")
							.append(sVO.getField())
							.append("&keyword=")
							.append(sVO.getKeyword());
				}//if
				
				nextMark.append("'>&gt;&gt;</a>]");
			}//if
			
			pagination.append(nextMark);
		}//if
		
		return pagination.toString();
	}//pagination()
	
}//c
