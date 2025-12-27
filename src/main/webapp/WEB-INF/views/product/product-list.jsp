<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Shopping Site</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f6f8;
        margin: 0;
        padding: 0;
    }

    h2 {
        text-align: center;
        margin: 20px 0;
    }

    .product-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 20px;
        padding: 20px;
        min-height: 60vh;
    }

    .product-card {
        background-color: #ffffff;
        width: 250px;
        border-radius: 8px;
        box-shadow: 0 2px 6px rgba(0,0,0,0.15);
        padding: 15px;
        text-align: center;
    }

    .product-card img {
        width: 150px;
        height: 150px;
        object-fit: cover;
        margin-bottom: 10px;
        cursor: pointer;
        transition: transform 0.2s ease;
    }

    .product-card img:hover {
        transform: scale(1.05);
    }

    .product-name {
        font-size: 18px;
        font-weight: bold;
    }

    .product-brand {
        color: #555;
        font-size: 14px;
    }

    .product-description {
        font-size: 14px;
        margin: 8px 0;
        color: #666;
    }

    .product-price {
        color: #2e7d32;
        font-size: 16px;
        font-weight: bold;
    }

    .out-of-stock {
        color: red;
        font-weight: bold;
        margin-top: 8px;
    }
</style>
</head>

<body>

<!-- HEADER -->
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!-- MAIN CONTENT -->
<main>

<h2>Our Products</h2>

<div class="product-container">

    <c:forEach var="product" items="${products}">
        <div class="product-card">

            <!-- CLICKABLE PRODUCT IMAGE -->
            <a href="${pageContext.request.contextPath}/product/details?id=${product.id}">
                <img src="${pageContext.request.contextPath}/resources/images/${product.imageUrl}"
                     alt="${product.name}">
            </a>

            <div class="product-name">${product.name}</div>
            <div class="product-brand">${product.brand}</div>
            <div class="product-description">${product.description}</div>
            <div class="product-price">₹ ${product.price}</div>

            <c:if test="${product.stockQuantity == 0}">
                <div class="out-of-stock">Out of Stock</div>
            </c:if>

        </div>
    </c:forEach>

</div>

</main>

<!-- FOOTER -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>
