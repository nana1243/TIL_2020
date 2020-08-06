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
	         
	         //Transaction ?ƒ?„±
	         
	         EntityTransaction tx= em.getTransaction();
	         tx.begin();
	         try{
	        	 System.out.println("check in insertboard");
	             Board board = new Board();
	             // ID?Š” ??™ ?ƒ?„±?˜?„ë¡? ?–ˆ?œ¼ë¯?ë¡? ?´ë¦„ë§Œ SET ?•´ë³¸ë‹¤.
	             board.setName("henniezz1213");
	  
	             
	             // ?˜?†?™”
	             em.persist(board);
	  
	             //?Š¸?œ?­?…˜ ì»¤ë°‹!
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
