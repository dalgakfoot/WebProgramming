package com.care.controller04;

public class Controller01 implements Car {

	@Override
	public void speed() {
		System.out.println("3000000km/h 속력을 냅니다!");
		
	}

	@Override
	public void handle() {
		System.out.println("소형차 핸들 입니다.");
		
	}

}
