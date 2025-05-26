<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.servlets.BookListServlet.Book" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ourBooks - Available Books</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-r from-blue-100 via-purple-100 to-pink-100 min-h-screen flex flex-col items-center justify-center font-sans">

    <header class="mb-10 text-center">
        <h1 class="text-5xl font-bold text-purple-700 drop-shadow-lg">📚 ourBooks</h1>
        <p class="text-lg text-gray-700 mt-2">Explore your collection</p>
    </header>

    <main class="bg-white p-8 rounded-lg shadow-lg w-full max-w-4xl">
        <h2 class="text-2xl font-semibold text-center text-purple-600 mb-6">Available Books</h2>

        <div class="overflow-x-auto">
            <table class="min-w-full border border-gray-300 rounded-md overflow-hidden">
                <thead class="bg-purple-100 text-purple-700">
                    <tr>
                        <th class="px-6 py-3 text-left text-sm font-medium">Title</th>
                        <th class="px-6 py-3 text-left text-sm font-medium">Author</th>
                        <th class="px-6 py-3 text-left text-sm font-medium">Genre</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200 bg-white text-gray-700">
                    <%
                        List<Book> books = (List<Book>) request.getAttribute("bookList");
                        if (books != null && !books.isEmpty()) {
                            for (Book book : books) {
                    %>
                    <tr class="hover:bg-purple-50">
                        <td class="px-6 py-4"><%= book.getTitle() %></td>
                        <td class="px-6 py-4"><%= book.getAuthor() %></td>
                        <td class="px-6 py-4"><%= book.getGenre() %></td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="3" class="px-6 py-4 text-center text-gray-500">No books found.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </main>

    <footer class="mt-10 text-gray-500 text-sm text-center">
        &copy; 2025 ourBooks. All rights reserved.
    </footer>

</body>
</html>
