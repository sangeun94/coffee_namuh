<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/news.css" rel="stylesheet" type="text/css">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.bodybox {
	height: 100px;
}

.titlebox {
	width: 100%;
	height: 100px;
}

.contentbox {
	width: 100%;
	height: 400px
}

.btnntwidth {
	width: 5%;
	font-family: 'Noto Sans kr', sans-serif;
	border: 1px solid #e0e0e0;
	font-weight: 400;
	font-size: 12px;
	text-align: center;
	padding: 0px 20px;
	height: 100%;
	font-weight: 500;
	cursor: pointer;
	font-weight: 500;
	transition: All 0.2s ease;
	-webkit-transition: All 0.2s ease;
	-o-transition: All 0.2s ease;
	-ms-transition: All 0.2s ease;
	overflow: hidden;
}

.btnwd5 {
	width: 50%;
	font-family: 'Noto Sans kr', sans-serif;
	border: 1px solid #e0e0e0;
	font-weight: 400;
	font-size: 12px;
	text-align: center;
	padding: 0px 20px;
	height: 100%;
	font-weight: 500;
	cursor: pointer;
	font-weight: 500;
	transition: All 0.2s ease;
	-webkit-transition: All 0.2s ease;
	-o-transition: All 0.2s ease;
	-ms-transition: All 0.2s ease;
	overflow: hidden;
}

textarea {
	overflow: hidden;
	height: 45px;
	resize: none;
}

.input_text_wrap1 {
	position: relative;
	width: 95%;
	display: inline-block;
	font-size: 16px;
}

.li_left {
	float: left;
}


.txdiv {
  position: relative;
  
  margin-left: 50px;
  margin-top: 100px;
}

.txinput {
  font-size: 15px;
  color: #222222;
  width: 300px;
  
  border-bottom: solid #aaaaaa 1px;
  padding-bottom: 10px;
  padding-left: 10px;
  position: relative;
  background: none;
  z-index: 5;
}

.txinput::placeholder { color: #aaaaaa; }
.txinput:focus { outline: none; }

.txspan {
  display: block;
  position: absolute;
  bottom: 0;
  left: 0%;  /* right로만 바꿔주면 오 - 왼 */
  background-color: #666;
  width: 0;
  height: 2px;
  bor
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/header/header.jsp"%>

	<div class="bodybox"></div>

	<div class="cont_wrap bbs_wrap">
		<div class="cont">
			<div class="cont_box cont_head">
				<div class="cont_boxs">
					<div class="cont_title_wrap">
						<div class="cont_title_info">NAMUH NEWS</div>
						<div class="cont_title robo color">
							<h2>FAQ</h2>
						</div>
					</div>
					<div class="cont_text_wrap">
						<div class="cont_text cont_list_map">
							<ul>
								<li>홈</li>
								<li>메가소식</li>
								<li>고객의 소리</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="cont_box brand01">
				<div class="cont_boxs text_center">
					<div class="cont_title_wrap">
						<div class="cont_title txdiv">
    <input class="txinput" id="title" type="text" value="${feedback.title}">
</div>
<textarea id="content" class="contentbox">${feedback.content}</textarea>

<div class="input_btn_wrap input_wrap2">
    <c:set var="isAuthor" value="${feedback.userId eq loggedInUserId}" />
    <c:if test="${isAuthor}">
        <div class="input_btn_wrap input_wrap2">
            <button class="btnwd5 btn1 float_right" onclick="location.href='/boardDelete/${feedback.feedbackNumber}'">삭제</button>
            <button class="btnwd5 btn1 float_right" onclick="updateFeedback()">수정</button>
        </div>
    </c:if>
</div>
		</div>
		</div>
		</div>
		</div>
		</div>
	
	</form>
	


	<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
	<

	
	<script>
    function updateFeedback() {
        var title = document.getElementById("title").value;
        var content = document.getElementById("content").value;
        var feedbackNumber = ${feedback.feedbackNumber};
        
        // AJAX를 이용하여 서버로 데이터 전송
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/boardUpdate/" + feedbackNumber, true);
        xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    // 성공적으로 업데이트된 경우 처리
                    window.location.href = "/board"; // 업데이트 후 보고 있던 페이지로 이동
                } else {
                    // 업데이트에 실패한 경우 처리
                    console.error('Feedback 업데이트 실패: ', xhr.responseText);
                }
            }
        };
        var data = JSON.stringify({ title: title, content: content });
        xhr.send(data);
    }
</script>

</body>
</html>