<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@font-face {
        font-family: 'Sucrose Bold Two';
        src: url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/4273/sucrose.woff2') format('woff2');
    }

    * {
        box-sizing: border-box;
    }

    body {
        margin: 0;
    }

    header {
        background-color: #47322D;
		margin-top: 10%;
        padding-top: 30%;
        background-size: cover;
        font-family: 'Sucrose Bold Two';
    }

    header img {
        position: absolute;
        top: 0;
        right: 0;
        width: 30%;
    }

    header h1 {
        position: fixed;
        top: 2rem;
        right: 2rem;
        font-size: 12vw;
        line-height: .8;
        margin-top: 7%;
        text-align: center;
    }

    header h1 span {
        display: block;
        font-size: 8.75vw;
    }

    

    @media all and (max-width: 400px) {
        main {
            padding: 2rem;
        }
    }

    h1 {
        color: #000;
    }

    ::-webkit-scrollbar {
        width: 5px;
        height: 5px;
        background: #f2f2f2;
    }

    ::-webkit-scrollbar-thumb {
        background: #1A3B33;
    }

    html,
    body {
        font-weight: 300;
        letter-spacing: normal;
        word-break: keep-all;
        width: 100%;
        text-align: left;
        font-size: 16px;
        color: #1c1c1b;
        line-height: 1.4;
        margin: 0;
        padding: 0;
    }

    h1,
    h2 {
        padding: 0;
        margin: 0;
        display: inline-block;
        font-weight: normal;
    }

    ul,
    li {
        list-style: none;
        padding: 0px;
        margin: 0px;
    }

    .m {
        display: none !important;
        margin: 0 auto;
    }

    /* COFFEENAMUH BRAND */
    .color {
        color: #fdd000 !important;
    }

    .color_w {
        color: #fff;
    }

    .bg_color {
        background: #fdd000;
        color: #1A3B33;
        padding: 0.5% 1%;
    }

    .text_center {
        text-align: center;
    }

    .robo {
        font-family: 'Roboto', NanumSquareR;
        font-weight: 900 !important;
        line-height: 1 !important;
        letter-spacing: -1px !important;
    }

    .robo h1,
    .robo h2 {
        font-weight: 900 !important;
    }

    /* cont */
    .cont_wrap {
        padding-top: 106px;
    }

    .main_body .cont_wrap {
        padding-top: 0 !important;
    }

    .main_body .cont_box {
        overflow: hidden;
    }


        .bi img {
            max-width: 600px; /* Set the maximum width for BI image */
            height: auto; /* Maintain the aspect ratio */
        }

        .nonebg img {
            max-width: 180px; /* Set the maximum width for NONEBG image */
            height: auto; /* Maintain the aspect ratio */
        }

        .nonebg_white img {
            max-width: 160px; /* Set the maximum width for NONEBG_WHITE image */
            height: auto; /* Maintain the aspect ratio */
        }

        .logo img {
            max-width: 220px; /* Set the maximum width for Logo image */
            height: auto; /* Maintain the aspect ratio */
        }

        .mini-namu img {
            max-width: 120px; /* Set the maximum width for Mini Namu images */
            height: auto; /* Maintain the aspect ratio */
        }
        
        .info {
            display: flex;
            flex-direction: row;
            align-items: center; /* 아이템을 수직으로 가운데 정렬 */

            /* .info 컨테이너에 필요한 추가 스타일을 추가하세요 */
            margin-top: 20px; /* 필요에 따라 마진 조정 */
        }

        .info h1 {
            font-weight: bold; /* 텍스트를 굵게 설정 */
            margin-bottom: 10px; /* 필요에 따라 여백 조정 */
        }

        /* .info 클래스 안의 p 태그는 여러 개가 있어서 각각에 적용하려면 클래스나 ID를 사용하는 것이 좋습니다. 
           만약 모든 p 태그를 같은 스타일로 설정하려면 .info p 로 선택자를 사용하세요. */
        .info p {
            font-weight: bold; /* 텍스트를 굵게 설정 */
            margin-bottom: 10px; /* 필요에 따라 여백 조정 */
        }

        .container{
           
        }
    </style>

</head>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp"%>
	 <header>
        <h1>CAFFEE <span>NAMUH</span>BRAND</h1>
    </header>
    
    <div class="container">
        <div class="bi"><img src="/images/user/BI.jpg"></div>

        <div class="nonebg"><img src="/images/user/Coffee Namuh NONEBG_logo.png"></div>

        <div class="nonebg_white"><img src="/images/user/Coffee Namuh NONEBG_white_logo.png"></div>

        <div class="logo"> <img src="/images/user/Coffee Namuh.png"></div>

        <div class="info">
        <div class="mini-namu"><img src="/images/user/namuh_brown_logo.png">
            <img src="/images/user/namuh_brownbg_logo.png">
            <img src="/images/user/namuh_greenbg_logo.png">
            <img src="/images/user/namuh_white_logo.png"></div>

            <div><h1>나무 NAMUH 커피 브랜드 아이덴티티</h1>
                <p>NAMUH COFFEE BI</p>
                <p>로고의 비율을 무시한 채 늘리거나 줄이는 로고의 변형은 불가하며, 문서 작업시 로고 형태 그대로 첨부 사용 권장합니다.</p>
                <p>국문 지정 서체는 로고 타입을 보조해서 다양하게 활용되는 서체로 인쇄, 사인물, 디자인물 등에서 문구를 강조할 경우 가독성을 고려하여 세련되고 선명한 이미지를 가진 윤고딕을 사용합니다.</p>
                <p>전용매체의 성격이나 내용에 따라 굵기를 선택적으로 사용할 수 있습니다.</p></div>
            </div>
    </div>
    <br>
    <br>
    
    <!-- 푸터 -->
<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
<script type="text/javascript" src="../js/menu/menu_food.js"></script>
</body>
</html>