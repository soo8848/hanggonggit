<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
</head>
<body>

<%
    request.setCharacterEncoding("utf-8");

    String userId = (String) session.getAttribute("userId");

    if (userId == null) {
        response.sendRedirect("login.jsp"); 
        return;
    }

    Class.forName("com.mysql.cj.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3307/spring5fs";
    String username = "root";
    String password = "mysql";

    try (
        Connection conn = DriverManager.getConnection(url, username, password);
        PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM HG_user_table WHERE id = ?")
    ) {
        pstmt.setString(1, userId);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
%>
        <form action="member_update.jsp" method="post">
            <table>
                <tr>
                    <td>아이디</td>
                    <td><input type="text" name="id" readonly
                               value="<%= rs.getString("id") %>"></td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td><input type="password" name="pw" 
                               value="<%= rs.getString("pw") %>"></td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td><input type="text" name="name" 
                               value="<%= rs.getString("name") %>"></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td><input type="email" name="email"
                               value="<%= rs.getString("email") %>"></td>
                </tr>
            </table>    
            <input type="submit" value="저장"> 
        </form>
<%
        } else {
            out.println("사용자 정보를 찾을 수 없습니다.");
        }
    } catch (Exception e) {
        e.printStackTrace();
%>
        <script>
            alert('회원 정보 조회 중 오류가 발생했습니다.');
            history.back();
        </script>
<%
    }
%>

</body>
</html>
