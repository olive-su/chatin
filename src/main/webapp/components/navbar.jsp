<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="src/main/webapp/styles/index.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
    String navBarOn = "hidden";
    String selecteMenuStyle = "block py-2 pl-3 pr-4 text-white bg-purple-700 rounded md:bg-transparent md:text-purple-700 md:p-0 md:dark:text-purple-400";
    String defaultMenuStyle = "block py-2 pl-3 pr-4 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-purple-700 md:p-0 md:dark:hover:text-purple-400 dark:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700";

    Integer currentMenu = Integer.parseInt(request.getParameter("selected"));
    String[] menuStyles = new String[5];
    for (int i = 0; i < menuStyles.length; i++) {
        menuStyles[i] = defaultMenuStyle;
    }
    menuStyles[currentMenu] = selecteMenuStyle;

%>

<nav class="bg-white dark:bg-gray-900 fixed w-full z-20 top-0 left-0 p-2 border-b border-gray-200 dark:border-gray-600">
    <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4">
        <a href="/" class="flex items-center">
            <img src="../assets/logo_white.png" class="h-14" alt="Flowbite Logo">
            <%--                <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">My CS Interviewer</span>--%>
        </a>
        <div class="flex md:order-2">
            <%
                String userEmail = (String) session.getAttribute("email");
                if (userEmail == null){
                    out.println("<a href=\"/auth/signin.jsp\"><button type=\"button\" class=\"relative inline-flex items-center justify-center p-0.5 mb-2 mr-2 overflow-hidden text-sm font-medium text-gray-900 rounded-lg group bg-gradient-to-br from-purple-500 to-pink-500 group-hover:from-purple-500 group-hover:to-pink-500 hover:text-white dark:text-white focus:ring-4 focus:outline-none focus:ring-purple-200 dark:focus:ring-purple-800\">\n" +
                            " <span class=\"relative px-5 py-2.5 transition-all ease-in duration-75 bg-white dark:bg-gray-900 rounded-md group-hover:bg-opacity-0\">" +
                            "                    Login\n" +
                            " </span>" +
                            "                </button></a>\n" +
                            "                <button data-collapse-toggle=\"navbar-sticky\" type=\"button\" class=\"inline-flex items-center p-2 text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600\" aria-controls=\"navbar-sticky\"\n" +
                            "                        aria-expanded=\"true\">\n" +
                            "                    <svg class=\"w-6 h-6\" aria-hidden=\"true\" fill=\"currentColor\" viewBox=\"0 0 20 20\" xmlns=\"http://www.w3.org/2000/svg\"><path fill-rule=\"evenodd\" d=\"M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z\" clip-rule=\"evenodd\"></path></svg>\n" +
                            "                </button>");
                } else {
                    out.println("<a href=\"/chat.jsp\"><button type=\"button\" class=\"relative inline-flex items-center justify-center p-0.5 mb-2 mr-2 overflow-hidden text-sm font-medium text-gray-900 rounded-lg group bg-gradient-to-br from-purple-500 to-pink-500 group-hover:from-purple-500 group-hover:to-pink-500 hover:text-white dark:text-white focus:ring-4 focus:outline-none focus:ring-purple-200 dark:focus:ring-purple-800\">\n" +
                            " <span class=\"relative px-5 py-2.5 transition-all ease-in duration-75 bg-white dark:bg-gray-900 rounded-md group-hover:bg-opacity-0\">" +
                            "                    GPT Interview\n" +
                            " </span>" +
                            "                </button></a>\n" +
                            "<a href=\"auth/signout_process.jsp\"><button type=\"button\" class=\"relative inline-flex items-center justify-center p-0.5 mb-2 mr-2 overflow-hidden text-sm font-medium text-gray-900 rounded-lg group bg-gradient-to-br from-purple-500 to-pink-500 group-hover:from-purple-500 group-hover:to-pink-500 hover:text-white dark:text-white focus:ring-4 focus:outline-none focus:ring-purple-200 dark:focus:ring-purple-800\">\n" +
                            " <span class=\"relative px-5 py-2.5 transition-all ease-in duration-75 bg-white dark:bg-gray-900 rounded-md group-hover:bg-opacity-0\">" +
                            "                    Logout\n" +
                            " </span>" +
                            "                </button></a>\n" +
                            "                <button data-collapse-toggle=\"navbar-sticky\" type=\"button\" class=\"inline-flex items-center p-2 text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600\" aria-controls=\"navbar-sticky\"\n" +
                            "                        aria-expanded=\"true\">\n" +
                            "                    <svg class=\"w-6 h-6\" aria-hidden=\"true\" fill=\"currentColor\" viewBox=\"0 0 20 20\" xmlns=\"http://www.w3.org/2000/svg\"><path fill-rule=\"evenodd\" d=\"M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z\" clip-rule=\"evenodd\"></path></svg>\n" +
                            "                </button>");
                }
            %>
        </div>

        <div class="items-center justify-between hidden w-full md:flex md:w-auto md:order-1" id="navbar-sticky">
            <ul class="flex flex-col p-4 md:p-0 mt-4 font-medium border border-gray-100 rounded-lg bg-gray-50 md:flex-row md:space-x-8 md:mt-0 md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700">
                <li>
                    <a href="/index.jsp" class="<%= menuStyles[0] %>">Home</a>
                </li>
                <li>
                    <a href="/articles.jsp" class="<%= menuStyles[1] %>" >Articles</a>
                </li>
                <li>
                    <a href="/community.jsp" class="<%= menuStyles[2] %>">Community</a>
                </li>
                <li>
                    <%
                        userEmail = (String) session.getAttribute("email");
                        if (userEmail != null){
                            out.println(
                                    "<a href=\"/mypage.jsp\" class=\"" +
                                            menuStyles[3] +"\">"+
                                            "My Page </a>");
                        }
                    %>
                </li>
            </ul>
        </div>
    </div>
    <div class="md:hidden <%= navBarOn %> w-full">
        <ul class="flex flex-col font-medium mt-4 rounded-lg bg-gray-50 dark:bg-gray-800 dark:border-gray-700">
            <li>
                <a href="#" class="block py-2 pl-3 pr-4 text-white bg-blue-700 rounded dark:bg-blue-600" aria-current="page">Home</a>
            </li>
            <li>
                <a href="#" class="block py-2 pl-3 pr-4 text-gray-900 rounded hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">Services</a>
            </li>
            <li>
                <a href="#" class="block py-2 pl-3 pr-4 text-gray-900 rounded hover:bg-gray-100 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white">Pricing</a>
            </li>
            <li>
                <a href="#" class="block py-2 pl-3 pr-4 text-gray-900 rounded hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">Contact</a>
            </li>
        </ul>
    </div>
</nav>
</body>
</html>
