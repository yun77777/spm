package com.mall.common;

import org.springframework.web.multipart.MultipartFile;

public class testDTO {
	private String test1;
	private String test2;
	private MultipartFile[] test3;
	
	public String getTest1() {
		return test1;
	}
	public void setTest1(String test1) {
		this.test1 = test1;
	}
	public String getTest2() {
		return test2;
	}
	public void setTest2(String test2) {
		this.test2 = test2;
	}
	public MultipartFile[] getTest3() {
		return test3;
	}
	public void setTest3(MultipartFile[] test3) {
		this.test3 = test3;
	}
	
	
}