<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>

<head>
<meta charset="UTF-8">
<title>COFFEE NAMUH</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery.min.js"></script>
<link rel="shortcut icon" href="../images/favicon-32x32.png"
	type="image/x-icon">

<style>

</style>
<link href="../css/menu/menu.css" rel="stylesheet" type="text/css">
</head>

<body>
	<!-- 헤더 -->
	<%@ include file="/WEB-INF/views/header/header.jsp"%>

	<div class="cont">
		<div class="cont-head">
			<div class="cont-title-info">커피나무의 엄선된 메뉴</div>
			<div class="cont-title">FOOD MENU</div>
			<div class="cont-text-info">※메뉴 이미지는 연출컷이라 실물과 다를 수 있습니다.</div>
		</div>
		<div class="cont-select">
			<div class="cont-select-title">푸드</div>
			<fieldset class="cont-select-fieldset">
				<div class="cont-select-subtitle">분류보기</div>
				<hr>
				<div class="wrapper">
					<label><input type="checkbox" class="checkAll" checked><strong>전체선택</strong></label>
					<label><input type="checkbox" class="chkbox" checked><span>브레드</span></label>
					<label><input type="checkbox" class="chkbox" checked><span>케이크</span></label>
					<label><input type="checkbox" class="chkbox" checked><span>샌드위치</span></label>
				</div>
			</fieldset>
		</div>

		<div class="mfl menu-food-list-1">
			<div class="cont-menu-title">브레드</div>
			<ul class="menu-item-box">
				<!-- 메뉴 반복으로 돌려야할 부분 -->
				<c:forEach var="menuItem" items="${menuList}">
					<c:choose>
						<c:when test="${menuItem.menuType == 6}">
							<li>
								<ul class="menu-item">
									<li class="menu-img"><img
										src="${menuItem.filePath}${menuItem.fileName}">
									</li>
									<li class="menu-title">
										<p>${menuItem.menuName}</p>
									</li>
								</ul>
							</li>
						</c:when>
					</c:choose>
				</c:forEach>
			</ul>
		</div>
		<div class="mfl menu-food-list-2">
			<div class="cont-menu-title">케이크</div>
			<ul class="menu-item-box">
				<!-- 메뉴 반복으로 돌려야할 부분 -->
				<c:forEach var="menuItem" items="${menuList}">
					<c:choose>
						<c:when test="${menuItem.menuType == 7}">
							<li>
								<ul class="menu-item">
									<li class="menu-img"><img
										src="${menuItem.filePath}${menuItem.fileName}">
									</li>
									<li class="menu-title">
										<p>${menuItem.menuName}</p>
									</li>
								</ul>
							</li>
						</c:when>
					</c:choose>
				</c:forEach>
			</ul>
		</div>
		<div class="mfl menu-food-list-3">
			<div class="cont-menu-title">샌드위치</div>
			<ul class="menu-item-box">
				<!-- 메뉴 반복으로 돌려야할 부분 -->
				<c:forEach var="menuItem" items="${menuList}">
					<c:choose>
						<c:when test="${menuItem.menuType == 8}">
							<li>
								<ul class="menu-item">
									<li class="menu-img"><img
										src="${menuItem.filePath}${menuItem.fileName}">
									</li>
									<li class="menu-title">
										<p>${menuItem.menuName}</p>
									</li>
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
	<script type="text/javascript" src="../js/menu/menu_food.js"></script>
</body>

</html>