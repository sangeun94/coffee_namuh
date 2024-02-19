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
		<ion-icon name="bag-handle-outline" class="bag_handle"></ion-icon><h2>상품관리</h2>
	</div>
		<dl>
		<dt class="g10 menu_toggle">상품관리</dt>		
        <dd class="g10 active"><a href="/admin/drinkList">음료 관리</a></dd>				
        <dd class="g10"><a href="/admin/foodList">푸드 관리</a></dd>		
        <dd class="g10"><a href="/admin/productList">상품 관리</a></dd>		
        </dl>
	</div>
	<div id="content">
		<div class="breadcrumb">
			<span>HOME</span> <ion-icon name="chevron-forward-outline"></ion-icon> 상품관리 
            <ion-icon name="chevron-forward-outline"></ion-icon> 음료관리		
        </div>
	
<div class="s_wrap">
	<h1>음료 관리</h1>
	
</script>
<h2>기본검색</h2>
<form action="/admin/drinkList" name="fsearch" id="fsearch" method="get">

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
					<option value="menuNumber">음료번호</option>
					<option value="menuName">음료이름</option>
					<option value="menuDescription">음료설명</option>
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
			<th scope="row">음료 타입</th>
			<td>
				<label><input type="radio" name="menuType" value="0" checked="checked"> 전체 </label>	
				<label><input type="radio" name="menuType" value="1"> 콜드브루 </label>
				<label><input type="radio" name="menuType" value="2"> 에스프레소 </label>
				<label><input type="radio" name="menuType" value="3"> 프라푸치노 </label>
				<label><input type="radio" name="menuType" value="4"> 티 </label>					
				<label><input type="radio" name="menuType" value="5"> 기타 </label>			
			</td>
		</tr>
		<tr>
			<th scope="row">사이즈</th>
			<td>
				<label><input type="radio" name="menuSize" value="0" checked="checked"> 전체</label>
				<label><input type="radio" name="menuSize" value="1"> 1oz </label>
				<label><input type="radio" name="menuSize" value="7"> 7oz </label>
				<label><input type="radio" name="menuSize" value="12"> 12oz </label>
				<label><input type="radio" name="menuSize" value="16"> 16oz </label>
	
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
	
<form id="frm_customers" action="/admin/drinkRemove" method="post">
	
	<div class="local_frm01">
		<button type="submit" class="btn_delete btn_lsmall bx-white">선택삭제</button>
		<a href="/admin/drinkRegister" class="fr btn_lsmall red"><ion-icon name="add-outline"></ion-icon>상품등록</a>
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
			<th scope="col">사이즈</th>
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
				<td>${menuItem.menuSize}oz</td>
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
					<button type="button" id="btn_modify" onclick="window.location.href='/admin/drinkModify?menuNumber=${menuItem.menuNumber}'" class="btn_lsmall">수정</button>
				</td>
			</tr>
			</c:forEach>
		</tbody>
		</table>
	</div>
	<div class="local_frm02">
		<button type="submit" class="btn_delete btn_lsmall bx-white">선택삭제</button>
		<a href="/admin/drinkRegister" class="fr btn_lsmall red"><ion-icon name="add-outline"></ion-icon>상품등록</a>
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


</script>

</body>
</html>
