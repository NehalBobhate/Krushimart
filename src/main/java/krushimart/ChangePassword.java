package krushimart;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/changepd")
public class ChangePassword extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String role=req.getParameter("role");
		
		
		User user = new User();
		
		user.setEmail(email);
		user.setPassword(password);
		


		UserCRUD crud = new UserCRUD();
		RequestDispatcher dispatcher = null;
		try {
			int count = crud.changePassword(user);
			if(count != 0) {
				if(role.equals("farmer")){
					dispatcher = req.getRequestDispatcher("login.jsp");
					req.setAttribute("message2", "Passaword changed, Please Login !");
					dispatcher.forward(req, resp);
					
				}
				else {
					dispatcher = req.getRequestDispatcher("profilebuyer.jsp");
					dispatcher.forward(req, resp);
				}
				
			}
		
				
		} catch (Exception e) {
			e.printStackTrace();
		}
	}



	}


