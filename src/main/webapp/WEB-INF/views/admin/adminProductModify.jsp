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
	<h1>상품 정보 수정</h1>
	
	
<form action="/admin/productModify" method="post"  name="productForm" enctype="multipart/form-data" onsubmit="return validateForm()">
	<input type="hidden" name="productNumber" value="${productList.productNumber}">

	<h2>음료 정보 수정</h2>
	
	<div class="tbl_frm02">
		<table>
		<colgroup>
			<col class="w180">
			<col>
		</colgroup>
		<tbody>
		<tr class="item_img_fld">
		    <th scope="row">이미지</th>
		    <td>
		        <div>
		            <!-- 이전에 업로드된 파일의 미리보기 이미지 (사용 가능하다면) -->
		            <%-- <img src="${menuList.filePath}${menuList.fileName}" alt="Uploaded Image Preview" style="width:70px; height:70px;"> --%>
		            <!-- 사용자가 새 파일을 업로드할 수 있는 입력 필드 -->
		            <input type="file" name="profileImage">
		        </div>
		           	<!-- 이전 파일 이름을 보여주는 부분 -->
		            <span>이전 파일: ${productList.originalFileName}</span>
		            <!-- 이전 파일 정보를 저장하는 숨겨진 필드 -->
		            <input type="hidden" name="previousFileId" value="${productList.fileId}">
<%-- 		            <input type="hidden" name="fileId" value="${menuList.fileId}">
		            <input type="hidden" name="fileName" value="${menuList.fileName}">
		            <input type="hidden" name="originalFileName" value="${menuList.originalFileName}">
		            <input type="hidden" name="filePath" value="${menuList.filePath}">
		            <input type="hidden" name="fileExtension" value="${menuList.fileExtension}">
		            <input type="hidden" name="fileSize" value="${menuList.fileSize}"> --%>
		    </td>
		</tr>
		<tr>
			<th scope="row">상품 타입</th>
			<td>
				<select name="productType">
					<option value="1" ${productList.productType == '1' ? 'selected' : ''}>머그</option>
					<option value="2" ${productList.productType == '2' ? 'selected' : ''}>텀블러</option>
					<option value="3" ${productList.productType == '3' ? 'selected' : ''}>원두</option>
					<option value="4" ${productList.productType == '4' ? 'selected' : ''}>악세서리</option>
				</select>		
			</td>
		</tr>
		<tr>
			<th scope="row">상품 상태</th>
			<td>
				<select name="productStatus">
					<option value="1" ${productList.productStatus == '1' ? 'selected' : ''}>판매중</option>
					<option value="2" ${productList.productStatus == '2' ? 'selected' : ''}>품절</option>
					<option value="3" ${productList.productStatus == '3' ? 'selected' : ''}>판매종료</option>
				</select>		
			</td>
		</tr>
		
		<tr>
			<th scope="row">상품 이름</th>
			<td><input type="text" name="productName" value="${productList.productName}" class="frm_input"></td>
		</tr>
		<tr> 
			<th scope="row">상품 설명</th>
			<td>
				<textarea id="memo" name="productDescription" class="smarteditor2" maxlength="65536" style="width:60%">${productList.productDescription}</textarea>
			</td>
		</tr>
		<tr>
			<th scope="row">상품 가격</th>
			<td>
				<input type="text" name="productPrice" value="${productList.productPrice}" class="frm_input"  style="width:80px;text-align: right;"> 원
			</td>
		</tr>
		<tr>
			<th scope="row">상품 사이즈 (텀블러,머그: ml, 원두,악세서리: g)</th>
			<td>
				<input type="text" name="productSize" value="${productList.productSize}" class="frm_input"  style="width:80px;text-align: right;"> ml / g
			</td>
		</tr>
		<tr>
			<th scope="row">재고 수량</th>
			<td>
				<input type="text" name="productStockQuantity" value="${productList.productStockQuantity}" class="frm_input"  style="width:80px;text-align: right;"> 개
			</td>
		</tr>
				
		</tbody>
		</table>
	</div>	
	<div class="btn_confirm">
		<button type="submit" class="btn_large"> 저장 </button>			
		<a href="/admin/productList" class="btn_large bx-white">목록</a>
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
    var productName = document.forms["productForm"]["productName"].value;
    var productDescription = document.forms["productForm"]["productDescription"].value;
/*     var profileImage = document.forms["drinkForm"]["profileImage"].value;

    if (profileImage == null || profileImage.trim() == "") {
        alert("파일 첨부 해주세요.");
        return false; // 폼 제출을 방지
    } */
    
    if (productName == null || productName.trim() == "") {
        alert("상품 이름을 입력해주세요.");
        return false; // 폼 제출을 방지
    }
    
    if (productDescription == null || productDescription.trim() == "") {
        alert("상품 설명을 입력해주세요.");
        return false; // 폼 제출을 방지
    }
    
    return true; // 유효성 검사 통과, 폼 제출 진행
}
</script>

<c:if test="${not empty successMessage}">
<script type="text/javascript">
    alert('<c:out value="${successMessage}"/>');
    window.location.href = '/admin/productList'; // 성공 메시지를 보여준 후 목록 페이지로 이동
</script>
</c:if>

<c:if test="${not empty errorMessage}">
<script type="text/javascript">
    alert('<c:out value="${errorMessage}"/>');
</script>
</c:if>

</body>
</html>
