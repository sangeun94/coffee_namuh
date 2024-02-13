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

<style>
	/* 슬라이더 전체 스타일 */
input[type=range] {
  -webkit-appearance: none; /* 크롬, 사파리, 오페라에서 기본 디자인 제거 */
  width: 100%; /* 전체 너비 */
  margin: 10px 0; /* 슬라이더와 다른 요소 사이의 여백 */
}

/* 슬라이더 트랙(바탕) 스타일 */
input[type=range]::-webkit-slider-runnable-track {
  width: 100%;
  height: 8px; /* 트랙의 높이 */
  cursor: pointer;
  background: #3071A9; /* 트랙의 배경색 */
  border-radius: 5px; /* 트랙의 둥근 모서리 */
}

/* 슬라이더 썸(손잡이) 스타일 */
input[type=range]::-webkit-slider-thumb {
  -webkit-appearance: none; /* 기본 디자인 제거 */
  height: 20px; /* 썸의 높이 */
  width: 20px; /* 썸의 너비 */
  border-radius: 50%; /* 썸을 원형으로 만듦 */
  background: #ffffff; /* 썸의 배경색 */
  cursor: pointer;
  margin-top: -6px; /* 트랙 중앙에 썸을 위치시키기 위한 조정 */
}

/* 슬라이더에 포커스 됐을 때의 스타일 */
input[type=range]:focus {
  outline: none; /* 기본 아웃라인 제거 */
}

input[type=range]:focus::-webkit-slider-runnable-track {
  background: #367ebd; /* 포커스 됐을 때의 트랙 색상 변경 */
}

/* 슬라이더 호버 스타일 */
input[type=range]:hover::-webkit-slider-thumb {
  background: #blue; /* 호버됐을 때 썸의 색상 변경 */
}

</style>

<body>

<header id="hd">
	<div id="hd_wrap">
		<h1>행복을 주는 쇼핑몰!</h1>
		<div id="logo"><a href=""><img src="/images/admin/white_logo.png" alt="행복을 주는 쇼핑몰! 관리자"></a></div>
		<div id="tnb">
			<ul>
				<li><a href="">관리자정보</a></li>
				<li><a href="">관리자홈</a></li>
				<li><a href="" target="_blank">홈페이지</a></li>
				<li id="tnb_logout"><a href="">로그아웃</a></li>
			</ul>
		</div>

		<nav id="gnb">
			<h2>관리자 주메뉴</h2>
			<ul id="gnb_1dul">
				<li class="gnb_1dli">
					<a href="" class="gnb_1da">회원관리</a>
				</li>
				
				<li class="gnb_1dli active">
					<a href="/admin/drinkList" class="gnb_1da">상품관리</a>
				</li>
				<li class="gnb_1dli">
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
		<ion-icon name="bag-handle-outline" class="bag_handle"></ion-icon><h2>상품관리</h2>
	</div>
		<dl>
		<dt class="g10 menu_toggle">상품관리</dt>		
        <dd class="g10"><a href="/admin/drinkList">음료 관리</a></dd>				
        <dd class="g10 active"><a href="/admin/foodList">푸드 관리</a></dd>		
        <dd class="g10"><a href="">상품 관리</a></dd>		
        </dl>
	</div>
	<div id="content">
		<div class="breadcrumb">
			<span>HOME</span> <ion-icon name="chevron-forward-outline"></ion-icon> 상품관리 
            <ion-icon name="chevron-forward-outline"></ion-icon> 푸드관리		
        </div>
	
<div class="s_wrap">
	<h1>푸드 관리</h1>
	
</script>
<h2>기본검색</h2>
<form action="/admin/foodList" name="fsearch" id="fsearch" method="get">

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
					<option value="menuNumber">푸드번호</option>
					<option value="menuName">푸드이름</option>
					<option value="menuDescription">푸드설명</option>
					<option value="menuCalories">칼로리</option>
					<option value="menuSaturatedFat">포화지방</option>
					<option value="menuSugars">당류</option>
					<option value="menuSodium">나트륨</option>
					<option value="menuProtein">단백질</option>
					<option value="menuCaffeine">카페인함유량</option>
				</select>
				<input type="text" name="searchKeyword" value="" class="frm_input" size="30">
			</td>
		</tr>
		<tr>
			<th scope="row">푸드 타입</th>
			<td>
				<label><input type="radio" name="menuType" value="0" checked="checked"> 전체 </label>	
				<label><input type="radio" name="menuType" value="6"> 브레드 </label>
				<label><input type="radio" name="menuType" value="7"> 케이크 </label>
				<label><input type="radio" name="menuType" value="8"> 샌드위치 </label>
		
			</td>
		</tr>

		<tr>
			<th scope="row">총 내용량</th>
			<td>
				<label for="menuSize"></label>
				<input type="range" id="menuSize" name="menuSize" min="0" max="500" value="500" oninput="updateMenuSizeDisplay(this.value);" class="frm_input w90">
				<span id="menuSizeDisplay">0g</span>			
			</td>
		</tr>

		<tr>
			<th scope="row">알레르기 정보</th>
			<td>
				<label><input type="radio" name="menuAllergyInfo" value="0" checked="checked"> 전체</label>
				<label><input type="radio" name="menuAllergyInfo" value="1"> 우유 </label>
				<label><input type="radio" name="menuAllergyInfo" value="2"> 대두 </label>
				<label><input type="radio" name="menuAllergyInfo" value="3"> 우유 및 대두 </label>
				<label><input type="radio" name="menuAllergyInfo" value="4"> 없음 </label>
	
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
		전체 : <b class="fc_red">${totalMenuList}</b> 건 조회
	</div>
	
