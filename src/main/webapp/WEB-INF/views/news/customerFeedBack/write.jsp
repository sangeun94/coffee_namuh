<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="write" method="post">
		<input type="text" name="title">
		<textarea rows="" cols="" name="content"></textarea>
		<button>글쓰기</button>
		<input type="hidden" name="sb_cate" value="">
	</form>
</body>
</html>