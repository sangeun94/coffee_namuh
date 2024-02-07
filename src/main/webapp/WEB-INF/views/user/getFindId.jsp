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
    <div id="container">
        <h1>아이디 찾기</h1>
        <form action="/getFindId" method="post">
            <!-- 기존 코드 유지 -->
            <label>이름:</label>
            <input type="text" id="user_name" name="user_name" >
            <br>
            <label>이메일:</label>
            <input type="email" id="user_email" name="user_email">
            <br>
            <button type="submit">아이디 찾기</button>
        </form>
        <a href="/login">로그인 페이지로 바로가기</a>
    </div>

    <!-- 모달창 -->
    <div class="modal">
        <div class="modal_body">
            <h2>고객님의 CAFFEE NAMUH 아이디</h2>
            
            <!-- 추가된 부분 -->
            <div id="modalUserId"></div>

            <form id="findUserIdFormModal" action="/getFindId" method="post">
                <!-- 기존 코드 유지 -->
                <input type="text" id="userId" name="userId"value="${userId}">
                <button type="submit">로그인 하러가기</button>
            </form>
        </div>
    </div>
    
    
    

    
	
                

    
</body>
</html>
