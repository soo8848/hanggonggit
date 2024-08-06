<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이용안내사항</title>
    <link rel="icon" href="HG.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        header {
            background: #333;
            color: #fff;
            padding: 10px 0;
            text-align: center;
        }
        header h1 {
            margin: 0;
        }
        .container {
            width: 80%;
            margin: auto;
            overflow: hidden;
            padding: 20px;
            background: #fff;
        }
        h2 {
            color: #333;
            border-bottom: 2px solid #333;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        ul {
            list-style: none;
            padding: 0;
        }
        ul li {
            margin-bottom: 10px;
        }
        a {
            color: #007bff;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        footer {
            background: #333;
            color: #fff;
            text-align: center;
            padding: 10px 0;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
    </style>
</head>
<body>
    <header>
        <h1>HangGangGit 항공사이트</h1>
    </header>

    <div class="container">
        <h2>이용안내사항</h2>
        
        <h3>1. 회원가입 및 로그인</h3>
        <ul>
            <li><strong>회원가입:</strong> 웹사이트의 모든 기능을 사용하려면 회원가입이 필요합니다. <a href="signup.jsp">회원가입 페이지</a>에서 필요한 정보를 입력하고 가입해 주세요.</li>
            <li><strong>로그인:</strong> 이미 가입된 회원은 <a href="login_main.jsp">로그인 페이지</a>에서 사용자 ID와 비밀번호를 입력하여 로그인할 수 있습니다.</li>
        </ul>

        <h3>2. 게시물 작성 및 댓글</h3>
        <ul>
            <li><strong>게시물 작성:</strong> 게시판에서 새로운 게시물을 작성하려면 <a href="PostFolder/write.jsp">게시물 작성 페이지</a>로 이동하세요. 제목, 내용, 작성자 정보를 입력하면 됩니다.</li>
            <li><strong>댓글 작성:</strong> 게시물에 댓글을 달려면 해당 게시물 페이지에서 댓글 입력란에 내용을 작성하고 제출하세요.</li>
        </ul>

        <h3>3. 개인정보 보호</h3>
        <ul>
            <li><strong>개인정보 보호:</strong> 회원님의 개인정보는 철저히 보호됩니다. 자세한 내용은 <a href="privacyPolicy.jsp">개인정보 처리방침</a>을 참조하세요.</li>
        </ul>

        <h3>4. 이용약관</h3>
        <ul>
            <li><strong>이용약관:</strong> 웹사이트 사용에 관한 자세한 사항은 <a href="terms.jsp">이용약관 페이지</a>에서 확인할 수 있습니다.</li>
        </ul>

        <h3>5. 고객 지원</h3>
        <ul>
            <li><strong>문의 및 지원:</strong> 웹사이트 이용 중 문제가 발생하거나 문의사항이 있을 경우, <a href="support.jsp">고객 지원 페이지</a>를 통해 도움을 요청해 주세요.</li>
        </ul>

        <h3>6. 사이트 업데이트</h3>
        <ul>
            <li><strong>업데이트:</strong> 사이트는 주기적으로 업데이트됩니다. 최신 소식은 <a href="news.jsp">공지사항 페이지</a>에서 확인하실 수 있습니다.</li>
        </ul>
    </div>

    <footer>
        <p>&copy; 2024 HangGangGit 회사. 모든 권리 보유.</p>
    </footer>
</body>
</html>
