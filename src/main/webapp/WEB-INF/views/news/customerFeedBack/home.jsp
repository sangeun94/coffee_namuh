<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>detail</h1>
${detail.feedbacknumber}<br>
${detail.title}<button onclick="location.href='./boardDelete?feedbacknumber=${detail.feedbacknumber }'">삭제</button>
<button onclick="location.href='./boardUpdate?feedbacknumber=${detail.feedbacknumber}'">수정</button><br>
${detail.content }<br>
</body>
</html>