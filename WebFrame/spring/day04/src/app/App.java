package app;

import java.util.ArrayList;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.frame.Service;
import com.vo.UserVO;

public class App {

	public static void main(String[] args) {
		// Start Spring Container
		AbstractApplicationContext factory
		= new GenericXmlApplicationContext("myspring.xml");
		
		Service<String,UserVO> biz = 
			(Service)factory.getBean("uservice");
		ArrayList<UserVO> list=null;
		try {
			list=biz.get();
			for(UserVO u:list) {
				System.out.println(u);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		UserVO dbuser;
		
		
//		UserVO user = 
//		new UserVO("id41", "pwd93", "¸»¼÷Å´");
//		try {
//			biz.register(user);
//			System.out.println("registerok");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
		factory.close();
	}

}



