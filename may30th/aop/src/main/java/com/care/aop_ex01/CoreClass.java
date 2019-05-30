
package com.care.aop_ex01;

public class CoreClass {

	public void corePrint() {
		for(int i =0 ; i<10 ; i++) {
			try {
				Thread.sleep(100);
				System.out.println("핵심기능 실행!");
			}catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
	
}
