package servlet;

import db.db;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import post.Post;
import user.User;
import utils.MyLogger;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet(name = "CommunityServlet", value = "/servlet/CommunityServlet")
public class CommunityServlet extends HttpServlet {
    public void init() {
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response)
                    throws ServletException, IOException {
        String categoryParam = request.getParameter("category");

        MyLogger logger = new MyLogger();
        try{
            JSONArray data = loadPost(categoryParam);
            response.setCharacterEncoding("UTF-8");
            PrintWriter pw = response.getWriter();

            pw.println("<html>");
            pw.println("<head>");
            pw.println("<title></title>");
            pw.println("</head>");
            pw.println("<body>");
            for (Object obj : data){
                Post postObject = (Post) obj;

                pw.println("<div class=\"w-full rounded-lg overflow-hidden\">");
                pw.println("<a href=\"/community/post.jsp?postId=" + postObject.getCommunityId() + "\" class=\"w-full block p-6 bg-white border-y border-gray-200 shadow hover:bg-gray-100 dark:bg-gray-800 dark:border-gray-700 dark:hover:bg-gray-700\">");
                pw.println("<h5 class=\"mb-2 text-xl font-bold tracking-tight text-gray-900 dark:text-white\">");
                pw.println(postObject.getTitle());
                pw.println("</h5>");
                pw.println("<p class=\"text-sm font-normal text-gray-700 dark:text-gray-400\">");
                pw.println(postObject.getContent());
                pw.println("</p>");
                pw.println("<div class=\"flex justify-end gap-2 text-gray-400\">");
                pw.println("<div class=\"flex\">");
                pw.println("<svg xmlns=\"http://www.w3.org/2000/svg\" style=\"width: 24px; height: 24px\" fill=\"none\" viewBox=\"0 0 24 24\" strokeWidth={1.5} stroke=\"currentColor\">");
                pw.println("<path strokeLinecap=\"round\" strokeLinejoin=\"round\" d=\"M17.982 18.725A7.488 7.488 0 0012 15.75a7.488 7.488 0 00-5.982 2.975m11.963 0a9 9 0 10-11.963 0m11.963 0A8.966 8.966 0 0112 21a8.966 8.966 0 01-5.982-2.275M15 9.75a3 3 0 11-6 0 3 3 0 016 0z\"/>");
                pw.println("</svg>");
                pw.println("<span>");
                pw.println(postObject.getNickname());
                pw.println("</span>");
                pw.println("</div>");
                pw.println("<span> | </span>");
                pw.println("<div class=\"flex\">");
                pw.println("<svg xmlns=\"http://www.w3.org/2000/svg\" fill=\"none\" viewBox=\"0 0 24 24\" stroke-width=\"1.5\" stroke=\"currentColor\" class=\"w-6 h-6\">");
                pw.println("<path stroke-linecap=\"round\" stroke-linejoin=\"round\" d=\"M12 6v6h4.5m4.5 0a9 9 0 11-18 0 9 9 0 0118 0z\"/>");
                pw.println("</svg>");
                pw.println("<span>");
                pw.println(postObject.getCalcDate());
                pw.println("</span>");
                pw.println("</div>");
                pw.println("</div>");
                pw.println("</a>");
                pw.println("</div>");
            }
            pw.println("</body>");
            pw.println("</html>");
        } catch (Exception e){
            logger.servere("Faliure Load Post Datas");
        }
    }

    JSONArray loadPost(String category) throws SQLException, IOException, ParseException {
        db database = new db();
        Connection conn = database.getConnection();
        Statement sm = conn.createStatement();
        MyLogger logger = new MyLogger();

        String sql = "SELECT * FROM `community` WHERE category='" + category + "';";

        ResultSet resultSet = sm.executeQuery(sql);

        JSONArray jsonArray = new JSONArray();

        while (resultSet.next()) {
            Post jsonPost = new Post();
            jsonPost.setCommunityId(resultSet.getString("communityid"));
            jsonPost.setTitle(resultSet.getString("title"));
            jsonPost.setContent(resultSet.getString("content"));
            jsonPost.setCategory(resultSet.getString("category"));
            jsonPost.setNickname(resultSet.getString("nickname"));
            jsonPost.setCreatedDate(resultSet.getString("create_date"));
            jsonArray.add(jsonPost);
        }

        sm.close();
        conn.close();
        logger.info("Posts retrieved by category: " + category);

        return jsonArray;
    }


    public void destroy() {
    }
}