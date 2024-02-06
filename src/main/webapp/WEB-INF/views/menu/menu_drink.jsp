<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>

<head>
<meta charset="UTF-8">
<title>COFFEE NAMUH</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="../js/test.js"></script>
<link rel="icon" href="../images/favicon-32x32.png">
</head>

<body>
	<div class="cont_boxs menu_box">
		<div class="cont_title_wrap text_center">
			<div class="cont_title_info">커피나무의 엄선된 메뉴</div>
			<div class="cont_title robo">
				<h2>NAMUH MENU</h2>
			</div>
		</div>
		<div class="cont_text_wrap text_center">
			<div class="cont_text_info">※메뉴 이미지는 연출컷이라 실물과 다를 수 있습니다.</div>
		</div>
		<div class="cont_text_wrap list_checkbox_wrap">
			<div class="cont_text cont_text_title">
				<b>분류보기</b>
			</div>
			<div class="checkbox_wrap">
				<label class="checkbox"> <input type="checkbox" id=""
					name="list_checkbox_all" value="all" checked> <span
					class="check_mark"></span>
					<div class="checkbox_text">전체 상품보기</div>
				</label>
			</div>
			<div class="checkbox_wrap list_checkbox">
				<label class="checkbox"> <input type="checkbox" id=""
					name="list_checkbox" value="0"> <span class="check_mark"></span>
					<div class="checkbox_text">콜드 브루</div>
				</label>
			</div>
			<div class="checkbox_wrap list_checkbox">
				<label class="checkbox"> <input type="checkbox" id=""
					name="list_checkbox" value="1"> <span class="check_mark"></span>
					<div class="checkbox_text">에스프레소</div>
				</label>
			</div>
			<div class="checkbox_wrap list_checkbox">
				<label class="checkbox"> <input type="checkbox" id=""
					name="list_checkbox" value="2"> <span class="check_mark"></span>
					<div class="checkbox_text">프라푸치노</div>
				</label>
			</div>
			<div class="checkbox_wrap list_checkbox">
				<label class="checkbox"> <input type="checkbox" id=""
					name="list_checkbox" value="3"> <span class="check_mark"></span>
					<div class="checkbox_text">티</div>
				</label>
			</div>
			<div class="checkbox_wrap list_checkbox">
				<label class="checkbox"> <input type="checkbox" id=""
					name="list_checkbox" value="4"> <span class="check_mark"></span>
					<div class="checkbox_text">기타</div>
				</label>
			</div>
		</div>
		<div class="cont_text_wrap">
			<div
				class="cont_gallery_list cont_gallery_list2 cont_list cont_list4 cont_list_m cont_list_m2">
				<ul id="menu_list">
					<li><a class="inner_modal_open">
							<div class="cont_gallery_list_box">
								<div class="cont_gallery_list_img"
									style="width: 305px; height: 305px;">
									<div class="cont_gallery_list_label cont_gallery_list_label2">ICE</div>
									<img
										src="https://img.79plus.co.kr/megahp/manager/upload/menu/20240118000022_1705503622059_H8rL88kAbV.jpg">
								</div>
								<div class="cont_text_box">
									<div class="cont_text">
										<div class="cont_text_inner text_wrap cont_text_title">
											<div class="text text1">
												<b>쇼콜라 딸기라떼 프라페</b>
											</div>
										</div>
										<div class="cont_text_inner text_wrap cont_text_info">
											<div class="text text1">Chocolat Strawberry Latte
												frappe</div>
										</div>
									</div>
									<div class="cont_text cont_text_info">
										<div class="text_wrap">
											<div class="text text2">진하고 꾸덕한 초코 젤라또를 부드럽고 상큼달콤한 딸기
												연유 쉐이크에 더해 강렬한 달콤함을 즐길 수 있는 딸기시즌 한정 프라페</div>
										</div>
									</div>
								</div>
							</div>
					</a>
						<div class="inner_modal" style="display: block;">
							<div class="cont_text_box">
								<div class="cont_text inner_modal_title">
									<div class="cont_text_inner cont_text_title">
										<b>쇼콜라 딸기라떼 프라페</b>
									</div>
									<div class="cont_text_inner cont_text_info">Chocolat
										Strawberry Latte frappe</div>
									<div class="close_wrap">
										<div class="close"></div>
									</div>
								</div>
								<div class="cont_text">
									<div class="cont_text_inner">20oz</div>
									<div class="cont_text_inner">1회 제공량 589.9kcal</div>
								</div>
								<div class="cont_text">진하고 꾸덕한 초코 젤라또를 부드럽고 상큼달콤한 딸기 연유
									쉐이크에 더해 강렬한 달콤함을 즐길 수 있는 딸기시즌 한정 프라페</div>
								<div class="cont_text cont_text_info">알레르기 성분 : 우유, 대두</div>
							</div>
							<div
								class="cont_list cont_list2 cont_list_small cont_list_small2">
								<ul>
									<li>포화지방 20.3g</li>
									<li>당류 69.9g</li>
									<li>나트륨 218.9mg</li>
									<li>단백질 9.4g</li>
									<li>카페인 4.9mg</li>
								</ul>
							</div>
						</div></li>
				</ul>
			</div>
		</div>
	</div>
	</div>
	</div>
	</div>
	<c:forEach var="menuItem" items="${menuList}">
		<c:choose>
			<c:when test="${menuItem.menuType == 0}">
				<p>콜드 브루</p>
			</c:when>
			<c:when test="${menuItem.menuType == 1}">
				<p>에스프레소</p>
			</c:when>
			<c:otherwise>
				<p>${menuItem.menuName}${menuItem.menuType}</p>
			</c:otherwise>
		</c:choose>
	</c:forEach>


	</div>
	<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
	<script src="../../js/checkAll.js"></script>
</body>

</html>