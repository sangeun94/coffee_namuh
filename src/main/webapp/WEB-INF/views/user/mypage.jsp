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
	
	color: #fff;
	padding: 20px;
	text-align: center;
	border-top-left-radius: 8px;
	border-top-right-radius: 8px;
}

#profile-image {
    max-width: 100%;
    height: auto;
    margin-bottom: 20px;
    display: inline-block; /* 추가된 부분: 이미지를 인라인 요소로 설정 */
    vertical-align: middle; /* 추가된 부분: 이미지를 수직 가운데 정렬 */
}

h1 {
    color: #1A3B33;
    display: inline-block; /* 추가된 부분: 텍스트를 인라인 요소로 설정 */
    vertical-align: middle; /* 추가된 부분: 텍스트를 수직 가운데 정렬 */
    margin: 0; /* 추가된 부분: 기본 마진 제거 */
}

.profile-form {
	padding: 20px;
}

.label-input-group {
    margin-bottom: 20px; /* 각 라벨-입력 그룹의 간격을 늘립니다. */
}

.label-input-group label {
    display: inline-block;
    margin-bottom: 8px;
    color: #333;
    font-weight: bold;
    width: 15%; /* 수정된 부분: 라벨 박스 크기를 줄임 */
    text-align: left;
    margin-left: 30px;
}

.label-input-group input {
    display: inline-block;
    width: 70%; /* 수정된 부분: 입력 필드 크기 조정 */
    padding: 8px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

button {
    background-color: #1A3B33;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    width: 100%;
    box-sizing: border-box;
}
.button-container button:hover {
    background-color: #155c4d;
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
<%@ include file="/WEB-INF/views/header/header.jsp"%>

<br>
<br>
<br>
<br>
	<div id="container">
		<div class="profile-header">
		<img id="profile-image" src="/images/user/COFFEENAMUH_logo.png">
			<h1>마이페이지</h1>
			
		</div>
		<form action="" method="method">
		<div class="label-input-group">
    <label>성  함:</label>
    <input type="text" id="userName" name="userName" value="${user.userName}" disabled>
</div>

<div class="label-input-group">
    <label>아이디:</label>
    <input type="text" id="DBuserId" name="DBuserId" value="${user.userId}" disabled>
</div>

<div class="label-input-group">
    <label>패스워드:</label>
    <input type="text" id="DBuserPassword" name="DBuserPassword" value="${user.userPassword}" disabled>
</div>

<div class="label-input-group">
    <label>Email:</label>
    <input type="email" id="DBuserEmail" name="DBuserEmail" value="${user.userEmail}" disabled>
</div>

<div class="label-input-group">
    <label>생년월일:</label>
    <input type="text" id="DBuserBirth" name="DBuserBirth" value="${user.userBirth}" disabled>
</div>

<div class="label-input-group">
    <label>우편번호:</label>
    <input type="text" id="DBuserZipcode" name="DBuserUpdateZipcode" value="${user.userZipcode}" disabled>
</div>

<div class="label-input-group">
    <label>주  소:</label>
    <input type="text" id="DBuserAddress" name="DBuserAddress" value="${user.userAddress}" disabled>
    
    <label>상세주소:</label>
    <input type="text" id="DBuserDetailAddress" name="DBuserDetailAddress" value="${user.userDetailAddress}" disabled>
</div>

	
		</form>
		
    <button>회원정보 수정하기</button><br><br>
    <button type="submit">회원탈퇴</button>
	</div>
	
	<br>
	<br>
	<br>
	<br>

	<!-- 모달창 -->
	<div class="modal">
	    <div class="modal_body">
	    	<img id="profile-image" src="/images/user/COFFEENAMUH_logo.png">
	        <h2>정보 수정</h2>
	        <form id="updateFormModal" action="/mypage" method="post">
				<!-- user_id를 hidden으로 추가 -->
            	<input type="hidden" id="userId" name="userId" value="${user.userId}">
            
	            <label>비밀번호:</label>
	            <input type="password" id="userPassword" name="userPassword" value="${user.userPassword}">
	            <div id="pwCheckResult"></div>
	
	            <label>비밀번호 확인:</label>
	            <input type="password" id="userConfirmPassword" name="userConfirmPassword" value="${user.userConfirmPassword}">
	            <div id="pwConfirmCheckResult"></div>
	
	            <label>이메일:</label>
	            <input type="email" id="userEmail" name="userEmail" value="${user.userEmail}">
	            <div id="emailCheckResult"></div>

	            <label>우편번호:</label>
	            <input type="text" id="userZipcode" name="userZipcode" value="${user.userZipcode}">
	            <input type="button" value="우편번호검색" id="btn">
				<div id="zipCheckResult"></div>
				
	            <label>주소:</label>
	            <input type="text" id="userAddress" name="userAddress" value="${user.userAddress}">
				<div id="AddressCheckResult"></div>
				
	            <label>상세주소:</label>
	            <input type="text" id="userDetailAddress" name="userDetailAddress" value="${user.userDetailAddress}">
				<div id="detailAddressCheckResult"></div>
				
	            <button type="submit">수정하기</button>
	            <button type="button" class="btn-close-modal">취소</button>
	        </form>
	    </div>
	</div>
	
	
	<!-- 새로운 모달창 (회원탈퇴) -->
	<div class="modal" id="withdrawModal">
	    <div class="modal_body">
	        <h2>회원탈퇴</h2>
	        <form id="withdrawFormModal" action="/withdrawal" method="post">
	            <!-- user_id를 hidden으로 추가 -->
	            <input type="hidden" name="userId" value="${user.userId}">
	            
	            <p>정말로 탈퇴하시겠습니까? 탈퇴 후에는 복구할 수 없습니다.</p>
	
	            <button type="submit">탈퇴하기</button>
	            <button type="button" class="btn-close-modal">취소</button>
	        </form>
	    </div>
	</div>
	
	
	<!-- 로그아웃 버튼 추가 -->
<button id="logoutButton">로그아웃</button>

<!-- 기존의 스크립트 아래에 추가 -->
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // ... 기존 스크립트 코드 ...

        // 로그아웃 버튼 클릭 시 이벤트 처리
        const logoutButton = document.getElementById('logoutButton');

        logoutButton.addEventListener('click', function () {
            // 로그아웃 처리를 위한 로직을 추가할 수 있습니다.
            // 여기서는 간단하게 '/logout' 경로로 이동하는 예제를 보여드립니다.
            window.location.href = '/logout'; // 이동하고자 하는 경로로 변경해주세요.
        });
    });
