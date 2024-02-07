<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
			height: 500px
		}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/header/header.jsp"%>

	<div class="bodybox"></div>

			<div class="titlebox"> ${feedback.title} ${feedback.feedbackDate} ${feedback.userId}</div>
			<div class="contentbox">${feedback.content}</div>
		
			<button
				onclick="location.href='/boardDelete/${feedback.feedbackNumber}'">삭제</button>
			<button
				onclick="location.href='/boardDelete/${feedback.feedbackNumber}'">수정</button>
		
				<a href="/board/1">게시판으로</a><br> <a href="/boardWrite">글쓰기</a>
</body>
</html>