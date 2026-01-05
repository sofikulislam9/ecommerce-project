<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Cart</title>

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

    .cart-container {
        width: 80%;
        margin: auto;
        background: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 6px rgba(0,0,0,0.15);
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    th, td {
        padding: 12px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #f0f0f0;
    }

    .product-info {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .product-info img {
        width: 60px;
        height: 60px;
        object-fit: cover;
        border-radius: 4px;
    }

    .price {
        color: #2e7d32;
        font-weight: bold;
    }

    .remove-btn {
        color: red;
        text-decoration: none;
        font-weight: bold;
    }

    .remove-btn:hover {
        text-decoration: underline;
    }

    .cart-summary {
        text-align: right;
        margin-top: 20px;
    }

    .checkout-btn {
        background-color: #2e7d32;
        color: white;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 5px;
        font-weight: bold;
    }

    .checkout-btn:hover {
        background-color: #1b5e20;
    }

    .empty-cart {
        text-align: center;
        font-size: 18px;
        color: #777;
        margin: 40px 0;
    }
</style>
</head>

<body>

<!-- HEADER -->
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<main>

<h2>Your Shopping Cart</h2>

<c:choose>
    <c:when test="${empty cartItems}">
        <div class="empty-cart">
            Your cart is empty 😕 <br><br>
            <a href="${pageContext.request.contextPath}/home">Continue Shopping</a>
        </div>
    </c:when>

    <c:otherwise>
        <div class="cart-container">

            <table>
                <tr>
                    <th>Product</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Action</th>
                </tr>

                <c:set var="grandTotal" value="0" />

                <c:forEach var="item" items="${cartItems}">
                    <tr>
                        <td>
                            <div class="product-info">
                                <img src="${pageContext.request.contextPath}/resources/images/${item.imageUrl}">
                                <span>${item.productName}</span>
                            </div>
                        </td>
                        <td class="price">₹ ${item.price}</td>
                        <td>${item.quantity}</td>
                        <td class="price">₹ ${item.totalPrice}</td>
                        <td>
                            <a class="remove-btn"
                               href="${pageContext.request.contextPath}/cart/remove/${item.id}">
                                Remove
                            </a>
                        </td>
                    </tr>

                    <c:set var="grandTotal"
                           value="${grandTotal + item.totalPrice}" />
                </c:forEach>
            </table>

            <div class="cart-summary">
                <h3>Grand Total: ₹ ${grandTotal}</h3>
                <a class="checkout-btn"
                   href="${pageContext.request.contextPath}/checkout">
                    Proceed to Checkout
                </a>
            </div>

        </div>
    </c:otherwise>
</c:choose>

</main>

<!-- FOOTER -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>
