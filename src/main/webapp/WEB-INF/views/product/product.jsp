<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>

<head>
<meta charset="UTF-8">
<title>COFFEE NAMUH</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery.min.js"></script>
<link rel="shortcut icon" href="../images/favicon-32x32.png"
	type="image/x-icon">

<style>

</style>
<link href="../css/product/product.css" rel="stylesheet" type="text/css">
</head>

<body>
	<!-- 헤더 -->
	<%@ include file="/WEB-INF/views/header/header.jsp"%>

	<div class="cont">
		<div class="cont-head">
			<div class="cont-title-info">커피나무 상품들</div>
			<div class="cont-title">PRODUCT MENU</div>
			<div class="cont-text-info">※메뉴 이미지는 연출컷이라 실물과 다를 수 있습니다.</div>
		</div>
		<div class="cont-select">
			<div class="cont-select-title">상품</div>
			<fieldset class="cont-select-fieldset">
				<div class="cont-select-subtitle">분류보기</div>
				<hr>
				<div class="wrapper">
					<label><input type="checkbox" class="checkAll" checked><strong>전체선택</strong></label>
					<label><input type="checkbox" class="chkbox" checked><span>머그</span></label>
					<label><input type="checkbox" class="chkbox" checked><span>텀블러</span></label>
					<label><input type="checkbox" class="chkbox" checked><span>원두</span></label>
					<label><input type="checkbox" class="chkbox" checked><span>악세사리</span></label>
				</div>
			</fieldset>
		</div>

		<div class="pl product-list-1">
			<div class="cont-menu-title">머그</div>
			<ul class="menu-item-box">
				<!-- 메뉴 반복으로 돌려야할 부분 -->
				<c:forEach var="productItem" items="${productList}">
					<c:choose>
						<c:when test="${productItem.productType == 1}">
							<li>
								<ul class="menu-item">
									<li class="menu-img"><img
										src="${productItem.filePath}${productItem.originalFileName}">
									</li>
									<li class="menu-title">
										<p><b>${productItem.productName}</b></p>
										<p class="product-price">${productItem.productPrice}원</p>
									</li>
									<!-- 아이콘 추가 -->
    <li class="add-to-cart" data-cart-url="/cart"><i class="fas fa-shopping-cart"></i> 담기</li>
								</ul>
							</li>
						</c:when>
					</c:choose>
				</c:forEach>
			</ul>
		</div>
		<div class="pl product-list-2">
			<div class="cont-menu-title">텀블러</div>
			<ul class="menu-item-box">
				<!-- 메뉴 반복으로 돌려야할 부분 -->
				<c:forEach var="productItem" items="${productList}">
					<c:choose>
						<c:when test="${productItem.productType == 2}">
							<li>
								<ul class="menu-item">
									<li class="menu-img"><img
										src="${productItem.filePath}${productItem.originalFileName}">
									</li>
									<li class="menu-title">
										<p><b>${productItem.productName}</b></p>
										<p class="product-price">${productItem.productPrice}원</p>
									</li>
									<li class="add-to-cart" data-cart-url="/cart"><i class="fas fa-shopping-cart"></i> 담기</li>
								</ul>
							</li>
						</c:when>
					</c:choose>
				</c:forEach>
			</ul>
		</div>
		<div class="pl product-list-3">
			<div class="cont-menu-title">원두</div>
			<ul class="menu-item-box">
				<!-- 메뉴 반복으로 돌려야할 부분 -->
				<c:forEach var="productItem" items="${productList}">
					<c:choose>
						<c:when test="${productItem.productType == 3}">
							<li>
								<ul class="menu-item">
									<li class="menu-img"><img
										src="${productItem.filePath}${productItem.originalFileName}">
									</li>
									<li class="menu-title">
										<p><b>${productItem.productName}</b></p>
										<p class="product-price">${productItem.productPrice}원</p>
									</li>
									<li class="add-to-cart" data-cart-url="/cart"><i class="fas fa-shopping-cart"></i> 담기</li>
								</ul>
							</li>
						</c:when>
					</c:choose>
				</c:forEach>
			</ul>
		</div>
		<div class="pl product-list-4">
			<div class="cont-menu-title">악세사리</div>
			<ul class="menu-item-box">
				<!-- 메뉴 반복으로 돌려야할 부분 -->
				<c:forEach var="productItem" items="${productList}">
					<c:choose>
						<c:when test="${productItem.productType == 4}">
							<li>
								<ul class="menu-item">
									<li class="menu-img"><img
										src="${productItem.filePath}${productItem.originalFileName}">
									</li>
									<li class="menu-title">
										<p><b>${productItem.productName}</b></p>
										<p class="product-price">${productItem.productPrice}원</p>
									</li>
									<li class="add-to-cart" data-cart-url="/cart"><i class="fas fa-shopping-cart"></i> 담기</li>
								</ul>
							</li>
						</c:when>
					</c:choose>
				</c:forEach>
			</ul>
		</div>
	</div>

	<!-- 푸터 -->
	<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
	<div id="scrollToTopButton" class="scroll-to-top">맨 위로</div>
	<script type="text/javascript" src="../js/product/product.js"></script>
</body>

</html>