<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>CHATIN | Sign Up</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="../styles/index.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
        let nicknameCheck = false;
        let emailCheck = false;
        $(document).ready(function() {
            $("#emailSubmit").click(function() {
                if ($("#emailInput").val()) {
                    $.ajax({
                        url: `/servlet/ValidationEmailServlet`,
                        type: "GET",
                        data: {email: $("#emailInput").val()},
                        success: function (response) {
                            if (response == "0") {
                                document.getElementById('emailInput').className = 'bg-red-50 border border-red-500 text-red-900 placeholder-red-700 text-sm rounded-lg focus:ring-red-500 focus:border-red-500 block w-5/6 p-2.5 dark:bg-red-100 dark:border-red-400';
                                document.getElementById('emailLabel').style.visibility = "visibility";
                                document.getElementById('emailLabel').className = 'mt-2 text-sm text-red-600 dark:text-red-500';
                                document.getElementById('emailLabel').innerText = '이미 존재하는 이메일입니다.';
                                alert("이메일을 다시 입력해주세요.");
                            } else {
                                document.getElementById('emailInput').className = 'bg-green-50 border border-green-500 text-green-900 placeholder-green-700 text-sm rounded-lg focus:ring-green-500 focus:border-green-500 block w-5/6 p-2.5 dark:bg-green-100 dark:border-green-400';
                                document.getElementById('emailInput').disabled = true;
                                document.getElementById('emailInput').readonly = true;
                                document.getElementById('emailLabel').style.visibility = "visibility";
                                document.getElementById('emailLabel').className = 'mt-2 text-sm text-green-600 dark:text-green-500';
                                document.getElementById('emailLabel').innerText = '사용 가능한 이메일입니다.';
                                emailCheck = true;
                            }
                        },
                        error: function (response) {
                            console.log(response);
                        }
                    });
                }
            });
            $("#nicknameSubmit").click(function() {
                if ($("#nicknameInput").val()) {
                    $.ajax({
                        url: `/servlet/ValidationNicknameServlet`,
                        type: "GET",
                        data: {nickname: $("#nicknameInput").val()},
                        success: function (response) {
                            if (response == "0") {
                                document.getElementById('nicknameInput').className = 'bg-red-50 border border-red-500 text-red-900 placeholder-red-700 text-sm rounded-lg focus:ring-red-500 focus:border-red-500 block w-5/6 p-2.5 dark:bg-red-100 dark:border-red-400';
                                document.getElementById('nicknameLabel').style.visibility = "visibility";
                                document.getElementById('nicknameLabel').className = 'mt-2 text-sm text-red-600 dark:text-red-500';
                                document.getElementById('nicknameLabel').innerText = '이미 존재하는 닉네임입니다.';
                                alert("닉네임을 다시 입력해주세요.");
                            } else {
                                document.getElementById('nicknameInput').className = 'bg-green-50 border border-green-500 text-green-900 placeholder-green-700 text-sm rounded-lg focus:ring-green-500 focus:border-green-500 block w-5/6 p-2.5 dark:bg-green-100 dark:border-green-400';
                                document.getElementById('nicknameInput').disabled = true;
                                document.getElementById('nicknameInput').readonly = true;
                                document.getElementById('nicknameLabel').style.visibility = "visibility";
                                document.getElementById('nicknameLabel').className = 'mt-2 text-sm text-green-600 dark:text-green-500';
                                document.getElementById('nicknameLabel').innerText = '사용 가능한 닉네임입니다.';
                                nicknameCheck = true;
                            }
                        },
                        error: function (response) {
                            console.log(response);
                        }
                    });

                }
            });

            $("#signupSubmit").click(function() {
                if (emailCheck && nicknameCheck){
                    let password = $("#passwordInput").val();
                    let repeatPassword = $("#repeatPasswordInput").val();
                    if (password === repeatPassword){
                        if (verifyPassword(password)){
                            document.getElementById('signupForm').onsubmit = "return true;";
                        } else {
                            document.getElementById('passwordLabel').className = 'mt-2 text-sm text-red-600 dark:text-red-500';
                            document.getElementById('passwordLabel').innerText = '숫자와 문자를 포함한 6~12자 이내의 비밀번호를 입력해주세요.';
                        }
                    } else {
                        document.getElementById('repeatPasswordLabel').className = 'mt-2 text-sm text-red-600 dark:text-red-500';
                        document.getElementById('repeatPasswordLabel').innerText = '입력하신 비밀번호와 동일하게 입력해주세요.';
                    }

                } else {
                    if(!emailCheck){
                        document.getElementById('emailInput').className = 'bg-red-50 border border-red-500 text-red-900 placeholder-red-700 text-sm rounded-lg focus:ring-red-500 focus:border-red-500 block w-5/6 p-2.5 dark:bg-red-100 dark:border-red-400';
                        document.getElementById('emailLabel').style.visibility = "visibility";
                        document.getElementById('emailLabel').className = 'mt-2 text-sm text-red-600 dark:text-red-500';
                        document.getElementById('emailLabel').innerText = '이메일을 입력해주세요.';
                    } else if(!nicknameCheck){
                        document.getElementById('nicknameInput').className = 'bg-red-50 border border-red-500 text-red-900 placeholder-red-700 text-sm rounded-lg focus:ring-red-500 focus:border-red-500 block w-5/6 p-2.5 dark:bg-red-100 dark:border-red-400';
                        document.getElementById('nicknameLabel').style.visibility = "visibility";
                        document.getElementById('nicknameLabel').className = 'mt-2 text-sm text-red-600 dark:text-red-500';
                        document.getElementById('nicknameLabel').innerText = '닉네임을 입력해주세요.';
                    }
                }
            });
        });

        function verifyPassword(passwordInput) {
            let regExp = /^[A-Za-z0-9]{6,12}$/;

            if (passwordInput.match(regExp) == null) {
                return false;
            }
            else {
                return true;
            }
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
        <form id="signupForm" class="mt-8 space-y-6" action="signup_process.jsp" onsubmit="return false;" method="get">
            <div>
                <label for="emailInput" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">이메일
                    <span class="text-red-400">*</span>
                </label>
                <div class="flex justify-between">
                    <input type="email" name="email"
                           id="emailInput"
                           class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-5/6 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                           placeholder="name@email.com" required>
                    <button type="button"
                            id="emailSubmit"
                            class="focus:outline-none text-white bg-purple-700 hover:bg-purple-800 focus:ring-4 focus:ring-purple-300 font-medium rounded-lg text-sm px-5 py-2.5 mb-2 dark:bg-purple-600 dark:hover:bg-purple-700 dark:focus:ring-purple-900"
                    >
                        이메일 중복 확인
                    </button>
                </div>
                <p id="emailLabel" class="mt-2 text-sm text-green-600 dark:text-green-500">
                </p>
            </div>
            <div>
                <label for="nicknameInput" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">닉네임
                    <span class="text-red-400">*</span>
                </label>
                <div class="flex justify-between">
                <input type="text" name="nickname"
                       id="nicknameInput"
                       class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-5/6 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                       placeholder="chatin" required>
                <button type="button"
                        id="nicknameSubmit"
                        class="focus:outline-none text-white bg-purple-700 hover:bg-purple-800 focus:ring-4 focus:ring-purple-300 font-medium rounded-lg text-sm px-5 py-2.5 mb-2 dark:bg-purple-600 dark:hover:bg-purple-700 dark:focus:ring-purple-900">
                    닉네임 중복 확인
                </button>
                </div>
                <p id="nicknameLabel" class="mt-2 text-sm text-green-600 dark:text-green-500">
                </p>
            </div>
            <div>
                <label for="passwordInput" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">비밀번호
                    <span class="text-red-400">*</span>
                </label>
                <input type="password" name="password" id="passwordInput" placeholder="••••••••"
                       class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                       required>
                <p id="passwordLabel" class="mt-2 text-sm text-green-600 dark:text-green-500">
                </p>
            </div>
            <div>
                <label for="repeatPasswordInput" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">비밀번호 확인
                    <span class="text-red-400">*</span>
                </label>
                <input type="password" name="repeatPasswordInput" id="repeatPasswordInput" placeholder="••••••••"
                       class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                       required>
                <p id="repeatPasswordLabel" class="mt-2 text-sm text-green-600 dark:text-green-500">
                </p>
            </div>
            <div class="flex justify-center">
                <button type="submit"
                        id="signupSubmit"
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
