package servlet;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import mongo.mongo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.bson.Document;
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
import java.util.Date;

@WebServlet(name = "ChatServlet", value = "/servlet/ChatServlet")
public class ChatServlet extends HttpServlet {
    public void init() {
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response)
                    throws ServletException, IOException {
        String historyId = request.getParameter("historyId");

        MyLogger logger = new MyLogger();
        try{
            long count = countDocuments(historyId);

            response.setCharacterEncoding("UTF-8");
            PrintWriter pw = response.getWriter();

            pw.println("<html>");
            pw.println("<head>");
            pw.println("<title></title>");
            pw.println("</head>");
            pw.println("<body>");
            if (count == 0) { // 미존재
                String ChatData = createDocument(historyId);
                pw.println("<div class=\"chat chat-start p-4\">");
                pw.println("<div class=\"chat-bubble\">");
                pw.println("여러 가지 질문을 준비했습니다. 준비가 되면 바로 시작해봅시다.");
                pw.println("컴퓨터 프로그램에서 변수란 무엇인가요?");
                pw.println("객체 지향 프로그래밍에서 상속이란 무엇인가요?");
                pw.println("데이터베이스에서 JOIN이란 무엇인가요?");
                pw.println("HTTP와 HTTPS의 차이점은 무엇인가요?");
                pw.println("네트워크에서 OSI 모델은 무엇이고, 이 중 몇 번째 계층이 전송 계층이며 어떤 역할을 하는지 설명해주세요.");
                pw.println("답변을 듣고 평가와 꼬리질문을 진행할게요.");
                pw.println("간단한 설명만으로도 괜찮으니, 부담 갖지 마시고 대답해주시면 됩니다!");
                pw.println("</div>");
                pw.println("</div>");
                System.out.println("Data exists.");
            } else {
                String rst = createDocument(historyId);
                response.setContentType("text/plain");
                response.getWriter().write(rst);
                logger.info("Success Create Chatgpt Datas");
                System.out.println("Data does not exist.");
            }
            pw.println("</body>");
            pw.println("</html>");
        } catch (Exception e){
            logger.servere("Faliure Create Chatgpt Datas");
        }
    }

    Long countDocuments(String historyId) throws IOException, ParseException {
        mongo database = new mongo();
        MongoDatabase conn = database.getConnection();
        MongoCollection<Document> collection = conn.getCollection("history");

        Document query = new Document("history_id", historyId);
        long count = collection.count(query);
        database.getMongoClient().close();
        return count;
    }

    void addHistory(String historyId, String chatContents) throws SQLException, IOException, ParseException {
        mongo database = new mongo();
        MongoDatabase conn = database.getConnection();
        MongoCollection<Document> collection = conn.getCollection("history");

        Document query = new Document("history_id", historyId);
        Document document = collection.find(query).first();

        if (document != null) {
            System.out.println(document.toJson());
        } else {
            System.out.println("Document not found.");
        }
        database.getMongoClient().close();
    }

    String createDocument(String historyId) throws SQLException, IOException, ParseException {
        mongo database = new mongo();
        MongoDatabase conn = database.getConnection();
        MongoCollection<Document> collection = conn.getCollection("history");

        Document document = new Document();
        Date nowDate = new Date();
        String chatData = "{\"model\": \"gpt-3.5-turbo\", \"messages\":[{\"role\": \"system\", \"content\": \"당신은 앞으로 IT기업에서 신입 개발자를 뽑는 면접관입니다. 당신은 당신이 면접관이라고 생각하고 제게 컴퓨터 공학 기초에 관한 5가지 질문을 해주십시오.\"},{\"role\": \"user\", \"content\": \"그러면 제가 지원자가 되어서 답변하겠습니다. 그리고 당신은 제 답변을 1부터 10까지 숫자 중 평가를 내리고 꼬리질문을 해주십시오.\"}]}";
        document.append("history_id", historyId);
        document.append("chat", chatData);

        collection.insertOne(document);

        System.out.println("Document inserted successfully.");

        database.getMongoClient().close();
        return chatData;
    }

    public void destroy() {
    }
}