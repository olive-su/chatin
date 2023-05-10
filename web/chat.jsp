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
    <title>My CS Interviewer | Chat</title>
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
        body {
            background-color: #272a3b;
        }
    </style>
</head>
<body>
<jsp:include page="components/navbar.jsp" flush="false">
    <jsp:param name="selected" value="4"/>
</jsp:include>

<div class="mx-40 mt-40 mb-24 container px-40 md:mx-auto">

    <div class="h-screen px-20 pt-20 md:mx-auto rounded-lg ">
        <%-- 말풍선 들어갈 자리--%>
        <div class="h-5/6 bg-slate-400 rounded-lg ">
            <div class="chat chat-start p-4">
                <div class="chat-bubble">여러 가지 질문을 준비했습니다. 준비가 되면 바로 시작해봅시다.

                    컴퓨터 프로그램에서 변수란 무엇인가요?
                    객체 지향 프로그래밍에서 상속이란 무엇인가요?
                    데이터베이스에서 JOIN이란 무엇인가요?
                    HTTP와 HTTPS의 차이점은 무엇인가요?
                    네트워크에서 OSI 모델은 무엇이고, 이 중 몇 번째 계층이 전송 계층이며 어떤 역할을 하는지 설명해주세요.
                    답변을 듣고 평가와 꼬리질문을 진행할게요.

                    간단한 설명만으로도 괜찮으니, 부담 갖지 마시고 대답해주시면 됩니다!</div>
            </div>
            <div class="chat chat-end p-4">
                <div class="chat-bubble">변수는 변할 수 있는 값을 담을 수 있는 데이터의 자료형으로, 코드가 실행되는 중간에 값이 변해야할 때 사용합니다.</div>
            </div>

            <div class="chat chat-start p-4">
                <div class="chat-bubble">
                    좋아요, 이해가 되었습니다. 8점을 주겠습니다. 그리고 추가적인 꼬리질문을 드릴게요. 변수에는 어떤 종류가 있고, 그 종류들의 차이점은 무엇인가요? 예를 들어볼까요?</div>
            </div>
            <div class="chat chat-end p-4">
                <div class="chat-bubble">변수의 종류라고 한다면 정확히 어떤걸 말씀하시는 걸까요?
                </div>
            </div>
        </div>
        <form>
            <label for="chat" class="sr-only">Your message</label>
            <div class="flex items-center px-3 py-2 rounded-lg bg-gray-50 dark:bg-gray-700">
                <button type="button"
                        class="inline-flex justify-center p-2 text-gray-500 rounded-lg cursor-pointer hover:text-gray-900 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-600">
                    <svg aria-hidden="true" class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20"
                         xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                              d="M4 3a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V5a2 2 0 00-2-2H4zm12 12H4l4-8 3 6 2-4 3 6z"
                              clip-rule="evenodd"></path>
                    </svg>
                    <span class="sr-only">Upload image</span>
                </button>
                <button type="button"
                        class="p-2 text-gray-500 rounded-lg cursor-pointer hover:text-gray-900 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-600">
                    <svg aria-hidden="true" class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20"
                         xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                              d="M10 18a8 8 0 100-16 8 8 0 000 16zM7 9a1 1 0 100-2 1 1 0 000 2zm7-1a1 1 0 11-2 0 1 1 0 012 0zm-.464 5.535a1 1 0 10-1.415-1.414 3 3 0 01-4.242 0 1 1 0 00-1.415 1.414 5 5 0 007.072 0z"
                              clip-rule="evenodd"></path>
                    </svg>
                    <span class="sr-only">Add emoji</span>
                </button>
                <textarea id="chat" rows="1"
                          class="block mx-4 p-2.5 w-full text-sm text-gray-900 bg-white rounded-lg border border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-800 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                          placeholder="Your message..."></textarea>
                <button type="submit"
                        class="inline-flex justify-center p-2 text-blue-600 rounded-full cursor-pointer hover:bg-blue-100 dark:text-blue-500 dark:hover:bg-gray-600">
                    <svg aria-hidden="true" class="w-6 h-6 rotate-90" fill="currentColor" viewBox="0 0 20 20"
                         xmlns="http://www.w3.org/2000/svg">
                        <path d="M10.894 2.553a1 1 0 00-1.788 0l-7 14a1 1 0 001.169 1.409l5-1.429A1 1 0 009 15.571V11a1 1 0 112 0v4.571a1 1 0 00.725.962l5 1.428a1 1 0 001.17-1.408l-7-14z"></path>
                    </svg>
                    <span class="sr-only">Send message</span>
                </button>
            </div>
        </form>
    </div>

</div>
<jsp:include page="components/footer.jsp" flush="false"/>
</body>
</html>
