<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<html>
<head>
<title>COFFEE NAMUH</title>
<link rel="shortcut icon" href="../images/favicon-32x32.png"
	type="image/x-icon">
<link href="../css/order/order.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- 헤더 -->
	<%@ include file="/WEB-INF/views/header/header.jsp"%>
	<div class="cont">
		<div class="cont-head">
			<div class="cont-title-info">주문자 정보</div>
			<div class="cont-title">ORDER INFO</div>
			<div class="cont-text-info">※결제하기 전, 입력한 정보를 다시 한번 확인해주시기 바랍니다.</div>
		</div>
		<tbody>
			<tr>
				<td width="20%" class="list_tit">이름 <span>*</span></td>
				<td width="80%"><input name="name" required="" title="이름"
					maxlength="10" value="" type="text" class="list_inpu"></td>
			</tr>
			<tr>
				<td class="list_tit">이메일주소 <span>*</span></td>
				<td><input name="email" required="" title="이메일주소"
					maxlength="100" size="70" value="" type="text"
					class="list_inpu mail"></td>
			</tr>
			<tr>
				<td class="list_tit">휴대전화 <span>*</span></td>
				<td><input name="hp" required="" title="휴대전화" maxlength="14"
					value="" type="text" class="list_inpu tel"></td>
			</tr>
			<tr>
				<td class="list_tit">전화번호</td>
				<td><input name="tel" maxlength="14" value="" type="text"
					class="list_inpu tel"></td>
			</tr>
			<tr>
				<td class="list_tit">팩스번호</td>
				<td><input name="fax" maxlength="14" value="" type="text"
					class="list_inpu tel"></td>
			</tr>
			<tr>
				<td class="list_tit">회사명</td>
				<td><input name="company" maxlength="40" size="30" value=""
					type="text" class="list_inpu"></td>
			</tr>
			<tr>
				<td class="list_tit">주소 <span>*</span></td>
				<td style="line-height: 2.4em; padding: 5px 30px;"><input
					name="zip" id="zip" type="text" required="" title="우편번호"
					class="list_inpu onlyNum zip_btn" size="6" maxlength="6" value=""
					readonly="readonly"> <a href="JavaScript:void(0)"
					class="btn btn-gray btn-medium zip_btn" readonly="readonly">주소검색</a>
					<br> <input name="addr1" id="addr1" type="text" required=""
					title="주소" class="list_inpu zip_btn" size="60" maxlength="100"
					value="" readonly="readonly"> 기본주소<br> <input
					name="addr2" id="addr2" type="text" required="" title="기본주소"
					class="list_inpu" size="60" maxlength="100" value=""> 상세주소
					<input name="addr3" id="addr3" type="text" required="" title="상세주소"
					class="list_inpu" size="60" maxlength="100" value=""
					readonly="readonly"> 참고항목 <input name="jibeon" id="jibeon"
					type="hidden" value=""></td>
			</tr>
		</tbody>
	</div>
	<!-- 푸터 -->
	<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
	<script type="text/javascript" src="../js/order/order.js"></script>
<body>

</body>
</html>