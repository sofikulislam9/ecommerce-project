<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!-- HEADER START -->
<header style="background-color:#222; padding:15px 30px;">
    <div style="display:flex; justify-content:space-between; align-items:center;">

        <!-- LOGO -->
        <div>
            <a href="${pageContext.request.contextPath}/home"
               style="color:#fff; font-size:22px; font-weight:bold; text-decoration:none;">
                Ecommerce
            </a>
        </div>

        <!-- SEARCH BAR -->
        <div>
            <form action="${pageContext.request.contextPath}/products/search" method="get">
                <input type="text" name="keyword" placeholder="Search products..."
                       style="padding:6px; width:200px;">
                <button type="submit" style="padding:6px;">Search</button>
            </form>
        </div>

        <!-- NAVIGATION -->
        <nav>
            <a href="${pageContext.request.contextPath}/login"
               style="color:#fff; margin-right:15px; text-decoration:none;">Login</a>

            <a href="${pageContext.request.contextPath}/orders"
               style="color:#fff; margin-right:15px; text-decoration:none;">Orders</a>

            <a href="${pageContext.request.contextPath}/cart"
               style="color:#fff; text-decoration:none;">Cart</a>
        </nav>

    </div>
</header>
<hr>
<!-- HEADER END -->
