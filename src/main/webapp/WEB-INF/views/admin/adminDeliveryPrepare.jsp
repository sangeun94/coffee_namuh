<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- jstl 쓸때!! -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>관리자 페이지</title>
<link type="text/css" href="/css/admin/reset.css" rel="stylesheet">
<link type="text/css" href="/css/admin/basic.css" rel="stylesheet">
<link type="text/css" href="/css/admin/button.css" rel="stylesheet">
<link rel="stylesheet" href="/css/admin/admin.css">
<link rel="stylesheet" href="/css/admin/jquery-ui.css">

<!-- fontawesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- ionicons -->
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

<link rel="shortcut icon" href="" type="image/x-icon">


<script>
// 자바스크립트에서 사용하는 전역변수 선언
var tb_url		 = "";
var tb_bbs_url	 = "";
var tb_shop_url  = "";
var tb_admin_url = "";
</script>

<script src="/js/admin/jquery-1.8.3.min.js"></script>
<script src="/js/admin/jquery-ui-1.10.3.custom.js"></script>
<script src="/js/admin/common.js"></script>
<script src="/js/admin/categorylist.js"></script>
</head>
<body>

<header id="hd">
	<div id="hd_wrap">
		<h1>행복을 주는 쇼핑몰!</h1>
		<div id="logo"><a href=""><img src="/images/admin/white_logo.png" alt="행복을 주는 쇼핑몰! 관리자"></a></div>
		<div id="tnb">
			<ul>
				<li><a href="">관리자정보</a></li>
				<li><a href="">관리자홈</a></li>
				<li><a href="" target="_blank">쇼핑몰</a></li>
				<li id="tnb_logout"><a href="">로그아웃</a></li>
			</ul>
		</div>

		<nav id="gnb">
			<h2>관리자 주메뉴</h2>
			<ul id="gnb_1dul">
				<li class="gnb_1dli">
					<a href="" class="gnb_1da">회원관리</a>
				</li>
				
				<li class="gnb_1dli">
					<a href="" class="gnb_1da">상품관리</a>
				</li>
				<li class="gnb_1dli active">
					<a href="" class="gnb_1da">주문관리</a>
				</li>
				
				<li class="gnb_1dli">
					<a href="" class="gnb_1da">고객지원</a>
				</li>

				<li class="gnb_1dli">
					<a href="" class="gnb_1da">마이페이지</a>
				</li>
			</ul>
		</nav>
	</div>
</header>
<div id="wrapper">
	
<div id="snb">
	<div class="snb_header ico_config">
		<ion-icon name="reader-outline" class="order_outline"></ion-icon><h2>주문관리</h2>
	</div>
		<dl>
		<dt class="o10 menu_toggle">주문관리</dt>		
        <dd class="o10"><a href="/admin/orderList">주문리스트
        <dd class="o10 active"><a href="">배송준비</a></dd>		
        <dd class="o10"><a href="">배송중</a></dd>		
        <dd class="o10"><a href="">배송완료</a></dd>		
	
    </dl>
	</div>
	<div id="content">
		<div class="breadcrumb">
			<span>HOME</span> <ion-icon name="chevron-forward-outline"></ion-icon> 주문관리 
            <ion-icon name="chevron-forward-outline"></ion-icon> 배송준비		
        </div>
	
<div class="s_wrap">
	<h1>배송준비</h1>


<h2>기본검색</h2>
<form name="fsearch" id="fsearch" method="get">
<div class="tbl_frm01">
	<table>
	<colgroup>
		<col class="w100">
		<col>
	</colgroup>
	<tbody>
		<tr>
			<th scope="row">검색어</th>
			<td>
				<select name="searchType">
					<option value="orderNumber">주문번호</option>
					<option value="productName">주문상품</option>
					<option value="ordererName">주문자명</option>
					<option value="trackingNumber">운송장번호</option>
					
				</select>
				<input type="text" name="searchKeyword" value="" class="frm_input" size="30">
			</td>
		</tr>
		<tr>
			<th scope="row">기간검색</th>
			<td>
				<label for="fr_date" class="sound_only">시작일</label>
				<input type="date" name="orderDateStart" value="" id="fr_date" class="frm_input w90" maxlength="20">
				 ~ 
				<label for="to_date" class="sound_only">종료일</label>
				<input type="date" name="orderDateEnd" value="" id="to_date" class="frm_input w90" maxlength="20">
			</td>
		</tr>
	</tbody>
	</table>
</div>
<div class="btn_confirm">
	<button type="submit" class="btn_medium"> 검색 </button>
	<input type="button" value="초기화" id="frmRest" class="btn_medium grey">
