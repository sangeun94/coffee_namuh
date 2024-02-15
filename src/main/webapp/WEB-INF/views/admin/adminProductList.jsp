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

<link rel="shortcut icon" href="/images/favicon-32x32.png" type="image/x-icon">

<!-- <script src="/js/admin/jquery-1.8.3.min.js"></script> -->
<script src="/js/admin/jquery-ui-1.10.3.custom.js"></script>
<script src="/js/admin/common.js"></script>
<script src="/js/admin/categorylist.js"></script>

</head>
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

				<li class="gnb_1dli active">
					<a href="/admin/drinkList" class="gnb_1da">상품관리</a>
				</li>
				<li class="gnb_1dli">
					<a href="/admin/orderList" class="gnb_1da">주문관리</a>
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
		<ion-icon name="bag-handle-outline" class="bag_handle"></ion-icon><h2>상품관리</h2>
	</div>
		<dl>
		<dt class="g10 menu_toggle">상품관리</dt>		
        <dd class="g10"><a href="/admin/drinkList">음료 관리</a></dd>				
        <dd class="g10"><a href="/admin/foodList">푸드 관리</a></dd>		
        <dd class="g10 active"><a href="/admin/productList">상품 관리</a></dd>		
        </dl>
	</div>
	<div id="content">
		<div class="breadcrumb">
			<span>HOME</span> <ion-icon name="chevron-forward-outline"></ion-icon> 상품관리 
            <ion-icon name="chevron-forward-outline"></ion-icon> 상품 관리		
        </div>
	
<div class="s_wrap">
	<h1>상품 관리</h1>
	
<h2>기본검색</h2>
<form action="/admin/productList" name="fsearch" id="fsearch" method="get">

	<div class="tbl_frm01">
		<table class="tablef">
		<colgroup>
			<col class="w120">
			<col>
		</colgroup>
		<tbody>
		<tr>
			<th scope="row">검색어</th>
			<td>
				<select name="searchType">
					<option value="productNumber">상품번호</option>
					<option value="productName">상품이름</option>
					<option value="productDescription">상품설명</option>
				</select>
				<input type="text" name="searchKeyword" value="" class="frm_input" size="30">
			</td>
		</tr>
		<tr>
			<th scope="row">상품 타입</th>
			<td>
				<label><input type="radio" name="productType" value="0" checked="checked"> 전체 </label>	
				<label><input type="radio" name="productType" value="1"> 머그 </label>
				<label><input type="radio" name="productType" value="2"> 텀블러 </label>
				<label><input type="radio" name="productType" value="3"> 원두 </label>
				<label><input type="radio" name="productType" value="4"> 악세서리 </label>					
			</td>
		</tr>
		<tr>
			<th scope="row">상태</th>
			<td>
				<label><input type="radio" name="productStatus" value="0" checked="checked"> 전체</label>
				<label><input type="radio" name="productStatus" value="1"> 판매중 </label>
				<label><input type="radio" name="productStatus" value="2"> 품절 </label>
				<label><input type="radio" name="productStatus" value="3"> 판매종료 </label>
	
			</td>
		</tr>
		<tr>
			<th scope="row">가격</th>
			<td>
				<label for="" class=""></label>
				<input type="number" name="minPrice" min="0" value="" id="" class="frm_input w90" maxlength="20">원
				 ~ 
				<label for="" class=""></label>
				<input type="number" name="maxPrice" max="50000" value="" id="" class="frm_input w90" maxlength="20">원
				
			</td>
		</tr>
		<tr>
			<th scope="row">텀블러,머그</th>
			<td>
				<label for="" class=""></label>
				<input type="number" name="mlSizeStart" min="0" value="" id="" class="frm_input w90" maxlength="20">ml
				 ~ 
				<label for="" class=""></label>
				<input type="number" name="mlSizeEnd" max="50000" value="" id="" class="frm_input w90" maxlength="20">ml
				
			</td>
		</tr>
		<tr>
			<th scope="row">원두</th>
			<td>
				<label for="" class=""></label>
				<input type="number" name="beansSizeStart" min="0" value="" id="" class="frm_input w90" maxlength="20">g
				 ~ 
				<label for="" class=""></label>
				<input type="number" name="beansSizeEnd" max="50000" value="" id="" class="frm_input w90" maxlength="20">g
				
			</td>
		</tr>
		<tr>
			<th scope="row">재고수량</th>
			<td>
				<input type="number" name="productStockQuantity" min="0" max="50000" value="" id="" class="frm_input w90" maxlength="20">개 이상
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
		전체 : <b class="fc_red">${totalProductList}</b> 건 조회
	</div>
	
