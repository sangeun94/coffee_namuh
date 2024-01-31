<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!-- jstl 쓸때!! -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>관리자 페이지</title>
<link type="text/css" href="css/admin/reset.css" rel="stylesheet">
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
		<div id="logo"><a href=""><img src="/image/admin/white_logo.png" alt="행복을 주는 쇼핑몰! 관리자" class="logo"></a></div>
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
				<li class="gnb_1dli active">
					<a href="" class="gnb_1da">회원관리</a>
				</li>

				<li class="gnb_1dli">
					<a href="" class="gnb_1da">상품관리</a>
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
		<ion-icon name="people-outline" class="people_outline"></ion-icon> <h2> 회원관리 </h2>
	</div>
		<dl>
		<dt class="m10 menu_toggle">회원관리</dt>		
        <dd class="m10 active"><a href="">회원 정보관리</a></dd>		
        <dd class="m10"><a href="">회원 등록하기</a></dd>			
        </dl>
	</div>
	<div id="content">
		<div class="breadcrumb">
			<span>HOME</span> <ion-icon name="chevron-forward-outline"></ion-icon> 회원관리 
            <ion-icon name="chevron-forward-outline"></ion-icon> 회원 정보관리		
        </div>
        
        	
<div class="s_wrap">
	<h1>회원 정보수정</h1>
	
<script src="http://demofran.com/js/jquery.register_form.js"></script>

<form name="fregisterform" id="fregisterform" action="./member/member_register_form_update.php" onsubmit="return fregisterform_submit(this);" method="post" autocomplete="off">
<input type="hidden" name="token" value="">

<h2>사이트 이용정보 입력</h2>
<div class="tbl_frm01">
	<table>
	<colgroup>
		<col class="w180">
		<col>
	</colgroup>
	<tbody>
	<tr>
		<th scope="row"><label for="reg_mb_id">아이디</label></th>
		<td>
			<input type="text" name="mb_id" id="reg_mb_id" required class="frm_input required" size="20" maxlength="20">
			<span id="msg_mb_id"></span>
			<span class="frm_info fc_125">영문자, 숫자, _ 만 입력 가능. 최소 3자이상 입력하세요.</span>		</td>
	</tr>
	<tr>
		<th scope="row"><label for="reg_mb_password">비밀번호</label></th>
		<td><input type="password" name="mb_password" id="reg_mb_password" required class="frm_input required" size="20" maxlength="20"> 4자 이상의 영문 및 숫자</td>
	</tr>
	<tr>
		<th scope="row"><label for="reg_mb_password_re">비밀번호 확인</label></th>
		<td><input type="password" name="mb_password_re" id="reg_mb_password_re" required class="frm_input required" size="20" maxlength="20"></td>
	</tr>
	</tbody>
	</table>
</div>

