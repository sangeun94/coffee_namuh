<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- jstl 쓸때!! -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

<link rel="shortcut icon" href="/images/favicon-32x32.png" type="image/x-icon">

<!-- <script src="/js/admin/jquery-1.8.3.min.js"></script> -->
<script src="/js/admin/jquery-ui-1.10.3.custom.js"></script>
<script src="/js/admin/common.js"></script>
<script src="/js/admin/categorylist.js"></script>
</head>

<style>
	.modal {
    display: none; 
    position: fixed; 
    z-index: 1; 
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto; 
    background-color: rgb(0,0,0); 
    background-color: rgba(0,0,0,0.4); 
	}
	
	#modalBody {
		margin-top: 20px;
	}
	
	.modal-content {
	    background-color: #fefefe;
	    margin: 20% 35%; 
	    padding: 20px;
	    border: 1px solid #888;
	    width: 40%; 
	}
	
	.close {
	    color: #aaa;
	    float: right;
	    font-size: 28px;
	    font-weight: bold;
	    margin-top: -13px;
	}
	
	.close:hover,
	.close:focus {
	    color: black;
	    text-decoration: none;
	    cursor: pointer;
	}
	
</style>

<body>
<header id="hd">
	<div id="hd_wrap">
		<h1>행복을 주는 쇼핑몰!</h1>
		<div id="logo"><a href=""><img src="/images/admin/white_logo.png" alt="행복을 주는 쇼핑몰! 관리자" class="logo"></a></div>
		<div id="tnb">
			<ul>
				<li> ${sessionScope.userName} 님 접속</li>
				<li><a href="/mainHome" target="_blank">COFFEE NAMUH 홈페이지</a></li>
				<li id="tnb_logout"><a href="/admin/logout">로그아웃</a></li>
			</ul>
		</div>

		<nav id="gnb">
			<h2>관리자 주메뉴</h2>
			<ul id="gnb_1dul">
				<li class="gnb_1dli">
					<a href="/admin/adminMember" class="gnb_1da">회원관리</a>
				</li>

				<li class="gnb_1dli">
					<a href="/admin/drinkList" class="gnb_1da">상품관리</a>
				</li>
				<li class="gnb_1dli active">
					<a href="/admin/totalOrderList" class="gnb_1da">주문관리</a>
				</li>
				<li class="gnb_1dli">
					<a href="/admin/feedback" class="gnb_1da">고객지원</a>
				</li>
				<li class="gnb_1dli">
					<a href="/admin/modifyAdmin" class="gnb_1da">마이페이지</a>
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
			<dd class="o10"><a href="/admin/totalOrderList">주문리스트(전체)</a></dd>		
	        <dd class="o10 active"><a href="/admin/orderList">신규주문</a></dd>
	        <dd class="o10"><a href="/admin/deliveryPrepare">배송준비</a></dd>		
	        <dd class="o10"><a href="/admin/delivering">배송중</a></dd>		
	        <dd class="o10"><a href="/admin/deliveryComplete">배송완료</a></dd>		
	
    	</dl>
	</div>
	<div id="content">
		<div class="breadcrumb">
			<span>HOME</span> <ion-icon name="chevron-forward-outline"></ion-icon> 주문관리 
            <ion-icon name="chevron-forward-outline"></ion-icon> 신규주문		
        </div>
	
<div class="s_wrap">
	<h1>신규 주문</h1>
	
	<h2>기본검색</h2>
