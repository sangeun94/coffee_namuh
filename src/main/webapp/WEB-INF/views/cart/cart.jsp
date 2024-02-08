<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Shopping Cart</title>
</head>
<body>
    <h1>Shopping Cart</h1>
    <!-- 장바구니 내용을 표시하는 부분 -->
    <!-- 필요한 코드 작성 -->
    <form action="/cart/add" method="post">
        Product ID: <input type="text" name="productId"><br>
        Quantity: <input type="number" name="quantity" min="1"><br>
        <input type="submit" value="Add to Cart">
    </form>
    <form action="/cart/update" method="post">
        Item ID: <input type="text" name="itemId"><br>
        New Quantity: <input type="number" name="quantity" min="1"><br>
        <input type="submit" value="Update Cart">
    </form>
    <form action="/cart/remove" method="post">
        Item ID: <input type="text" name="itemId"><br>
        <input type="submit" value="Remove from Cart">
    </form>
</body>
</html>