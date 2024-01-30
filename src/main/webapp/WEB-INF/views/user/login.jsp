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
    
        .login-logo img {
            max-width: 100%;
            height: auto;
        }
    
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }
    
        input, select {
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
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                width: 100%;  
                box-sizing: border-box; 
            }
    </style>
    </head>
    <body>
        <form id="loginForm">
            <div class="login-container">
                <div class="login-logo">
                    <img src="/ex) 3차 html/img/KakaoTalk_20240129_084923601.png">
                </div>
    
                <label for="userid">아이디:</label>
                <input type="text" id="userid" name="userid" required>
    
                <label for="password">비밀번호:</label>
                <input type="password" id="password" name="password" required>
                <button type="submit">가입하기</button>
            </div>
        </form>
    </body>
    </html>
    