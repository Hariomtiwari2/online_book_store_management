package org.example.servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class RegisterServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/online_book_store", "root", "********");

			PreparedStatement ps = conn.prepareStatement("INSERT INTO reader(name, email) VALUES(?, ?)");
			ps.setString(1, name);
			ps.setString(2, email);
			ps.executeUpdate();
			conn.close();

			// ✅ Redirect to /books after successful registration
			response.sendRedirect("books");

		} catch (SQLIntegrityConstraintViolationException e) {
			response.setContentType("text/html");
			response.getWriter().println("<h2>Name already exists. Choose a different name.</h2>");
		} catch (Exception e) {
			e.printStackTrace();
			response.setContentType("text/html");
			response.getWriter().println("<h2>Error while registering.</h2>");
		}
	}
}
