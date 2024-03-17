package krushimart;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/forgot")
public class ForgotPassword extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String email = req.getParameter("email");
		String newPassword = req.getParameter("newpass");
		
		UserCRUD crud=new UserCRUD();
		try {
			String msg=crud.setNewPassword(email,newPassword);
			
			if (msg!=null) {
				RequestDispatcher dispatcher=req.getRequestDispatcher("login.jsp");
				dispatcher.forward(req, resp);
				} else {
					
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	

	
}
}
