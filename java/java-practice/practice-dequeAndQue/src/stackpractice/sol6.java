package stackpractice;

import java.util.ArrayList;

public class sol6 {
	public static void main(String[] args) {
		int[] prices= {1, 2, 3, 2, 3};
		int [] answer = new int[prices.length];

		for( int i=0;i<prices.length;i++) {
			int result = f(i,prices);
			answer[i] = result;
			
		}
		System.out.println(answer);

	}
	
	public static int f(int n,int[] testcase) {
		int cnt=0;
		for(int i=n+1;i<testcase.length;i++) {
			if(testcase[n]>testcase[i] ) {
				cnt+=1;
				break;
			}else {
				cnt+=1;
			}
		}
		return cnt;
	}
}
