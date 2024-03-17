package krushimart;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/delete")
public class DeletePost extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		
		UserCRUD crud  = new UserCRUD();
		ProductCRUD crud2 = new ProductCRUD();
		RequestDispatcher dispatcher = null;
		try {
			int count = crud.deletePost(id);;
			if(count != 0) {
				List<Product> list = crud2.dispalyAll();
				req.setAttribute("List", list);
				dispatcher = req.getRequestDispatcher("profile.jsp");
				dispatcher.forward(req, resp);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	

}
