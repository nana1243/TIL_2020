package polymorphism;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component("lgtv")
public class LgTV implements TV{
	
	
	@Autowired
	@Qualifier("apple")
	private Speaker speaker;
	
	public LgTV() {
	System.out.println("��ü����");
	
	}

	
	public LgTV(Speaker speaker) {
	System.out.println("lgtv start");
	this.speaker = speaker;
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