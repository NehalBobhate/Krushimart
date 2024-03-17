package krushimart;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class ProfileController extends HttpServlet{
	
	
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			UserCRUD crud = new UserCRUD();
			String email = req.getParameter("email");
			try {
				User user = crud.getUser(email);
				if (user != null) {
//					validating session
					HttpSession httpSession = req.getSession();
					System.out.println(httpSession);
					email = (String) httpSession.getAttribute("session");
					if(email != null) {
						req.setAttribute("use", user);
						RequestDispatcher dispatcher = req.getRequestDispatcher("edit.jsp");
						dispatcher.forward(req, resp);
					}
					else {
						req.setAttribute("message", "Session doen't exist please Login !!!");
						RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
						dispatcher.forward(req, resp);
					}
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}


}
