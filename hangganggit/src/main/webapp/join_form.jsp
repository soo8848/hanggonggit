<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
</head>
<body>

<form action="join.jsp" method="post">
    <table>
        <tr>
            <td>아이디</td>
            <td><input type="text" name="id" required></td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="pw" required></td>
        </tr>
        <tr>
            <td>이름</td>
            <td><input type="text" name="name" required></td>
        </tr>
        <tr>
            <td>이메일</td>
            <td><input type="email" name="email" required></td>
        </tr>
    </table>    
    <input type="submit" value="등록">
    <input type="button" value="로그인 화면으로 가기" onclick="window.location.href='login.jsp'">
</form>

</body>
</html>