<h2 class="mart30">개인정보 입력</h2>
<div class="tbl_frm01">
	<table>
	<colgroup>
		<col class="w180">
		<col>
	</colgroup>
	<tbody>
	<tr>
		<th scope="row"><label for="reg_mb_name">이름(실명)</label></th>
		<td><input type="text" name="mb_name" id="reg_mb_name" required class="frm_input required" size="20"></td>
	</tr>
	<tr>
		<th scope="row"><label for="reg_mb_tel">전화번호</label></th>
		<td><input type="text" name="mb_tel" id="reg_mb_tel" class="frm_input" size="20" maxlength="20"></td>
	</tr>
	<tr>
		<th scope="row"><label for="reg_mb_hp">휴대폰번호</label></th>
		<td>
			<input type="text" name="mb_hp" id="reg_mb_hp" class="frm_input" size="20" maxlength="20">
			<span class="frm_info">
				<label><input type="checkbox" name="mb_sms" value="Y" checked="checked"> 휴대폰 문자메세지를 받겠습니다.</label>
			</span>
		</td>
	</tr>
	<tr>
		<th scope="row"><label for="reg_mb_email">E-mail</label></th>
		<td>
			<input type="text" name="mb_email" id="reg_mb_email" required class="frm_input required" size="40" maxlength="100">
			<span class="frm_info">
				<label><input type="checkbox" name="mb_mailling" value="Y" id="reg_mb_mailling" checked="checked"> 정보 메일을 받겠습니다.</label>
			</span>
		</td>
	</tr>
    <tr>
        <th scope="row">본인확인방법</th>
        <td>
            <input type="radio" name="mb_certify_case" value="ipin" id="mb_certify_ipin">
            <label for="mb_certify_ipin">아이핀</label>
            <input type="radio" name="mb_certify_case" value="hp" id="mb_certify_hp">
            <label for="mb_certify_hp">휴대폰</label>
        </td>
    </tr>
    <tr>
        <th scope="row">본인확인</th>
        <td>
            <input type="radio" name="mb_certify" value="1" id="mb_certify_yes">
            <label for="mb_certify_yes">예</label>
            <input type="radio" name="mb_certify" value="" id="mb_certify_no" checked="checked">
            <label for="mb_certify_no">아니오</label>
        </td>
	</tr>
    <tr>
        <th scope="row">성인인증</th>
        <td>
            <input type="radio" name="mb_adult" value="1" id="mb_adult_yes">
            <label for="mb_adult_yes">예</label>
            <input type="radio" name="mb_adult" value="0" id="mb_adult_no" checked="checked">
            <label for="mb_adult_no">아니오</label>
        </td>
    </tr>
	<tr>
		<th scope="row">주소</th>
		<td>
			<label for="reg_mb_zip" class="sound_only">우편번호</label>
			<input type="text" name="mb_zip" id="reg_mb_zip" class="frm_input" size="8" maxlength="5">
			<button type="button" class="btn_small" onclick="win_zip('fregisterform', 'mb_zip', 'mb_addr1', 'mb_addr2', 'mb_addr3', 'mb_addr_jibeon');">주소검색</button><br>
			<input type="text" name="mb_addr1" id="reg_mb_addr1" class="frm_input frm_address" size="60">
			<label for="reg_mb_addr1">기본주소</label><br>
			<input type="text" name="mb_addr2" id="reg_mb_addr2" class="frm_input frm_address" size="60">
			<label for="reg_mb_addr2">상세주소</label><br>
			<input type="text" name="mb_addr3" id="reg_mb_addr3" class="frm_input frm_address" size="60" readonly="readonly">
			<label for="reg_mb_addr3">참고항목</label>
			<input type="hidden" name="mb_addr_jibeon" value="">
		</td>
	</tr>
	<tr>
		<th scope="row"><label for="reg_mb_recommend">추천인</label></th>
		<td><input type="text" name="mb_recommend" value="admin" id="reg_mb_recommend" required class="frm_input required"></td>
	</tr>
	</tbody>
	</table>
</div>
<div class="btn_confirm">
	<input type="submit" value="저장" id="btn_submit" class="btn_large" accesskey="s">
</div>
</form>

<script>
function fregisterform_submit(f)
{
	// 회원아이디 검사
	var msg = reg_mb_id_check();
	if(msg) {
		alert(msg);
		f.mb_id.select();
		return false;
	}

	if(f.mb_password.value.length < 4) {
		alert("비밀번호를 4글자 이상 입력하십시오.");
		f.mb_password.focus();
		return false;
	}

	if(f.mb_password.value != f.mb_password_re.value) {
		alert("비밀번호가 같지 않습니다.");
		f.mb_password_re.focus();
		return false;
	}

	if(f.mb_password.value.length > 0) {
		if(f.mb_password_re.value.length < 4) {
			alert("비밀번호를 4글자 이상 입력하십시오.");
			f.mb_password_re.focus();
			return false;
		}
	}

	// 이름 검사
	if(f.mb_name.value.length < 1) {
		alert("이름을 입력하십시오.");
		f.mb_name.focus();
		return false;
	}

	/*
	var pattern = /([^가-힣\x20])/i;
	if(pattern.test(f.mb_name.value)) {
		alert("이름은 한글로 입력하십시오.");
		f.mb_name.select();
		return false;
	}
	*/

	// E-mail 검사
	var msg = reg_mb_email_check();
	if(msg) {
		alert(msg);
		f.reg_mb_email.select();
		return false;
	}

	if(typeof(f.mb_recommend) != "undefined" && f.mb_recommend.value) {
		if(f.mb_id.value == f.mb_recommend.value) {
			alert("본인을 추천할 수 없습니다.");
			f.mb_recommend.focus();
			return false;
		}

		var msg = reg_mb_recommend_check();
		if(msg) {
			alert(msg);
			f.mb_recommend.select();
			return false;
		}
	}

	document.getElementById("btn_submit").disabled = "disabled";

    return true;
}
</script>
</div>

</div>
</div>
<div id="ft">
	<p>Copyright &copy; 샘플샵. All rights reserved.</p>
</div>


<div id="ajax-loading"><img src="/image/admin/ajax-loader.gif"></div>
<div id="anc_header"><a href="#anc_hd"><span></span>TOP</a></div>

<script src="/js/admin/admin.js"></script>

<script src="/js/admin/wrest.js"></script>
</body>
</html>
