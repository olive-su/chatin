package db;

import java.io.IOException;
import java.sql.*;
import java.io.FileReader;
import java.io.Reader;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import utils.MyLogger;

public class db {
    String driverName;
    String host;
    String username;
    String password;
    Connection conn;

    public db() throws IOException, ParseException {
        Reader reader = new FileReader("/Users/sugyeong/Workspace/ayu-2023/chatin/application.json");
        JSONParser parser = new JSONParser();
        JSONObject jsonFile = (JSONObject) parser.parse(reader);
        JSONObject db = (JSONObject) jsonFile.get("db");

        driverName = (String) db.get("driverName");
        host = (String) db.get("host");
        username = (String) db.get("username");
        password = (String) db.get("password");
        conn = null;
    }

    public Connection getConnection(){
        MyLogger logger = new MyLogger();

        try {
            Class.forName(driverName);
            conn = DriverManager.getConnection(host, username, password);

            logger.info("Success DB Connection" + conn);
        } catch (ClassNotFoundException e) {
            logger.servere("Failure DB Connection : Need to Driver Connection");
        } catch (SQLException e) {
            logger.servere("Failure DB Connection : Check SQL Syntax");
        }
        return this.conn;
    }
}
