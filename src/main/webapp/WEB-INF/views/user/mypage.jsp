<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<link rel="stylesheet" href="styles.css">
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
}

#container {
	max-width: 600px;
	margin: 50px auto;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	overflow-y: auto;
	max-height: 700px;
}

#container::-webkit-scrollbar {
	width: 0px;
}

#container::-webkit-scrollbar-track {
	background-color: #f1f1f1;
}

#container::-webkit-scrollbar-thumb {
	background-color: #888;
	border-radius: 6px;
}

#container::-webkit-scrollbar-thumb:hover {
	background-color: #555;
}

.profile-header {
	background-color: #1A3B33;
	color: #fff;
	padding: 20px;
	text-align: center;
	border-top-left-radius: 8px;
	border-top-right-radius: 8px;
}

.profile-form {
	padding: 20px;
}

.label-input-group {
	margin-bottom: 16px;
}

.label-input-group label {
	display: block;
	margin-bottom: 8px;
	color: #333;
}

.label-input-group input {
	width: calc(100% - 16px);
	padding: 8px;
	margin-bottom: 16px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.button-container {
	text-align: center;
}

.button-container button {
	background-color: #1A3B33;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}
/* 모달 스타일 추가 */
.modal {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    display: none;
    justify-content: center;
    align-items: center;
    background-color: rgba(0, 0, 0, 0.4);
    z-index: 1000; /* 모달이 다른 요소 위에 올라오도록 설정 */
}

.modal_body {
    position: relative;
    width: 400px;
    padding: 40px;
    text-align: center;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
    transform: translateY(-50%);
}


</style>
</head>
<body>
	<div id="container">
		<div class="profile-header">
			<h1>마이페이지</h1>
		</div>
		<form action="" method="method">
		<div class="label-input-group">
    <label>성함:</label>
    <input type="text" id="userName" name="userName" value="${user.userName}" disabled>
</div>

<div class="label-input-group">
    <label>아이디:</label>
    <input type="text" id="userId" name="userId" value="${user.userId}" disabled>
</div>

<div class="label-input-group">
    <label>비밀번호:</label>
    <input type="text" id="userPassword" name="userPassword" value="${user.userPassword}" disabled>
</div>

<div class="label-input-group">
    <label>이메일:</label>
    <input type="email" id="userEmail" name="userEmail" value="${user.userEmail}" disabled>
</div>

<div class="label-input-group">
    <label>생년월일:</label>
    <input type="text" id="userBirth" name="userBirth" value="${user.userBirth}" disabled>
</div>

<div class="label-input-group">
    <label>우편번호:</label>
    <input type="text" id="userUpdateZipcode" name="userUpdateZipcode" value="${user.userZipcode}" disabled>
</div>

<div class="label-input-group">
    <label>주소:</label>
    <input type="text" id="userUpdateAddress" name="userUpdateAddress" value="${user.userAddress}" disabled>
    
    <label>상세주소:</label>
    <input type="text" id="userUpdateDetailAddress" name="userUpdateDetailAddress" value="${user.userDetailAddress}" disabled>
</div>

	
		</form>
		
    <button>회원정보 수정하기</button>
    
	</div>
	

	<!-- 모달창 -->
	<div class="modal">
	    <div class="modal_body">
	        <h2>정보 수정</h2>
	        <form id="updateFormModal">
	            <label>이름:</label>
	            <input type="text" id="updateUserName" name="userName" value="" >
	
	            <label>비밀번호:</label>
	            <input type="password" id="updateUserPassword" name="userPassword" value="">
	            <div id="pwCheckResult"></div>
	
	            <label>비밀번호 확인:</label>
	            <input type="password" id="updateUserConfirmPassword" name="userConfirmPassword">
	            <div id="pwConfirmCheckResult"></div>
	
	            <label>이메일:</label>
	            <input type="email" id="updateUserEmail" name="userEmail" value="">
	            <div id="emailCheckResult"></div>

	            <label>우편번호:</label>
	            <input type="text" id="userZipcode" name="userZipcode" value="">
	            <input type="button" value="우편번호검색" id="btn">
	
	            <label>주소:</label>
	            <input type="text" id="userAddress" name="userAddress" value="">
	
	            <label>상세주소:</label>
	            <input type="text" id="userDetailAddress" name="userDetailAddress" value="">
	
	            <button type="submit">수정하기</button>
	            <button type="button" class="btn-close-modal">취소</button>
	        </form>
	
		
		
		
	    </div>
	</div>
	
	
	
	<script>
	    document.addEventListener('DOMContentLoaded', function () {
	        const btnOpenUpdateModal = document.querySelector('button');
	        const modal = document.querySelector('.modal');
	
	        btnOpenUpdateModal.addEventListener('click', function () {
	            modal.style.display = 'flex';
	        });
	
	        const btnCancel = document.querySelector('.modal_body .btn-close-modal');
	
	        btnCancel.addEventListener('click', function () {
	            modal.style.display = 'none';
	        });
	    });
	</script>



	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
        const btn = document.querySelector("#btn");
        btn.addEventListener("click", () => {
            new daum.Postcode({
                oncomplete: function (data) {
                    let fullAddr = '';
                    let extraAddr = '';

                    if (data.userSelectedType === 'R') {
                        fullAddr = data.roadAddress;
                    } else {
                        fullAddr = data.jibunAddress;
                    }

                    if (data.userSelectedType === 'R') {
                        if (data.baname !== '') {
                            extraAddr += data.bname;
                        }
                        if (data.buildingName !== '') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }

                        fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '')
                    }
                    document.getElementById('userZipcode').value = data.zonecode;
                    document.getElementById('userAddress').value = fullAddr;
                    document.getElementById('userDetailAddress').focus();
                }
            }).open();
        });
    </script>
	
	
	
    
	
	
</body>
</html>
