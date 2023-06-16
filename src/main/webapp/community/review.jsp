<%@ page import="org.json.simple.JSONObject" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="post" scope="request" class="post.Post" />

<html>
<head>
    <title>CHATIN | Community</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="../styles/index.css" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
    </script>
</head>
<body>
<jsp:include page="../components/navbar.jsp" flush="false">
    <jsp:param name="selected" value="2"/>
</jsp:include>
<div class="mx-20 mt-40 container px-40 md:mx-auto">
    <div class="w-full mb-8">
        <img class="rounded-lg" src="/assets/community-banner.png" alt="community-banner"/>
    </div>
    <div class="text-m font-medium text-center text-gray-500 border-b border-gray-200 dark:text-gray-400 dark:border-gray-700">
        <ul class="flex flex-wrap -mb-px">
            <li class="mr-2">
                <a href="/community/free.jsp"
                   class="inline-block p-4 border-b-2 border-transparent rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300">자유</a>
            </li>
            <li class="mr-2">
                <a href="/community/review.jsp"
                   class="inline-block p-4 text-gray-100 border-b-2 border-purple-600 rounded-t-lg active dark:text-gray-100 dark:border-purple-500">면접
                    후기</a>
            </li>
            <li class="mr-2">
                <a href="/community/tip.jsp"
                   class="inline-block p-4 border-b-2 border-transparent rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300">면접
                    꿀팁</a>
            </li>
            <li class="mr-2">
                <a href="/community/study.jsp"
                   class="inline-block p-4 border-b-2 border-transparent rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300">스터디 모집</a>
            </li>
        </ul>
    </div>

    <div id="content_section" class="w-full rounded-lg overflow-hidden">
        <div>
        <jsp:include page="/servlet/CommunityServlet" flush="true">
            <jsp:param name="category" value="면접 후기"/>
        </jsp:include>
        </div>
    </div>
    <div class="flex justify-end py-10 ">
        <a href="/community/create_post.jsp">
            <button type="button"
                    class="flex items-center text-white bg-purple-700 hover:bg-purple-800 focus:outline-none focus:ring-4 focus:ring-purple-300 font-medium rounded-full text-sm px-5 py-2.5 text-center mb-2 dark:bg-purple-600 dark:hover:bg-purple-700 dark:focus:ring-purple-900">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                     stroke="rgb(255,255,255)" class="w-4 h-4">
                    <path stroke-linecap="round" stroke-linejoin="round"
                          d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652 2.652L6.832 19.82a4.5 4.5 0 01-1.897 1.13l-2.685.8.8-2.685a4.5 4.5 0 011.13-1.897L16.863 4.487zm0 0L19.5 7.125"/>
                </svg>
                <span class="ml-2">새 글 쓰기</span>
            </button>
        </a>
    </div>
</div>

<jsp:include page="../components/footer.jsp" flush="true"/>
</body>
</html>
