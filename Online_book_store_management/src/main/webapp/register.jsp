<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ourBooks - Register Reader</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-r from-blue-100 via-purple-100 to-pink-100 min-h-screen flex flex-col items-center justify-center font-sans">

    <header class="mb-10">
        <h1 class="text-5xl font-bold text-purple-700 drop-shadow-lg">📚 ourBooks</h1>
        <p class="text-lg text-gray-700 mt-2">Your personal library companion</p>
    </header>

    <main class="bg-white p-8 rounded-lg shadow-lg w-full max-w-md">
        <h2 class="text-2xl font-semibold text-center text-purple-600 mb-6">Register New Reader</h2>
        <form action="register" method="post" class="space-y-5">
            <div>
                <label for="name" class="block text-sm font-medium text-gray-700">Name</label>
                <input type="text" name="name" id="name" required
                       class="mt-1 w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-purple-400 focus:border-transparent">
            </div>
            <div>
                <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                <input type="email" name="email" id="email" required
                       class="mt-1 w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-purple-400 focus:border-transparent">
            </div>
            <div class="text-center">
                <input type="submit" value="Register"
                       class="bg-purple-600 text-white font-semibold px-6 py-2 rounded-md hover:bg-purple-700 transition">
            </div>
        </form>
    </main>

    <footer class="mt-10 text-gray-500 text-sm">
        &copy; 2025 ourBooks. All rights reserved.
    </footer>

</body>
</html>
