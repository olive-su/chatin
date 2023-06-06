<%--
  Created by IntelliJ IDEA.
  User: sugyeong
  Date: 2023/05/10
  Time: 12:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My CS Interviewer | Community</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="../styles/index.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../components/navbar.jsp" flush="false">
    <jsp:param name="selected" value="2"/>
</jsp:include>
<div class="mx-20 mt-40 container mb-24 px-40 md:mx-auto">
    <div class="w-full mb-8">
        <img class="rounded-lg" src="/assets/community-banner.png" alt="community-banner"/>
    </div>
    <div class="text-m font-medium text-center text-gray-500 border-b border-gray-200 dark:text-gray-400 dark:border-gray-700">
        <ul class="flex flex-wrap -mb-px">
            <li class="mr-2">
                <a href="free.jsp"
                   class="inline-block p-4 text-gray-100 border-b-2 border-purple-600 rounded-t-lg active dark:text-gray-100 dark:border-purple-500">자유</a>
            </li>
            <li class="mr-2">
                <a href="review.jsp"
                   class="inline-block p-4 border-b-2 border-transparent rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300">면접
                    후기</a>
            </li>
            <li class="mr-2">
                <a href="tip.jsp"
                   class="inline-block p-4 border-b-2 border-transparent rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300">면접
                    꿀팁</a>
            </li>
            <li class="mr-2">
                <a href="study.jsp"
                   class="inline-block p-4 border-b-2 border-transparent rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300">스터디</a>
            </li>
        </ul>
    </div>

    <div class="flex justify-end py-3 ">
        <button type="button"
                class="flex items-center text-white bg-purple-700 hover:bg-purple-800 focus:outline-none focus:ring-4 focus:ring-purple-300 font-medium rounded-full text-sm px-5 py-2.5 text-center mb-2 dark:bg-purple-600 dark:hover:bg-purple-700 dark:focus:ring-purple-900">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                 stroke="rgb(255,255,255)" class="w-4 h-4">
                <path stroke-linecap="round" stroke-linejoin="round"
                      d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652 2.652L6.832 19.82a4.5 4.5 0 01-1.897 1.13l-2.685.8.8-2.685a4.5 4.5 0 011.13-1.897L16.863 4.487zm0 0L19.5 7.125"/>
            </svg>
            <span class="ml-2">새 글 쓰기</span>
        </button>
    </div>
    <div class="w-full rounded-lg overflow-hidden">

        <a href="#"
           class="w-full block p-6 bg-white border-y border-gray-200 shadow hover:bg-gray-100 dark:bg-gray-800 dark:border-gray-700 dark:hover:bg-gray-700">
            <h5 class="mb-2 text-xl font-bold tracking-tight text-gray-900 dark:text-white">메모 제목 1</h5>
            <p class="text-sm font-normal text-gray-700 dark:text-gray-400">메모 내용 1</p>
            <div class="flex justify-end gap-2 text-gray-400">
                <div class="flex">
                    <svg xmlns="http://www.w3.org/2000/svg" style="width: 24px; height: 24px" fill="none"
                         viewBox="0 0 24 24" strokeWidth={1.5}
                         stroke="currentColor">
                        <path strokeLinecap="round" strokeLinejoin="round"
                              d="M17.982 18.725A7.488 7.488 0 0012 15.75a7.488 7.488 0 00-5.982 2.975m11.963 0a9 9 0 10-11.963 0m11.963 0A8.966 8.966 0 0112 21a8.966 8.966 0 01-5.982-2.275M15 9.75a3 3 0 11-6 0 3 3 0 016 0z"/>
                    </svg>
                    <span>
                        글자수테스트테스트테스트
                    </span>
                </div>
                <span> | </span>
                <div class="flex">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                         stroke="currentColor" class="w-6 h-6">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              d="M12 6v6h4.5m4.5 0a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                    <span>
                        150일전
                    </span>
                </div>
            </div>
        </a>
        <a href="#"
           class="w-full block p-6 bg-white border-y border-gray-200 shadow hover:bg-gray-100 dark:bg-gray-800 dark:border-gray-700 dark:hover:bg-gray-700">
            <h5 class="mb-2 text-xl font-bold tracking-tight text-gray-900 dark:text-white">메모 제목 1</h5>
            <p class="font-normal text-gray-700 dark:text-gray-400">메모 내용 1</p>
        </a>
    </div>

</div>

<%--<div id="markdownEditor"></div>--%>
<jsp:include page="../components/footer.jsp" flush="false"/>
</body>
</html>
