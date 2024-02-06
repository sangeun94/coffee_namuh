<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp"%>
 <table border="1">
        <tr>
            <th>제품 번호</th>
            <th>수량</th>
        </tr>
        <c:forEach items="${cartItems}" var="item">
            <tr>
                <td>${item.productNumber}</td>
                <td>${item.cartQuantity}</td>
            </tr>
        </c:forEach>
    </table>


<%@ include file="/WEB-INF/views/footer/footer.jsp"%>

</body>
</html>