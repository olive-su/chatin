<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CHATIN | Community</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="../styles/index.css" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../components/navbar.jsp" flush="false">
    <jsp:param name="selected" value="2"/>
</jsp:include>

<jsp:useBean id="post" scope="application" class="post.Post"/>
<div class="mx-20 mt-40 container px-40 md:mx-auto">
    <jsp:include page="/servlet/PostServlet" flush="false">
        <jsp:param name="postId" value="<%= request.getParameter(\"postId\") %>" />
    </jsp:include>
</div>
<jsp:include page="../components/footer.jsp" flush="false"/>
</body>
</html>
