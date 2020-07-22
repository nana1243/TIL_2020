package test01;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;

public class sol02 {
	
	public static int[] complete(int[] progresses,int[] speeds) {
		int[] c= new int[progresses.length];
		
		for(int i=0;i<progresses.length;i++) {
			  int result=(100-progresses[i])/speeds[i];
			  result = (int) Math.ceil(result);
			  c[i] = result;
		}

		return c;
	}

	public static void main(String[] args) {
		
		int[] progresses = {93,30,55};
		int[] speeds = {1,30,5};
		
		int[] c = complete(progresses, speeds);
		
		for(int i=0;i<c.length-1;i++) {
			if(c[i]>c[i+1]) {
				c[i+1]=c[i];
			}else {
				continue;
			}
		}
		
		System.out.println(Arrays.toString(c));
		
		HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();
		
		for (Integer elm : c) {
            map.put(elm, map.getOrDefault(elm, 0) + 1);
        }
		

		int[] answer= new int[map.size()];
		int idx=0;
		for(Integer elm : map.values()) {
			answer[idx]= elm;
			idx++;
		}
		System.out.println(Arrays.toString(answer));
		
		
	
		
		
		
		
		
	}

}
