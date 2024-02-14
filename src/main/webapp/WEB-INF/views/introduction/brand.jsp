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
    background-color: #1A3B33;
  
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
  margin-top: 0;
  text-align: center;
}
header h1 span {
  display: block;
  font-size: 8.75vw;
}
main { 
  background: #fff;
  position: relative;
  border: 1px solid #fff;
  font-size: 1.4rem;
  padding: 2rem 25%;
  line-height: 1.6;
  display: flex;
  flex-direction: row; /* 가로로 나란히 정렬하도록 설정 */
  justify-content: space-between; /* 자식 요소들을 좌우로 분산 정렬 */
}
@media all and (max-width: 400px) {
  main { padding: 2rem; }
}
h1{
    color: #fdd000;
}

::-webkit-scrollbar{width:5px; height:5px; background:#f2f2f2;}
    ::-webkit-scrollbar-thumb{background:#fdd000;}
    
    html, body{font-weight:300; letter-spacing:normal; word-break:keep-all; width:100%; text-align:left; font-size:16px; color:#1c1c1b; line-height:1.4; margin:0; padding:0; }
    
    h1,h2{padding:0; margin:0; display:inline-block; font-weight:normal;}
    ul, li{list-style:none; padding:0px; margin:0px;}

    .m{display:none !important; margin:0 auto;}
    
    /* COFFEENAMUH BRAND */
    .color{color:#fdd000 !important;}  

    .color_w{color:#fff;}
    .bg_color{background:#fdd000; color:#1A3B33; padding:0.5% 1%;}

    .text_center{text-align:center;}

    

    .robo{font-family:'Roboto', NanumSquareR; font-weight:900 !important; line-height:1 !important; letter-spacing:-1px !important;}
        .robo h1, .robo h2{font-weight:900 !important;}


/* cont */
    .cont_wrap{padding-top:106px;}
    .main_body .cont_wrap{padding-top:0 !important;}
        .main_body .cont_box{overflow:hidden;}

    .cont_box{padding:100px 0px; width:100%; margin:0 auto; position:relative;}
        /*.cont_box:nth-child(2n-1){background:#fdd000;}*/
        .cont_boxs{width:100%; max-width:1280px; margin:0 auto; margin-bottom:100px;}
            .cont_boxs:last-child{margin-bottom:0;}

        /* COFFEENANUH 로고 들어갈 위치 */
        .cont_head{text-align:center; background:#444 !important; color:#fff !important; z-index:1;}
            .cont_head .cont_title_wrap{margin-bottom:20px; text-transform:uppercase;}
                .cont_head .cont_title_wrap .cont_title{margin-bottom:10px;}

        .cont_banner{background:#fdd000; position:relative; overflow:inherit !important; z-index:2; padding:50px 0;}
            .cont_banner:before{position:absolute; z-index:1; content:""; background:#fdd000; width:50px; height:50px; bottom:-25px; left:50%; -webkit-transform:translate(-50%,0) rotate(-45deg); -ms-transform:translate(-50%,0) rotate(-45deg); transform:translate(-50%,0) rotate(-45deg);}
                .cont_banner .cont_title{font-size:1.4em;}

        .cont_title_wrap{font-size:24px; margin-bottom:40px; position:relative;}
            .cont_title_wrap:last-child{margin-bottom:0;}
                .cont_title{font-size:1.8em; line-height:1.2; letter-spacing:-3px;}
                    .cont_title h1{font-size:2.8em; text-transform:uppercase;}
                    .cont_title h2{font-size:1.4em;}
                    .cont_title h3{font-size:1.2em;}

                .cont_title_info{margin:15px 0;}
                    .cont_title_info:first-child{margin-top:0;}
                    .cont_title_info:last-child{margin-bottom:0;}

            

        .cont_text_wrap{margin:40px 0;}
            .cont_text_wrap:first-child{margin-top:0;}
            .cont_text_wrap:last-child{margin-bottom:0;}
                .cont_text_box{margin-bottom:20px;}
                    .cont_text_box:last-child{margin-bottom:0;}
                    .cont_text_title{font-size:1.4em; line-height:1.2;}
                        .cont_text_title b{font-weight:400;}
                    .cont_text{margin:20px 0;}
                        .cont_text:first-child{margin-top:0;}
                        .cont_text:last-child{margin-bottom:0;}
                    .cont_text_inner{margin:5px 0;}
                        .cont_text_inner:first-child{margin-top:0 !important;}
                        .cont_text_inner:last-child{margin-bottom:0 !important;}
                    .cont_text_info{font-size:0.9em; opacity:0.7;}
                    .cont_text_info2{opacity:1;font-weight:400;color:#424242;}
                    .cont_text_label{background:#000; color:#fff; font-siz
                    e:0.6em; padding:2px 8px; border-radius:5px; vertical-align:middle;}

        
        .cont_list_map > ul > li{position:relative; display:inline-block; padding:0 15px;}
            .cont_list_map > ul > li:first-child{padding-left:0;}
            .cont_list_map > ul > li:last-child{padding-right:0;}
            .cont_list_map > ul > li:before{height:8px; width:8px; position:absolute; top:55%; right:-5px; margin:0; border:solid rgba(255,255,255,0.5); border-width:0 0 1px 1px; content:""; display:inline-block; transition:All 0.2s ease; -webkit-transition:All 0.2s ease; -moz-transition:All 0.2s ease; -o-transition:All 0.2s ease; -webkit-transform:translate(0,-50%) rotate(-135deg); -ms-transform:translate(0,-50%) rotate(-135deg); transform:translate(0,-50%) rotate(-135deg);}
            .cont_list_map > ul > li:last-child:before{display:none;}

        .cont_title_wrap img {
            max-width: 100%; /* Set the maximum width to 100% of the parent container */
            height: auto;    /* Allow the height to adjust proportionally based on the width */
            display: block;  /* Remove any default inline styles */
            margin: 0 auto;   /* Center the image within its container horizontally */
            }

           

    
    .works_container {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: row;
  flex-wrap: wrap;
  align-content: center;
}

.poto-info {
    display: flex; /* 추가된 부분: flex로 레이아웃 설정 */
    flex-wrap: wrap; /* 필요에 따라 요소가 넘칠 때 줄 바꿈 설정 */
    justify-content: space-around; /* 요소들을 가로로 분산 정렬 */
}

.works_main {
    width: 230px;
    height: 331px;
    overflow: hidden;
    display: inline-block;
    margin: 10px; /* 각 요소 사이의 간격 조절 (상하좌우 여백) */
}
  
.works_main div {
  width: 230px;
  height: 331px;
  overflow: hidden;
  display: inline-block;
}
  
.works_main img {
  width: 100%;
  height: auto;
  transition: transform 1s ease-in-out, filter 1s ease-in-out;
}
  
.works_content {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  text-align: center; /* 텍스트를 중앙 정렬 */
}
.works_main:hover img {
  transform: scale(1.2);
  transform-origin: center;
  filter: brightness(10%);
  transition: transform 1s ease-in-out, filter 1s ease-in-out;
}

.works_main:hover p {
  opacity: 1;
  transition: opacity 1s ease-in-out;
}

.cont_title b {
    font-family: 'Your-Soft-Font', sans-serif; /* 'Your-Soft-Font'을 원하는 글꼴 패밀리로 대체하세요 */
    font-size: 1.8em; /* 원하는 글꼴 크기로 조정하세요 */
}


</style>

</head>
<body>
	
	<header>
  <h1>CAFFEE <span>NAMUH</span>BRAND</h1>1
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
            </div>
        </div>

<main>

    <div class="font-info">
        
</div>
    <div class="poto-info">

        <div class="works_container">
            <div class="works_main" onclick="#">
                <div class="works_content">
                  <!-- 이미지 추가 -->
                  
                  <img src="/images/user/newMenuHoney.png">
                  
                  
                </div>
              </div>
          </div>
          <div class="works_container">
            <div class="works_main" onclick="#">
              <div>
                <img src="/images/user/newMenuHoney.png">
              </div>
              
            </div>
          </div>
          <div class="works_container">
            <div class="works_main" onclick="#">
              <div>
                <img src="/images/user/newMenuStrawberry.png">
              </div>
             
            </div>
          </div>
          <div class="works_container">
            <div class="works_main" onclick="#">
              <div>
                <img src="/images/user/newMenuStrawberry.png">
            </div>
             
            </div>
          </div>
    </div>
    
    
    
</main>

<!-- 푸터 -->
<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
<div id="scrollToTopButton" class="scroll-to-top">맨 위로</div>
<script type="text/javascript" src="../js/menu/menu_food.js"></script>

</div>
</div>
	
</body>
</html>