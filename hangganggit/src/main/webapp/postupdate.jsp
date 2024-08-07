<%@page import="PostDTO_DAO.PostDTO"%>
<%@page import="PostDTO_DAO.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");

    // 파라미터 가져오기
    String numStr = request.getParameter("num");
    String title = request.getParameter("title");
    String writer = request.getParameter("writer");
    String content = request.getParameter("content");
    String comments = request.getParameter("comments"); // 댓글 추가
    String type = request.getParameter("type"); // 타입 추가

    // numStr이 null이거나 비어있으면 예외 처리
    if (numStr == null || numStr.isEmpty()) {
        response.sendRedirect("list.jsp");
        return;
    }

    int num = Integer.parseInt(numStr);

    // PostDAO와 PostDTO 객체 생성
    PostDAO dao = new PostDAO();
    // regtime은 null로 설정
    PostDTO dto = new PostDTO(num, writer, title, content, null, 0, 0, 0, comments, type);

    // 게시물 업데이트
    boolean updateSuccess = dao.updatePost(dto);

    if (updateSuccess) {
        response.sendRedirect("list.jsp");
    } else {
        out.println("업데이트 실패");
    }
%>
