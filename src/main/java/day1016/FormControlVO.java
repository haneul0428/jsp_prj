package day1016;

import java.util.Arrays;

public class FormControlVO {
	private String name, gender;
	private String[] hobby;
	private int age;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String[] getHobby() {
		return hobby;
	}
	public void setHobby(String[] hobby) {
		this.hobby = hobby;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	@Override
	public String toString() {
		return "FormControlVO [name=" + name + ", gender=" + gender + ", hobby=" + Arrays.toString(hobby) + ", age="
				+ age + "]";
	}
	
}//c
