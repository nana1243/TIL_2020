package fortesthash;


import java.util.Arrays;

public class test02 {

	public static void main(String[] args) {
		
		String[] phone_book= { "97674223", "1195524421","119","229"};
		
		
//		int limit = phone_book.length;
//		
//		for(int i=0;i<limit;i++) {
//			for(int j =i+1;j<limit;j++) {
//				if(phone_book[j].startsWith(phone_book[i])) {
//					return false;
//				}else {
//					continue;
//				}
//			}
//		}
		
		Arrays.sort(phone_book);
		System.out.println(Arrays.toString(phone_book));
		
	
	}

}
