package com.springbook.biz.board;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

public class BoardInsert {
	
	public void InsertBoard() {
	     System.out.println( "Hello Insert World!" );
	        
	     
	        //entityManager
	        
	         EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAProject2");

	         EntityManager em = emf.createEntityManager();
	         
	         //Transaction 생성
	         
	         EntityTransaction tx= em.getTransaction();
	         tx.begin();
	         try{
	        	 System.out.println("check in insertboard");
	             Board board = new Board();
	             // ID는 자동 생성되도록 했으므로 이름만 SET 해본다.
	             board.setName("henniezz1213");
	  
	             
	             // 영속화
	             em.persist(board);
	  
	             //트랜잭션 커밋!
	             tx.commit();
	        	 System.out.println("check commit in insertBoard");
	             
	         }catch(Exception e){
	             tx.rollback();
	             System.out.println("check in insertboard rollback");
	         }finally{
	             em.close();
	         }
	         emf.close();
	}

}
