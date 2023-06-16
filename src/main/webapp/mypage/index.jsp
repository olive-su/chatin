<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CHATIN | My Page</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="../styles/index.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../components/navbar.jsp" flush="false">
    <jsp:param name="selected" value="3"/>
</jsp:include>
<div class="mx-20 mt-40 container mb-24 px-40 md:mx-auto">
    <div class="w-full mb-8">
        <section class="bg-gray-50 dark:bg-gray-900 rounded-lg">
            <div class="px-10 pt-10">
                <h5 class="mb-4 text-3xl font-bold tracking-tight text-gray-900 dark:text-white">
        <span class="flex gap-2 text-white px-2">
            <svg fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24"
                 xmlns="http://www.w3.org/2000/svg" aria-hidden="true" width="40" height="40">
              <path stroke-linecap="round" stroke-linejoin="round"
                    d="M17.982 18.725A7.488 7.488 0 0012 15.75a7.488 7.488 0 00-5.982 2.975m11.963 0a9 9 0 10-11.963 0m11.963 0A8.966 8.966 0 0112 21a8.966 8.966 0 01-5.982-2.275M15 9.75a3 3 0 11-6 0 3 3 0 016 0z"/>
        </svg>
            내 정보
        </span>
                </h5>
                <div class="md:w-auto md:h-1.5 box-decoration-slice bg-gradient-to-r from-indigo-600 to-pink-500 ">
                </div>
            </div>
            <div class="flex w-full">
                <div class="flex-none px-8 pt-8">
                    <img class="rounded-lg" src="/assets/proflie_default.png" alt="profile-img" width="200px"/>
                </div>
                <form action="update_user_profile.jsp" method="post" class="grow">
                    <div class="flex flex-col items-center p-10 mx-auto max-w-screen-xl lg:py-12 gap-8">
                        <div class="w-full">
                            <label for="nickname" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">닉네임</label>
                            <input disabled
                                   type="text"
                                   id="nickname"
                                   name="nickname"
                                   value="<%= session.getAttribute("nickname") %>"
                                   class="bg-gray-50 border border-gray-300 text-gray-500 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white-500 dark:focus:ring-blue-500 dark:focus:border-blue-500">
                        </div>
                        <div class="w-full">
                            <label for="email"
                                   class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">이메일</label>
                            <input disabled
                                   type="text"
                                   id="email"
                                   name="email"
                                   value="<%= session.getAttribute("email") %>"
                                   class="bg-gray-50 border border-gray-300 text-gray-500 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white-500 dark:focus:ring-blue-500 dark:focus:border-blue-500">
                        </div>
<%--                        <div class="w-full">--%>
<%--                            <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">비밀번호</label>--%>
<%--                            <input disabled--%>
<%--                                   type="text"--%>
<%--                                   id="password"--%>
<%--                                   name="password"--%>
<%--                                   value="비밀번호 들어갈 곳"--%>
<%--                                   class="bg-gray-50 border border-gray-300 text-gray-500 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white-500 dark:focus:ring-blue-500 dark:focus:border-blue-500">--%>
<%--                        </div>--%>
                    </div>
                </form>
            </div>
        </section>

    </div>
</div>
<jsp:include page="../components/footer.jsp" flush="false"/>
</body>
</html>
