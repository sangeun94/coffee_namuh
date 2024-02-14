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

<link rel="shortcut icon" href="" type="image/x-icon">

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
				<li><a href="/main" target="_blank">COFFEE NAMUH 홈페이지</a></li>
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
				<li class="gnb_1dli">
					<a href="/admin/orderList" class="gnb_1da">주문관리</a>
				</li>
				<li class="gnb_1dli active">
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
        <ion-icon name="accessibility-outline" class="announcement_outline"></ion-icon><h2>고객지원</h2>
	</div>
    <dl>
		<dt class="h10 menu_toggle">고객지원</dt>		
        <dd class="h10"><a href="/admin/feedback">1:1 상담문의</a></dd>	    		
        <dt class="h20 menu_toggle">기타 관리</dt>			
        <dd class="h20 active"><a href="/admin/announcement">공지사항 관리</a></dd>        
        <dd class="h20"><a href="/admin/faq">FAQ 관리</a></dd>	
        </dl>
	</div>
	<div id="content">
		<div class="breadcrumb">
			<span>HOME</span> <ion-icon name="chevron-forward-outline"></ion-icon> 고객지원 
            <ion-icon name="chevron-forward-outline"></ion-icon> 공지사항 관리		
        </div>
	
<div class="s_wrap">
	<h1>공지사항 수정</h1>

<form action="/admin/modifyAnnounce" method="post"  name="announcementForm" onsubmit="return validateForm()">
	<input type="hidden" name="announcementNumber" value="${announcement.announcementNumber}">
	<input type="hidden" name="userId" value="${announcement.userId}">
	<input type="hidden" name="postDate" value="${announcement.postDate}">

<div class="tbl_frm02">
	<table>
	<colgroup>
		<col class="w140">
		<col>
	</colgroup>
	<tbody>

	<tr>
		<th scope="row">제목</th>
		<td>
			<input type="text" name="title" value="${announcement.title}" required itemname="제목" class="frm_input required" size="60">
		</td>
	</tr>
	<tr>
		<th scope="row">내용</th>
		<td>
			<textarea id="memo" name="content" class="smarteditor2" maxlength="65536" style="width:100%">${announcement.content}</textarea>		
		</td>
	</tr>
	</tbody>
	</table>
</div>

<div class="btn_confirm">
	<button type="submit" class="btn_large"> 수정 </button>
	<a href="/admin/announcement" class="btn_large bx-white">목록</a>
</div>
</form>

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

<script>
// 폼 제출 핸들러
function validateForm() {
    var title = document.forms["announcementForm"]["title"].value;
    var content = document.forms["announcementForm"]["content"].value;
    
    if (title == null || title.trim() == "") {
        alert("제목을 입력해주세요.");
        return false; // 폼 제출을 방지
    }
    
    if (content == null || content.trim() == "") {
        alert("내용을 입력해주세요.");
        return false; // 폼 제출을 방지
    }
    
    return true; // 유효성 검사 통과, 폼 제출 진행
}
</script>

</body>
</html>
