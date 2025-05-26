package org.example.servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class MarkReadServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] bookIds = request.getParameterValues("bookIds");
		HttpSession session = request.getSession();

		// For simplicity, assume reader ID is stored in session after registration or login
		Integer readerId = (Integer) session.getAttribute("readerId");
		if (readerId == null) {
			response.getWriter().println("Please register or login first.");
			return;
		}

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_book_store", "root", "********");

			String sql = "INSERT INTO reader_books (reader_id, book_id) VALUES (?, ?)";

			PreparedStatement ps = conn.prepareStatement(sql);

			for (String bookIdStr : bookIds) {
				int bookId = Integer.parseInt(bookIdStr);
				ps.setInt(1, readerId);
				ps.setInt(2, bookId);
				try {
					ps.executeUpdate();
				} catch (SQLIntegrityConstraintViolationException e) {
					// Ignore duplicates if user already marked book as read
				}
			}
			response.getWriter().println("<h2>Books marked as read successfully!</h2>");
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("<h2>Error while marking books.</h2>");
		}
	}
}
