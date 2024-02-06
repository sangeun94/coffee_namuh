<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- jstl 쓸때!! -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		<div id="logo"><a href=""><img src="/images/admin/white_logo.png" alt="행복을 주는 쇼핑몰! 관리자" class="logo"></a></div>
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
	<h1>회원 정보관리</h1>

<h2>기본검색</h2>
<form action="/admin/adminMember" name="fsearch" id="fsearch" method="get">
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
						    <option value="userId">아이디</option>
						    <option value="userEmail">이메일</option>
						    <option value="userName">이름</option>
						    <option value="userBirth ">생년월일</option>
						    <option value="userAddress">주소</option>
						    <option value="isMember">가입상태</option>
						</select>
                        <!-- <label> <input type="checkbox" name="userId" >아이디 </label>
						<label> <input type="checkbox" name="userEmail">이메일 </label> -->
                        
                        <input type="text" name="searchKeyword" value="" class="frm_input" size="30">
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
	총 회원수 : <b class="fc_red">${totalUsers}</b>명
</div>

<div class="tbl_head01">
	<table>
	<colgroup>

	</colgroup>
	<thead>
	<tr>
		<th scope="col">번호</th>
		<th scope="col">아이디</th>
		<th scope="col">이메일</th>
		<th scope="col">이름</th>
		<th scope="col">생년월일</th>		
		<th scope="col">주소</th>
		<th scope="col">가입 상태</th>
		<th scope="col">회원수정</th>

	</tr>
	</thead>
	<tbody>
        <c:forEach var="userItem" items="${userList}">
            <tr class="list0">
                <td>${userItem.userNumber}</td>
                <td class="tal">${userItem.userId}</td>
                <td class="tal">${userItem.userEmail}</td>
                <td>${userItem.userName}</td>
                <td>
                    <c:out value="${fn:substring(userItem.userBirth, 0, 4)}-${fn:substring(userItem.userBirth, 4, 6)}-${fn:substring(userItem.userBirth, 6, 8)}"></c:out>                                   
                </td>
                <td>${userItem.userAddress} ${userItem.userDetailAddress}</td>
                <td>
                    <c:choose>
                        <c:when test="${userItem.isMember == 1}">회원</c:when>
                        <c:when test="${userItem.isMember == 0}">탈퇴</c:when>
                    </c:choose>
                </td>
                <td>
                	<button onclick="location.href='/admin/modifyMember?userNumber=${userItem.userNumber}'" class="btn_lsmall">수정</button>
                </td>
            </tr>       
        </c:forEach>
    </tbody>
	</table>
</div>



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
	function resetSearchForm() {
	    // 'fsearch'라는 ID를 가진 폼의 내용을 초기화
	    document.getElementById('fsearch').reset();
	}
</script>

</body>
</html>
