<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title> COFFEE NAMUH </title>
<link rel="shortcut icon" href="/images/favicon-32x32.png" type="image/x-icon">

</head>
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
        color: black;
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
    
	.cont_banner:before {
        position: absolute;
        z-index: 1;
        content: "";
        background: #1A3B33;
        width: 50px;
        height: 50px;
        bottom: -25px;
        left: 50%;
        -webkit-transform: translate(-50%, 0) rotate(-45deg);
        -ms-transform: translate(-50%, 0) rotate(-45deg);
        transform: translate(-50%, 0) rotate(-45deg);
    }
    

    

    .cont_box {
        padding: 100px 0px;
        width: 100%;
        margin: 0 auto;
        position: relative;
    }


    .cont_boxs:last-child {
        margin-bottom: 0;
    }

    
    

    .cont_head .cont_title_wrap {
        margin-bottom: 20px;
        text-transform: uppercase;
    }

    .cont_head .cont_title_wrap .cont_title {
        margin-bottom: 10px;
    }

    

    
    .cont_banner .cont_title {
        font-size: 1.4em;
        
    }

    .cont_title_wrap {
        font-size: 24px;
    }
    
    .signature {
    display: flex; /* 요소를 행 (row)으로 배치 */
    justify-content: space-between; /* 자식 요소들을 좌우로 고르게 배치 */
    align-items: center; /* 세로 방향 가운데 정렬 */
}

.font-box {
    flex: 1; /* 남은 공간을 모두 차지하도록 설정 */
    padding: 20px; /* 내부의 텍스트에 좌우 패딩 추가 */
   
}

.works_container {
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: row; /* 자식 요소들을 행 (row)으로 배치 */
}

.works_main {
    width: 300px; /* 원하는 크기로 조정 */
    height: 300px; /* 원하는 크기로 조정 */
    overflow: hidden;
    display: inline-block;
    margin: 10px;
}

.works_main div {
    width: 100%;
    height: 100%;
    overflow: hidden;
    display: flex;
    align-items: center;
    justify-content: center;
}

.works_main img {
    width: 100%;
    height: auto;
    transition: transform 1s ease-in-out, filter 1s ease-in-out;
}

.works_main:hover img {
    transform: scale(1.2);
    transform-origin: center;
    filter: brightness(10%);
    transition: transform 1s ease-in-out, filter 1s ease-in-out;
}

    .h1color {
        color: black;
        text-align: left;
        font-weight: bold; /* Making the font bold */
    }

    main {
    width: 100%; /* main 요소를 화면 전체 너비로 확장 */
    padding: 20px; /* 내부의 div에 좌우 패딩 추가 */
    background: #1A3B33;
        position: relative;
        overflow: inherit !important;
        z-index: 2;
        padding: 50px 0;
}
</style>


<body>
	<%@ include file="/WEB-INF/views/header/header.jsp"%>
	<header>
    	<h1>CAFFEE <span>NAMUH</span>BRAND</h1>
	</header>
<div class="cont_box cont_banner" data-aos="slide-down" data-aos-delay="0">
    <div class="cont_boxs text_center">
        <div class="cont_title_wrap">
            <div class="cont_title">
                <b>BIG SIZE 2 SHOT</b><br>
                빅사이즈와 착한가격의 <br class="m">데일리 커피
            </div>
        </div>
    </div>
</div>
<div class="cont_box brand01">

  
    <div class="cont_boxs text_center">
        <div class="cont_title_wrap">
            <div class="cont_title_info">
                COFFEENAMUH <br class="m">
                시그니처 메뉴를 만나보세요!
            </div>
            <div class="cont_title robo">
                <h2>DAILY COFFEE</h2>
                <br>
                <br>
            </div>
        </div>

        <div class="main-container">
            <main>
                <div class="signature">
                  <div class="font-box">
                    <h1 class="h1color"  >NAMUH COFFEE CONCEPT</h1>
                    <p style="text-align: left; font-size: 1rem; font-weight: bold;">나무 NAMUH 커피는, 커피 및 음료전문점으로 다양한 음료와 100% 아라비카 원두의 진한 커피를 맛 보실수 있습니다.
                        더 크고 더 맛있다!
                        빅사이즈에 우수한 품질의 커피&음료를 합리적인 가격으로 제공하여 부담없이 여유롭게 다양하고 착한 음료를 제공합니다.</p>
                  </div>

                        <div class="works_container">

                          <div class="works_main" onclick="#">
                              <div class="works_content">
                                  <img src="/images/user/시그니처1.PNG">
                              </div>
                          </div>
                      </div>
                </div>

            

                <div class="poto-info">
                    
                    
                    
                </div>
            </main>
        </div>
    </div>
</div>
<!-- 푸터 -->
<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
<script type="text/javascript" src="../js/menu/menu_food.js"></script>


	
</body>
</html>