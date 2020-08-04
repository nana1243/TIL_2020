package polymorphism;

public class SamsungTV implements TV {
	
	private SonySpeaker speaker;

	
	public SamsungTV() {
	System.out.println("saumsungtv 按眉积己");
	}
	
	public SamsungTV(SonySpeaker speaker) {
	System.out.println("saumsungtv 按眉积己22222222222222");
	this.speaker = speaker;
	}

	
	@Override
	public void powerOn() {
		System.out.println("伙己萍厚难咙");
	}
	@Override
	public void powerOff() {
		System.out.println("伙己萍厚波咙");
	}

	@Override
	public void volumeOn() {
		System.out.println("伙己萍厚 家府糯");

	}

	@Override
	public void volumeOff() {
		System.out.println("伙己萍厚 家府阐");

	}

}
