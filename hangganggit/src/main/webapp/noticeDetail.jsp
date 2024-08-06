<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="PostDTO_DAO.PostDAO" %>
<%@ page import="PostDTO_DAO.PostDTO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 상세</title>
    <style>
        .content { margin: 20px; padding: 10px; border: 1px solid #ddd; }
    </style>
</head>
<body>

<%
String num = request.getParameter("num");
PostDAO dao = new PostDAO();
PostDTO dto = dao.getOne(Integer.parseInt(num));

if (dto == null) {
    out.println("공지사항을 찾을 수 없습니다.");
    return;
}
%>

<h2><%= dto.getTitle() %></h2>
<p>작성자: <%= dto.getWriter() %></p>
<p>등록 시간: <%= dto.getRegtime() %></p>
<div class="content">
    <%= dto.getContent() %>
</div>

<a href="noticeList.jsp">목록으로 돌아가기</a>

</body>
</html>
