package stackpractice;

public class practicecompare {

	public static void main(String[] args) {
		String str1 ="AA";
		String str2 ="BB";
		String str3 ="CC";
		
		System.out.println(str1.compareTo(str2));
		System.out.println(str2.compareTo(str3));
		System.out.println(str3.compareTo(str1));
		
		
		String[] arr = new String[3];
		arr[0]=str1;
		arr[1]=str2;
		arr[2]=str3;
		
		System.out.println((arr[0]+arr[1]).compareTo(arr[1]+arr[0]));
		System.out.println((arr[0]+arr[1]));
		System.out.println((arr[1]+arr[0]).compareTo(arr[0]+arr[1]));
		System.out.println((arr[1]+arr[0]));
	}

}