<form id="frm_customers" action="/admin/foodRemove" method="post">
	
	<div class="local_frm01">
		<button type="submit" class="btn_delete btn_lsmall bx-white">선택삭제</button>
		<a href="/admin/foodRegister" class="fr btn_lsmall red"><ion-icon name="add-outline"></ion-icon>상품등록</a>
	</div>
	
	<div class="tbl_head02">
		<table id="sodr_list" class="tablef">
		<colgroup>
			<col class="w10">
			<col class="w20">
			<col class="w40">
			<col class="w40">
			<col class="w50">
			<col class="w20">
			<col class="w20">
			<col class="w20">
			<col class="w20">
			<col class="w20">
			<col class="w20">
			<col class="w20">
			<col class="w20">
			<col class="w30">			
		</colgroup>
		<thead>
		<tr>
			<th scope="col"><input type="checkbox" name="chkall"></th>
			<th scope="col">번호</th>
			<th scope="col">이미지</th>
			<th scope="col">이름</th>
			<th scope="col">설명</th>	
			<th scope="col">총 내용량</th>
			<th scope="col">칼로리</th>
			<th scope="col">알레르기 정보</th>
			<th scope="col">포화지방</th>
			<th scope="col">당류</th>
			<th scope="col">나트륨</th>
			<th scope="col">단백질</th>
			<th scope="col">카페인 함유량</th>
			<th scope="col">정보 수정</th>
	
		</tr>
		
		</thead>
		<tbody>
			<c:forEach var="menuItem" items="${menuList}">
				<tr class="list1">
				<td>
					<input type="checkbox" class="chb_checkNumber" name="menuNumber" value="${menuItem.menuNumber}">
				</td>
				<td >${menuItem.menuNumber}</td>
				<td ><img src="${menuItem.fullFilePath}" width="70" height="70"></td>
				<td>${menuItem.menuName}</td>
				<td>${menuItem.menuDescription}</td>
				<td>${menuItem.menuSize}g</td>
				<td>${menuItem.menuCalories}kcal</td>
				<td>
					<c:choose>
				        <c:when test="${menuItem.menuAllergyInfo == 1}">우유</c:when>
				        <c:when test="${menuItem.menuAllergyInfo == 2}">대두</c:when>
				        <c:when test="${menuItem.menuAllergyInfo == 3}">우유 및 대두</c:when>
				        <c:when test="${menuItem.menuAllergyInfo == 4}">없음</c:when>
				    </c:choose>
				</td>
				<td>${menuItem.menuSaturatedFat}g</td>
				<td>${menuItem.menuSugars}g</td>
				<td>${menuItem.menuSodium}mg</td>
				<td>${menuItem.menuProtein}g</td>
				<td>${menuItem.menuCaffeine}mg</td>
				<td>
					<button type="button" id="btn_modify" onclick="window.location.href='/admin/foodModify?menuNumber=${menuItem.menuNumber}'" class="btn_lsmall">수정</button>
				</td>
			</tr>
			</c:forEach>
		</tbody>
		</table>
	</div>
	<div class="local_frm02">
		<button type="submit" class="btn_delete btn_lsmall bx-white">선택삭제</button>
		<a href="/admin/foodRegister" class="fr btn_lsmall red"><ion-icon name="add-outline"></ion-icon>상품등록</a>
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

    function updateMenuSizeDisplay(value) {
        document.getElementById('menuSizeDisplay').textContent = value + 'g';
    }

    // 페이지 로드 시 슬라이더의 초기 값을 설정합니다.
    document.addEventListener('DOMContentLoaded', function() {
        updateMenuSizeDisplay(document.getElementById('menuSize').value);
    });

</script>

</body>
</html>
