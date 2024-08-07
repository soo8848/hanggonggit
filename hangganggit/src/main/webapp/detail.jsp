<%@ page import="PostDTO_DAO.PostDAO" %>
<%@ page import="PostDTO_DAO.PostDTO" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.sql.SQLException" %>
<%
    request.setCharacterEncoding("UTF-8");
    String numStr = request.getParameter("num");
    String type = request.getParameter("type");
    String newComment = request.getParameter("newComment");
    String deleteComment = request.getParameter("deleteComment");

    if (numStr == null) {
        response.sendRedirect("list.jsp");
        return;
    }

    int num = Integer.parseInt(numStr);
    PostDAO dao = new PostDAO();
    PostDTO dto = dao.getOne(num);

    if (dto == null) {
        response.sendRedirect("list.jsp");
        return;
    }

    // 추천/비추천 처리
    if (type != null) {
        boolean success = false;
        if (type.equals("like")) {
            success = dao.incrementRecommend(num);
        } else if (type.equals("dislike")) {
            success = dao.incrementDisrecommend(num);
        }

        if (success) {
            response.sendRedirect("detail.jsp?num=" + num);
            return;
        }
    }

    // 댓글 추가 처리
    if (newComment != null && !newComment.trim().isEmpty()) {
        String comments = dto.getComments();
        if (comments == null) {
            comments = "";
        }
        comments += "<div>" + newComment + "</div>";
        dto.setComments(comments);
        boolean updateSuccess = dao.updatePost(dto);

        if (updateSuccess) {
            response.sendRedirect("detail.jsp?num=" + num);
            return;
        }
    }

    // 댓글 삭제 처리
    if (deleteComment != null) {
        String comments = dto.getComments();
        if (comments != null && !comments.isEmpty()) {
            String decodedDeleteComment = URLDecoder.decode(deleteComment, "UTF-8");
            comments = comments.replace("<div>" + decodedDeleteComment + "</div>", "");
            dto.setComments(comments);
            boolean updateSuccess = dao.updatePost(dto);

            if (updateSuccess) {
                response.sendRedirect("detail.jsp?num=" + num);
                return;
            }
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 상세보기</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }
        .header {
            border-bottom: 2px solid #333;
            margin-bottom: 20px;
            padding-bottom: 10px;
        }
        .header h1 {
            margin: 0;
            font-size: 24px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th {
            background-color: #333;
            color: #fff;
            text-align: left;
            padding: 10px;
        }
        td {
            padding: 10px;
            text-align: left;
        }
        .content {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            box-sizing: border-box;
            background-color: #f9f9f9;
            margin-bottom: 20px;
        }
        .footer {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .footer div {
            flex: 1;
            padding: 10px;
            border: 1px solid #ddd;
            box-sizing: border-box;
            text-align: center;
        }
        .button-group {
            text-align: center;
            margin-top: 20px;
        }
        .button-group input {
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            margin: 0 10px;
            transition: background-color 0.3s;
        }
        .button-group .recommend-button {
            background-color: #2196F3;
            color: #fff;
        }
        .button-group .recommend-button:hover {
            background-color: #0b7dda;
        }
        .button-group .disrecommend-button {
            background-color: #9e9e9e;
            color: #fff;
        }
        .button-group .disrecommend-button:hover {
            background-color: #757575;
        }
        .comment-section {
            margin-top: 20px;
        }
        .comment-section textarea {
            width: calc(100% - 22px);
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }
        .comment-section button {
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            background-color: #2196F3;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .comment-section button:hover {
            background-color: #0b7dda;
        }
        .comment-section .comment {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 10px;
            background-color: #f9f9f9;
        }
        .comment-section .comment a {
            color: #e74c3c;
            text-decoration: none;
        }
        .comment-section .comment a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="header">
        <h1>게시물 상세보기</h1>
    </div>
    
    <table>
        <tr>
            <th>제목</th>
            <td><%=dto.getTitle() %></td>
        </tr>
        <tr>
            <th>작성일시</th>
            <td><%=dto.getRegtime() %></td>
        </tr>
    </table>

    <div class="content">
        <%=dto.getContent() %>
    </div>

    <div class="footer">
        <div>추천수: <%=dto.getRecommend() %></div>
        <div>비추천수: <%=dto.getDisrecommend() %></div>
    </div>

    <div class="button-group">
        <form action="detail.jsp" method="post" style="display:inline;">
            <input type="hidden" name="num" value="<%=dto.getNum()%>">
            <input type="hidden" name="type" value="like">
            <input type="submit" class="recommend-button" value="추천">
        </form>
        <form action="detail.jsp" method="post" style="display:inline;">
            <input type="hidden" name="num" value="<%=dto.getNum()%>">
            <input type="hidden" name="type" value="dislike">
            <input type="submit" class="disrecommend-button" value="비추천">
        </form>
        <input type="button" value="목록보기" onclick="location.href='list.jsp'">
        <input type="button" value="수정" onclick="location.href='write2.jsp?num=<%=dto.getNum()%>'">
        <input type="button" value="삭제" onclick="location.href='delete.jsp?num=<%=dto.getNum()%>'">
    </div>

    <div class="comment-section">
        <h3>댓글</h3>
        <form method="post" action="detail.jsp">
            <textarea name="newComment" rows="4" placeholder="댓글을 입력하세요..."></textarea>
            <input type="hidden" name="num" value="<%=dto.getNum()%>">
            <button type="submit">댓글 추가</button>
        </form>
        <div>
            <% 
                String comments = dto.getComments();
                if (comments != null && !comments.isEmpty()) {
                    String[] commentArray = comments.split("</div>");
                    for (String comment : commentArray) {
                        if (!comment.trim().isEmpty()) {
                            comment = comment.trim() + "</div>";
                            out.println("<div class='comment'>" + comment + 
                                "<form action='detail.jsp' method='post' style='display:inline;'>"
                                + "<input type='hidden' name='num' value='" + dto.getNum() + "'>"
                                + "<input type='hidden' name='deleteComment' value='" + 
                                URLEncoder.encode(comment.replace("<div>", "").replace("</div>", ""), "UTF-8") + "'>"
                                + "<button type='submit' style='background:none; border:none; color:#e74c3c; cursor:pointer;'>삭제</button>"
                                + "</form></div>");
                        }
                    }
                }
            %>
        </div>
    </div>
</div>

</body>
</html>
