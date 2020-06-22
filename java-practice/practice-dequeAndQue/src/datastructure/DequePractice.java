package datastructure;

import java.util.ArrayDeque;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.PriorityQueue;
import java.util.Queue;

public class DequePractice {

	public static void main(String[] args) {
		Queue<Integer> q1 = new ArrayDeque<>(); 
		Queue<Integer> q2 = new LinkedList(); 
		Queue<String> q3 = new PriorityQueue<>();
		
		// arraydeque practice
		
		for(int i=1;i<10;i++) {
			q1.add(i);
		}
		
		System.out.println(q1);
		
		Iterator itque1 = q1.iterator();
		for(int i=0;i<q1.size();i++) {
			System.out.println(itque1.next());
		}
		
	
		
	
	q2.addAll(q1);
	System.out.println(q2);
	
	
	}
	
	
	
	

}
