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
        margin-bottom: 10px;
    }

    .out-of-stock {
        color: red;
        font-weight: bold;
        margin-top: 8px;
    }

    .add-to-cart-btn {
        background-color: #1976d2;
        color: white;
        border: none;
        padding: 8px 12px;
        border-radius: 4px;
        cursor: pointer;
        font-size: 14px;
    }

    .add-to-cart-btn:disabled {
        background-color: #aaa;
        cursor: not-allowed;
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

            <!-- PRODUCT IMAGE -->
            <a href="${pageContext.request.contextPath}/home/details?id=${product.id}">
                <img src="${pageContext.request.contextPath}/resources/images/${product.imageUrl}"
                     alt="${product.name}">
            </a>

            <div class="product-name">${product.name}</div>
            <div class="product-brand">${product.brand}</div>
            <div class="product-description">${product.description}</div>
            <div class="product-price">₹ ${product.price}</div>

            <!-- ADD TO CART -->
            <c:choose>
                <c:when test="${product.stockQuantity > 0}">
                    <form action="${pageContext.request.contextPath}/cart/add" method="post">
                        <input type="hidden" name="productId" value="${product.id}" />
                        <button type="submit" class="add-to-cart-btn">
                            Add to Cart
                        </button>
                    </form>
                </c:when>

                <c:otherwise>
                    <div class="out-of-stock">Out of Stock</div>
                    <button class="add-to-cart-btn" disabled>
                        Add to Cart
                    </button>
                </c:otherwise>
            </c:choose>

        </div>
    </c:forEach>

</div>

</main>

<!-- FOOTER -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>
