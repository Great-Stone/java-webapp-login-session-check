<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.util.concurrent.TimeUnit" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.lang.management.ManagementFactory" %>
<%@ page import="java.net.InetAddress" %>

<%
    // 세션 객체 가져오기
    HttpSession currentSession = request.getSession();
    
    // 세션에서 사용자 이름 가져오기
    String username = (String) currentSession.getAttribute("username");

    // 세션의 남은 시간 계산
    long currentTime = System.currentTimeMillis();
    long lastAccessTime = currentSession.getLastAccessedTime();
    int maxInactiveInterval = currentSession.getMaxInactiveInterval();
    long elapsedTimeInSeconds = TimeUnit.MILLISECONDS.toSeconds(currentTime - lastAccessTime);
    long remainingTimeInSeconds = maxInactiveInterval - elapsedTimeInSeconds;

    // username이 null이면 login 페이지로 이동
    if (username == null) {
        response.sendRedirect("login.jsp");
    }

    // Tomcat 서버 정보 가져오기
    String javaVersion = System.getProperty("java.version");
    String hostname = InetAddress.getLocalHost().getHostName();
    String ipAddress = InetAddress.getLocalHost().getHostAddress();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
    <script>
        // 초기 남은 시간 설정
        var remainingTime = <%= remainingTimeInSeconds %>;
    
        // 남은 시간을 갱신하는 함수
        function updateRemainingTime() {
            remainingTime--;
            document.getElementById("remainingTime").innerText = remainingTime;

            // remainingTime이 0이 되면 logout 페이지로 이동
            if (remainingTime === 0) {
                window.location.href = "logout.jsp";
            }
        }
    
        // 1초마다 updateRemainingTime 함수 실행
        setInterval(updateRemainingTime, 1000);
    </script>  
</head>
<body>
    <h1>Welcome <%= username %>!</h1>
    <p>This is a protected page. Only logged-in users can access it.</p>
    <a href="logout.jsp">Logout</a>
    
    <h2>Session Information</h2>
    <table>
        <tr>
            <th>Session ID</th>
            <td><%= currentSession.getId() %></td>
        </tr>
        <tr>
            <th>Creation Time</th>
            <td><%= new java.util.Date(currentSession.getCreationTime()) %></td>
        </tr>
        <tr>
            <th>Max Inactive Interval (seconds)</th>
            <td><%= maxInactiveInterval %></td>
        </tr>
        <tr>
            <th>Remaining Time (seconds)</th>
            <td id="remainingTime"><%= remainingTimeInSeconds %></td>
        </tr>
    </table>

    <h2>Server Information</h2>
    <table>
        <tr>
            <th>Java Version</th>
            <td><%= javaVersion %></td>
        </tr>
        <tr>
            <th>Hostname</th>
            <td><%= hostname %></td>
        </tr>
        <tr>
            <th>IP Address</th>
            <td><%= ipAddress %></td>
        </tr>
    </table>
</body>
</html>
