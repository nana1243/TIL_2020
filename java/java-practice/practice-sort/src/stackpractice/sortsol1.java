package stackpractice;

import java.util.Arrays;

public class sortsol1 {

	public static void main(String[] args) {
		
		
		int[] array= {1, 5, 2, 6, 3, 7, 4};
		int[][] commands = {{2, 5, 3}, {4, 4, 1}, {1, 7, 3}};
		
		int[] ans = new int[commands.length];
		
		for(int i=0;i<commands.length;i++) {
// python의 splicing과정을 arrays.copyofrange()의 함수로 대체할 수 있다
//			int[] temp = Arrays.copyOfRange(array, commands[i][0]-1, commands[i][1]);
			  int f = commands[i][0] -1;
			  int  e = commands[i][1] -1 ;
			  int[] tmp = new int[e-f+1];
			  int idx=0;
			  for( int j = f;j<e+1;j++) {
				  tmp[idx]=array[j];
				  idx++;
			  }
			  Arrays.sort(tmp);
			  int result = tmp[commands[i][2]-1];
			  ans[i]=result;
		}
		
		System.out.println(Arrays.toString(ans));

	}

}
