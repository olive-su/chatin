<%--
  Created by IntelliJ IDEA.
  User: sugyeong
  Date: 2023/05/07
  Time: 3:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="chatgpt" scope="request" class="api.chatgpt" />

<!DOCTYPE html>
<html xml:lang>
<head>
    <title>My CS Interviewer | Sign Up</title>
    <%--    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.5/flowbite.min.css" rel="stylesheet" />--%>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@2.51.6/dist/full.css" rel="stylesheet" type="text/css" />
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        clifford: '#da373d',
                    }
                }
            }
        }
    </script>
    <style>
        :root {
            background-color: #272a3b;
        }
        body {
            background-color: #272a3b;
        }
    </style>
</head>
<body>
<jsp:include page="components/navbar.jsp" flush="false">
    <jsp:param name="selected" value="4"/>
</jsp:include>
<%
    if(session.getAttribute("email") != null)
        session.removeAttribute("email"); // 세션 초기화
%>

<div class="mx-20 mt-40 container mb-24 px-40 md:mx-auto">

    <section class="bg-gray-50 dark:bg-gray-900">
        <div class="py-8 px-4 mx-auto max-w-screen-xl lg:py-16 grid lg:grid-cols-2 gap-8 lg:gap-16">
            <div class="flex flex-col justify-center">
                <h1 class="mb-4 text-3xl font-extrabold tracking-tight leading-none text-gray-900 md:text-4xl lg:text-5xl dark:text-white">로그인하고 <br> ChatGPT와 <br> 면접을 진행해보세요!</h1>
                <p class="mb-6 text-lg font-normal text-gray-500 lg:text-xl dark:text-gray-400">개발자의 기술면접 도우미, CHATIN</p>
                </a>
            </div>
            <div>
                <div class="w-full lg:max-w-xl p-6 space-y-8 sm:p-8 bg-white rounded-lg shadow-xl dark:bg-gray-800">
                    <h2 class="text-2xl font-bold text-gray-900 dark:text-white">
                        로그인
                    </h2>
                    <form class="mt-8 space-y-6" action="signin_process.jsp">
                        <div>
                            <label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your email</label>
                            <input type="email" name="email" id="email" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="name@email.com" required>
                        </div>
                        <div>
                            <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your password</label>
                            <input type="password" name="password" id="password" placeholder="••••••••" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" required>
                        </div>
<%--                        <div class="flex items-start">--%>
<%--                            <div class="flex items-center h-5">--%>
<%--                                <input id="remember" aria-describedby="remember" name="remember" type="checkbox" class="w-4 h-4 border-gray-300 rounded bg-gray-50 focus:ring-3 focus:ring-blue-300 dark:focus:ring-blue-600 dark:ring-offset-gray-800 dark:bg-gray-700 dark:border-gray-600" required>--%>
<%--                            </div>--%>
<%--                            <div class="ml-3 text-sm">--%>
<%--                                <label for="remember" class="font-medium text-gray-500 dark:text-gray-400">Remember this device</label>--%>
<%--                            </div>--%>
<%--                            <a href="#" class="ml-auto text-sm font-medium text-blue-600 hover:underline dark:text-blue-500">Lost Password?</a>--%>
<%--                        </div>--%>
                        <button type="submit" class="w-full px-5 py-3 text-base font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 sm:w-auto dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" onClick={}>Login</button>
                        <div class="text-sm font-medium text-gray-900 dark:text-white">
                            아직 회원이 아니신가요? <a class="text-blue-600 hover:underline dark:text-blue-500">회원가입</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

</div>

<jsp:include page="components/footer.jsp" flush="false"/>
</body>
</html>
