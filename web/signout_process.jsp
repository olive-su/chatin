<%--
  Created by IntelliJ IDEA.
  User: sugyeong
  Date: 2023/06/02
  Time: 9:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    session.removeAttribute("email");
    response.sendRedirect("index.jsp");
%>
</body>
</html>
