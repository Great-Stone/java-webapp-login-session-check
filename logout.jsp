<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    // 세션 객체 가져오기
    HttpSession currentSession = request.getSession();
    
    // 세션 무효화
    currentSession.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logout</title>
</head>
<body>
    <h1>Logout Successful</h1>
    <p>You have been successfully logged out.</p>
    <a href="login.jsp">Login Again</a>
</body>
</html>
