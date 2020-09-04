package com.care.aop_ex01;

import org.springframework.context.support.GenericXmlApplicationContext;
/*
���� ��� ���� �ñ⸦ ����
<aop:before> : �޼ҵ� ���� ���� advice ����
<aop:after-returnning> : ���������� �޼ҵ� ���� �Ŀ� advice ����
<aop:ater-throwing> : �޼ҵ� ������ ���� �߻� �� advice ����
<aop:after> : �޼ҵ� ������ ���ܰ� �߻� �Ͽ��� advice ����
<aop:around> : �޼ҵ� ���� ��/�� �� ���� �߻� �� advice ����

���������� before , around�� ���� ����.
 */

public class MainClass {

	public static void main(String[] args) {
		
		String path = "classpath:applicationAOP_01.xml";
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext(path);
		CoreClass core = ctx.getBean("core", CoreClass.class);
		
		System.out.println("���� ����");
		core.corePrint();
		System.out.println("���� ��");
		ctx.close();
		
	}

}