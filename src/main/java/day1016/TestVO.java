package day1016;

public class TestVO {
	private String name;
	private int myAge;
	
	public TestVO() {
		super();
		System.out.println("기본생성자");
	}
	
	public TestVO(String name, int myAge) {
		super();
		this.name = name;
		this.myAge = myAge;
		System.out.println("인자있는 생성자");
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getMyAge() {
		return myAge;
	}

	public void setMyAge(int myAge) {
		this.myAge = myAge;
	}

	@Override
	public String toString() {
		return "testVO [name=" + name + ", myAge=" + myAge + "]";
	}
}// c
