package stackpractice;

import java.util.*;

public class sortsol2 {

	public static void main(String[] args) {

		int[] numbers = { 6, 10, 2 };
		
		
        String[] arr = new String[numbers.length];
       
        for(int i = 0; i < numbers.length; i++) {
        	arr[i] = String.valueOf(numbers[i]);
        }
        
        System.out.println(Arrays.toString(arr));

        Arrays.sort(arr, (o1,o2)->(o2+o1).compareTo(o1+o2));
        StringBuffer sb = new StringBuffer();
        for(int i = 0; i < arr.length ; i++) {
        	sb.append(arr[i]);
        }
 

	}

}
