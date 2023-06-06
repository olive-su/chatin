<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>My CS Interviewer | Articles</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="../styles/index.css" rel="stylesheet" type="text/css">
  <script type="text/javascript">
    function tooltipHover() {
      document.getElementById('tooltipContent').style.visibility = "visible";
    }

    function tooltipLeave() {
      document.getElementById('tooltipContent').style.visibility = "hidden";
    }
  </script>
</head>
<body>
<jsp:include page="../components/navbar.jsp" flush="false">
  <jsp:param name="selected" value="1"/>
</jsp:include>
<jsp:useBean id="dateBean" scope="request" class="java.util.Date"/>


<div class="mx-20 mt-40 container mb-24 px-40 md:mx-auto">
  <div class="w-full mb-8">
    <img class="rounded-lg" src="assets/article-banner.png" alt="article-banner"/>
  </div>
  <h5 class="mb-4 text-3xl font-bold tracking-tight text-gray-900 dark:text-white">
    <div class="flex justify-between">
        <span class="flex gap-2 text-white px-2">

            <svg fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24"
                 xmlns="http://www.w3.org/2000/svg" aria-hidden="true" width="40" height="40">
            <path stroke-linecap="round" stroke-linejoin="round"
                  d="M12 7.5h1.5m-1.5 3h1.5m-7.5 3h7.5m-7.5 3h7.5m3-9h3.375c.621 0 1.125.504 1.125 1.125V18a2.25 2.25 0 01-2.25 2.25M16.5 7.5V18a2.25 2.25 0 002.25 2.25M16.5 7.5V4.875c0-.621-.504-1.125-1.125-1.125H4.125C3.504 3.75 3 4.254 3 4.875V18a2.25 2.25 0 002.25 2.25h13.5M6 7.5h3v3H6v-3z"></path>
        </svg>
            <%= dateBean.getMonth() + 1%>월 <%= dateBean.getDate() %>일 따끈따끈 IT 소식
        </span>
      <div class="flex">
        <div id="tooltipContent" role="tooltip" style="visibility:hidden"
             class="p-3 mb-2 text-sm font-medium text-white transition-opacity duration-300 bg-gray-900 rounded-lg shadow-sm tooltip dark:bg-gray-700">
          해당 콘텐츠는 'GeekNews - 개발/기술/스타트업 뉴스 서비스'의 위클리 랭킹입니다!
          <div class="tooltip-arrow" data-popper-arrow></div>
        </div>
        <a id="tooltipButton"
           class="focus:ring-4 focus:outline-none focus:ring-blue-300 text-sm px-5 py-2.5 text-center"
           onmouseover={tooltipHover()} onmouseleave={tooltipLeave()}>
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="rgb(255, 255, 255)" class="w-8 h-8">
            <path stroke-linecap="round" stroke-linejoin="round" d="M11.25 11.25l.041-.02a.75.75 0 011.063.852l-.708 2.836a.75.75 0 001.063.853l.041-.021M21 12a9 9 0 11-18 0 9 9 0 0118 0zm-9-3.75h.008v.008H12V8.25z" />
          </svg>
        </a>
      </div>
    </div>
    <div class="md:w-auto md:h-1.5 box-decoration-slice bg-gradient-to-r from-indigo-600 to-pink-500 ">
    </div>
  </h5>
  <jsp:include page="crawling.jsp" flush="false"/>
  <div>
    <h5 class="mb-4 text-3xl font-bold tracking-tight text-gray-900 dark:text-white">
        <span class="flex gap-2 box-decoration-slice bg-gradient-to-r from-indigo-600 to-pink-500 text-white px-2 ...">
        <svg fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"
             aria-hidden="true" width="40" height="40">
            <path stroke-linecap="round" stroke-linejoin="round"
                  d="M13.19 8.688a4.5 4.5 0 011.242 7.244l-4.5 4.5a4.5 4.5 0 01-6.364-6.364l1.757-1.757m13.35-.622l1.757-1.757a4.5 4.5 0 00-6.364-6.364l-4.5 4.5a4.5 4.5 0 001.242 7.244"></path>
        </svg>
            면접 질문 리스트
        </span>
    </h5>
    <ul class="ml-8 list-image-github">
      <a href="https://github.com/ksundong/backend-interview-question#backend-interview-question">
        <li class="text-2xl text-gray-900 underline underline-offset-2 dark:text-white">
          Backend-Interview-Question
        </li>
      </a>
      <a href="https://github.com/VSFe/Tech-Interview">
        <li class="text-2xl text-gray-900 underline underline-offset-2 dark:text-white">Tech-Interview</li>
      </a>
      <a href="https://github.com/WooVictory/Ready-For-Tech-Interview">
        <li class="text-2xl text-gray-900 underline underline-offset-2 dark:text-white">
          Ready-For-Tech-Interview
        </li>
      </a>
      <a href="https://github.com/JaeYeopHan/Interview_Question_for_Beginner">
        <li class="text-2xl text-gray-900 underline underline-offset-2 dark:text-white">
          Interview_Question_for_Beginner
        </li>
      </a>
    </ul>
  </div>
</div>


<jsp:include page="../components/footer.jsp" flush="false"/>
</body>
</html>
