package dataAccess;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnector {

	// Driver and URL
	private static final String DRIVER_JDBC = "com.mysql.jdbc.Driver";
	private static final String URL_DB = "jdbc:mysql://localhost/csdlwebthtv2?useUnicode=true&characterEncoding=utf-8";
	// Pass and User
	private static final String USER = "root";
	private static final String PASS = "123456789";

	private static Connection conn;

	public static Connection getConnection() {
		try {
			Class.forName(DRIVER_JDBC);
			conn = DriverManager.getConnection(URL_DB, USER, PASS);
			System.out.println("Connect success");
		} catch (Exception e) {
			 System.out.println("Error connection "+e);
		}

		return conn;
	}
}
