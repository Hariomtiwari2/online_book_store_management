package org.example.servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookListServlet extends HttpServlet {

	// Inner Book class to hold book data
	public static class Book {
		private int id;
		private String title;
		private String author;
		private String genre;

		public Book(int id, String title, String author, String genre) {
			this.id = id;
			this.title = title;
			this.author = author;
			this.genre = genre;
		}

		// Getters for JSP access
		public int getId() { return id; }
		public String getTitle() { return title; }
		public String getAuthor() { return author; }
		public String getGenre() { return genre; }
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Book> books = new ArrayList<>();

		try {
			// Load JDBC driver
			Class.forName("com.mysql.cj.jdbc.Driver");

			// Connect to DB - update credentials if needed
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/online_book_store",
					"root",
					"DAV22@niet26"
			);

			// Query all books
			String sql = "SELECT id, title, author, genre FROM books";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			// Loop through result and create Book objects
			while (rs.next()) {
				books.add(new Book(
						rs.getInt("id"),
						rs.getString("title"),
						rs.getString("author"),
						rs.getString("genre")
				));
			}

			rs.close();
			stmt.close();
			conn.close();

			// Set list in request attribute for JSP to access
			request.setAttribute("bookList", books);

			// Forward to JSP page to display the books
			RequestDispatcher rd = request.getRequestDispatcher("markRead.jsp");
			rd.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();  // Log full stack trace on server console

			response.setContentType("text/html");
			response.getWriter().println("<h2>Error loading books.</h2>");
			response.getWriter().println("<pre>" + e.getMessage() + "</pre>");
		}
	}
}
