<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html xml:lang>
  <head>
    <title>CHATIN</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="../styles/index.css" rel="stylesheet" type="text/css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&display=swap" rel="stylesheet">
    <style>
      @font-face {
        font-family: 'LeeSeoyun';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2202-2@1.0/LeeSeoyun.woff') format('woff');
        font-weight: normal;
        font-style: normal;
      }

      body {
        height: 6000px;
        background-color: #14151C;
        transition: background-color 0.5s ease-in-out;
      }
      .fade-out {
        background-color: #272a3b;
      }

      :root {
        background-color: #14151C;
      }

      #parallax1{
        top: 40%;
        left: 40%;
        font-size: 90px;
        font-family: 'LeeSeoyun', cursive;
        color: #ccc;
        animation: moveText 2s linear infinite alternate;
      }

      #parallax2{
        top: 60%;
        left: 60%;
        font-size: 70px;
        font-family: 'LeeSeoyun', cursive;
        color: #ccc;
        animation: moveText 2s linear infinite alternate;
      }

      #parallax3{
        top: 50%;
        left: 50%;
        font-size: 80px;
        font-family: 'LeeSeoyun', cursive;
        color: #ccc;
        animation: moveText 2s linear infinite alternate;
      }

      .scroll-text {
        position: fixed;
        transform: translate(-50%, -50%);
        color: white;
        opacity: 0;
        transition: opacity 0.3s ease-in-out;
      }

      @keyframes moveText {
        0% {
          transform: translate(-50%, -50%);
        }
        50% {
          transform: translate(-50%, -60%);
        }
        100% {
          transform: translate(-50%, -50%);
        }
      }

      .show {
        opacity: 1;
      }

      #main {
        position: fixed;
        transform: translate(-50%, -50%);
        top: 55%;
        left: 50%;
        transition: opacity 0.5s ease-in-out;
      }

    </style>
    <script type="text/javascript">
      document.addEventListener('DOMContentLoaded', function() {
        var parallax1 = document.querySelector('#parallax1');
        var parallax2 = document.querySelector('#parallax2');
        var parallax3 = document.querySelector('#parallax3');
        var main = document.querySelector('#main');

        window.addEventListener('scroll', function() {
          var scrollPosition = window.scrollY;
          var windowHeight = window.innerHeight;
          var body = document.body;

          if (scrollPosition < windowHeight){
            parallax1.classList.add('show');
            parallax2.classList.remove('show');
            parallax3.classList.remove('show');
            main.classList.remove('show');
            body.classList.remove('fade-out');
          } else if (scrollPosition > windowHeight && scrollPosition < windowHeight * 2) {
            parallax1.classList.remove('show');
            parallax2.classList.add('show');
            parallax3.classList.remove('show');
            main.classList.remove('show');
            body.classList.remove('fade-out');
          } else if (scrollPosition > windowHeight * 2 && scrollPosition < windowHeight * 4) {
            parallax1.classList.remove('show');
            parallax2.classList.remove('show');
            parallax3.classList.add('show');
            main.classList.remove('show');
            body.classList.remove('fade-out');
          } else {
            parallax1.classList.remove('show');
            parallax2.classList.remove('show');
            parallax3.classList.remove('show');
            body.classList.add('fade-out');
            main.classList.add('show');
          }
        });
      });
    </script>
  </head>
  <body>
  <jsp:include page="../components/navbar.jsp" flush="false">
    <jsp:param name="selected" value="0"/>
  </jsp:include>
  <div class="mx-40 mt-40 mb-24 flex justify-center">
    <div id="parallax1" class="scroll-text">면접 준비 어디서하지?</div>
    <div id="parallax2" class="scroll-text">뭐 부터 해야하지?</div>
    <div id="parallax3" class="scroll-text">누구 같이할 사람 없을까?</div>

  <%--    <div>--%>
<%--      <p class="my-4 flex justify-center font-bold text-2xl text-sky-200"> <a class="underline decoration-indigo-500">ChatGPT</a>로 인터뷰 연습하기 </p>--%>
<%--      <img class="h-auto max-w-lg mxy-auto transition-all duration-300 rounded-lg cursor-pointer filter hover:grayscale-0" src="https://i.guim.co.uk/img/media/54473a6bbec3abc8a550cb6f03f175afdec7b1b8/0_267_5035_3021/master/5035.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=5f89d851b3d196a04f1d2ee07c1e55d6" alt="chatgpt">--%>
<%--    </div>--%>
  </div>
  <div id="main" class="scroll-text">
    <img src="../assets/main-line.png" class="w-full" alt="main-line-image">
    <div class="flex gap-10 mb-24">
      <a href="/articles.jsp">
        <img src="../assets/article-button.png" class="w-auto rounded-lg" alt="articles-button-image">
      </a>
      <a href="/community.jsp">
        <img src="../assets/community-button.png" class="w-auto rounded-lg" alt="community-button-image">
      </a>
      <a href="/chat.jsp">
        <img src="../assets/interview-button.png" class="w-auto rounded-lg" alt="chat-button-image">
      </a>
    </div>
    <jsp:include page="../components/footer.jsp" flush="false"/>
  </div>
  </body>
</html>
