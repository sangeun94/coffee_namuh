<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> 고객 목록 페이지 </h1>
	
	<div>
		<form action="" method="get">
			<span>검색기준</span>
			<label><input type="checkbox" name="id">아이디</label>
			<label><input type="checkbox" name="name">이름</label>
			<br> 
			<label>검색어 : </label> <input type="text" name="searchKeyword">
			<button type="submit">검색</button>
		</form>
	</div>
	
	<hr>
	
	<form id="frm_customers" action="/admin/customers/delete" method="post">
	<button id="btn_delete" type="submit">삭제</button>
	<button id="btn_modify" type="submit">수정</button>
		<c:forEach var="userItem" items="${userList}">
			<p>
			<input class="chb_checkId" type="checkbox" name="checkId" value="${userItem.id}" checked> 
			${userItem.id} ${userItem.pw} ${userItem.name} </p>	
		</c:forEach>
	</form>
	
	
	<script>
	
// 		let frm_customers = document.querySelector('#frm_customers');
// 		document.getElementById('btn_modify').addEventListener('click', ()=>{
// 			frm_customers.action = "/modify/customer";
// 			frm_customers.submit();
// 		}
		document.getElementById('btn_delete').addEventListener('click', ()=>{
// 			frm_customers.action = "/delete/customer";
// 			frm_customers.submit();
			
			
			const chb_arr = document.querySelectorAll('.chb_checkId');
			
			let sendArr = [];
			
			chb_arr.forEach(function(item){
				if(item.checked == true){
					console.log(item.value);
					sendArr.push(item.value);
				}
			});
			
			console.log(sendArr);
			//JSON
			console.log(JSON.stringify(sendArr));
			
		});
	</script>
	
	@PostMapping("/customers/delete")
	public String customersDelete(@RequestParam List<String> checkId) {

		System.out.println(checkId);
		
		userService.remove..(checkId);
		
		return "admin/customers";
	}
	
	
</body>
</html>