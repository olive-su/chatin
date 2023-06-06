<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="auth" scope="application" class="utils.auth" />
<jsp:useBean id="user" scope="request" class="user.User" />
<jsp:setProperty name="user" property="email" value="${param.email}" />
<jsp:setProperty name="user" property="password" value="${param.password}" />

<html>
<head>
    <title>My CS Interviewer | Sign Up</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="../styles/index.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
        function validateEmail(nickname) {
            const nicknameData = nickname;
<%--            <jsp:setProperty name="user" property="nickname" value="${nicknameData}" />--%>
            console.log("123");
            <%--if (<%=  %> === true){--%>

            <%--}--%>
        }
    </script>

</head>
<body>
<jsp:include page="../components/navbar.jsp" flush="false">
    <jsp:param name="selected" value="4"/>
</jsp:include>
<%
    if (session.getAttribute("email") != null)
        session.removeAttribute("email"); // 세션 초기화
%>

<div class="mx-20 mt-40 container mb-24 px-40 md:mx-auto">
    <div class="w-full h-auto py-4 space-y-12 sm:p-8 bg-white rounded-lg shadow-xl dark:bg-gray-800">
        <h2 class="text-2xl font-bold text-gray-900 dark:text-white">
            회원가입
        </h2>
        <form class="mt-8 space-y-6" action="signup_process.jsp">
            <div>
                <label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">이메일
                    <span class="text-red-400">*</span>
                </label>
                <form class="flex justify-between" action="signup_process.jsp">
                    <input type="email" name="email" id="email"
                           class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-5/6 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                           placeholder="name@email.com" required>
                    <button type="submit"
                            class="focus:outline-none text-white bg-purple-700 hover:bg-purple-800 focus:ring-4 focus:ring-purple-300 font-medium rounded-lg text-sm px-5 py-2.5 mb-2 dark:bg-purple-600 dark:hover:bg-purple-700 dark:focus:ring-purple-900">
                        이메일 중복 확인
                    </button>
                </form>
            </div>
            <div>
                <label for="nickname" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">닉네임
                    <span class="text-red-400">*</span>
                </label>
                <div class="flex justify-between">
                <input type="text" name="nickname" id="nickname"
                       class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-5/6 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                       placeholder="chatin" required>
                <button type="button"
                        class="focus:outline-none text-white bg-purple-700 hover:bg-purple-800 focus:ring-4 focus:ring-purple-300 font-medium rounded-lg text-sm px-5 py-2.5 mb-2 dark:bg-purple-600 dark:hover:bg-purple-700 dark:focus:ring-purple-900">
                    닉네임 중복 확인
                </button>
                </div>
            </div>
            <div>
                <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">비밀번호
                    <span class="text-red-400">*</span>
                </label>
                <input type="password" name="password" id="password" placeholder="••••••••"
                       class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                       required>
            </div>
            <div>
                <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">비밀번호 확인
                    <span class="text-red-400">*</span>
                </label>
                <input type="password" name="password" id="repeat_password" placeholder="••••••••"
                       class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                       required>
            </div>
            <div class="flex justify-center">
                <button type="submit"
                        class="relative inline-flex items-center justify-center p-0.5 mb-2 mr-2 overflow-hidden text-sm font-medium text-gray-900 rounded-lg group bg-gradient-to-br from-purple-500 to-pink-500 group-hover:from-purple-500 group-hover:to-pink-500 hover:text-white dark:text-white focus:ring-4 focus:outline-none focus:ring-purple-200 dark:focus:ring-purple-800">
                  <span class="relative px-5 py-2.5 transition-all ease-in duration-75 bg-white dark:bg-gray-900 rounded-md group-hover:bg-opacity-0">
                      확인
                  </span>
                </button>
                <a href="signin.jsp"
                        class="relative inline-flex items-center justify-center p-0.5 mb-2 mr-2 overflow-hidden text-sm font-medium text-gray-900 rounded-lg group bg-gradient-to-br from-purple-500 to-pink-500 group-hover:from-purple-500 group-hover:to-pink-500 hover:text-white dark:text-white focus:ring-4 focus:outline-none focus:ring-purple-200 dark:focus:ring-purple-800">
                  <span class="relative px-5 py-2.5 transition-all ease-in duration-75 bg-white dark:bg-gray-900 rounded-md group-hover:bg-opacity-0">
                      로그인하러 가기
                  </span>
                </a>
            </div>
        </form>
    </div>
</div>
<jsp:include page="../components/footer.jsp" flush="false"/>
</body>
</html>
