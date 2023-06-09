package utils;

import java.io.IOException;
import java.sql.*;

import org.json.simple.parser.ParseException;
import user.User;
import db.db;

public class auth {
    public boolean SignIn(User user) throws SQLException, IOException, ParseException {
        db database = new db();
        Connection conn = database.getConnection();
        Statement sm = conn.createStatement();
        MyLogger logger = new MyLogger();

        String email = user.getEmail();
        String password = user.getPassword();

        String sql = "SELECT COUNT(*) as cnt, nickname FROM `user` WHERE email='" + email + "' AND hashcode='" + password + "';";

        ResultSet rst = sm.executeQuery(sql);

        while (rst.next()) {
            int rstCnt = rst.getInt("cnt");
            if (rstCnt == 1) {
                user.setNickname(rst.getString("nickname"));
                sm.close();
                conn.close();
                logger.info("Successs Sign In");
                return true;
            } else {
                sm.close();
                conn.close();
                logger.info("Failure Sign In");
                return false;
            }
        }
        return false;
    }

    public boolean SignUp(User user) throws SQLException, IOException, ParseException {
        db database = new db();
        Connection conn = database.getConnection();
        Statement sm = conn.createStatement();
        MyLogger logger = new MyLogger();

        String email = user.getEmail();
        String password = user.getPassword();
        String nickname = user.getNickname();

        String sql = "INSERT INTO `user` (email, hashcode, nickname) VALUES ('" + email + "', '" + password + "', '" + nickname + "');";

        int rowsAffected = sm.executeUpdate(sql);

        if (rowsAffected > 0) {
            sm.close();
            conn.close();
            logger.info("Successs Sign Up");
            return true;
        } else {
            sm.close();
            conn.close();
            logger.info("Failure Sign Up");
            return false;
        }
    }



}