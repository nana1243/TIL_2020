package polymorphism;

import org.springframework.stereotype.Component;

@Component("apple")
public class AppleSpeaker implements Speaker {

	public AppleSpeaker() {
		System.out.println("apple start");
	}

	@Override
	public void volumeUp() {
		System.out.println("applespeaker volume up!");

	}

	@Override
	public void volumeDown() {
		System.out.println("applespeaker volume down!");

	}

}
