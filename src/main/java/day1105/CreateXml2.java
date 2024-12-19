package day1105;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

public class CreateXml2 {
	
	public static void main(String[] args) {
		
		//1. XML문서 객체 생성 --> <?xml version="1.0" encoding="UTF-8"?>
		Document doc = new Document();
		
		//2. 최상위 부모노드 생성 --> <depts />
		Element deptsNode = new Element("depts");
		
		//--1
		//3. 자식노드를 생성
		Element deptNode = new Element("dept");	//<dept />
		
		//3. 자식노드를 생성
		Element deptnoNode = new Element("deptno");
		deptnoNode.setText("10");		//<deptno>10</deptno>
		
		Element dnameNode = new Element("dname");
		dnameNode.setText("개발부");		//<dname>개발부</dname>
		
		Element locNode = new Element("loc");
		locNode.setText("서울");		//<loc>서울</loc>
		
		//--2
		//3. 자식노드를 생성
		Element deptNode2 = new Element("dept");	//<dept />
		
		//3. 자식노드를 생성
		Element deptnoNode2 = new Element("deptno");
		deptnoNode2.setText("20");		//<deptno>20</deptno>
		
		Element dnameNode2 = new Element("dname");
		dnameNode2.setText("유지보수");		//<dname>유지보수</dname>
		
		Element locNode2 = new Element("loc");
		locNode2.setText("서울");		//<loc>서울</loc>
		
		//--3
		//3. 자식노드를 생성
		Element deptNode3 = new Element("dept");	//<dept />
		
		//3. 자식노드를 생성
		Element deptnoNode3 = new Element("deptno");
		deptnoNode3.setText("30");		//<deptno>30</deptno>
		
		Element dnameNode3 = new Element("dname");
		dnameNode3.setText("영업부");		//<dname>영업부</dname>
		
		Element locNode3 = new Element("loc");
		locNode3.setText("서울");		//<loc>서울</loc>
		
		//4. 자식노드를 부모노드에 배치
		deptNode.addContent(deptnoNode);	//<dept><deptno>10</deptno></dept>
		deptNode.addContent(dnameNode);	//<dept><dname>개발부</dname></dept>
		deptNode.addContent(locNode);	//<dept><loc>서울</loc></dept>
		
		deptNode2.addContent(deptnoNode2);	//<dept><deptno>20</deptno></dept>
		deptNode2.addContent(dnameNode2);	//<dept><dname>유지보수</dname></dept>
		deptNode2.addContent(locNode2);	//<dept><loc>서울</loc></dept>
		
		deptNode3.addContent(deptnoNode3);	//<dept><deptno>30</deptno></dept>
		deptNode3.addContent(dnameNode3);	//<dept><dname>영업부</dname></dept>
		deptNode3.addContent(locNode3);	//<dept><loc>서울</loc></dept>
		
		deptsNode.addContent(deptNode);
		deptsNode.addContent(deptNode2);
		deptsNode.addContent(deptNode3);
		
		//5. 모든 자식노드를 가진 부모노드를 XML 문서 객체에 추가
		//최상위 부모노드를 문서노드에 배치
		doc.addContent(deptsNode);
		
		//생성된 문서 객체를 출력
		XMLOutputter xOut = new XMLOutputter(Format.getPrettyFormat());
		
		try {
			xOut.output(doc, System.out);
			
			//File file = new File("C:/dev/workspace/jsp_prj/src/main/java/day1105/dept.xml");
			File file = new File("C:/dev/workspace/jsp_prj/src/main/webapp/day1105/dept.xml");
			FileOutputStream fos = new FileOutputStream(file);
			
			xOut.output(doc, fos);	//file 출력
			
			if(fos != null) { fos.close(); }//if
			
		} catch (IOException e) {
			e.printStackTrace();
		}//try~ca
		
	}//m
	
}//c
