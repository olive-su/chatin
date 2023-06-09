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
<div class="mx-20 mt-40 container px-40 md:mx-auto">
    <section class="bg-gray-50 dark:bg-gray-900 rounded-lg">
        <div class="px-8 pt-8">
            <img class="rounded-lg" src="/assets/community-banner2.png" alt="community-banner"/>
        </div>
        <form action="create_post_process.jsp" method="post">
            <div class="flex flex-col items-center p-10 mx-auto max-w-screen-xl lg:py-12 gap-8">
                <div class="mb-6 w-5/6">
                    <label for="title" class="block mb-2 text-lg font-medium text-gray-900 dark:text-white">제목</label>
                    <input type="text" id="title"
                           name="title"
                           placeholder="제목을 입력해주세요."
                           class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                </div>

                <div class="mb-6 w-5/6">
                    <h3 class="font-semibold text-gray-900 dark:text-white">카테고리</h3>
                    <p id="helper-radio-text" class="my-2 text-xs font-normal text-purple-500 dark:text-purple-300">적절한
                        카테고리를 선택해주세요.</p>
                    <ul class="items-center w-full text-sm font-medium text-gray-900 bg-white border border-gray-200 rounded-lg sm:flex dark:bg-gray-700 dark:border-gray-600 dark:text-white">
                        <li class="w-full border-b border-gray-200 sm:border-b-0 sm:border-r dark:border-gray-600">
                            <div class="flex items-center pl-3">
                                <input checked id="horizontal-list-radio-free" type="radio" value="자유"
                                       name="category"
                                       class="w-4 h-4 text-purple-600 bg-gray-100 border-gray-300 focus:ring-purple-500 dark:focus:ring-purple-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                                <label for="horizontal-list-radio-free"
                                       class="w-full py-3 ml-2 text-sm font-medium text-gray-900 dark:text-gray-300">자유</label>
                            </div>
                        </li>
                        <li class="w-full border-b border-gray-200 sm:border-b-0 sm:border-r dark:border-gray-600">
                            <div class="flex items-center pl-3">
                                <input id="horizontal-list-radio-review" type="radio" value="면접 후기" name="category"
                                       class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-700 dark:focus:ring-offset-gray-700 focus:ring-2 dark:bg-gray-600 dark:border-gray-500">
                                <label for="horizontal-list-radio-review"
                                       class="w-full py-3 ml-2 text-sm font-medium text-gray-900 dark:text-gray-300">면접
                                    후기</label>
                            </div>
                        </li>
                        <li class="w-full border-b border-gray-200 sm:border-b-0 sm:border-r dark:border-gray-600">
                            <div class="flex items-center pl-3">
                                <input id="horizontal-list-radio-tip" type="radio" value="면접 꿀팁" name="category"
                                       class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-700 dark:focus:ring-offset-gray-700 focus:ring-2 dark:bg-gray-600 dark:border-gray-500">
                                <label for="horizontal-list-radio-tip"
                                       class="w-full py-3 ml-2 text-sm font-medium text-gray-900 dark:text-gray-300">면접
                                    꿀팁</label>
                            </div>
                        </li>
                        <li class="w-full dark:border-gray-600">
                            <div class="flex items-center pl-3">
                                <input id="horizontal-list-radio-recruit" type="radio" value="스터디 모집" name="category"
                                       class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-700 dark:focus:ring-offset-gray-700 focus:ring-2 dark:bg-gray-600 dark:border-gray-500">
                                <label for="horizontal-list-radio-recruit"
                                       class="w-full py-3 ml-2 text-sm font-medium text-gray-900 dark:text-gray-300">스터디
                                    모집</label>
                            </div>
                        </li>
                    </ul>

                </div>

                <div class="mb-6 w-5/6">
                    <label for="content" class="block mb-2 text-lg font-medium text-gray-900 dark:text-white">내용
                    </label>
                    <textarea id="content" rows="10"
                              name="content"
                              class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                              placeholder="내용을 입력해주세요."></textarea>
                </div>
                <div class="flex justify-center">
                    <button type="submit"
                            id="signupSubmit"
                            class="relative inline-flex items-center justify-center p-0.5 mb-2 mr-2 overflow-hidden text-sm font-medium text-gray-900 rounded-lg group bg-gradient-to-br from-purple-500 to-pink-500 group-hover:from-purple-500 group-hover:to-pink-500 hover:text-white dark:text-white focus:ring-4 focus:outline-none focus:ring-purple-200 dark:focus:ring-purple-800">
                  <span class="relative px-5 py-2.5 transition-all ease-in duration-75 bg-white dark:bg-gray-900 rounded-md group-hover:bg-opacity-0">
                      확인
                  </span>
                    </button>
                    <a href="/community/free.jsp">
                        <button type="button"
                                class="relative inline-flex items-center justify-center p-0.5 mb-2 mr-2 overflow-hidden text-sm font-medium text-gray-900 rounded-lg group bg-gradient-to-br from-purple-500 to-pink-500 group-hover:from-purple-500 group-hover:to-pink-500 hover:text-white dark:text-white focus:ring-4 focus:outline-none focus:ring-purple-200 dark:focus:ring-purple-800">
                  <span class="relative px-5 py-2.5 transition-all ease-in duration-75 bg-white dark:bg-gray-900 rounded-md group-hover:bg-opacity-0">
                      게시글 목록
                  </span>
                        </button>
                    </a>
                </div>
            </div>
        </form>
    </section>

</div>
<jsp:include page="../components/footer.jsp" flush="false"/>
</body>
</html>
