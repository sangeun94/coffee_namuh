<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="UTF-8">
     <title>개인정보 확인 및 수정</title>
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
            }
    
            label {
                display: block;
                margin-bottom: 8px;
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
        <div id="container">
        <h2>개인정보 확인 및 수정</h2>
        <label for="id">아이디:</label>
        <input type="text" id="id" value="your_username" readonly>
    
        <label for="name">이름:</label>
        <input type="text" id="name" value="Your Name">
    
        <label for="birthdate">생년월일:</label>
        <input type="text" id="birthdate" value="YYYY-MM-DD">
    
        <label for="phone">휴대폰 번호:</label>
        <input type="text" id="phone" value="010-1234-5678">
    
        <label for="email">이메일:</label>
        <input type="email" id="email" value="your_email@example.com">
    
        <button onclick="updateInfo()">정보 수정</button>
    </div>
    
    <script>
        function updateInfo() {
            // 여기에 정보 업데이트 로직을 추가할 수 있습니다.
            alert('정보가 성공적으로 업데이트되었습니다.');
        }
    </script>
    </body>
    </html>