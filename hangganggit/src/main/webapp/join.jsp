<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 처리</title>
</head>
<body>

<%
    request.setCharacterEncoding("utf-8");

    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String role = "user";  // 고정된 역할 값

    Class.forName("com.mysql.cj.jdbc.Driver");

    try ( 
        Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3307/spring5fs", "root", "mysql");
        PreparedStatement checkStmt = conn.prepareStatement("SELECT * FROM HG_user_table WHERE id = ?");
        PreparedStatement insertStmt = conn.prepareStatement(
            "INSERT INTO HG_user_table (id, pw, name, role, email) VALUES (?, ?, ?, ?, ?)")
    ) {
        // 아이디 중복 체크
        checkStmt.setString(1, id);
        ResultSet rs = checkStmt.executeQuery();

        if (rs.next()) {   
            // 이미 있는 아이디이면 오류 표시
%>
            <script>
                alert('이미 등록된 아이디입니다.');
                window.location.href = 'join_form .jsp';
            </script>
<%          
        } else {           
            // 새로운 회원정보를 DB에 추가
            insertStmt.setString(1, id);
            insertStmt.setString(2, pw);
            insertStmt.setString(3, name);
            insertStmt.setString(4, role);
            insertStmt.setString(5, email);
            insertStmt.executeUpdate();
%>
            <script>
                alert('가입이 완료되었습니다.');
                window.location.href = 'login_main.jsp';
            </script>
<%          
        }
    } catch(Exception e) {
        e.printStackTrace();
%>
        <script>
            alert('회원가입 처리 중 오류가 발생했습니다.');
            history.back();
        </script>
<%
    }
%>

</body>
</html>
