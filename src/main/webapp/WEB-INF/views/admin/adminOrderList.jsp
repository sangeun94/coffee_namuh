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

<!-- <script src="/js/admin/jquery-1.8.3.min.js"></script> -->
<script src="/js/admin/jquery-ui-1.10.3.custom.js"></script>
<script src="/js/admin/common.js"></script>
<script src="/js/admin/categorylist.js"></script>
</head>
<body>

<header id="hd">
	<div id="hd_wrap">
		<h1>행복을 주는 쇼핑몰!</h1>
		<div id="logo"><a href=""><img src="/image/admin/white_logo.png" alt="행복을 주는 쇼핑몰! 관리자"></a></div>
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
        <dd class="o10 active"><a href="/admin/orderList">주문리스트(전체)
        <dd class="o10"><a href="">배송준비</a></dd>		
        <dd class="o10"><a href="">배송중</a></dd>		
        <dd class="o10"><a href="">배송완료</a></dd>		
	
    </dl>
	</div>
	<div id="content">
		<div class="breadcrumb">
			<span>HOME</span> <ion-icon name="chevron-forward-outline"></ion-icon> 주문관리 
            <ion-icon name="chevron-forward-outline"></ion-icon> 주문리스트(전체)		
        </div>
	
<div class="s_wrap">
	<h1>주문리스트(전체)</h1>
	
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/jquery-ui.min.js"></script>
<script>
jQuery(function($){
    $.datepicker.regional["ko"] = {
        closeText: "닫기",
        prevText: "이전달",
        nextText: "다음달",
        currentText: "오늘",
        monthNames: ["1월(JAN)","2월(FEB)","3월(MAR)","4월(APR)","5월(MAY)","6월(JUN)", "7월(JUL)","8월(AUG)","9월(SEP)","10월(OCT)","11월(NOV)","12월(DEC)"],
        monthNamesShort: ["1월","2월","3월","4월","5월","6월", "7월","8월","9월","10월","11월","12월"],
        dayNames: ["일","월","화","수","목","금","토"],
        dayNamesShort: ["일","월","화","수","목","금","토"],
        dayNamesMin: ["일","월","화","수","목","금","토"],
        weekHeader: "Wk",
        dateFormat: "yymmdd",
        firstDay: 0,
        isRTL: false,
        showMonthAfterYear: true,
        yearSuffix: ""
    };
	$.datepicker.setDefaults($.datepicker.regional["ko"]);
});
</script>
<h2>기본검색</h2>
<form action="/admin/orderList" name="fsearch" id="fsearch" method="get">
<input type="hidden" name="code" value="list">

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
				</select>
				<input type="text" name="searchKeyword" value="" class="frm_input" size="30">
			</td>
		</tr>
		<tr>
			<th scope="row">기간검색</th>
			<td>
				<select name="sel_field">
					<option value="">주문일</option>	
				</select>
				<label for="fr_date" class="sound_only">시작일</label>
				<input type="date" name="orderDateStart" value="" id="fr_date" class="frm_input w80" maxlength="10">
				 ~ 
				<label for="to_date" class="sound_only">종료일</label>
				<input type="date" name="orderDateEnd" value="" id="to_date" class="frm_input w80" maxlength="10">
			</td>
		</tr>
		<tr>
			<th scope="row">결제방법</th>
			<td>
				<label><input type="radio" name="paymentMethod" value="" checked="checked"> 전체</label>
				<label><input type="radio" name="paymentMethod" value="1"> 신용카드</label>
				<label><input type="radio" name="paymentMethod" value="2"> 휴대폰결제</label>
				<label><input type="radio" name="paymentMethod" value="3"> 무통장입금</label>
	
			</td>
		</tr>
		</tbody>
		</table>
	</div>
	<div class="btn_confirm">
		<button type="submit" class="btn_medium"> 검색 </button>
		<button type="button" class="btn_medium grey" onclick="resetSearchForm()"> 초기화 </button>      
	</div>
</form>

<div class="local_ov mart30">
	전체 : <b class="fc_red">${totalOrder}</b> 건 조회
	<strong class="ov_a">총주문액 : ${totalOrderAmount}원</strong>
</div>

<form name="forderlist" id="forderlist" method="post">
<input type="hidden" name="q1" value="code=list">
<input type="hidden" name="page" value="1">

<div class="tbl_head01">
	<table id="sodr_list">
	<colgroup>
		<col class="w50">
		<col class="w100">
		<col class="w150">
		<col class="w40">
		<col class="w40">
		<col class="w60">
		<col class="w80">
		<col class="w80">
		<col class="w90">
		<col class="w90">
	</colgroup>
	<thead>
	<tr>
		<th scope="col">주문번호</th>
		<th scope="col">주문일시</th>
		<th scope="col">주문상품</th>
		<th scope="col">수량</th>
		<th scope="col">배송비</th>
		<th scope="col">주문상태</th>
		<th scope="col">주문자</th>
		<th scope="col">총주문액</th>
		<th scope="col">결제방법</th>
		<th scope="col">발주확인</th>

	</tr>
	</thead>
	<tbody>
		<c:forEach var="orderItem" items="${orderList}">
			<tr class="list0">
				<td>${orderItem.orderNumber}</td>
				<td>${orderItem.orderDate}</td>
				<td>${orderItem.productName}</td>
				<td>${orderItem.orderQuantity}</td>
				<td>${orderItem.shippingFee}</td>
				<td>${orderItem.orderStatus}</td>
				<td>${orderItem.ordererName}</td>
				<td>${orderItem.totalPrice}</td>
				<td>${orderItem.paymentMethod}</td>
				<td>
					<button type="button" id="btn_modify" onclick="window.location.href='/admin/modifyAnnounce?announcementNumber=${announceItem.announcementNumber}'" class="btn_lsmall">발주확인</button>
				</td>
			</tr>
		</c:forEach>
	</tbody>
	</table>




<script>
$(function(){
    $("#fr_date, #to_date").datepicker({ changeMonth: true, changeYear: true, dateFormat: "yy-mm-dd", showButtonPanel: true, yearRange: "c-99:c+99", maxDate: "+0d" 
});

	// 'fsearch'라는 ID를 가진 폼의 내용을 초기화
	function resetSearchForm() {
	    document.getElementById('fsearch').reset();
	}
</script>
</div>

</div>
</div>
<div id="ft">
	<p>Copyright &copy; coffee namuh. All rights reserved.</p>
</div>


<div id="ajax-loading"><img src="/image/admin/ajax-loader.gif"></div>
<div id="anc_header"><a href="#anc_hd"><span></span>TOP</a></div>

<script src="/js/admin/admin.js"></script>

<script src="/js/admin/wrest.js"></script>
</body>
</html>
