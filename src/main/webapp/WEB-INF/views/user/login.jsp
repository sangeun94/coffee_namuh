<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>COFFEENAMUH 로그인</title>
    <style>
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

        .login-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }

        .login-logo {
            text-align: center;
            margin-bottom: 20px;
        }

        .login-button, .signup-button {
            background-color: #03c75a;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            text-align: center;
            margin-top: 10px; /* 버튼 간격 조절 */
        }

        .signup-button {
            background-color: brown;
        }

        .login-divider {
            margin: 20px 0;
            border-bottom: 1px solid #ccc;
        }

        .other-login {
            text-align: center;
            margin-top: 20px;
        }

        .other-login-buttons a {
            margin-right: 10px;
            text-decoration: none;
            color: #03c75a;
        }

        /* 추가된 스타일 */
        input, select {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .gender-label {
            font-weight: bold;
            margin-bottom: 8px;
        }

        .gender-options {
            display: flex;
            justify-content: space-between;
            margin-bottom: 16px;
        }

        
    </style>
</head>
<body>
	<form id="loginForm">
    <div class="login-container">
        <div class="login-logo">
            <img src="naver_logo.png" alt="COFFEENAMUH">
        </div>

        
        <label for="userid">아이디:</label>
        <input type="text" id="userid" name="userid" required>

        <label for="password">비밀번호:</label>
        <input type="password" id="password" name="password" required>
</body>
</html>