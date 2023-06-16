<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="post" scope="request" class="post.Post" />
<jsp:setProperty name="post" property="communityId" value="${param.communityId}" />
<jsp:setProperty name="post" property="title" value="${param.title}" />
<jsp:setProperty name="post" property="category" value="${param.category}" />
<jsp:setProperty name="post" property="content" value="${param.content}" />
<jsp:setProperty name="post" property="nickname" value="${param.nickname}" />
<jsp:setProperty name="post" property="createdDate" value="${param.createdDate}" />

<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="w-full rounded-lg overflow-hidden">
    <a href="/community/post.jsp?postId=<%= post.getCommunityId() %>"
       class="w-full block p-6 bg-white border-y border-gray-200 shadow hover:bg-gray-100 dark:bg-gray-800 dark:border-gray-700 dark:hover:bg-gray-700">
        <h5 class="mb-2 text-xl font-bold tracking-tight text-gray-900 dark:text-white">
            <%= post.getTitle() %>
        </h5>
        <p class="text-sm font-normal text-gray-700 dark:text-gray-400">
            <%= post.getContent() %>
        </p>
        <div class="flex justify-end gap-2 text-gray-400">
            <div class="flex">
                <svg xmlns="http://www.w3.org/2000/svg" style="width: 24px; height: 24px" fill="none"
                     viewBox="0 0 24 24" strokeWidth={1.5}
                     stroke="currentColor">
                    <path strokeLinecap="round" strokeLinejoin="round"
                          d="M17.982 18.725A7.488 7.488 0 0012 15.75a7.488 7.488 0 00-5.982 2.975m11.963 0a9 9 0 10-11.963 0m11.963 0A8.966 8.966 0 0112 21a8.966 8.966 0 01-5.982-2.275M15 9.75a3 3 0 11-6 0 3 3 0 016 0z"/>
                </svg>
                <span>
                        <%= post.getNickname() %>
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
                        <%= post.getCalcDate() %>일전
                    </span>
            </div>
        </div>
    </a>
</div>
</body>
</html>
