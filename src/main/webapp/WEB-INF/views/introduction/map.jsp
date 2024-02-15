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
</head>
<body>
	<header>
        <h1>CAFFEE <span>NAMUH</span>BRAND</h1>
    </header>
    
    <div>
                <!-- 지도를 표시할 div 입니다 -->
                <div id="map" style="width:100%;height:350px;">여기지도</div>

                
                
              </div>
              
              <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=69fed32b36e9b199673ec12d75d6fcdb"></script>
                <script>
                var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                    mapOption = { 
                        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                        level: 3 // 지도의 확대 레벨
                    };

                // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
                var map = new kakao.maps.Map(mapContainer, mapOption); 
                </script>
    
</body>
</html>