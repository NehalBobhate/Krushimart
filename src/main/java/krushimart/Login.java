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
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class Login extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
//		String role = req.getParameter("role");

		UserCRUD crud = new UserCRUD();
		String roll = "farmer";
		String id = null;
		RequestDispatcher dispatcher = null;
		try {
			User user = crud.userLogin(email);
			if (user.getPassword() != null) {
				if (password.equals(user.getPassword())) {
					HttpSession httpSession = req.getSession();
					httpSession.setAttribute("session", email);
					System.out.println(httpSession);
					if (user.getRole().equals("farmer")) {

						ProductCRUD productCRUD = new ProductCRUD();
						List<Product> list = productCRUD.dispalyAll();
						req.setAttribute("List", list);
						dispatcher = req.getRequestDispatcher("homePageFamer.jsp");
						req.setAttribute("message", "Login Success");

					} else {

						ProductCRUD productCRUD = new ProductCRUD();
						List<Product> list = productCRUD.dispalyAll();
						req.setAttribute("List", list);
						dispatcher = req.getRequestDispatcher("homePageBuyer.jsp");
						req.setAttribute("message", "Login Success");

					}
				} else {
					req.setAttribute("message", "Login Fail, Invalid Password");
					dispatcher = req.getRequestDispatcher("login.jsp");

				}
			}
			else {
				req.setAttribute("message", "Invalid Email, Please SignUp");
				dispatcher = req.getRequestDispatcher("SignUp.jsp");
				
			}
			dispatcher.forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
