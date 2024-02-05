<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp"%>
<br><br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

	<form action="write" method="post"><br>
		<input type="text" name="title"><br>
		<textarea rows="" cols="" name="content"></textarea><br>
		<button>글쓰기</button>
		<input type="hidden" name="sb_cate" value="">
	</form>
</body>
</html>