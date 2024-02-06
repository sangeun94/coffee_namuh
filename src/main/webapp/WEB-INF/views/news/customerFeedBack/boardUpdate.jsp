<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="boardUpdate" method="post">
	<input type="text" name="title" value="${update.title }">
	<textarea rows="" cols="" name="content">${update.content}</textarea>
	<input type="hidden" name="userid" value="${update.userId}">
	<button>글수정하기</button>
	</form>
</body>
</html>