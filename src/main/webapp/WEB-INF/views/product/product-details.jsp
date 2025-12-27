<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${product.name}</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f6f8;
        margin: 0;
        padding: 0;
    }

    .details-container {
        max-width: 1000px;
        margin: 40px auto;
        background: #fff;
        padding: 30px;
        border-radius: 10px;
        display: flex;
        gap: 40px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.15);
    }

    .product-image img {
        width: 350px;
        height: 350px;
        object-fit: cover;
        border-radius: 8px;
    }

    .product-info {
        flex: 1;
    }

    .product-info h2 {
        margin-bottom: 10px;
    }

    .brand {
        color: #555;
        margin-bottom: 10px;
    }

    .category {
        font-size: 14px;
        color: #777;
        margin-bottom: 15px;
    }

    .price {
        font-size: 24px;
        color: #2e7d32;
        font-weight: bold;
        margin: 15px 0;
    }

    .description {
        margin-bottom: 20px;
        line-height: 1.6;
        color: #444;
    }

    .stock {
        font-weight: bold;
        margin-bottom: 20px;
    }

    .out-of-stock {
        color: red;
    }

    .buttons {
        display: flex;
        gap: 15px;
    }

    .btn {
        padding: 12px 20px;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
    }

    .add-cart {
        background-color: #1976d2;
        color: #fff;
    }

    .buy-now {
        background-color: #2e7d32;
        color: #fff;
    }

    .btn:disabled {
        background-color: #aaa;
        cursor: not-allowed;
    }
</style>
</head>

<body>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<main>
<div class="details-container">

    <!-- Product Image -->
    <div class="product-image">
        <img src="${pageContext.request.contextPath}/resources/images/${product.imageUrl}"
             alt="${product.name}">
    </div>

    <!-- Product Info -->
    <div class="product-info">
        <h2>${product.name}</h2>

        <div class="brand">Brand: ${product.brand}</div>
        <div class="category">Category: ${product.category}</div>

        <div class="price">₹ ${product.price}</div>

        <div class="description">
            ${product.description}
        </div>

        <c:choose>
            <c:when test="${product.stockQuantity > 0}">
                <div class="stock">In Stock</div>

                <div class="buttons">
                    <!-- Add to Cart -->
                    <form action="${pageContext.request.contextPath}/cart/add" method="post">
                        <input type="hidden" name="productId" value="${product.id}">
                        <button type="submit" class="btn add-cart">
                            Add to Cart
                        </button>
                    </form>

                    <!-- Buy Now -->
                    <form action="${pageContext.request.contextPath}/buy/now" method="post">
                        <input type="hidden" name="productId" value="${product.id}">
                        <button type="submit" class="btn buy-now">
                            Buy Now
                        </button>
                    </form>
                </div>
            </c:when>

            <c:otherwise>
                <div class="stock out-of-stock">Out of Stock</div>

                <div class="buttons">
                    <button class="btn add-cart" disabled>Add to Cart</button>
                    <button class="btn buy-now" disabled>Buy Now</button>
                </div>
            </c:otherwise>
        </c:choose>

    </div>
</div>
</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>
