package day1016;

public class CounterVO {
	private int cnt;

	public CounterVO() {
		super();
		System.out.println("CounterVO 객체 생성");
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt += cnt;	//(+=) --> instance변수의 누적합
	}

	@Override
	public String toString() {
		return "CounterVO [cnt=" + cnt + "]";
	}
}//c
