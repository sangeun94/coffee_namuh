<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>회원가입</title>
    <style>

       

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            background-color: #1A3B33;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }

        a {
            color: #1A3B33;
            text-decoration: none;
        }

        .coffeenamuh-join-logo {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
        }

        .coffeenamuh-join-logo img {
            max-width: 200px; 
            max-height: 100%; 
            width: auto; 
        }

    </style>
</head>
<body>
	<main>
            <form id="joinForm" action="join_process.php" method="post" onsubmit="return validateForm()">
                <div class="coffeenamuh-join-logo">
                    <img src="/ex) 3차 html/img/KakaoTalk_20240129_084923601.png">
                </div>

                <h2 class="coffeenamuh-logo">JOIN</h2>

                <label for="username">이름:</label>
                <input type="text" id="username" name="username" required>

                <label for="username">아이디:</label>
                <input type="text" id="id" name="id" required>

                <label for="password">비밀번호:</label>
                <input type="password" id="password" name="password" required>

                <label for="confirm_password">비밀번호 확인:</label>
                <input type="password" id="confirm_password" name="confirm_password" required>

                <label for="email">이메일:</label>
                <input type="email" id="email" name="email" required>

                <label for="username">생년월일:</label>
                <input type="text" id="userdate" name="userdate" required>

                <div class="address-inputs">
                    <label for="zipcode">우편번호:</label>
                    <input type="text" id="zipcode" name="zipcode" required>
                    <input type="button"  value="우편번호검색"  id="btn">
                    <label for="address">주소:</label>
                    <input type="text" id="address" name="address" required>
                    <label for="detailAddress">상세주소:</label>
                    <input type="text" id="detailAddress" name="detailAddress" required>
                </div>

                <button type="submit">가입하기</button>
                <p><a href="#" onclick="goToLoginPage()">로그인 페이지로 바로가기</a></p>
            </form>
        </main>
    </div>

    <script>
        window.addEventListener('scroll', function () {
            var headerHeight = document.querySelector('header').offsetHeight;
            document.querySelector('main').style.marginTop = headerHeight + 'px';
        });

        function goToLoginPage() {
            window.location.href = 'login.html';
        }

        function validateForm() {
            // 여기에 유효성 검사 로직 추가
            return true; // 현재는 항상 true를 반환하도록 설정되어 있습니다.
        }

    
    </script>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        const btn = document.querySelector("#btn");
        btn.addEventListener("click",()=> {
            new daum.Postcode({
                oncomplete: function(data) {
                    console.log(data);

                    let fullAddr = '';
                    let extraAddr = '';

                    if(data.userSelectedType === 'R') {
                        fullAddr = data.roadAddress;
                    } else {
                        fullAddr = data.jibunAddress;
                    }

                    if(data.userSelectedType === 'R'){
                        if(data.baname !== ''){
                            extraAddr += data.bname;
                        }
                        if(data.buildingName !== ''){
                            extraAddr += (extraAddr !== '' ?  ', ' + data.buildingName : data.buildingName);
                        }

                        fullAddr += (extraAddr !== '' ? ' ('+ extraAddr + ')' :  '')
                    }
                    document.getElementById('zipcode').value = data.zonecode;
                    document.getElementById('address').value = fullAddr;
                    document.getElementById('detailAddress').focus();
                        }
            }).open();
        });
</script>
</body>
</html>