</div>
</form>

<div class="local_ov mart30">
	전체 : <b class="fc_red">29</b> 건 조회
	<strong class="ov_a">총주문액 : 2,099,450원</strong>
</div>

<form name="forderlist" id="forderlist" method="post">

<div class="tbl_head01">
	<table id="sodr_list">
	<colgroup>

	</colgroup>
	<thead>
	<tr>
		<th scope="col">주문번호</th>
		<th scope="col">주문일시</th>
		<th scope="col">주문상품</th>
		<th scope="col"></th>
		<th scope="col">수량</th>
		<th scope="col">택배회사</th>
		<th scope="col">운송장번호</th>
		<th scope="col">상태</th>
		<th scope="col">주문자</th>
		<th scope="col">총주문액</th>
		<th scope="col">배송</th>

	</tr>
	</thead>
	<tbody>
		<c:forEach var="orderItem" items="${orderList}">
			<form action="/admin/modifyOrderStatus1" name="forderlist" id="forderlist" method="post">
				<input type="hidden" name="orderNumber" value="${orderItem.orderNumber}" />

			<tr class="list0">
				<td>${orderItem.orderNumber}</td>
				<td>
	            	<!-- parseDate를 사용하여 문자열을 날짜 객체로 변환 -->
					<fmt:parseDate value="${orderItem.orderDate}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate"/>
					<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd" />						            	
	            </td>
				<td>
				    <c:choose>
				        <c:when test="${orderItem.additionalProductCount == 0}">
				            ${orderItem.firstProductName}
				        </c:when>
				        <c:otherwise>
				            ${orderItem.firstProductName} 외 ${orderItem.additionalProductCount}건
				        </c:otherwise>
				    </c:choose>
				</td>
				<td>
		            <button type="button" class="btn_lsmall detailBtn" data-order-number="${orderItem.orderNumber}">상세정보</button>
		        </td>
				<td>${orderItem.totalQuantity}</td>
				<td>${orderItem.courierName}</td>
				<td>${orderItem.trackingNumber}</td>			
				<td>
				    <c:choose>
				        <c:when test="${orderItem.orderStatus == 0}">상품준비중</c:when>
				        <c:when test="${orderItem.orderStatus == 1}">배송준비중</c:when>
				        <c:when test="${orderItem.orderStatus == 2}">배송중</c:when>
				        <c:when test="${orderItem.orderStatus == 3}">배송완료</c:when>
				        <c:when test="${orderItem.orderStatus == 4}">주문취소</c:when>
				        <c:when test="${orderItem.orderStatus == 5}">구매확정</c:when>
				    </c:choose>
				</td>
				<td>${orderItem.ordererName}</td>
				<td>${orderItem.totalPrice}</td>
				<td>
					<button type="submit" id="btn_modify" class="btn_lsmall">배송시작</button>
				</td>
			</tr>
			</form>
		</c:forEach>
	</tbody>
	</table>




<script>
$(function(){
    $("#fr_date, #to_date").datepicker({ changeMonth: true, changeYear: true, dateFormat: "yy-mm-dd", showButtonPanel: true, yearRange: "c-99:c+99", maxDate: "+0d" });

	// 주문서출력
	$("#frmOrderPrint, #frmOrderExcel").on("click", function() {
		var type = $(this).attr("id");
		var od_chk = new Array();
		var od_id = "";
		var $el_chk = $("input[name='chk[]']");

		$el_chk.each(function(index) {
			if($(this).is(":checked")) {
				od_chk.push($("input[name='od_id["+index+"]']").val());
			}
		});

		if(od_chk.length > 0) {
			od_id = od_chk.join();
		}

		if(od_id == "") {
			alert("처리할 자료를 하나 이상 선택해 주십시오.");
			return false;
		} else {
			if(type == 'frmOrderPrint') {
				var url = "./order/order_print.php?od_id="+od_id;
				window.open(url, "frmOrderPrint", "left=100, top=100, width=670, height=600, scrollbars=yes");
				return false;
			} else {
				this.href = "./order/order_excel2.php?od_id="+od_id;
				return true;
			}
		}
	});
});
</script>
</div>

</div>
</div>
<div id="ft">
	<p>Copyright &copy; coffee namuh. All rights reserved.</p>
</div>


<div id="ajax-loading"><img src="/images/admin/ajax-loader.gif"></div>
<div id="anc_header"><a href="#anc_hd"><span></span>TOP</a></div>

<script src="/js/admin/admin.js"></script>

<script src="/js/admin/wrest.js"></script>
</body>
</html>
