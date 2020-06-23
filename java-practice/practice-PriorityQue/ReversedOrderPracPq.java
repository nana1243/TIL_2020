package test01;

import java.util.PriorityQueue;

public class ReversedOrderPracPq {
	
	
	public static PriorityQueue<PrisonerReverse> getPriorityList(){
		PrisonerReverse p1 = new PrisonerReverse("hennie",1);
		PrisonerReverse p2 = new PrisonerReverse("Jenny",2);
		PrisonerReverse p3 = new PrisonerReverse("heanna",100);
		PrisonerReverse p4 = new PrisonerReverse("papa", 44);
		PrisonerReverse p5 = new PrisonerReverse("henniezznag", 12);
		
		
		 PriorityQueue<PrisonerReverse> priorityQueue = new PriorityQueue<PrisonerReverse>();
		 priorityQueue.offer(p1);
		 priorityQueue.offer(p2);
		 priorityQueue.offer(p3);
		 priorityQueue.offer(p4);
		 priorityQueue.offer(p5);
		 
		 return priorityQueue;
	}
	

	public static void main(String[] args) {
		
		PriorityQueue<PrisonerReverse> priorityQueue = getPriorityList();
		
		   while (!priorityQueue.isEmpty()) {
	            PrisonerReverse prisoner = priorityQueue.poll();
	            System.out.println(prisoner.name+" "+ prisoner.weight);
	        }
		
	

	}

}


class PrisonerReverse implements Comparable<PrisonerReverse>{
	
	String name;
	int weight;
	
	public PrisonerReverse() {

	}

	public PrisonerReverse(String name, int weight) {
		this.name = name;
		this.weight = weight;
	}
	
	public String getName() {
		return name;
	}
	public int getWeight() {
		return weight;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public void setWeight(int weight) {
		this.weight = weight;
	}

	@Override
	public int compareTo(PrisonerReverse target) {
		
		if(this.weight>target.weight) {
			return -1;
		}else if(this.weight< target.weight) {
			return 1;
		}
		return 0;
	}
	
	
	
	
}
