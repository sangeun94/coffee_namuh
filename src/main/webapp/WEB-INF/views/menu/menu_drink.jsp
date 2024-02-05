<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>COFFEE NAMUH</title>
        <link href="../../css/style.css" rel="stylesheet" type="text/css">
    </head>

    <body>
        <h1>메뉴 페이지</h1>
        <div class="menu-head-cont">
            <h2>NAMUH MENU</h2>
            <h1>DRINK MENU</h1>
            <h4>홈 > 메뉴소개 > 음료</h4>
        </div>
        <div class="menu-main-cont">
            <h2>COFFEE NAMUH의 엄선된 메뉴</h2>
            <h1>NAMUH MENU</h1>
            <h4>※메뉴 이미지는 연출컷이라 실물과 다를 수 있습니다.</h4>
        </div>
        <div class="cont_text_wrap list_checkbox_wrap">
            <div class="cont_text cont_text_title">
                <b>분류보기</b>
            </div>
            <div class="wrapper">
                <label><input type="checkbox" class="checkAll"><strong>전체선택</strong></label>
                <label><input type="checkbox" class="chkbox"><span>콜드 브루</span></label>
                <label><input type="checkbox" class="chkbox"><span>에스프레소</span></label>
                <label><input type="checkbox" class="chkbox"><span>프라푸치노</span></label>
                <label><input type="checkbox" class="chkbox"><span>티</span></label>
                <label><input type="checkbox" class="chkbox"><span>기타</span></label>
            </div>
        </div>
        <%@ include file="/WEB-INF/views/footer/footer.jsp" %>
        <script src="../../js/checkAll.js"></script>
    </body>

    </html>