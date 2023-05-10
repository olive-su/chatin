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
    <title>My CS Interviewer</title>
<%--    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.5/flowbite.min.css" rel="stylesheet" />--%>
    <script src="https://cdn.tailwindcss.com"></script>
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
      body {
        background-color: #272a3b;
      }
    </style>
  </head>
  <body>
  <jsp:include page="components/navbar.jsp" flush="false">
    <jsp:param name="selected" value="0"/>
  </jsp:include>
  <div class="mx-40 mt-40 mb-24 flex justify-center">
    <div>
      <p class="my-4 flex justify-center font-bold text-2xl text-sky-200"> <a class="underline decoration-indigo-500">ChatGPT</a>로 인터뷰 연습하기 </p>
      <img class="h-auto max-w-lg mxy-auto transition-all duration-300 rounded-lg cursor-pointer filter hover:grayscale-0" src="https://i.guim.co.uk/img/media/54473a6bbec3abc8a550cb6f03f175afdec7b1b8/0_267_5035_3021/master/5035.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=5f89d851b3d196a04f1d2ee07c1e55d6" alt="chatgpt">
    </div>
  </div>
  <jsp:include page="components/footer.jsp" flush="false"/>
  </body>
</html>
