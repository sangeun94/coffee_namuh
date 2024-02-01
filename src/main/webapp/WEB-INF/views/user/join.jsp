<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

#container {
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	text-align: center;
	width: 100%;
	max-width: 600px;
	max-height: 700px; /* 최대 높이로 설정, 필요에 따라 조절 가능 */
	overflow-y: auto; /* 내용이 높이를 초과할 경우 스크롤바 표시 */
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

#profile-image {
	max-width: 100%;
	height: auto;
	margin-bottom: 20px;
}

h2 {
	text-align: center;
	color: #1A3B33;
}

form {
	width: 100%;
	box-sizing: border-box;
}

label {
	display: block;
	margin-bottom: 8px;
	text-align: left;
	margin-left: 10px;
}

input {
	width: calc(100% - 16px); /* 좌우 8px의 여백 제외 */
	padding: 8px;
	margin-bottom: 16px;
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

a {
	color: #1A3B33;
	text-decoration: none;
}

</style>
</head>
<body>
	<div id="container">
		<img id="profile-image" src="/image/user/COFFEENAMUH_logo.png">

		<h2>회원가입</h2>

		<form id="infoForm" method="post" action="/register">
            <label for="userName">이름:</label>
            <input type="text" id="userName" name="userName" required>
           

            <label for="userId">아이디:</label>
            <input type="text" id="userId" name="userId" required>

            <label for="userPassword">비밀번호:</label>
            <input type="password" id="userPassword" name="userPassword" required>
           

            <label for="confirm_password">비밀번호 확인:</label>
            <input type="password" id="confirm_password" name="confirm_password" required>
           

            <label for="userEmail">이메일:</label>
            <input type="email" id="userEmail" name="userEmail" required>
           

            <label for="userBirth">생년월일:</label>
            <input type="text" id="userBirth" name="userBirth" required>
           

            <div class="address-inputs">
                <label for="userZipcode">우편번호:</label>
                <input type="text" id="userZipcode" name="userZipcode" required>
               

                <input type="button" value="우편번호검색" id="btn">

                <label for="userAddress">주소:</label>
                <input type="text" id="userAddress" name="userAddress" required>
               

                <label for="userDetailAddress">상세주소:</label>
                <input type="text" id="userDetailAddress" name="userDetailAddress" required>
               
            </div>

            <button type="submit">가입하기</button>
        </form>
        <p>
            <a href="/login">로그인 페이지로 바로가기</a>
        </p>
    </div>

	<script>
	
        window.addEventListener('scroll', function () {
            var headerHeight = document.querySelector('header').offsetHeight;
            document.querySelector('main').style.marginTop = headerHeight + 'px';
        });


        function validateForm() {
            // 여기에 유효성 검사 로직 추가
            return true; // 현재는 항상 true를 반환하도록 설정되어 있습니다.
        }
    </script>

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
        const btn = document.querySelector("#btn");
        btn.addEventListener("click", () => {
            new daum.Postcode({
                oncomplete: function (data) {
                    console.log(data);

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