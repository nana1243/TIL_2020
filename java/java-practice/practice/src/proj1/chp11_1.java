package proj1;

import java.util.ArrayList;

// List interface
public class chp11_1 {

	
	
	// 중복을 허용하고, 저장된 순서가 유지된다
	public static void main(String[] args) {
		// 1. 선언과 생성
		ArrayList<Integer> arr1 = new ArrayList<Integer>();
		ArrayList<Integer> arr2 = new ArrayList<Integer>();
		// 2. add
		for(int i=0;i<10;i++) {
			arr1.add(i*3);
			arr2.add(i*3-1);
		}
		System.out.println(arr1);
		
		// 2-1 addAll
		
		
		// arr3은 arr1+arr2로 만들고 싶다 이떄, addall은 arr자체를 추가할 수 있게 한다
		
		ArrayList<Integer> arr3 = new ArrayList<Integer>(arr1);
		arr3.addAll(arr2);
		System.out.println(arr3);
		
		int limit =  arr2.size();
		for(int i=0;i<limit;i++) {
			int elem = arr2.get(i); // 해당 index에 저장된 객체를 반환한다
			arr2.set(i,elem+2 ); // 해당 index에 객체를 저장해주는 역할

		}
		
		ArrayList<Integer> arr4=new ArrayList<Integer>(arr2.subList(10,13));
		System.out.println(arr4);
		
		// sort의 기능
//		arr4.sort();
		
		
	}

}