<form id="frm_customers" action="/admin/productRemove" method="post">
	
	<div class="local_frm01">
		<button type="submit" class="btn_delete btn_lsmall bx-white">선택삭제</button>
		<a href="/admin/productRegister" class="fr btn_lsmall red"><ion-icon name="add-outline"></ion-icon>상품등록</a>
	</div>
	
	<div class="tbl_head02">
		<table id="sodr_list" class="tablef">
		<colgroup>
			
		</colgroup>
		<thead>
		<tr>
			<th scope="col"><input type="checkbox" name="chkall"></th>
			<th scope="col">번호</th>
			<th scope="col">이미지</th>
			<th scope="col">이름</th>
			<th scope="col">설명</th>	
			<th scope="col">사이즈</th>
			<th scope="col">가격</th>
			<th scope="col">재고수량</th>
			<th scope="col">상태</th>
			<th scope="col">정보 수정</th>
	
		</tr>
		
		</thead>
		<tbody>
			<c:forEach var="productItem" items="${productList}">
				<tr class="list1">
				<td>
					<input type="checkbox" class="chb_checkNumber" name="productNumber" value="${productItem.productNumber}">
				</td>
				<td >${productItem.productNumber}</td>
				<td ><img src="${productItem.fullFilePath}" width="70" height="70"></td>
				<td>${productItem.productName}</td>
				<td>${productItem.productDescription}</td>
				<td>
				    <c:choose>
				        <c:when test="${productItem.productType == 1 or productItem.productType == 2}">
				            ${productItem.productSize}ml
				        </c:when>
				        <c:when test="${productItem.productType == 3 or productItem.productType == 4}">
				            ${productItem.productSize}g
				        </c:when>
				    </c:choose>
				</td>
				<td>${productItem.productPrice}원</td>
				<td>${productItem.productStockQuantity}개</td>
				<td>
					<c:choose>
				        <c:when test="${productItem.productStatus == 1}">판매중</c:when>
				        <c:when test="${productItem.productStatus == 2}">품절</c:when>
				        <c:when test="${productItem.productStatus == 3}">판매종료</c:when>
				    </c:choose>
				</td>
				<td>
					<button type="button" id="btn_modify" onclick="window.location.href='/admin/productModify?productNumber=${productItem.productNumber}'" class="btn_lsmall">수정</button>
				</td>
			</tr>
			</c:forEach>
		</tbody>
		</table>
	</div>
	<div class="local_frm02">
		<button type="submit" class="btn_delete btn_lsmall bx-white">선택삭제</button>
		<a href="/admin/productRegister" class="fr btn_lsmall red"><ion-icon name="add-outline"></ion-icon>상품등록</a>
	</div>

</div>
</form>

</div>
</div>
<div id="ft">
	<p>Copyright &copy; coffee namuh. All rights reserved.</p>
</div>


<div id="ajax-loading"><img src="/images/admin/ajax-loader.gif"></div>
<div id="anc_header"><a href="#anc_hd"><span></span>TOP</a></div>

<script src="/js/admin/admin.js"></script>

<script src="/js/admin/wrest.js"></script>

<script>

    // 'fsearch'라는 ID를 가진 폼의 내용을 초기화하는 함수
    function resetSearchForm() {
        document.getElementById('fsearch').reset();
    }
    
    // 선택삭제
    document.querySelectorAll('.btn_delete').forEach(function(button) {
        button.addEventListener('click', function(event) {
            event.preventDefault(); // 폼 자동 제출 방지

            if (confirm("정말 삭제하시겠습니까?")) {
                console.log('삭제 확인 누름');

                const chb_arr = document.querySelectorAll('.chb_checkNumber');

                let sendArr = [];

                chb_arr.forEach(function(item) {
                    if (item.checked === true) {
                        console.log(item.value);
                        sendArr.push(item.value);
                    }
                });

                console.log(sendArr);
                console.log(JSON.stringify(sendArr));

                // 필요한 경우 폼 제출
                var form = document.querySelector('#frm_customers');
                    if (form) {
                        form.submit();
                    } else {
                        console.error('Form not found');
                    }
            }
    	});
    });
    
/*     function updateProductPriceDisplay(value) {
        document.getElementById('productPriceDisplay').textContent = value + 'g';
    }

    // 페이지 로드 시 슬라이더의 초기 값을 설정합니다.
    document.addEventListener('DOMContentLoaded', function() {
        updateMenuSizeDisplay(document.getElementById('productPrice').value);
    }); */


</script>

</body>
</html>
