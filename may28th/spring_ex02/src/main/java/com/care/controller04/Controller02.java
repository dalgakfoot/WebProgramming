package com.care.controller04;

public class Controller02 implements Car {

	@Override
	public void speed() {
		System.out.println("20km/h 속력을 냅니다!");
		
	}

	@Override
	public void handle() {
		System.out.println("중형차 핸들 입니다.");
		
	}
	
	
}