</script>
	
	<script>//회원정보 모달창 스크립트
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


	<script>
	    document.addEventListener('DOMContentLoaded', function () {
	        const btnOpenUpdateModal = document.querySelector('#container button:first-of-type');
	        const btnOpenWithdrawModal = document.querySelector('#container button:last-of-type');
	        const modalUpdate = document.querySelector('#updateModal');
	        const modalWithdraw = document.querySelector('#withdrawModal');
	
	        btnOpenUpdateModal.addEventListener('click', function () {
	            modalUpdate.style.display = 'flex';
	        });
	
	        btnOpenWithdrawModal.addEventListener('click', function () {
	            modalWithdraw.style.display = 'flex';
	        });
	
	        const btnCancelUpdate = document.querySelector('#updateModal .btn-close-modal');
	        const btnCancelWithdraw = document.querySelector('#withdrawModal .btn-close-modal');
	
	        btnCancelUpdate.addEventListener('click', function () {
	            modalUpdate.style.display = 'none';
	        });
	
	        btnCancelWithdraw.addEventListener('click', function () {
	            modalWithdraw.style.display = 'none';
	        });
	    });
	</script>



	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>//주소창 스크립트
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
	
	
	
    <script>//pw, confirmPw, email 유효성 검증
    
    document.addEventListener('DOMContentLoaded', function () {
        
        
        const userPasswordInput = document.getElementById('userPassword');
        const userConfirmPasswordInput = document.getElementById('userConfirmPassword');
        const userEmailInput = document.getElementById('userEmail');
        const userBirthInput = document.getElementById('userBirth');
        
	 // userPassword 검증
	    userPasswordInput.addEventListener('input', function () {
		    const userPassword = userPasswordInput.value;
		    const pwRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[a-zA-Z\d!@#$%^&*]{8,}$/;
		    
		    if (!pwRegex.test(userPassword)) {
		        userPasswordInput.style.background = 'pink';
		        pwCheckResult.textContent = '비밀번호는 특수문자 포함 8자 이상이어야 합니다.';
		    } else {
		        userPasswordInput.style.background = 'aqua';
		        pwCheckResult.textContent = '';
		    }
		});
	    
	 	// user컨펌Password 검증
	    userConfirmPasswordInput.addEventListener('input', function () {
	        const userPassword = userPasswordInput.value;
	        const userConfirmPassword = userConfirmPasswordInput.value;
	        const pwRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[a-zA-Z\d!@#$%^&*]{8,}$/;
	
	        if (userPassword !== userConfirmPassword) {
	            userConfirmPasswordInput.style.background = 'pink';
	            pwConfirmCheckResult.textContent = '동일하지 않은 비밀번호입니다.';
	        } else if (!pwRegex.test(userPassword)) {
	            userConfirmPasswordInput.style.background = 'pink';
	            pwConfirmCheckResult.textContent = '비밀번호는 특수문자 포함 8자 이상이어야 합니다.';
	        } else {
	            userConfirmPasswordInput.style.background = 'aqua';
	            pwConfirmCheckResult.textContent = '';
	        }
	    });
	    
	  //userEmail
        userEmailInput.addEventListener('input', function () {
            if (!/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/.test(userEmailInput.value)) {
                userEmailInput.style.background = 'pink';
                emailCheckResult.textContent = '올바른 이메일 주소를 입력해주세요.';
            } else {
            	userEmailInput.style.background = 'aqua';
            	emailCheckResult.textContent = '';
            }
        });
	    
	    //생년월일 검증
	    userBirthInput.addEventListener('input', function () {
	        const userBirth = userBirthInput.value;
	        const birthRegex = /^19\d{6}$/;
	
	        if (!birthRegex.test(userBirth)) {
	            userBirthInput.style.background = 'pink';
	            birthCheckResult.textContent = '생년월일 8자리를 입력해주세요. (19YYMMDD)';
	        } else {
	            userBirthInput.style.background = 'aqua';
	            birthCheckResult.textContent = '';
	        }
	    });
	    
	
	    document.getElementById('infoForm').addEventListener('submit', function (e) {
	        if (!validateForm()) {
	            e.preventDefault();
	        }
	    });
	
	    function displayError(field, message) {
	        document.getElementById(field).style.background = 'pink';
	        document.getElementById(field + 'ErrorMsg').textContent = message;
	    }
	
	    function removeError(field) {
	        document.getElementById(field).style.background = 'aqua';
	        document.getElementById(field + 'ErrorMsg').textContent = '';
	    }
	});
	</script>
	
	<script>//주소창 유효성 검증
	    document.getElementById('updateFormModal').addEventListener('submit', function (e) {
	        const userZipcodeInput = document.getElementById('userZipcode');
	        const userAddressInput = document.getElementById('userAddress');
	        const userDetailAddressInput = document.getElementById('userDetailAddress');
	
	        // 주소 필수 입력 검증
	        if (!userZipcodeInput.value.trim() || !userAddressInput.value.trim() || !userDetailAddressInput.value.trim()) {
	            e.preventDefault();
	            alert('주소를 입력은 필수 입니다.'); // 혹은 원하는 다른 처리를 수행할 수 있습니다.
	        }
	
	        if (!validateForm()) {
	            e.preventDefault();
	        }
	    });
	  	
	    
	</script>
	
	
	<!-- 푸터 -->
<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
<script type="text/javascript" src="../js/menu/menu_food.js"></script>
	
</body>
</html>
