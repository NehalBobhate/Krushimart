package krushimart;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/edit")
public class EditProfile extends HttpServlet{
	

		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			int id = Integer.parseInt(req.getParameter("id"));
			String first_name = req.getParameter("first_name");
			String last_name = req.getParameter("last_name");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			long phone = Long.parseLong(req.getParameter("phone"));
			String role = req.getParameter("role");

			User user = new User();
			user.setId(id);
			user.setFirst_name(first_name);
			user.setLast_name(last_name);
			user.setEmail(email);
			user.setPassword(password);
			user.setPhone(phone);
			user.setRole(role);

			UserCRUD crud = new UserCRUD();
			RequestDispatcher dispatcher = null;
			try {
				int count = crud.updateUser(user);
				if(count != 0) {
					if(role.equals("farmer")){
						dispatcher = req.getRequestDispatcher("profile.jsp");
						req.setAttribute("message", "Profile Update Successfully");
						dispatcher.forward(req, resp);
					}
					else {
						dispatcher = req.getRequestDispatcher("profilebuyer.jsp");
						req.setAttribute("message", "Profile Update Successfully");
						dispatcher.forward(req, resp);
					}
					
				}
			
					
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}


