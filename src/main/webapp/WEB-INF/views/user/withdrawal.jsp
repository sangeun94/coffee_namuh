<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원탈퇴 완료</title>
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

        h2 {
            text-align: center;
            color: #1A3B33;
        }

        p {
            margin-bottom: 20px;
            color: #1A3B33;
        }

        a {
            text-decoration: none;
            color: #1A3B33;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div id="container">
        <h2>회원탈퇴 완료</h2>
        <p>정상적으로 회원탈퇴가 진행되었습니다.</p>
        <a href="/">메인페이지로 이동</a>
    </div>
</body>
</html>
