package day1018;

import java.util.ArrayList;
import java.util.List;

public class DataDAO {
	
	public List<DataVO> selectData(){
		List<DataVO> list = new ArrayList<DataVO>();
		
		list.add(new DataVO("img.png", "3조 조원 이인혁", "모든 일에 최선을 다하는 조원 입니다.", 1));
		list.add(new DataVO("img2.jpg", "페페", "이게 뭐에요???", 2)); 
		list.add(new DataVO("img3.jpg", "침 흘리는 페페", "침흘림", 3));
		list.add(new DataVO("img4.jpg", "햄스터", "방가방가 햄토리", 4));
		 
		return list;
	}//selectData()
	
}//c
