package fortesthash;

import java.util.HashMap;

public class test01 {
	public static void main(String[] args) {


	String[] participant= {"marina", "josipa" , "nikola", "vinko","filipa"};
	String[] completion = {"josipa", "filipa" , "marina", "nikola" };
	String ans="";
	
	HashMap<String,Integer> hash= new HashMap<String, Integer>();
	
	// 
	for(String person: participant) {
		hash.put(person, hash.getOrDefault(person,0)+1);
	}
	System.out.println(hash.toString());
	
	for(String person: completion) {
		  hash.put(person, hash.getOrDefault(person, 0) - 1);
		  
		  if(hash.get(person)<0) {
			  ans+=person;
		  }
	}

	

}

}
