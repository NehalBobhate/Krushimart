package krushimart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductCRUD {
	
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/krushimart", "root", "root");
		return connection;
	}
	
	public int createPost(Product product) throws ClassNotFoundException, SQLException {
		Connection connection = getConnection();
		PreparedStatement preparedStatement= connection.prepareStatement("INSERT INTO PRODUCT(PRODUCT_NAME,PRICE,QUANTITY,USER_ID) VALUES(?,?,?,?)");
//		preparedStatement.setInt(1, product.getId());
		preparedStatement.setString(1, product.getProduct_name());
		preparedStatement.setDouble(2, product.getPrice());
		preparedStatement.setInt(3, product.getQuantity());
		preparedStatement.setInt(4, product.getUserId());
		
		
		int count = preparedStatement.executeUpdate();
		
		preparedStatement.close();
		connection.close();
		return count;
	}
	
	public List<Product> dispalyAll() throws ClassNotFoundException, SQLException {
		Connection connection = getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM PRODUCT");
		ResultSet resultSet= preparedStatement.executeQuery();
		List <Product> list = new ArrayList<>();
		while(resultSet.next()) {
			Product product = new Product();
			product.setId(resultSet.getInt("id"));
			product.setProduct_name(resultSet.getString("product_name"));
			product.setPrice(resultSet.getDouble("price"));
			product.setQuantity(resultSet.getInt("quantity"));
			list.add(product);
		}
		preparedStatement.close();
		connection.close();
		return list;
	}

	public List<Product> getPostById(int userId) throws Exception, Exception {
		
		Connection connection = getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM PRODUCT WHERE USER_ID=?");
		preparedStatement.setInt(1, userId);
		
		ResultSet resultSet= preparedStatement.executeQuery();
		List <Product> list = new ArrayList<>();
		while(resultSet.next()) {
			Product product = new Product();
			product.setId(resultSet.getInt("id"));
			product.setProduct_name(resultSet.getString("product_name"));
			product.setPrice(resultSet.getDouble("price"));
			product.setQuantity(resultSet.getInt("quantity"));
			list.add(product);
		}
		preparedStatement.close();
		connection.close();
		return list;
		
	}

}
