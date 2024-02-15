<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script>
        // 세션이 만료되었을 때 경고 창 표시
        var sessionExpired = ${sessionExpired};
        if (sessionExpired) {
            alert("세션이 만료되었습니다. 다시 로그인 해주세요.");
        }
    </script>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>COFFEENAMUH 로그인</title>
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
    width: 0px; /* 세로 스크롤바 너비 */
}

#container::-webkit-scrollbar-track {
    background-color: #f1f1f1; /* 스크롤바 트랙 색상 */
}

#container::-webkit-scrollbar-thumb {
    background-color: #888; /* 스크롤바 색상 */
    border-radius: 6px; /* 스크롤바 모서리 둥글게 */
}

#container::-webkit-scrollbar-thumb:hover {
    background-color: #555; /* 스크롤바 호버시 색상 */
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

        div a {
            text-decoration: none;
        }

        div a:hover {
            text-decoration: underline;
        }
        
        button {
            width: 48%; 
            padding: 8px; 
        }

        div span {
        margin: 0 10px;
        color: #1A3B33; 
	    }
	
	    
	    div a {
	        text-decoration: none;
	        margin-right: 10px;
	        color: #1A3B33; 
	    }
	
	    
	    div a:last-child {
	        margin-right: 0; 
	    }
       
    </style>
    
    <link rel="shortcut icon" href="/images/favicon-32x32.png" type="image/x-icon">
    
</head>
<body>
    <div id="container">
    <a href="/">
        <img id="profile-image" src="/images/user/Coffee Namuh NONEBG_logo.png" >
       </a> 
        <h2>로그인</h2>

<form id="infoForm" action="/login" method="post">
    <label>아이디:</label>
    <input type="text" id="userId" name="userId">

    <label>비밀번호:</label>
    <input type="password" id="userPassword" name="userPassword">

    <button type="submit">로그인</button>
    
</form>

	<div>
	    <a href="/getFindId">아이디 찾기</a>
	    <span> | </span>
	    <a href="/getFindPw">비밀번호 찾기</a>
	    <span> | </span>
	    <a href="/register">회원가입</a>
	</div>
</div>


<script>
// URL에서 'loginFailed' 매개변수 확인
const urlParams = new URLSearchParams(window.location.search);
const loginFailed = urlParams.get('loginFailed');

// 'loginFailed'가 true이면 경고 메시지 표시
if (loginFailed) {
    alert("아이디와 비밀번호를 확인해주세요.");
}
</script>
</body>
</html>


