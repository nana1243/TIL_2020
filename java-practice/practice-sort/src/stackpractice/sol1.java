package stackpractice;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Set;

public class sol1 {
	
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
				}
			}
			System.out.println(Arrays.toString(c));
			
			ArrayList<Integer> anstmp = new ArrayList<Integer>();
			
			int cnt=1;
//			for(int i=0;i<c.length-1;i++) {
//				
//				if(c[i]==c[i+1] && i!=c.length-1) {
//					cnt++;
//				}else if(c[i]!=c[i+1] && i!=c.length-1) {
//					anstmp.add(cnt);
//					cnt=1;
//				}else if(i==c.length-1 &&)
//				
//			}
			
			
//			HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();
//			
//			for (Integer elm : c) {
//	            map.put(elm, map.getOrDefault(elm, 0) + 1);
//	        }
//			System.out.println(map);
//			int[] answer = new int[map.values().size()];
//			
//			int idx=0;
//			for(int elm : map.values() ) {
//				answer[idx]=elm;
//				idx++;
//			}

	       
	       
	      
		
	

	}

}
