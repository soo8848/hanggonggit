<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 목록</title>
    <link rel="icon" href="HG.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/style.css">
    <style>
        .back-button {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px 0;
            font-size: 16px;
            color: #fff;
            background-color: #007bff;
            text-decoration: none;
            border-radius: 5px;
            text-align: center;
        }

        .back-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <header>
        <div class="inner">
            <h1><a href="index.jsp">HangGangGit</a></h1>
        </div>
    </header>

    <div class="container">
        <h2>공지사항</h2>
        <ul>
            <li><a href="login_main.jsp">게시판 이용은 로그인 이후에 가능합니다!</a></li>
      
        </ul>

        <a href="javascript:history.back()" class="back-button">뒤로가기</a>
    </div>

    <footer>
        <div class="inner">
            <p>&copy; 2024 HangGangGit 회사. 모든 권리 보유.</p>
        </div>
    </footer>
</body>
</html>
