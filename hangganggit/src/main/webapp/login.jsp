<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>

<%
    // JDBC 드라이버 로드
    Class.forName("com.mysql.cj.jdbc.Driver");
    
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");

    try ( 
        Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3307/spring5fs", "root", "mysql");
        PreparedStatement stmt = conn.prepareStatement(
                "SELECT * FROM HG_user_table WHERE id = ? AND pw = ?");
    ) {
        stmt.setString(1, id);
        stmt.setString(2, pw);
        
        // 로그인 정보를 확인하는 쿼리
        ResultSet rs = stmt.executeQuery();
        
        // 로그인 정보가 일치하면 세션 속성을 설정하고, list.jsp로 이동
        if (rs.next()) {
            session.setAttribute("userId",   rs.getString("id"));
            session.setAttribute("userName", rs.getString("name"));
            session.setAttribute("userRole", rs.getString("role")); 
            
            response.sendRedirect("list.jsp");   
            return;
        }
        
    } catch(Exception e) {
        e.printStackTrace();
    }
%>

<script>
    alert('아이디 또는 비밀번호가 틀립니다!');
    window.location.href = 'login_main.jsp';
</script>
 
</body>
</html>
