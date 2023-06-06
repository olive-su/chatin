<%@ page import="news.News" %>
<%@ page import="java.util.LinkedList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="src/main/webapp/styles/index.css" rel="stylesheet" type="text/css">
</head>
<body>
    <jsp:useBean id="crawling" scope="application" class="utils.Crawling" />
    <div class="md:grid gap-6 pb-12">
        <%
            crawling.createCrawling();
            LinkedList<News> crawlingData = crawling.getData();
            for (int i = 0; i < 5; i++){
                News article = crawlingData.get(i);
                out.println("<a href=\"" + article.getUrl() + "\" class=\"flex flex-col items-center bg-white border border-gray-200 rounded-lg shadow md:flex-row md:max-w-auto hover:bg-gray-100 dark:border-gray-700 dark:bg-gray-700 dark:hover:bg-gray-900\">");
                out.println("<div class=\"flex flex-col justify-between p-4 leading-normal\">");
                out.println("<h5 class=\"mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white\">"+ article.getTitle() +"</h5>");
                out.println("<p class=\"mb-3 font-normal text-gray-700 dark:text-gray-400\">" + article.getContent() + "</p>");
                out.println("</div>");
                out.println("</a>");
            }
        %>
        <a type="button"
           class="text-gray-900 hover:text-white border border-gray-800 hover:bg-gray-900 focus:ring-4 focus:outline-none focus:ring-gray-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center mr-2 mb-2 dark:border-gray-600 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-600 dark:focus:ring-gray-800"
            href="https://news.hada.io/">
            더 많은 소식 보러가기(Link to GeekNews)
        </a>
    </div>
</body>
</html>
