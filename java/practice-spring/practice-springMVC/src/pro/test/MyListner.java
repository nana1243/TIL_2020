package pro.test;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class MyListner implements ServletContextListener {

	
    public void contextDestroyed(ServletContextEvent sce)  { 
    	System.out.println("context가 파기되었습니다");
         
    }

	
    public void contextInitialized(ServletContextEvent sce)  { 
       System.out.println("context가 초기화되었습니다");
       sce.getServletContext().setAttribute("name", "practice");
    }
	
}
