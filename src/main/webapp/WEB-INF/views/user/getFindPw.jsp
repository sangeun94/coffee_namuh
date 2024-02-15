<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>
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
            width: 50%;
            box-sizing: border-box;
        }

        #container h1 {
            color: #1A3B33;
        }

        form {
            width: 50%;
            box-sizing: border-box;
            margin: 0 auto;
            margin-top: 20px;
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
            display: block;
            margin-top: 20px;
        }
    </style>
    <link rel="shortcut icon" href="/images/favicon-32x32.png" type="image/x-icon">
</head>
<body>
    <div id="container">
        <!-- 기존 HTML 내용 유지 -->
        <div class="text-center">
            <h1 class="h4 text-gray-900 mb-2">비밀번호 찾기</h1>
        </div>
        <form class="user" action="/findPw" method="POST">
            <div class="form-group">
            	<label>아이디</label><input type="text" id="userId" name="userId" placeholder="아이디를 입력해주세요.">
                <label>이메일</label><input type="email" id="userEmail" name="userEmail" placeholder="이메일을 입력해주세요.">
            	<label>이름</label><input type="text" id="userName" name="userName" placeholder="성함을 입력해주세요.">
            </div>
            <button type="submit">비밀번호 찾기</button>
        </form>
        <hr>
        <a href="/login" class="btn-user btn-block">로그인 페이지로 바로가기 </a>
        <hr>
        <div class="text-center">
            <a class="small" href="/mainHome">메인페이지</a>
        </div>
        <!-- 추가된 부분 -->
        <script type="text/javascript">
            var msg = "${msg}";
            if (msg !== "") {
                alert(msg);
            }
        </script>
    </div>
</body>
</html>
