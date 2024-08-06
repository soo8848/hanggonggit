<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 작성</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #2e2e2e;
            color: #e0e0e0;
            text-align: center;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            background-color: #3a3a3a;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            padding: 20px;
        }
        h1 {
            color: white;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid #555;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #444;
            color: #e0e0e0;
        }
        input[type="text"], textarea {
            width: calc(100% - 22px);
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #666;
            border-radius: 4px;
            background-color: #555;
            color: #e0e0e0;
        }
        textarea {
            resize: vertical;
        }
        .button {
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin: 5px;
        }
        .button:hover {
            background-color: #0056b3;
        }
        .cancel-button {
            background-color: #666;
        }
        .cancel-button:hover {
            background-color: #444;
        }
        .form-container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>게시물 작성</h1>
    <form method="post" action="insert.jsp">
        <div class="form-container">
            <table>
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="title" maxlength="80" value=""></td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td><input type="text" name="writer" maxlength="20" value=""></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td><textarea name="content" rows="10"></textarea></td>
                </tr>
            </table>
            <input type="submit" class="button" value="저장">
            <input type="button" class="button cancel-button" value="취소" onclick="history.back()">
        </div>
    </form>
</div>

</body>
</html>
