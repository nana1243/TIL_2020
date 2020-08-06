package com.springbook.biz.board;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

/**
 * Hello world!
 *
 */
public class App {
	public static void main(String[] args) {
		
		
		BoardUpdate boardupdate = new BoardUpdate();
		BoardInsert boardinsert = new BoardInsert();
		BoardDelete boarddelete = new BoardDelete();
		
		
		
		boardinsert.InsertBoard();
		boardupdate.UpdateBoard();
		boarddelete.DeleteBoard();

	}
}
