package test01;

import java.util.PriorityQueue;

public class practicePq {
	
//	형량이 낮은 'thomson' 이라는 녀석부터 출소한다. 형량이 '99년'인 schofield는 제일 나중에 나올 것이다.
	
	private static PriorityQueue<Prisoner> getPriorityQueue() {

	    Prisoner prisoner1 = new Prisoner("james", 5);
	    Prisoner prisoner2 = new Prisoner("schofield", 99);
	    Prisoner prisoner3 = new Prisoner("alex", 14);
	    Prisoner prisoner4 = new Prisoner("silvia", 10);
	    Prisoner prisoner5 = new Prisoner("thomson", 1);

	    PriorityQueue<Prisoner> priorityQueue = new PriorityQueue<Prisoner>();

	    priorityQueue.offer(prisoner1);
	    priorityQueue.offer(prisoner2);
	    priorityQueue.offer(prisoner3);
	    priorityQueue.offer(prisoner4);
	    priorityQueue.offer(prisoner5);
	    
	    return priorityQueue;
	}


	public static void main(String[] args) {
		

        PriorityQueue<Prisoner> priorityQueue = getPriorityQueue();

        System.out.println("=============== Normal Order");

        while (!priorityQueue.isEmpty()) {
            Prisoner prisoner = priorityQueue.poll();
            System.out.println(prisoner.name +" " + prisoner.weight);
        }
		
		
	}

}



class Prisoner implements Comparable<Prisoner> {

    String name;
    int weight; // 형량
    
    
    public Prisoner() {
    
	}

    public Prisoner(String name, int weight) {
        this.name = name;
        this.weight = weight;
    }

    @Override
    public int compareTo(Prisoner target) {
        if (this.weight > target.weight) {
            return 1;
        } else if (this.weight < target.weight) {
            return -1;
        }
        return 0;
    }
    
    
  
   
}