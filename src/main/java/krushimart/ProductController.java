package krushimart;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/product")
public class ProductController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		int id = Integer.parseInt(req.getParameter("id"));
		String product_name = req.getParameter("product_name");
		double price = Double.parseDouble(req.getParameter("price"));
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		int user_id = Integer.parseInt(req.getParameter("user_id"));

		Product product = new Product();
//		product.setId(id);
		product.setProduct_name(product_name);
		product.setPrice(price);
		product.setQuantity(quantity);
		product.setUserId(user_id);

		RequestDispatcher dispatcher = null;
		User user = new User();

		try {
			ProductCRUD crud = new ProductCRUD();
			int count = crud.createPost(product);
			if (count != 0) {

				HttpSession httpSession = req.getSession();
				httpSession.setAttribute("session", user.getEmail());

				List<Product> list = crud.dispalyAll();

				req.setAttribute("List", list);
				dispatcher = req.getRequestDispatcher("homePageFamer.jsp");
				req.setAttribute("message2", "Product Added ");

			}
			dispatcher.forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
