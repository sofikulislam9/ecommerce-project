<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        .container {
            width: 100%;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .card {
            width: 400px;
            background-color: #fff;
            padding: 25px;
            border-radius: 6px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .card h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
        }

        .form-group input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }

        .btn {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: #fff;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }

        .btn:hover {
            background-color: #218838;
        }

        .link {
            text-align: center;
            margin-top: 15px;
        }

        .error {
            color: red;
            text-align: center;
            margin-bottom: 10px;
        }

        .success {
            color: green;
            text-align: center;
            margin-bottom: 10px;
        }
    </style>
</head>

<body>

<div class="container">
    <div class="card">

        <h2>Register</h2>

        <!-- Error / Success Message -->
        <%
            String error = (String) request.getAttribute("error");
            String success = (String) request.getAttribute("success");
            if (error != null) {
        %>
            <div class="error"><%= error %></div>
        <%
            }
            if (success != null) {
        %>
            <div class="success"><%= success %></div>
        <%
            }
        %>

        <form action="${pageContext.request.contextPath}/register" method="post">

            <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="name" required />
            </div>

            <div class="form-group">
                <label>Email</label>
                <input type="email" name="email" required />
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" required />
            </div>

            <div class="form-group">
                <label>Phone</label>
                <input type="text" name="phone" required />
            </div>

            <!-- Hidden role -->
            <input type="hidden" name="role" value="USER" />

            <button type="submit" class="btn">Register</button>
        </form>

        <div class="link">
            Already have an account?
            <a href="${pageContext.request.contextPath}/login">Login</a>
        </div>

    </div>
</div>

</body>
</html>
