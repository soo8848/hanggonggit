<%@page import="PostDTO_DAO.PostDTO"%>
<%@page import="PostDTO_DAO.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");

    String title = request.getParameter("title");
    String writer = request.getParameter("writer");
    String content = request.getParameter("content");

    java.util.Date now = new java.util.Date();
    java.sql.Timestamp regtime = new java.sql.Timestamp(now.getTime());

    PostDTO dto = new PostDTO(0, writer, title, content, regtime, 0, 0, 0, null, null);
    PostDAO dao = new PostDAO();

    dao.insertPost(dto);

    response.sendRedirect("list.jsp");
%>
