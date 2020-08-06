package com.springbook.biz.user.impl;


import com.springbook.biz.vo.UserVO;
import com.springbook.view.common.DAO;

public class UserDAO implements DAO<String, UserVO>{

	@Override
	public void insert() {
		System.out.println("INSERT IN DAO");

	}

	@Override
	public void update() {
		System.out.println("UPDATE IN DAO");

	}

	@Override
	public void delete() {
		System.out.println("DELTE IN DAO");

	}

	@Override
	public UserVO read(UserVO model) {
		System.out.println("read in DAO");
		return model;
		
		
	}





}
