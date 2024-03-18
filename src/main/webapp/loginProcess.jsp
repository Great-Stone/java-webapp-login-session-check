<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Objects" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="jakarta.servlet.ServletException" %>
<%@ page import="java.io.IOException" %>

<%
    // 가상의 사용자 데이터베이스(Map) 생성
    Map<String, String> userDatabase = new HashMap<>();
    userDatabase.put("user1", "password1");
    userDatabase.put("user2", "password2");

    // 세션 객체 가져오기
    HttpSession currentSession = request.getSession();

    // 사용자가 제출한 로그인 데이터 가져오기
    String submittedUsername = request.getParameter("username");
    String submittedPassword = request.getParameter("password");

    // 로그인 검증
    if (submittedUsername != null && submittedPassword != null && userDatabase.containsKey(submittedUsername) && Objects.equals(userDatabase.get(submittedUsername), submittedPassword)) {
        // 올바른 사용자인 경우 세션에 사용자 정보 저장
        currentSession.setAttribute("username", submittedUsername);
        response.sendRedirect("welcome.jsp"); // welcome.jsp로 리다이렉트
    } else {
        // 올바르지 않은 사용자인 경우 에러 메시지 출력
        response.setContentType("text/html");
        PrintWriter writer = response.getWriter();
        writer.println("<h1>Invalid username or password. Please try again.</h1>");
    }
%>
