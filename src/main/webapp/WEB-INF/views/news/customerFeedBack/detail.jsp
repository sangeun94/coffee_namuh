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
<h1>Detail</h1>
 
${feedback.feedbacknumber}<br>
${feedback.title}<button onclick="location.href='./boardDelete?sb_no=${detail.sb_no}'">삭제</button>
				<button onclick="location.href='./boardUpdate?sb_no=${detail.sb_no}'">수정</button><br> 
${feedback.content}<br>
${feedback.feedbackdate}<br>
${feedback.feedbackcount}<br>
${feedback.userid}<br>
<a href="/board">게시판으로</a><br>
<a href="/write">글쓰기</a>

</body>
</html>