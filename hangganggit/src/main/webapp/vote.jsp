<%@page import="PostDTO_DAO.PostDAO"%>
<%@page import="java.io.IOException"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String numStr = request.getParameter("num");
    String type = request.getParameter("type");

    if (numStr == null || type == null) {
        response.sendRedirect("list.jsp");
        return;
    }

    int num = Integer.parseInt(numStr);
    PostDAO dao = new PostDAO();

    boolean success = false;
    if (type.equals("like")) {
        success = dao.incrementRecommend(num);
    } else if (type.equals("dislike")) {
        success = dao.incrementDisrecommend(num);
    }

    if (success) {
        response.sendRedirect("detail.jsp?num=" + num);
    } else {
        response.sendRedirect("list.jsp");
    }
%>
