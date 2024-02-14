<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title>COFFEE NAMUH</title>
    <link rel="shortcut icon" href="../images/favicon-32x32.png"
	type="image/x-icon">
	<link href="../css/cart/cart.css" rel="stylesheet" type="text/css">
</head>
<body>
<!-- 헤더 -->
	<%@ include file="/WEB-INF/views/header/header.jsp"%>
    <div class="cont">
        <div class="cont-head">
            <div class="cont-title-info">장바구니 목록</div>
            <div class="cont-title">
                CART LIST
            </div>
            <div class="cont-text-info">※주문하기 전, 수량과 금액을 다시 한번 확인해주시기 바랍니다.</div>
        </div>
        <div class="cont-select">
            <div class="cont-select-title">목록</div>
            <fieldset class="cont-select-fieldset">
                <div class="cont-select-subtitle">
                    <table>
                        <tbody>
                            <tr>
                                <td class="td-title td0">선택</td>
                                <td class="td-title td1">이미지</td>
                                <td class="td-title td2">이름</td>
                                <td class="td-title td3">수량</td>
                                <td class="td-title td4">가격</td>
                            </tr>
                            <tr>
                                <td><label><input type="checkbox" class="chkbox" checked><span></span></label></td>
                                <td><img class="td1-img" src="../../images/product/product_mug_커피나무_하우스_머그_237ml.jpg">
                                </td>
                                <td>커피나무 하우스 머그 237ml</td>
                                <td><input type="number" id="usernumber" name="usernumber" value="1"></td>
                                <td>10000</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </fieldset>
        </div>

        <p class=text-center>총 결제할 금액은 <span class="total-price"></span>원 입니다. (배송비 2500원 포함)</p>
        <div class="back-btn" onclick="javascript:history.go(-1)">취소</div>
        <div class="order-btn">주문하기</div>

    </div>
    <!-- 푸터 -->
	<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
	<script type="text/javascript" src="../js/cart/cart.js"></script>
</body>
</html>