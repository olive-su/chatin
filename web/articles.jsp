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
    <title>My CS Interviewer | Articles</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    listStyleImage: {
                        github: 'url("assets/github.png")',
                    },
                    colors: {
                        clifford: '#da373d',
                    }
                }
            }
        }
    </script>
    <style>
        body {
            background-color: #272a3b;
        }
    </style>
</head>
<body>
<jsp:include page="components/navbar.jsp" flush="false">
    <jsp:param name="selected" value="1"/>
</jsp:include>


<div class="mx-40 mt-40 mb-24">
<%--    <jsp:include page = "components/card.jsp" />--%>
<%--    <jsp:include page = "components/card.jsp" />--%>
<%--    <jsp:include page = "components/card.jsp" />--%>
<%--    <jsp:include page = "components/card.jsp" />--%>
<%--    <jsp:include page = "components/card.jsp" />--%>
    <h5 class="mb-4 text-3xl font-bold tracking-tight text-gray-900 dark:text-white">
        <span class="flex gap-2 box-decoration-slice bg-gradient-to-r from-indigo-600 to-pink-500 text-white px-2 ...">
        <svg fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" width="40" height="40">
            <path stroke-linecap="round" stroke-linejoin="round" d="M12 7.5h1.5m-1.5 3h1.5m-7.5 3h7.5m-7.5 3h7.5m3-9h3.375c.621 0 1.125.504 1.125 1.125V18a2.25 2.25 0 01-2.25 2.25M16.5 7.5V18a2.25 2.25 0 002.25 2.25M16.5 7.5V4.875c0-.621-.504-1.125-1.125-1.125H4.125C3.504 3.75 3 4.254 3 4.875V18a2.25 2.25 0 002.25 2.25h13.5M6 7.5h3v3H6v-3z"></path>
        </svg>
            5월 첫째주 주요 IT 아티클
        </span>
    </h5>
    <div class="md:grid gap-4 grid-cols-2 grid-rows-2">
    <a href="https://www.deeplearning.ai/short-courses/chatgpt-prompt-engineering-for-developers/" class="flex flex-col items-center bg-white border border-gray-200 rounded-lg shadow md:flex-row md:max-w-xl hover:bg-gray-100 dark:border-gray-700 dark:bg-gray-800 dark:hover:bg-gray-700">
        <img class="object-cover w-full rounded-t-lg h-96 md:h-auto md:w-48 md:rounded-none md:rounded-l-lg" src="https://www.deeplearning.ai/_next/image/?url=%2F_next%2Fstatic%2Fmedia%2FopenAI.b84b2b22.png&w=384&q=90" alt="">
        <div class="flex flex-col justify-between p-4 leading-normal">
            <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">개발자를 위한 ChatGPT 프롬프트 엔지니어링</h5>
            <p class="mb-3 font-normal text-gray-700 dark:text-gray-400">OpenAI와 Andrew Ng이 같이 만든 약 1.5 시간짜리 짧은 강의로 당분간 무료 공개</p>
        </div>
    </a>
    <a href="https://fleuret.org/public/lbdl.pdf" class="flex flex-col items-center bg-white border border-gray-200 rounded-lg shadow md:flex-row md:max-w-xl hover:bg-gray-100 dark:border-gray-700 dark:bg-gray-800 dark:hover:bg-gray-700">>
        <img class="object-cover w-full rounded-t-lg h-96 md:h-auto md:w-48 md:rounded-none md:rounded-l-lg" src="assets/not-found.jpg" alt="">
        <div class="flex flex-col justify-between p-4 leading-normal">
            <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">Little Book of Deep Learning [143p PDF]</h5>
            <p class="mb-3 font-normal text-gray-700 dark:text-gray-400">작은(Little) 모바일 기기의 화면에서 읽기 좋게 편집된 François Fleure 교수의 딥러닝 기초 서적</p>
        </div>
    </a>
    </div>
    <div>
        <h5 class="mb-4 text-3xl font-bold tracking-tight text-gray-900 dark:text-white">
        <span class="flex gap-2 box-decoration-slice bg-gradient-to-r from-indigo-600 to-pink-500 text-white px-2 ...">
        <svg fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" width="40" height="40">
            <path stroke-linecap="round" stroke-linejoin="round" d="M13.19 8.688a4.5 4.5 0 011.242 7.244l-4.5 4.5a4.5 4.5 0 01-6.364-6.364l1.757-1.757m13.35-.622l1.757-1.757a4.5 4.5 0 00-6.364-6.364l-4.5 4.5a4.5 4.5 0 001.242 7.244"></path>
        </svg>
            면접 질문 리스트
        </span>
        </h5>
        <ul class="ml-8 list-image-github">
            <a href="https://github.com/ksundong/backend-interview-question#backend-interview-question">
                <li class="text-2xl text-gray-900 underline underline-offset-2 dark:text-white">Backend-Interview-Question</li>
            </a>
            <a href="https://github.com/VSFe/Tech-Interview">
                <li class="text-2xl text-gray-900 underline underline-offset-2 dark:text-white">Tech-Interview</li>
            </a>
            <a href="https://github.com/WooVictory/Ready-For-Tech-Interview">
                <li class="text-2xl text-gray-900 underline underline-offset-2 dark:text-white">Ready-For-Tech-Interview</li>
            </a>
            <a href="https://github.com/JaeYeopHan/Interview_Question_for_Beginner">
                <li class="text-2xl text-gray-900 underline underline-offset-2 dark:text-white">Interview_Question_for_Beginner</li>
            </a>
        </ul>
    </div>
</div>


<jsp:include page="components/footer.jsp" flush="false"/>
</body>
</html>
