package com.springbook.biz.boardimpl;

import java.sql.Connection;

import org.springframework.stereotype.Repository;

import com.springbook.biz.DAO;

@Repository("boardDAO")
public class BoardDAO implements DAO {

	@Override
	public void insert() {
		 System.out.println("insert");
		
	}

	@Override
	public void update() {
		 System.out.println("update");

		
	}

	@Override
	public void delete() {
		 System.out.println("delete");

		
	}

	@Override
	public void read() {
		 System.out.println("read");
		
	}
	

	

}
