package polymorphism;

import org.springframework.beans.factory.xml.XmlBeanDefinitionReader;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericApplicationContext;

public class TVuser {

	public static void main(String[] args) {
		

		GenericApplicationContext context = new GenericApplicationContext();
		new XmlBeanDefinitionReader(context).loadBeanDefinitions("applicationContext.xml");
		
		TV tv = (TV) context.getBean("lgtv");
		
		tv.powerOn();
		tv.volumeOff();
		
		
		
		
		tv.powerOff();		

	}

}
