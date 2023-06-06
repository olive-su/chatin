<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="auth" scope="application" class="utils.auth" />
<jsp:useBean id="user" scope="request" class="user.User" />
<jsp:setProperty name="user" property="email" value="${param.email}" />
<jsp:setProperty name="user" property="nickname" value="${param.nickname}" />
<jsp:setProperty name="user" property="password" value="${param.password}" />

<%
    try{
        if (auth.SignIn(user) == true) {
        }
        session.setAttribute("email", user.getEmail());
        response.sendRedirect("index.jsp");
    } catch (Exception e){
        System.out.println(e);
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
