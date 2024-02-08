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
<link href="../css/menu/menu.css" rel="stylesheet" type="text/css">
</head>

<body>
	<!-- 헤더 -->
	<%@ include file="/WEB-INF/views/header/header.jsp"%>

	<div class="cont">
		<div class="cont-head">
			<div class="cont-title-info">커피나무의 엄선된 메뉴</div>
			<div class="cont-title">DRINK MENU</div>
			<div class="cont-text-info">※메뉴 이미지는 연출컷이라 실물과 다를 수 있습니다.</div>
		</div>
		<div class="cont-select">
			<div class="cont-select-title">음료</div>
			<fieldset class="cont-select-fieldset">
				<div class="cont-select-subtitle">분류보기</div>
				<hr>
				<div class="wrapper">
					<label><input type="checkbox" class="checkAll" checked><strong>전체선택</strong></label>
					<label><input type="checkbox" class="chkbox" checked><span>콜드
							브루</span></label> <label><input type="checkbox" class="chkbox" checked><span>에스프레소</span></label>
					<label><input type="checkbox" class="chkbox" checked><span>프라푸치노</span></label>
					<label><input type="checkbox" class="chkbox" checked><span>티</span></label>
					<label><input type="checkbox" class="chkbox" checked><span>기타</span></label>
				</div>
			</fieldset>
		</div>

		<div class="mdl menu-drink-list-1">
			<div class="cont-menu-title">콜드 브루</div>
			<ul class="menu-item-box">
				<!-- 메뉴 반복으로 돌려야할 부분 -->
				<c:forEach var="menuItem" items="${menuList}">
					<c:choose>
						<c:when test="${menuItem.menuType == 1}">
							<li>
								<ul class="menu-item">
									<li class="menu-img"><img
										src="${menuItem.filePath}${menuItem.originalFileName}">
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
		<div class="mdl menu-drink-list-2">
			<div class="cont-menu-title">에스프레소</div>
			<ul class="menu-item-box">
				<!-- 메뉴 반복으로 돌려야할 부분 -->
				<c:forEach var="menuItem" items="${menuList}">
					<c:choose>
						<c:when test="${menuItem.menuType == 2}">
							<li>
								<ul class="menu-item">
									<li class="menu-img"><img
										src="${menuItem.filePath}${menuItem.originalFileName}">
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
		<div class="mdl menu-drink-list-3">
			<div class="cont-menu-title">프라푸치노</div>
			<ul class="menu-item-box">
				<!-- 메뉴 반복으로 돌려야할 부분 -->
				<c:forEach var="menuItem" items="${menuList}">
					<c:choose>
						<c:when test="${menuItem.menuType == 3}">
							<li>
								<ul class="menu-item">
									<li class="menu-img"><img
										src="${menuItem.filePath}${menuItem.originalFileName}">
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
		<div class="mdl menu-drink-list-4">
			<div class="cont-menu-title">티</div>
			<ul class="menu-item-box">
				<!-- 메뉴 반복으로 돌려야할 부분 -->
				<c:forEach var="menuItem" items="${menuList}">
					<c:choose>
						<c:when test="${menuItem.menuType == 4}">
							<li>
								<ul class="menu-item">
									<li class="menu-img"><img
										src="${menuItem.filePath}${menuItem.originalFileName}">
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
		<div class="mdl menu-drink-list-5">
			<div class="cont-menu-title">기타</div>
			<ul class="menu-item-box">
				<!-- 메뉴 반복으로 돌려야할 부분 -->
				<c:forEach var="menuItem" items="${menuList}">
					<c:choose>
						<c:when test="${menuItem.menuType == 5}">
							<li>
								<ul class="menu-item">
									<li class="menu-img"><img
										src="${menuItem.filePath}${menuItem.originalFileName}">
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
	<script type="text/javascript" src="../js/menu/menu_drink.js"></script>
</body>

</html>