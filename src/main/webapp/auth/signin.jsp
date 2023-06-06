<%--
  Created by IntelliJ IDEA.
  User: sugyeong
  Date: 2023/05/07
  Time: 3:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html xml:lang>
<head>
    <title>My CS Interviewer | Sign In</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="../styles/index.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/daisyui@2.51.6/dist/full.css" rel="stylesheet" type="text/css"/>
    <style>
        :root{
            background-color: #272a3b;
        }
    </style>
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

    <section class="bg-gray-50 dark:bg-gray-900">
        <div class="items-center p-10 mx-auto max-w-screen-xl lg:py-12 grid lg:grid-cols-2 gap-8 lg:gap-16">
            <div class="flex flex-col items-center">
                <img class="pb-8 h-auto w-72 mxy-auto transition-all duration-300 rounded-lg cursor-pointer filter hover:grayscale-0"
                     src="https://i.guim.co.uk/img/media/54473a6bbec3abc8a550cb6f03f175afdec7b1b8/0_267_5035_3021/master/5035.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=5f89d851b3d196a04f1d2ee07c1e55d6"
                     alt="chatgpt">
                <h1 class="mb-4 text-3xl font-extrabold tracking-tight leading-none text-gray-900 md:text-4xl lg:text-5xl dark:text-white">
                    로그인하고 <br> ChatGPT와 <br> 면접을 진행해보세요!</h1>
                <p class="mb-6 text-lg font-normal text-gray-500 lg:text-xl dark:text-gray-400">개발자의 기술면접 도우미,
                    CHATIN</p>
                </a>
            </div>

            <div class="flex flex-col justify-center w-full h-full py-4 space-y-12 sm:p-8 bg-white rounded-lg shadow-xl dark:bg-gray-800">
                <h2 class="text-2xl font-bold text-gray-900 dark:text-white">
                    로그인
                </h2>
                <form class="mt-8 space-y-6" action="signin_process.jsp">
                    <div>
                        <label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                            이메일</label>
                        <input type="email" name="email" id="email"
                               class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                               placeholder="name@email.com" required>
                    </div>
                    <div>
                        <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                            비밀번호</label>
                        <input type="password" name="password" id="password" placeholder="••••••••"
                               class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                               required>
                    </div>
                    <div class="flex justify-center">
                        <button type="submit"
                                class="inline-flex items-center justify-center p-0.5 mb-2 mr-2 overflow-hidden text-sm font-medium text-gray-900 rounded-lg group bg-gradient-to-br from-purple-500 to-pink-500 group-hover:from-purple-500 group-hover:to-pink-500 hover:text-white dark:text-white focus:ring-4 focus:outline-none focus:ring-purple-200 dark:focus:ring-purple-800">
                          <span class="relative px-5 py-2.5 transition-all ease-in duration-75 bg-white dark:bg-gray-900 rounded-md group-hover:bg-opacity-0">
                              로그인
                          </span>
                        </button>
                    </div>
                    <div class="flex justify-end text-sm font-medium text-gray-900 dark:text-white">
                        아직 회원이 아니신가요?
                        <a class="pl-5 text-blue-600 hover:underline dark:text-blue-500" href="signup.jsp">회원가입</a>
                    </div>
                </form>
            </div>

        </div>
    </section>

</div>

<jsp:include page="../components/footer.jsp" flush="false"/>
</body>
</html>
