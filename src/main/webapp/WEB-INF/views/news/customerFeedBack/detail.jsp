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
	        *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        }

		.bodybox {
			height: 100px;
		}

		.titlebox{
			width: 100%;
			height: 100px;
		}
		.contentbox{
			width:100%;
			height: 400px
		}
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
						<div class="cont_title_info">MEGA NEWS</div>
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
						<div class="cont_title">
							<b>1:1 질문 </b>
						</div>
					</div>
					<div class="cont_text_wrap">
						<div class="cont_text">궁금하신 내용을 질문해 주세요.</div>
					</div>
					</div>
					</div>
					</div>
					</div>
		<form>
		<div>
		
			<div class="titlebox"> 제목 : ${feedback.title} ${feedback.feedbackDate} ${feedback.userId}</div>
			<hr>
			<div class="contentbox">${feedback.content}</div>
			<hr>
			<button
				onclick="location.href='/boardDelete/${feedback.feedbackNumber}'">삭제</button>
			<button
				onclick="location.href='/boardUpdate/${feedback.feedbackNumber}'">수정</button>
		
				<a href="/board/1">게시판으로</a><br> <a href="/boardWrite">글쓰기</a>
			</div>
			</form>
			<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
</body>
</html>