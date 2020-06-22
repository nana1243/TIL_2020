package stackpractice;

import java.util.Arrays;

public class sol2 {

	public static void main(String[] args) {
		//testcase
		int[] heights = {6,9,5,7,4};
		int [] answer = new int[heights.length];
		
		
		for(int i=0;i<answer.length;i++) {
			answer[i]=0;
		}
		int idx= heights.length-1;
		
		while(idx>0) {
			
			for (int i=idx;i>=0;i--) {
				   if (heights[idx]<heights[i]) {
					    answer[idx]=i+1;
					    break;
				   }
			}
			idx--;
		}
		System.out.println(Arrays.toString(answer));
		

	}

}
