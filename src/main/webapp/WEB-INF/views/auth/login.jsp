<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login | Ecommerce</title>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background: #f2f4f7;
    }

    .login-container {
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .card {
        width: 380px;
        background: #fff;
        padding: 25px;
        border-radius: 8px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        text-align: center;
    }

    h2 {
        margin-bottom: 20px;
        color: #333;
    }

    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 10px;
        margin: 8px 0;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    button {
        width: 100%;
        padding: 10px;
        margin-top: 10px;
        background: #007bff;
        border: none;
        color: #fff;
        font-size: 16px;
        border-radius: 4px;
        cursor: pointer;
    }

    button:hover {
        background: #0056b3;
    }

    .link {
        margin-top: 12px;
        font-size: 14px;
    }

    .link a {
        color: #007bff;
        text-decoration: none;
        cursor: pointer;
    }

    .link a:hover {
        text-decoration: underline;
    }

    .hidden {
        display: none;
    }

    .error {
        color: red;
        font-size: 14px;
        margin-bottom: 10px;
    }
</style>

<script>
    function showAdminLogin() {
        document.getElementById("userLogin").classList.add("hidden");
        document.getElementById("adminLogin").classList.remove("hidden");
    }

    function showUserLogin() {
        document.getElementById("adminLogin").classList.add("hidden");
        document.getElementById("userLogin").classList.remove("hidden");
    }
</script>

</head>
<body>

<div class="login-container">
    <div class="card">

        <!-- Error Message -->
        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>

        <!-- USER LOGIN (OPEN BY DEFAULT) -->
        <div id="userLogin">
            <h2>User Login</h2>

            <form action="${pageContext.request.contextPath}/auth/login" method="post">
                <input type="text" name="email" placeholder="Email" required>
                <input type="password" name="password" placeholder="Password" required>
                <button type="submit">Login</button>
            </form>

            <div class="link">
                New user?
                <a href="${pageContext.request.contextPath}/auth/register">Create an account</a>
            </div>

            <div class="link">
                <a onclick="showAdminLogin()">Login as Admin</a>
            </div>
        </div>

        <!-- ADMIN LOGIN -->
        <div id="adminLogin" class="hidden">
            <h2>Admin Login</h2>

            <form action="${pageContext.request.contextPath}/admin/login" method="post">
                <input type="text" name="username" placeholder="Admin Username" required>
                <input type="password" name="password" placeholder="Admin Password" required>
                <button type="submit">Login</button>
            </form>

            <div class="link">
                <a onclick="showUserLogin()">← Back to User Login</a>
            </div>
        </div>

    </div>
</div>



</body>
</html>