<form action="/admin/orderList" name="fsearch" id="fsearch" method="get">

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
				<label for="fr_date" class="sound_only">시작일</label>
				<input type="date" name="orderDateStart" value="" id="fr_date" class="frm_input w90" maxlength="20">
				 ~ 
				<label for="to_date" class="sound_only">종료일</label>
				<input type="date" name="orderDateEnd" value="" id="to_date" class="frm_input w90" maxlength="20">
			</td>
		</tr>
		<tr>
			<th scope="row">결제방법</th>
			<td>
				<label><input type="radio" name="paymentMethod" value="0" checked="checked"> 전체</label>
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
				<td>${orderItem.shippingFee}</td>
				<td>
				    <c:choose>
				        <c:when test="${orderItem.orderStatus == 1}">상품준비중</c:when>
				        <c:when test="${orderItem.orderStatus == 2}">배송준비중</c:when>
				        <c:when test="${orderItem.orderStatus == 3}">배송중</c:when>
				        <c:when test="${orderItem.orderStatus == 4}">배송완료</c:when>
				        <c:when test="${orderItem.orderStatus == 5}">주문취소</c:when>
				        <c:when test="${orderItem.orderStatus == 6}">구매확정</c:when>
				    </c:choose>
				</td>
				<td>${orderItem.ordererName}</td>
				<td>${orderItem.totalPrice}</td>
				<td>
				    <c:choose>
				        <c:when test="${orderItem.paymentMethod == 1}">신용카드</c:when>
				        <c:when test="${orderItem.paymentMethod == 2}">휴대폰결제</c:when>
				        <c:when test="${orderItem.paymentMethod == 3}">무통장입금</c:when>
				    </c:choose>
				</td>
				<td>
					<button type="submit" id="btn_modify" class="btn_lsmall">발주확인</button>
				</td>
			</tr>
			</form>
		</c:forEach>
	</tbody>
	</table>

</div>

</div>
</div>
<div id="ft">
	<p>Copyright &copy; coffee namuh. All rights reserved.</p>
</div>


<div id="ajax-loading"><img src="/images/admin/ajax-loader.gif"></div>
<div id="anc_header"><a href="#anc_hd"><span></span>TOP</a></div>


<!-- Modal창 -->
<div id="myModal" class="modal">
    <!-- Modal content -->
    <div class="modal-content">
        <span class="close">&times;</span>
        <h1>주문 상세 정보</h1>
        <!-- 여기에 주문 상세 정보를 동적으로 삽입할 예정 -->
        <div id="modalBody">
            <!-- AJAX로 받은 데이터를 여기에 삽입 -->
        </div>
    </div>
</div>

<!-- 발주확인 메세지 -->
<c:if test="${not empty successMessage}">
<script>
    alert('${successMessage}');
</script>
</c:if>

<c:if test="${not empty errorMessage}">
<script>
    alert('${errorMessage}');
</script>
</c:if>



<script src="/js/admin/admin.js"></script>

<script src="/js/admin/wrest.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
// 모달 변수를 전역적으로 초기화
var modal = document.getElementById('myModal');

$(function() {
    // 'fsearch'라는 ID를 가진 폼의 내용을 초기화하는 함수
    function resetSearchForm() {
        document.getElementById('fsearch').reset();
    }

 // 모든 '.detailBtn' 버튼에 대해 클릭 이벤트 리스너를 설정
    $(document).on('click', '.detailBtn', function() {
        var orderNumber = $(this).data('order-number'); // data-order-number 속성에서 주문 번호 가져오기

        $.ajax({
            url: '/admin/orderDetail', // 서버의 주문 상세 정보 조회 엔드포인트
            type: 'GET',
            dataType: 'json', // 응답 데이터 타입을 JSON으로 지정
            data: { orderNumber: orderNumber }, // 요청 매개변수로 주문 번호 전달
            success: function(orderDetailList) {
                // 모달 창의 내용을 업데이트하기 위한 HTML 초기화
                var modalContent = '<div class="tbl_head01"><table class="sodr_list"><colgroup>' +
				                    '</colgroup><thead>' +
				                    '<tr><th scope="col">주문번호</th><th scope="col">주문상품</th>' +
				                    '<th scope="col">수량</th><th scope="col">총금액</th></tr></thead><tbody>';

				$.each(orderDetailList, function(index, orderDetail) {
				    modalContent += '<tr class="list0">' +
				                    '<td>' + orderDetail.orderNumber + '</td>' +
				                    '<td>' + orderDetail.productName + '</td>' +
				                    '<td>' + orderDetail.orderQuantity + '</td>' +
				                    '<td>' + orderDetail.price + '</td>' +
				                    '</tr>';
                });
                
                modalContent += '</table>'; // 테이블 닫기
                
                $('#modalBody').html(modalContent); // 모달 본문에 HTML 삽입
                modal.style.display = 'block'; // 모달 창 표시
            },
            error: function(xhr, status, error) {
                console.error("AJAX 요청 실패: ", status, error);
            }
        });
    });

    // '.close' 클래스를 가진 요소를 클릭했을 때 모달을 닫음
    $(document).on('click', '.close', function() {
        modal.style.display = "none";
    });

    // 모달 외부를 클릭했을 때 모달을 닫음
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    };
});
</script>


</body>
</html>
