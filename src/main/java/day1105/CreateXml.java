package day1105;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

public class CreateXml {
	
	public static void main(String[] args) {
		
		//1. XML문서 객체 생성 --> <?xml version="1.0" encoding="UTF-8"?>
		Document doc = new Document();
		
		//2. 최상위 부모노드 생성 --> <root />
		Element rootNode = new Element("root");
		
		//3. 자식노드를 생성
		Element msgNode = new Element("msg");
		//자식노드에 들어갈 내용 설정
		msgNode.setText("안녕하세요?");		//<msg>안녕하세요?</msg>
		
		//3. 자식노드를 생성
		Element msgNode2 = new Element("msg");
		//자식노드에 들어갈 내용 설정
		msgNode2.setText("어서오세요.");		//<msg>어서오세요.</msg>
		
		//3. 자식노드를 생성
		Element msgNode3 = new Element("msg");
		//자식노드에 들어갈 내용 설정
		msgNode3.setText("오늘은 화요일 입니다.");		//<msg>오늘은 화요일 입니다.</msg>
		
		//4. 자식노드를 부모노드에 배치
		rootNode.addContent(msgNode);	//<root><msg>안녕하세요?</msg></root>
		rootNode.addContent(msgNode2);	//<root><msg>어서오세요.</msg></root>
		rootNode.addContent(msgNode3);	//<root><msg>오늘은 화요일 입니다.</msg></root>
		
		//5. 모든 자식노드를 가진 부모노드를 XML 문서 객체에 추가
		//최상위 부모노드를 문서노드에 배치
		doc.addContent(rootNode);
		
		//생성된 문서 객체를 출력
		XMLOutputter xOut = new XMLOutputter(Format.getPrettyFormat());
		
		try {
			xOut.output(doc, System.out);	//console 출력
			
			//file로 저장
			//File file = new File("C:/dev/workspace/jsp_prj/src/main/java/day1105/msg.xml");
			File file = new File("C:/dev/workspace/jsp_prj/src/main/webapp/day1105/msg.xml");
			FileOutputStream fos = new FileOutputStream(file);	//8bit Stream
			
			xOut.output(doc, fos);	//file 출력
			
			if(fos != null) { fos.close(); }//if
			
		} catch (IOException e) {
			e.printStackTrace();
		}//try~ca
		
	}//m
	
}//c
