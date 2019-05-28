package com.care.controller02;

public class STBean {
	public Student st;
	private String name;
	private int age;
	
	public void nameP() {st.namePrint(name);}
	public void ageP() {st.agePrint(age);}
	public Student getSt() {return st;}
	public void setSt(Student st) {this.st= st;}
	public void setName(String name) {this.name = name;}
	public String getName() {return name;}
	public int getAge() {return age;}
	public void setAge(int age) {this.age = age;}
	
	
}
