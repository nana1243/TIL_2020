package polymorphism;

public class LgTV implements TV{
	
	public LgTV() {
	System.out.println("lgtv start");
	}
	
	public void initMethod() {
		System.out.println("servlet�� init method�� ���� ����");
	}
	
	public void destoryMethod() {
		System.out.println("destroy�ɋ�");
	}

	@Override
	public void powerOn() {
		System.out.println("LGTV Ŵ");
		
	}

	@Override
	public void powerOff() {
		System.out.println("LGTV ��");
		
	}

	@Override
	public void volumeOn() {
		System.out.println("LGTV �ұ�Ŵ");
		
	}
	@Override
	public void volumeOff() {
		System.out.println("LGTV �ұ��");
		
	}

}