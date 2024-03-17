package krushimart;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterController extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		int id = Integer.parseInt(req.getParameter("id"));
		String first_name = req.getParameter("first_name");
		String last_name = req.getParameter("last_name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		long phone = Long.parseLong(req.getParameter("phone"));
		String role = req.getParameter("role");
		
		UserCRUD crud = new UserCRUD();
		
		User user = new User();
//		user.setId(id);
		user.setFirst_name(first_name);
		user.setLast_name(last_name);
		user.setEmail(email);
		user.setPassword(password);
		user.setPhone(phone);
		user.setRole(role);
		
		PrintWriter printWriter = resp.getWriter();
		try {
			int count = crud.signUp(user);
			if(count != 0) {
				resp.sendRedirect("login.jsp");
			}
			else {
				resp.sendRedirect("SignUp.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
