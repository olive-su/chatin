package servlet;

import db.db;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.simple.parser.ParseException;
import user.User;
import utils.MyLogger;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet(name = "ValidationEmailServlet", value = "/servlet/ValidationEmailServlet")
public class ValidationEmailServlet extends HttpServlet {
    public void init() {
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response)
                    throws ServletException, IOException {
        String email = request.getParameter("email");

        String message = "0";
        User user = new User();
        MyLogger logger = new MyLogger();
        user.setEmail(email);
        try{
            if (validateEmail(user) == true){
                message = "1";
            } else {
                message = "0";
            }
        } catch (Exception e){
            logger.servere("Faliure Email Check");
        }

        response.setContentType("text/plain");
        response.getWriter().write(message);
    }

    /**
     *
     * @param user
     * @return 미존재 이메일 : true
     *         존재 이메일 : false
     * @throws SQLException
     * @throws IOException
     * @throws ParseException
     */
    boolean validateEmail(User user) throws SQLException, IOException, ParseException {
        db database = new db();
        Connection conn = database.getConnection();
        Statement sm = conn.createStatement();
        MyLogger logger = new MyLogger();
        boolean result = false;

        String email = user.getEmail();

        String sql = "SELECT COUNT(*) as cnt FROM `user` WHERE email='" + email +"';";

        ResultSet rst = sm.executeQuery(sql);

        while (rst.next()) {
            int rstCnt = rst.getInt("cnt");
            if (rstCnt == 0) {
                logger.info("Success Validation Email");
                result = true;
            } else {
                logger.info("Success Validation Email");
                result = false;
            }
        }
        sm.close();
        conn.close();
        return result;
    }

    public void destroy() {
    }
}