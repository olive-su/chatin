package mongo;

import java.io.IOException;
import java.sql.*;
import java.io.FileReader;
import java.io.Reader;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import utils.MyLogger;

public class mongo {
    String host;
    String port;
    String dbName;
    MongoDatabase conn;
    MongoClient mongoClient;

    public mongo() throws IOException, ParseException {
        Reader reader = new FileReader("/Users/sugyeong/Workspace/ayu-2023/chatin/application.json");
        JSONParser parser = new JSONParser();
        JSONObject jsonFile = (JSONObject) parser.parse(reader);
        JSONObject mongo = (JSONObject) jsonFile.get("mongo");

        host = (String) mongo.get("host");
        port = (String) mongo.get("port");
        dbName = (String) mongo.get("dbName");
        conn = null;
    }

    public MongoDatabase getConnection(){
        MyLogger logger = new MyLogger();

        try {
            mongoClient = new MongoClient(host, Integer.parseInt(port));
            MongoDatabase DB = mongoClient.getDatabase(dbName);
//            MongoCollection<Document> collection = DB.getCollection(col);
//
//            Class.forName(driverName);
//            conn = DriverManager.getConnection(host, username, password);

            conn = DB;
            logger.info("Success Mongo DB Connection" + conn);
        } catch (Exception e) {
            logger.servere("Failure Mongo DB Connection");
        }
        return conn;
    }

    public MongoClient getMongoClient() {
        return mongoClient;
    }
}
