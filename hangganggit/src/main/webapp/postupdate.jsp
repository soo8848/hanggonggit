<%@page import="PostDTO_DAO.PostDAO"%>
<%@page import="PostDTO_DAO.PostDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String num = request.getParameter("num");
String title = request.getParameter("title");
String writer = request.getParameter("writer");
String content = request.getParameter("content");
PostDAO dao = new PostDAO();
PostDTO dto = new PostDTO(
        Integer.parseInt(num), 
        writer,               
        title,                  
        content,         
        null,                 
        0,        
        0,                     
        0,                    
        ""                     
    );
response.sendRedirect("list.jsp");
%>    