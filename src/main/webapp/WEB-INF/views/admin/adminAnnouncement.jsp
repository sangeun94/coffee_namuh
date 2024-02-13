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
	<h1>공지사항 관리</h1>
		
<h2>기본검색</h2>
<form action="/admin/announcement" name="fsearch" id="fsearch" method="get">
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
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
                    <input type="text" name="searchKeyword" value="" class="frm_input" size="30">
			</td>
		</tr>
		<tr>
			<th scope="row">검색일자</th>
			<td>
				<input type="date" name="feedbackDate" value="" id="to_date" class="frm_input w80" maxlength="10" autocomplete="off">	
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
		전체 : <b class="fc_red">${totalAnnouncement}</b> 건 조회
	</div>
	
	<form id="frm_customers" action="/admin/removeAnnounce" method="post">
	<div class="local_frm01">
	
		<button type="submit" class="btn_delete btn_lsmall bx-white">선택삭제</button>
		<a href="/admin/registerAnnounce" class="fr btn_lsmall red"><ion-icon name="add-outline"></ion-icon></i> 추가하기</a>
		
	</div>
	<div class="tbl_head01">
	<table>
	
	<colgroup>
		<col class="w50">
		<col class="w50">
		<col class="w60">
		<col>
		<col>
		<col class="w80">
		<col class="w60">
		
	</colgroup>
	
	<thead>
	<tr>
		<th scope="col"><input type="checkbox" name="chkall"></th>
		<th scope="col">번호</th>
		<th scope="col">작성자</th>
		<th scope="col">제목</th>
		<th scope="col">내용</th>
		<th scope="col">일자</th>		
		<th scope="col">수정하기</th>
	</tr>
	</thead>
	<tbody>
		<c:forEach var="announceItem" items="${announcementList}">
			<tr class="list0">
				<td>
					<input type="checkbox" class="chb_checkNumber" name="announcementNumber" value="${announceItem.announcementNumber}">
				</td>
				<td>${announceItem.announcementNumber}</td>
				<td>${announceItem.userId}</td>
				<td>${announceItem.title}</td>
				<td>${announceItem.content}</td>
				<td>
					<!-- parseDate를 사용하여 문자열을 날짜 객체로 변환 -->
					<fmt:parseDate value="${announceItem.postDate}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate"/>
					<fmt:formatDate value="${parsedDate}" pattern="yy-MM-dd" />				
				</td>
				<td>
					<button type="button" id="btn_modify" onclick="window.location.href='/admin/modifyAnnounce?announcementNumber=${announceItem.announcementNumber}'" class="btn_lsmall">수정</button>
				</td>
			</tr>       
		</c:forEach>	
	</tbody>
	</table>
</div>

<div class="local_frm02">

	<button type="submit" class="btn_delete btn_lsmall bx-white">선택삭제</button>
	<a href="/admin/registerAnnounce" class="fr btn_lsmall red"><ion-icon name="add-outline"></ion-icon></i> 추가하기</a></div>

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

<script type="text/javascript" src="/js/admin/jquery-ui.min.js"></script>
<script>
	
	// 'fsearch'라는 ID를 가진 폼의 내용을 초기화
	function resetSearchForm() {
	    document.getElementById('fsearch').reset();
	}
	
/*     window.onload = function() {
        // '모두 선택/해제' 체크박스에 대한 이벤트 리스너 설정
        document.querySelector("input[name='chkall']").addEventListener('change', function() {
            var checkboxes = document.querySelectorAll("input[name='chk[]']");
            for(var i = 0; i < checkboxes.length; i++) {
                checkboxes[i].checked = this.checked;
            }
        });

        // 개별 체크박스에 대한 이벤트 리스너 설정
        var individualCheckboxes = document.querySelectorAll("input[name='chk[]']");
        for(var i = 0; i < individualCheckboxes.length; i++) {
            individualCheckboxes[i].addEventListener('change', function() {
                var allChecked = Array.from(individualCheckboxes).every(function(checkbox) {
                    return checkbox.checked;
                });
                document.querySelector("input[name='chkall']").checked = allChecked;
            });
        }
    }; */

    
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
