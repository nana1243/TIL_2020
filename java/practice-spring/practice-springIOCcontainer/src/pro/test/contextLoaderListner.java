package pro.test;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

public class contextLoaderListner extends ContextLoader implements ServletContextListener {
	
	
	
	public contextLoaderListner() {
		// TODO Auto-generated constructor stub
	}
	
	
	public contextLoaderListner(WebApplicationContext context) {
		super(context);
		
	}
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		
		ServletContextListener.super.contextInitialized(sce);
	}
}
