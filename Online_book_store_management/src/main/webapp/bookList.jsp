<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <p class="text-lg text-gray-700 mt-2">Your personal library companion</p>
    </header>

    <main class="bg-white p-8 rounded-lg shadow-lg w-full max-w-3xl">
        <h2 class="text-2xl font-semibold text-center text-purple-600 mb-6">📖 Available Books</h2>

        <div class="overflow-x-auto">
            <table class="min-w-full border border-gray-300 rounded-lg overflow-hidden text-left">
                <thead class="bg-purple-100 text-purple-800 uppercase text-sm">
                    <tr>
                        <th class="px-6 py-3 border-b">Title</th>
                        <th class="px-6 py-3 border-b">Author</th>
                        <th class="px-6 py-3 border-b">Genre</th>
                    </tr>
                </thead>
                <tbody class="text-gray-700">
                    <c:forEach var="book" items="${bookList}">
                        <tr class="hover:bg-purple-50 transition">
                            <td class="px-6 py-4 border-b">${book[0]}</td>
                            <td class="px-6 py-4 border-b">${book[1]}</td>
                            <td class="px-6 py-4 border-b">${book[2]}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </main>

    <footer class="mt-10 text-gray-500 text-sm text-center">
        &copy; 2025 ourBooks. All rights reserved.
    </footer>

</body>
</html>
