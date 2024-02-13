<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기 결과</title>
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

        #container h2 {
            color: #1A3B33;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            margin-bottom: 8px;
            font-size: 18px;
        }

        button {
            background-color: #1A3B33;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 20px;
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
        <div class="jumbotron">
            <h2>COFFNAMUH<c:forEach items="${user}" var="user">
                    ${user.userName}님 의 아이디는
                </c:forEach> </h2>
            <ul>
                <c:forEach items="${user}" var="user">
                    <li>${user.userId}</li>
                </c:forEach>
            </ul>
            <h2>입니다</h2>
            <button type="button" onclick="location.href='/user/login'">로그인페이지</button>
            <button type="button" onclick="location.href='/user/main'">메인페이지</button>
        </div>
    </div>
</body>
</html>
