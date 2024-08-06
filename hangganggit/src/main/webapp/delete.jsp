
<%@page import="PostDTO_DAO.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String num = request.getParameter("num");
PostDAO dao = new PostDAO();
dao.deletePost(Integer.parseInt(num));
response.sendRedirect("list.jsp");
%>    
