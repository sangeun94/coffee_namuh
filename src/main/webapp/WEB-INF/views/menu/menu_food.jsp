<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="checkbox_wrap list_checkbox">
				<label class="checkbox"> <input type="checkbox" id=""
					name="list_checkbox" value="5"> <span class="check_mark"></span>
					<div class="checkbox_text">브레드</div>
				</label>
			</div>
			<div class="checkbox_wrap list_checkbox">
				<label class="checkbox"> <input type="checkbox" id=""
					name="list_checkbox" value="6"> <span class="check_mark"></span>
					<div class="checkbox_text">케이크</div>
				</label>
			</div>
			<div class="checkbox_wrap list_checkbox">
				<label class="checkbox"> <input type="checkbox" id=""
					name="list_checkbox" value="7"> <span class="check_mark"></span>
					<div class="checkbox_text">샌드위치</div>
				</label>
			</div>

<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
</body>
</html>