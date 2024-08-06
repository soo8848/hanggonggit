<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문의하기</title>
    <link rel="icon" href="HG.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <div class="inner">
            <h1><a href="index.jsp">HangGangGit</a></h1>
        </div>
    </header>

    <div class="container">
        <h2>문의하기</h2>
        <form action="index.jsp" method="post">
            <label for="name">이름:</label>
            <input type="text" id="name" name="name" required>
            <label for="email">이메일:</label>
            <input type="email" id="email" name="email" required>
            <label for="message">메시지:</label>
            <textarea id="message" name="message" rows="5" required></textarea>
            <button type="submit">전송</button>
        </form>
    </div>

    <footer>
        <div class="inner">
            <p>&copy; 2024 HangGangGit 회사. 모든 권리 보유.</p>
        </div>
    </footer>
</body>
</html>
