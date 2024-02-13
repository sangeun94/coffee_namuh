<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기</title>
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
</head>
<body>
    <div id="container">
        <!-- 기존 HTML 내용 유지 -->
        <div class="text-center">
            <h1 class="h4 text-gray-900 mb-2">아이디 찾기</h1>
            <p class="mb-4">이메일을 입력해주세요!</p>
        </div>
        <form class="user" action="/findId" method="POST">
            <div class="form-group">
                <input type="email" class="form-control" id="userEmail" aria-describedby="emailHelp" name="userEmail" placeholder="이메일을 입력해주세요.">
            	<div id="emailCheckResult"></div>
            </div>
            <button type="submit">아이디 찾기</button>
        </form>
        <hr>
        <a href="/login" class="btn-user btn-block">Login </a>
        <hr>
        <div class="text-center">
            <a class="small" href="/main">메인페이지</a>
        </div>

     
        
        <!-- 추가된 부분 -->
        <script type="text/javascript">
            var msg = "${msg}";
            if (msg !== "") {
                alert(msg);
            }
        </script>
        
        
        <script>
    	document.addEventListener('DOMContentLoaded', function () {
    		const userEmailInput = document.getElementById('userEmail');
    		
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
    </div>
</body>
</html>
