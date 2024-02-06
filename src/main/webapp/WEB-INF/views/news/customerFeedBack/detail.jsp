<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp"%>
 <br>
 <br>
 <br>
 <br>
 <br>
 <br>
 <br>
 
${feedback.feedbackNumber}<br>
${feedback.title}<button onclick="location.href='/boardDelete/${feedback.feedbackNumber}'">삭제</button>
				<button onclick="location.href='/boardDelete/${feedback.feedbackNumber}'">수정</button><br> 
${feedback.content}<br>
${feedback.feedbackDate}<br>
${feedback.feedbackCount}<br>
${feedback.userId}<br>
<a href="/board/1">게시판으로</a><br>
<a href="/boardWrite">글쓰기</a>

</body>
</html>