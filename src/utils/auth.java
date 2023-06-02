package utils;

import java.sql.*;

import user.User;
import db.db;

public class auth {
    public boolean SignIn(User user) throws SQLException {
        db database = new db();
        Connection conn = database.getConnection();
        Statement sm = conn.createStatement();
        MyLogger logger = new MyLogger();

        String email = user.getEmail();
        String password = user.getPassword();

        String sql = "SELECT COUNT(*) as cnt FROM `user` WHERE email='" + email + "' AND hashcode='" + password + "';";

        ResultSet rst = sm.executeQuery(sql);

        while (rst.next()) {
            int rstCnt = rst.getInt("cnt");
            if (rstCnt == 1) {
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
}