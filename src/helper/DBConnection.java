package helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.PersonOperationConstant;


public class DBConnection {

	public static Statement statement=null;
	public static Connection connection = null;
	public static PreparedStatement prepareStatement = null;
	public static ResultSet rs = null;
	public  Connection getconnection()
	{
		
		String username = "SYSTEM"; 
		String password = "nishankrocks"; 
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		try
		{
		Class.forName("oracle.jdbc.OracleDriver");
		connection=DriverManager.getConnection(url,username,password);
		//System.out.println("Getting connection now");
		return connection;
		}
		catch(ClassNotFoundException exception)
		{   
			System.out.println(PersonOperationConstant.CLASS_NOT_FOUND);
			
		} 
		catch (SQLException e)
		{
			System.out.println(PersonOperationConstant.SQL_EXCEPTION);
		}
		
		
		try {
			if(connection.isClosed())
			{
				System.out.println(PersonOperationConstant.CONNECTION_OPEN);
				return connection;
			}
			else
			{
				System.out.println(PersonOperationConstant.CONNECTION_NOT_OPEN);
			}
		} catch (SQLException e) {
			System.out.println(PersonOperationConstant.SQL_EXCEPTION);
		}
		return connection;
		
		
	}
	
	public void closeConnection(ResultSet result)
	{
			try {
				result.close();
			} catch (SQLException e) {
				System.out.println(PersonOperationConstant.SQL_EXCEPTION);
			}
		
	}
	public void closeConnection(Connection connection)
	{
			try {
				connection.close();
			} catch (SQLException e) {
				System.out.println(PersonOperationConstant.SQL_EXCEPTION);
			}
		
	}
	public void closeConnection(Statement statement)
	{
			try {
				statement.close();
			} catch (SQLException e) {
				System.out.println(PersonOperationConstant.SQL_EXCEPTION);
			}
		
	}
	public void closeConnection(PreparedStatement preparedStatement)
	{
			try {
				preparedStatement.close();
			} catch (SQLException e) {
				System.out.println(PersonOperationConstant.SQL_EXCEPTION);
			}
		
	}
		
}
