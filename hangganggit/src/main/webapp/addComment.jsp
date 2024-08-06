<%@page import="PostDTO_DAO.PostDAO"%>
<%@page import="PostDTO_DAO.PostDTO"%>
<%@page import="java.io.IOException"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String comment = request.getParameter("comment");
    String postIdStr = request.getParameter("postId");

    if (comment == null || comment.isEmpty() || postIdStr == null || postIdStr.isEmpty()) {
        response.sendRedirect("list.jsp");
        return;
    }

    int postId = Integer.parseInt(postIdStr);
    PostDAO dao = new PostDAO();
    PostDTO dto = dao.getOne(postId);
    if (dto == null) {
        response.sendRedirect("list.jsp");
        return;
    }

    String existingComments = dto.getComments();
    String newComments = (existingComments == null ? "" : existingComments) + "<div>" + comment + "</div>";
    dto.setComments(newComments);
    boolean success = dao.updatePost2(dto);

    if (success) {
        response.sendRedirect("detail.jsp?num=" + postId);
    } else {
        response.sendRedirect("list.jsp");
    }
%>
