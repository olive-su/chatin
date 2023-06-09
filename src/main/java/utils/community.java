package utils;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.io.IOException;

import org.json.simple.parser.ParseException;
import post.Post;
import db.db;

public class community {
    public boolean createPost(Post post) throws SQLException, IOException, ParseException {
        db database = new db();
        Connection conn = database.getConnection();
        Statement sm = conn.createStatement();
        MyLogger logger = new MyLogger();

        String title = post.getTitle();
        String content = post.getContent();
        String category = post.getCategory();
        String nickname = post.getNickname();

        String sql = "INSERT INTO `community` (title, content, category, nickname) VALUES ('" + title + "', '" + content + "', '" + category + "', '" + nickname  + "');";

        int rowsAffected = sm.executeUpdate(sql);

        if (rowsAffected > 0) {
            sm.close();
            conn.close();
            logger.info("Successfully created a post");
            return true;
        } else {
            sm.close();
            conn.close();
            logger.info("Failed to create a post");
            return false;
        }
    }
}