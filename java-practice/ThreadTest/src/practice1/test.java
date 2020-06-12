package practice1;

public class test {

	public static void main(String[] args) {
		
		Thread t1 = new thread1();
		
		Runnable r= new Runnable() {
			public void run() {
				for(int i=0;i<10;i++) {
					System.out.println(i);
				}
			}
		};
		
		
		Thread t2 = new Thread(r);
		t2.start();
		t1.start();
		
		
		
	}

}
