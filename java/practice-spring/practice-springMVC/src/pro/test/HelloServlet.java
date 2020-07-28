package pro.test;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet({ "/HelloServlet", "/helloservlet" })
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("do get");
		response.getWriter().println("doGet");
		response.getWriter().println("<h1> Hello Servlet </h1><br>");
		response.getWriter().println("hi" + getServletContext().getAttribute("name"));
		response.getWriter().println("</body></html>");

		
	}

}
