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
            width: 50%;
            box-sizing: border-box;
            margin: 0 auto;
        }

        label {
            display: block;
            margin-bottom: 8px;
            text-align: left;
            margin-left: 10px;
        }

        input {
            width: calc(100% - 16px);
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

        #btn_checkDupId {
            width: 40%;
            box-sizing: border-box;
        }

    </style>
</head>
<body>
    <div id="container">
        <img id="profile-image" src="/image/user/COFFEENAMUH_logo.png">

        <h2>회원가입</h2>

        <form id="infoForm" method="post" action="/register">
            <label for="userName">이름:</label>
            <input type="text" id="userName" name="userName">
            <div id="nameCheckResult"></div>
           
            <label for="userId">아이디:</label>
            <input type="text" id="userId" name="userId">
            <button type="button" id="btn_checkDupId">중복확인</button>
            <div id="idCheckResult"></div>

            <label for="userPassword">비밀번호:</label>
            <input type="password" id="userPassword" name="userPassword">
             <div id="pwCheckResult"></div>
           
            <label for="userConfirmpassword">비밀번호 확인:</label>
            <input type="password" id="userConfirmPassword" name="userConfirmPassword">
           	 <div id="pwConfirmCheckResult"></div>
           	
            <label for="userEmail">이메일:</label>
            <input type="email" id="userEmail" name="userEmail">
            <div id="emailCheckResult"></div>
           
            <label for="userBirth">생년월일:</label>
            <input type="text" id="userBirth" name="userBirth">
           	<div id="birthCheckResult"></div>
           	
            <div class="address-inputs">
                <label for="userZipcode">우편번호:</label>
                <input type="text" id="userZipcode" name="userZipcode">
                <input type="button" value="우편번호검색" id="btn">
                <div id="zipCheckResult"></div>

                <label for="userAddress">주소:</label>
                <input type="text" id="userAddress" name="userAddress">
                <div id="AddressCheckResult"></div>
               
                <label for="userDetailAddress">상세주소:</label>
                <input type="text" id="userDetailAddress" name="userDetailAddress">
                <div id="detailAddressCheckResult"></div>		
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

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
    document.addEventListener('DOMContentLoaded', function () {
        const btn_checkDupId = document.getElementById('btn_checkDupId');
        const userIdInput = document.getElementById('userId');
        const idCheckResult = document.getElementById('idCheckResult');
        const userNameInput = document.getElementById('userName');
        const userPasswordInput = document.getElementById('userPassword');
        const userConfirmPasswordInput = document.getElementById('userConfirmPassword');
        const userEmailInput = document.getElementById('userEmail');
        const userBirthInput = document.getElementById('userBirth');
		
        btn_checkDupId.addEventListener('click', function () {
            const input_id = userIdInput.value;

            $.ajax({
                type: "POST",
                url: "/customer/isDuplicatedId", // 여기를 수정
                headers: {
                    "Content-type": "application/x-www-form-urlencoded"
                },
                data: { id: input_id },
                dataType: 'json',
                success: function (result) {
                    if (result.resultCode === 409) {
                        idCheckResult.textContent = '이미 사용 중인 아이디입니다.';
                    } else {
                        idCheckResult.textContent = '사용 가능한 아이디입니다.';
                    }
                },
                error: function () {
                    console.log('실패 에러');
                }
            });
        });
		
       
     // userName검증
        userNameInput.addEventListener('input', function () {
            if (!/^[가-힣]{1,}$/.test(userNameInput.value)) {
            	userNameInput.style.background = 'pink';
                nameCheckResult.textContent = '한글만 입력 가능합니다.';
            } else {
            	userNameInput.style.background = 'aqua';
                nameCheckResult.textContent = '';
            }
        });
       
       
        // userId검증
        userIdInput.addEventListener('input', function () {
            if (!/^[a-zA-Z0-9]{4,14}$/.test(userIdInput.value)) {
                userIdInput.style.background = 'pink';
                idCheckResult.textContent = '영문과 숫자 조합으로 4~14자 조합해주세요.';
            } else {
                userIdInput.style.background = 'aqua';
                idCheckResult.textContent = '';
            }
        });
       
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

<script>
 

    document.getElementById('infoForm').addEventListener('submit', function (e) {
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


</body>
</html>