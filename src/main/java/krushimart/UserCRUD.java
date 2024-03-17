package krushimart;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class UserCRUD {

	public Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/krushimart", "root", "root");
		return connection;
	}

	public int signUp(User user) throws ClassNotFoundException, SQLException {
		Connection connection = getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO USER(FIRST_NAME, LAST_NAME,EMAIL_ID,PASSWORD,PHONE_NO,ROLE) VALUES(?,?,?,?,?,?)");
//		preparedStatement.setInt(1, user.getId());
		preparedStatement.setString(1, user.getFirst_name());
		preparedStatement.setString(2, user.getLast_name());
		preparedStatement.setString(3, user.getEmail());
		preparedStatement.setString(4, user.getPassword());
		preparedStatement.setLong(5, user.getPhone());
		preparedStatement.setString(6, user.getRole());

		int count = preparedStatement.executeUpdate();
		preparedStatement.close();
		connection.close();
		return count;
	}

	public User userLogin(String email) throws ClassNotFoundException, SQLException {

		Connection connection = getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM USER WHERE EMAIL_ID=?");
		preparedStatement.setString(1, email);
		ResultSet resultSet = preparedStatement.executeQuery();
		User user = new User();
		while (resultSet.next()) {
			user.setPassword(resultSet.getString("password"));
			user.setRole(resultSet.getString("role"));
//			user.setId(resultSet.getInt("id"));
		}
		connection.close();
		return user;
	}
	
	public User getUser(String email) throws ClassNotFoundException, SQLException{
		Connection connection= getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM USER WHERE email_id=?");
		preparedStatement.setString(1, email);
		ResultSet resultSet= preparedStatement.executeQuery();
		User user = new User();
		while(resultSet.next()) {
			user.setId(resultSet.getInt("id"));
			user.setFirst_name(resultSet.getString("first_name"));
			user.setLast_name(resultSet.getString("last_name"));
			user.setPassword(resultSet.getString("password"));
			user.setPhone(resultSet.getLong("phone_no"));
			user.setRole(resultSet.getString("role"));
			user.setEmail(resultSet.getString("email_id"));
		}
		connection.close();
		return user;
		
	}
	
	public int updateUser(User user) throws ClassNotFoundException, SQLException {
		Connection connection = getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement("Update user set first_name = ?, Last_name =?, password = ?, email_id=?, phone_no = ?, role=?  where id = ?");
		preparedStatement.setString(1, user.getFirst_name());
		preparedStatement.setString(2, user.getLast_name());
		preparedStatement.setString(3, user.getPassword());
		preparedStatement.setString(4, user.getEmail());
		preparedStatement.setLong(5, user.getPhone());
		preparedStatement.setString(6, user.getRole());
		preparedStatement.setInt(7, user.getId());
		
		
		int count = preparedStatement.executeUpdate();
		connection.close();
		return count;
	}
	
	public int changePassword(User user) throws ClassNotFoundException, SQLException {
		Connection connection = getConnection();
		PreparedStatement preparedStatement= connection.prepareStatement("Update user set password =? where email_id =?");
		
		preparedStatement.setString(1, user.getPassword());	
		
		preparedStatement.setString(2, user.getEmail());
		
		int count = preparedStatement.executeUpdate();
		connection.close();
		return count;
	}

	public String setNewPassword(String email, String newPassword) throws Exception {
		
		Connection connection = getConnection();
		PreparedStatement preparedStatement= connection.prepareStatement("Update  USER  set password=? WHERE email_id =?");
		preparedStatement.setString(1, newPassword);
		preparedStatement.setString(2, email);
		int count=preparedStatement.executeUpdate();
	
		
		if (count!=0) {
			String msg="Success";
			return msg;
		}
		
			return null;
			
		
	}
	public int deletePost(int id) throws Exception, Exception {
		Connection connection = getConnection();
		PreparedStatement preparedStatement= connection.prepareStatement("DELETE FROM USER WHERE id =?");
		preparedStatement.setInt(1, id);
		int count = preparedStatement.executeUpdate();
		connection.close();
		return id;
		
	}
	
	

}
