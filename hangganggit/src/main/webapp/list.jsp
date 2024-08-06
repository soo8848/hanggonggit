<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="util.MYSQLUtil" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }
        table {
            margin: 0 auto;
            width: 80%;
            border-collapse: collapse;
            text-align: center;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        th {
            background-color: #f4f4f4;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        a {
            text-decoration: none;
            color: #007bff;
        }
        a:hover {
            text-decoration: underline;
        }
        .button {
            padding: 10px 20px;
            font-size: 16px;
            color: white;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .button:hover {
            background-color: #0056b3;
        }
        .num, .title, .writer, .regtime, .hits, .recommend, .disrecommend, .comments {
            text-align: center;
        }
        .title {
            text-align: left;
        }
    </style>
</head>
<body>

<%
    String userId = (String) session.getAttribute("userId");
    if (userId == null) {
        // 로그인하지 않은 경우 로그인 페이지로 리다이렉트
        response.sendRedirect("login.jsp");
        return;
    }

    // 데이터베이스 연결
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
        conn = MYSQLUtil.getConnection(); // MySQLUtil 사용
        String sql = "SELECT * FROM HG_post_table";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
%>

<h1>게시판</h1>

<table>
    <thead>
        <tr>
            <th class="num">번호</th>
            <th class="title">제목</th>
            <th class="writer">작성자</th>
            <th class="regtime">작성일시</th>
            <th class="hits">조회수</th>
            <th class="recommend">추천수</th>
            <th class="disrecommend">비추천수</th>
            <th class="comments">댓글</th>
        </tr>
    </thead>
    <tbody>
<%
        while (rs.next()) {
            int num = rs.getInt("num");
            String writer = rs.getString("writer");
            String title = rs.getString("title");
            String regtime = rs.getString("regtime");
            int hits = rs.getInt("hits");
            int recommend = rs.getInt("recommend");
            int disrecommend = rs.getInt("disrecommend");
            String comments = rs.getString("comments");
%>
        <tr>
            <td><%= num %></td>
            <td style="text-align:left;">
                <a href="view.jsp?num=<%= num %>"><%= title %></a>
            </td>
            <td><%= writer %></td>
            <td><%= regtime %></td>
            <td><%= hits %></td>
            <td><%= recommend %></td>
            <td><%= disrecommend %></td>
            <td><%= comments %></td>
        </tr>
<%
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        MYSQLUtil.close(rs, pstmt, conn); // MySQLUtil 사용
    }
%>
    </tbody>
</table>

<br>
<input type="button" class="button" value="글쓰기" onclick="location.href='write.jsp'">

</body>
</html>
