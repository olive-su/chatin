package db;

import java.sql.*;

import utils.MyLogger;

public class db {


    public db(){
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
    }

    public Connection getConnection(){
        return this.conn;
    }
}
