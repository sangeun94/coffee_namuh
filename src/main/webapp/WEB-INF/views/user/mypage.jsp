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

.modal{
            position:absolute;
            display:none;
            
            justify-content: center;
            top:0;
            left:0;

            width:100%;
            height:100%;

            

            background-color: rgba(0,0,0,0.4);
        }
        
.modal_body{
            position:absolute;
            top:50%; //모달을 화면가운데 놓기위함. 
        

            width:400px;  //모달의 가로크기 
            height:1000px; //모달의 세로크기 

            padding:40px;  

            text-align: center;

            background-color: rgb(255,255,255); //모달창 배경색 흰색
            border-radius:10px; //테두리 
            box-shadow:0 2px 3px 0 rgba(34,36,38,0.15); //테두리 그림자 

            transform:translateY(-50%); //모듈창열었을때 위치설정 가운데로 
        }
</style>
</head>
<body>
	<div id="container">
		<div class="profile-header">
			<h1>마이페이지</h1>
		</div>
		<form action="/update-user" method="post">
		<div class="profile-form">
			<div class="label-input-group">
				<label>성함:</label> <input type="text" id="userName" name="userName" value="${user.userName}">
			</div>

			<div class="label-input-group">
				<label>아이디:</label> <input type="text" id="userId" name="userId" value="${user.userId}" disabled>
			</div>

			<div class="label-input-group">
				<label>비밀번호:</label> <input type="text" id="userPassword" name="userPassword" value="${user.userPassword}">
			</div>

			<div class="label-input-group">
				<label >이메일:</label> <input type="email"id="userEmail" name="userEmail" value="${user.userEmail}">
			</div>

			<div class="label-input-group">
				<label>생년월일:</label> <input type="text"id="userBirth" name="userBirth" value="${user.userBirth}">
			</div>

			<div class="label-input-group">
				<label>우편번호:</label> 
				<input type="text" id="userZipcode" name="userZipcode" value="${user.userZipcode}" disabled>
				
			</div>

			<div class="label-input-group">
				<label>주소:</label> <input type="text" id="userAddress" name="userAddress" value="${user.userAddress}"disabled>
				

				<label>상세주소:</label> <input type="text" id="userDetailAddress" name="userDetailAddress"value="${user.userDetailAddress}" disabled>
			</div>
		</div>
		
		</form>
		
    <button class="btn-open-modal">회원정보 수정하기</button>
    
	</div>
	
	<div class="modal">
        <div class="modal_body">
            <h2>회원정보 수정</h2>
            <form id="updateForm" method="post" action="">
            
            <label>이름:</label>
            <input type="text" id="userName" name="userName">
            
            <label>비밀번호:</label>
            <input type="password" id="userPassword" name="userPassword">
             <div id="pwCheckResult"></div>
           
            <label>비밀번호 확인:</label>
            <input type="password" id="userConfirmPassword" name="userConfirmPassword">
           	 <div id="pwConfirmCheckResult"></div>
            <label for="userEmail">이메일:</label>
            <input type="email" id="userEmail" name="userEmail">
            <div id="emailCheckResult"></div>
            
            <div class="address-inputs">
                <label>우편번호:</label>
                <input type="text" id="userUpdateZipcode" name="userUpdateZipcode">
                <input type="button" value="우편번호검색" id="btn">
                

                <label>주소:</label>
                <input type="text" id="userUpdateAddress" name="userUpdateAddress">
                
               
                <label for="userDetailAddress">상세주소:</label>
                <input type="text" id="userUpdateDetailAddress" name="userUpdateDetailAddress">
                		
            </div>
            
            <button type="submit">수정하기</button>
        </form>
        <button onclick="modalUpdateUser.style.display='none'">취소</button>
        </div>
    </div>
	



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
                    document.getElementById('userUpdateZipcode').value = data.zonecode;
                    document.getElementById('userUpdateAddress').value = fullAddr;
                    document.getElementById('userUpdateDetailAddress').focus();
                }
            }).open();
        });
    </script>
	
	
    <script>
        const modal = document.querySelector('.modal');
        const btnOpenModal=document.querySelector('.btn-open-modal');

        btnOpenModal.addEventListener("click", ()=>{
            modal.style.display="flex";
        });
    </script>
	
	<script>
	    const btnOpenUpdateModal = document.querySelector('#btnOpenUpdateModal');
	    const modalUpdateUser = document.querySelector('.modal-update-user');
	
	    btnOpenUpdateModal.addEventListener('click', () => {
	        modalUpdateUser.style.display = 'flex';
	    });
	</script>
	
</body>
</html>
