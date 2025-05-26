package org.example.jdbc;

import java.sql.*;

public class ReaderDAO {
	private String jdbcURL = "jdbc:mysql://localhost:3306/online_book_store";
	private String jdbcUsername = "root";
	private String jdbcPassword = "DAV22@niet26";

	private static final String CHECK_READER_SQL = "SELECT id FROM reader WHERE name = ?";
	private static final String INSERT_READER_SQL = "INSERT INTO reader (name, email) VALUES (?, ?)";

	public ReaderDAO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");  // Load MySQL driver
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	protected Connection getConnection() throws SQLException {
		return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
	}

	public boolean readerExists(String name) throws SQLException {
		try (Connection connection = getConnection();
		     PreparedStatement preparedStatement = connection.prepareStatement(CHECK_READER_SQL)) {
			preparedStatement.setString(1, name);
			ResultSet rs = preparedStatement.executeQuery();
			return rs.next();
		}
	}

	public void addReader(String name, String email) throws SQLException {
		try (Connection connection = getConnection();
		     PreparedStatement preparedStatement = connection.prepareStatement(INSERT_READER_SQL)) {
			preparedStatement.setString(1, name);
			preparedStatement.setString(2, email);
			preparedStatement.executeUpdate();
		}
	}
}
