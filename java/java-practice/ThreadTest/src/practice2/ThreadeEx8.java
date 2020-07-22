package practice2;

public class ThreadeEx8 {
	

	public static void main(String[] args) {
		
		Thread t1 = new ThreadEx1();
		Thread t2= new ThreadEx2();
		Thread t3= new ThreadEx3();
		Thread t4= new ThreadEx4();
		Thread t5= new ThreadEx5();
		
		t2.setPriority(10);
		t1.setPriority(4);
		
		t1.start();
		t2.start();
		t3.start();
		t4.start();
		t5.start();
	

	}

}


class ThreadEx1 extends Thread{
	@Override
	public void run() {
		for(int i=0;i<10;i++) {
			System.out.println(2*i+"번째 입니다--thread1");
		}
	}
	
}

class ThreadEx2 extends Thread{
	@Override
	public void run() {
		for( int i=100;i>80;i--) {
			System.out.println(i+"번째입니다 --thread2");
		}
	
	}
	
}


class ThreadEx3 extends Thread{
	@Override
	public void run() {
		for( int i=100;i>120;i--) {
			System.out.println(i+"번째입니다 --thread3");
		}
	
	}
	
}



class ThreadEx4 extends Thread{
	@Override
	public void run() {
		for( int i=100;i>120;i++) {
			System.out.println(i+"번째입니다 --thread4");
		}
	
	}
	
}


class ThreadEx5 extends Thread{
	@Override
	public void run() {
		for( int i=150;i>140;i--) {
			System.out.println(i+"번째입니다 --thread5");
		}
	
	}
	
}