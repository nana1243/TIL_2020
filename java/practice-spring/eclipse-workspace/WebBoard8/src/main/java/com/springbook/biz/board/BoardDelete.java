package com.springbook.biz.board;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

public class BoardDelete {
	
	
	public void DeleteBoard() {
		
		   EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAProject2");
	        EntityManager em = emf.createEntityManager();
	        EntityTransaction tx = em.getTransaction();
	        tx.begin();
	        try{
	            // ID Í∞íÏù¥ 1?ù∏ Agent SELECT
	            Board findBoard = em.find(Board.class, 1);
	            
	            System.out.println("check delteboard");
	 
	            // ?Ç≠?†ú
	            em.remove(findBoard);
	
	            //?ä∏?ûú?û≠?Öò Ïª§Î∞ã!
	            tx.commit();
	        }catch(Exception e){
	            tx.rollback();
	            System.out.println("check rollback");

	        }finally{
	            em.close();
	        }
	        emf.close();
	}

}
