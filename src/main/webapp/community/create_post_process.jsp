<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="community" scope="application" class="utils.community" />
<jsp:useBean id="post" scope="request" class="post.Post" />
<jsp:setProperty name="post" property="title" value="${param.title}" />
<jsp:setProperty name="post" property="category" value="${param.category}" />
<jsp:setProperty name="post" property="content" value="${param.content}" />

<%
    post.setNickname((String) session.getAttribute("nickname"));
    try{
        if (community.createPost(post) != true) {
            response.sendRedirect("/community.jsp");
        }
    } catch (Exception e){
        System.out.println(e);
    }
%>
<html>
<head>
    <title>CHATIN | Sign Up Error</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="../styles/index.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
        function modalClose(){
            location.replace("/community/free.jsp");
        }
    </script>
</head>
<body>
<div class="relative z-30" aria-labelledby="modal-title" role="dialog" aria-modal="true">

    <div class="fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity"></div>

    <div class="fixed inset-0 z-10 overflow-y-auto">
        <div class="flex min-h-full items-end justify-center p-4 text-center sm:items-center sm:p-0">
            <div class="relative transform overflow-hidden rounded-lg bg-white text-left shadow-xl transition-all sm:my-8 sm:w-full sm:max-w-lg">
                <div class="bg-white px-4 pb-4 pt-5 sm:p-6 sm:pb-4">
                    <div class="sm:flex sm:items-start">
                        <div class="mx-auto flex h-12 w-12 flex-shrink-0 items-center justify-center rounded-full bg-blue-100 sm:mx-0 sm:h-10 sm:w-10">
                            <svg class="h-10 w-10 text-blue-800" fill="currentColor" viewBox="0 0 20 20" aria-hidden="true">
                                <path fill-rule="evenodd"  d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"></path>
                            </svg>
                        </div>
                        <div class="mt-3 text-center sm:ml-4 sm:mt-0 sm:text-left">
                            <h3 class="text-base font-semibold leading-6 text-gray-900" id="modal-title">정상적으로 글을 업로드했습니다!</h3>
                        </div>
                    </div>
                </div>
                <div class="bg-gray-50 px-4 py-3 sm:flex sm:flex-row-reverse sm:px-6">
                    <button type="button" class="mt-3 inline-flex w-full justify-center rounded-md bg-white px-3 py-2 text-sm font-semibold text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50 sm:mt-0 sm:w-auto" onClick={modalClose()}>다른 글 보러가기</button>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="create_post.jsp" flush="false"/>
</body>
</html>
