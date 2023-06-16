package servlet;

import db.db;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.parser.ParseException;
import post.Post;
import utils.MyLogger;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet(name = "PostServlet", value = "/servlet/PostServlet")
public class PostServlet extends HttpServlet {
    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String communityIdParam = request.getParameter("postId");
        System.out.println(communityIdParam);

        MyLogger logger = new MyLogger();
        try{
            Post data = loadPost(communityIdParam);
            response.setCharacterEncoding("UTF-8");
            PrintWriter pw = response.getWriter();

            pw.println("<html>");
            pw.println("<head>");
            pw.println("<title></title>");
            pw.println("</head>");
            pw.println("<body>");
            pw.println("<div class=\"w-full rounded-lg bg-gray-50 dark:bg-gray-900\">");
            pw.println("  <div class=\"px-8 pt-8\">");
            pw.println("    <img class=\"rounded-lg\" src=\"/assets/community-banner2.png\" alt=\"community-banner\"/>");
            pw.println("  </div>");
            pw.println("    <div class=\"flex flex-col items-end max-w-screen-xl lg:pt-12 mx-32 \">");
            pw.println("      <a class=\"block mb-2 text-sm font-medium text-gray-900 dark:text-white\"> 작성일시 <span class=\"pl-2\">" + data.getCalcDate() + "</span> </a>");
            pw.println("      <a class=\"block mb-2 text-sm font-medium text-gray-900 dark:text-white\"> 작성자 <span class=\"pl-2\">" + data.getNickname() + "</span> </a>");
            pw.println("    </div>");
            pw.println("  <div class=\"flex flex-col items-center p-10 mx-auto max-w-screen-xl lg:py-12 gap-8\">");
            pw.println("    <div class=\"mb-6 w-5/6\">");
            pw.println("      <h3 class=\"block mb-2 text-lg font-medium text-gray-900 dark:text-white\">제목</h3>");
            pw.println("      <p class=\"bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500\">" + data.getTitle() + "</p>");
            pw.println("    </div>");
            pw.println("    <div class=\"mb-6 w-5/6\">");
            pw.println("      <h3 class=\"font-semibold mb-2 text-gray-900 dark:text-white\"> 카테고리 </h3>");
            pw.println("      <ul class=\"items-center w-full text-sm font-medium text-gray-900 bg-white border border-gray-200 rounded-lg sm:flex dark:bg-gray-700 dark:border-gray-600 dark:text-white\">");
            pw.println("        <li class=\"w-full border-b border-gray-200 sm:border-b-0 sm:border-r dark:border-gray-600\">");
            pw.println("          <div class=\"flex items-center pl-3\">");
            pw.println("            <span class=\"w-full py-3 ml-2 text-sm font-medium text-gray-900 dark:text-gray-300\">"+ data.getCategory() + "</span>");
            pw.println("          </div>");
            pw.println("        </li>");
            pw.println("      </ul>");
            pw.println("    </div>");
            pw.println("    <div class=\"mb-6 w-5/6\">");
            pw.println("      <h3 class=\"block mb-2 text-lg font-medium text-gray-900 dark:text-white\">내용</h3>");
            pw.println("      <p class=\"bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500\">" + data.getContent() + "</p>");
            pw.println("    </div>");
            pw.println("    <div class=\"flex justify-center\">");
            pw.println("      <a href=\"/community/free.jsp\">");
            pw.println("<button type=\"button\"");
            pw.println("class=\"relative inline-flex items-center  justify-center p-0.5 mb-2 mr-2 overflow-hidden text-sm font-medium text-gray-900 rounded-lg group bg-gradient-to-br from-purple-500 to-pink-500 group-hover:from-purple-500 group-hover:to-pink-500 hover:text-white dark:text-white focus:ring-4 focus:outline-none focus:ring-purple-200 dark:focus:ring-purple-800\">");
            pw.println("<span class=\"relative px-5 py-2.5 transition-all ease-in duration-75 bg-white dark:bg-gray-900 rounded-md group-hover:bg-opacity-0\">");
            pw.println("게시글 목록");
            pw.println("        </span>");
            pw.println("        </button>");
            pw.println("</a>");
            pw.println("</div>");
            pw.println("</div>");
            pw.println("</div>");
            pw.println("</body>");
            pw.println("</html>");
        } catch (Exception e){
            logger.servere("Faliure Load Post Datas");
        }
    }

    Post loadPost(String communityId) throws SQLException, IOException, ParseException {
        db database = new db();
        Connection conn = database.getConnection();
        Statement sm = conn.createStatement();
        MyLogger logger = new MyLogger();

        String sql = "SELECT * FROM `community` WHERE communityid='" + communityId + "';";

        ResultSet resultSet = sm.executeQuery(sql);

        JSONArray jsonArray = new JSONArray();

        Post jsonPost = new Post();
        while (resultSet.next()) {
            jsonPost.setCommunityId(resultSet.getString("communityid"));
            jsonPost.setTitle(resultSet.getString("title"));
            jsonPost.setContent(resultSet.getString("content"));
            jsonPost.setCategory(resultSet.getString("category"));
            jsonPost.setNickname(resultSet.getString("nickname"));
            jsonPost.setCreatedDate(resultSet.getString("create_date"));
        }

        sm.close();
        conn.close();
        logger.info("Posts retrieved by category: " + communityId);

        return jsonPost;
    }


    public void destroy() {
    }
}