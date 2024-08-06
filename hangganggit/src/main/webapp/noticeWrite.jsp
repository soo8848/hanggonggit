<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String loggedInUserRole = (String) session.getAttribute("userRole");
if (!"admin".equals(loggedInUserRole)) {
    response.sendRedirect("error.jsp");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 작성</title>
</head>
<body>

<form method="post" action="insertNotice.jsp">
    <table>
        <tr>
            <th>제목</th>
            <td><input type="text" name="title" maxlength="80"></td>
        </tr>
        <tr>
            <th>내용</th>
            <td><textarea name="content" rows="10"></textarea></td>
        </tr>
    </table>
    <br>
    <input type="submit" value="저장">
    <input type="button" value="취소" onclick="history.back()">
</form>

</body>
</html>
