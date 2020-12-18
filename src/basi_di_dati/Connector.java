package basi_di_dati;

import java.sql.*;

public class Connector {	
	private Connection con;
	
	public Connector(String db, String user, String password) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			String url = "jdbc:mysql://localhost:3306/" + db;
			con = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("[!] DB driver not found");
			System.out.println(e);
		} catch (Exception e) {
			System.out.println("[!] Connection Failed");
			System.out.println(e);
		}
	}

	public Connection getConnection() {
		return con;
	}
}
