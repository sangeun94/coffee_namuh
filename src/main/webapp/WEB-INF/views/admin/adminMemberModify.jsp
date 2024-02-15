<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!-- jstl 쓸때!! -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
				<li class="gnb_1dli active">
					<a href="/admin/adminMember" class="gnb_1da">회원관리</a>
				</li>

				<li class="gnb_1dli">
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
		<ion-icon name="people-outline" class="people_outline"></ion-icon> <h2> 회원관리 </h2>
	</div>
		<dl>
		<dt class="m10 menu_toggle">회원관리</dt>		
        <dd class="m10 active"><a href="/admin/adminMember">회원 정보관리</a></dd>		
        </dl>
	</div>
	<div id="content">
		<div class="breadcrumb">
			<span>HOME</span> <ion-icon name="chevron-forward-outline"></ion-icon> 회원관리 
            <ion-icon name="chevron-forward-outline"></ion-icon> 회원 정보관리		
        </div>
        
<form action="/admin/modifyMember" method="post">
	<div class="s_wrap">
		<h1>회원 정보수정</h1>
	
		<h2 class="mart30">개인정보 입력</h2>
		<div class="tbl_frm01">
	
		<table>
		<colgroup>
			<col class="w180">
			<col>
		</colgroup>
		<tbody>
		
		<!-- roomId가 식별자라서! hidden해놓고 넘기긴 해야지! -->
		<input type="hidden" name="userNumber" value="${user.userNumber}">
		
		<tr>
			<th scope="row"><label>아이디</label></th>
			<td>${user.userId}</td>
		</tr>
		<tr>
			<th scope="row"><label>임시 비밀번호</label></th>
	        <td><input type="text" name="userPassword" value="${user.userPassword}" class="frm_input" size="20" maxlength="20"></td>
	
		</tr>
		<tr>
			<th scope="row"><label for="reg_mb_email">E-mail</label></th>
	        <td><input type="text" name="userEmail" value="${user.userEmail}" class="frm_input" size="20" maxlength="20"></td>
		</tr>
		<tr>
			<th scope="row"><label>이름</label></th>
			<td><input type="text" name="userName" value="${user.userName}" class="frm_input required" size="20"></td>
		</tr>
	    <tr>
			<th scope="row"><label for="reg_mb_email">생년월일</label></th>
	        <td><input type="text" name="userBirth" value="${user.userBirth}" class="frm_input" size="20" maxlength="20"></td>
	    </tr>
		<tr>
			<th scope="row">주소</th>
			<td>
				<label for="zipcode" class="sound_only">우편번호</label>
				<input type="text" name="userZipcode" value="${user.userZipcode}" id="zipcode" class="frm_input" size="8" maxlength="5">
				<button type="button" id="btn" class="btn_small" onclick="">우편번호검색</button><br>
				<input type="text" name="userAddress" value="${user.userAddress}" id="address" class="frm_input frm_address" size="60">
				<label for="address">기본주소</label><br>
				<input type="text" name="userDetailAddress" value="${user.userDetailAddress}" id="detailAddress" class="frm_input frm_address" size="60">
				<label for="detailAddress">상세주소</label><br>
			</td>
		</tr>
		<tr>
	        <th scope="row">회원여부</th>
	        <td>
				<label for="withdrawal">
	            	<input type="radio" name="isMember" value="0" id="withdrawal" ${user.isMember == 0 ? 'checked' : ''}>
	            탈퇴</label>
				<label for="member">
	            	<input type="radio" name="isMember" value="1" id="member" ${user.isMember == 1 ? 'checked' : ''}>
	            회원</label>
	        </td>
		</tr>
	
		</tbody>
		</table>
	</div>
	<div class="btn_confirm">
		<button type="submit" id="btn_submit" class="btn_large"> 수정 </button>
	</div>
</form>

<script>
	function validateForm() {
	    var userPassword = document.querySelector("input[name='userPassword']").value;
	    if (!userPassword) { // userPassword가 비어있거나 null일 경우
	        alert("임시 비밀번호를 입력해주세요.");
	        return false; // 폼 제출을 중단
	    }
	    return true; // userPassword가 유효하면 폼 제출 계속
	}
	
	// 폼 제출 시 validateForm 함수 호출
	var form = document.querySelector("form");
	form.onsubmit = function(event) {
	    if (!validateForm()) {
	        event.preventDefault(); //유효성 검사를 통과하지 못하면, 폼의 기본 제출 동작을 중단
	    }
	};
</script>
</div>

</div>
</div>
<div id="ft">
	<p>Copyright &copy; coffe namuh. All rights reserved.</p>
</div>


<div id="ajax-loading"><img src="/images/admin/ajax-loader.gif"></div>
<div id="anc_header"><a href="#anc_hd"><span></span>TOP</a></div>

<script src="/js/admin/admin.js"></script>

<script src="/js/admin/wrest.js"></script>

<!-- 우편번호검색 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	const btn = document.querySelector("#btn");
	btn.addEventListener("click", () => {
		new daum.Postcode({
			oncomplete: function (data) {
				console.log(data);

				let fullAddr = '';
				let extraAddr = '';

				if (data.userSelectedType === 'R') {
					fullAddr = data.roadAddress;
				} else {
					fullAddr = data.jibunAddress;
				}

				if (data.userSelectedType === 'R') {
					if (data.baname !== '') {
						extraAddr += data.bname;
					}
					if (data.buildingName !== '') {
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}

					fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '')
				}
				document.getElementById('zipcode').value = data.zonecode;
				document.getElementById('address').value = fullAddr;
				document.getElementById('detailAddress').focus();
			}
		}).open();
	});
</script>

</body>
</html>
