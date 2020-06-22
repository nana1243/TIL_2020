package stackpractice;

import java.util.ArrayDeque;
import java.util.Deque;

class Truck {
	int weight;
	int time;

	public Truck(int weight, int time) {
		this.weight = weight;
		this.time = time;
	}

}

public class sol1 {
	
	public static void main(String[] args) {
		// test case
		int bridge_length = 2;
		int weight = 10;
		int[] truck_weights = new int[] { 7, 4, 5, 6 };


		Deque<Truck> cross = new ArrayDeque<Truck>();
		Deque<Truck> crossing = new ArrayDeque<Truck>();
		Deque<Integer> waiting = new ArrayDeque<Integer>();

		for (int elm : truck_weights) {
			waiting.add(elm);
		}
		
		int firsttruck=waiting.pollFirst();
		System.out.println(firsttruck);
		
		int time = 1;
		Truck truck = new Truck(firsttruck, time);
		crossing.add(truck);

		while(crossing.isEmpty()==false) {
			if(time-crossing.getFirst().time ==bridge_length-1) {
				cross.add(crossing.poll());
			}
			  time+=1;
			  int sumlist=0;
			  
//			 for(int i=0;i<crossing.size();i++) {
//				sumlist+=crossing.get 
//			 }
//			
//		            sumlist+=crossing[i][0]
//			
		}

	}

}
