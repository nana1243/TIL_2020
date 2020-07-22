package practice3;

public class SyncTest {
 
	public static void main(String[] args) {
	

	}

}


class Threadex1 implements Runnable{
	
	public synchronized void calcSum(int n) {
		int sum =0;
		for( int i=0; i<n;i++) {
			sum+=i;
			System.out.println(sum);
		}
		
	}
	@Override
	public void run() {
		calcSum(100);
	}
}