package api;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONObject;
import org.json.simple.parser.*;
import org.json.simple.JSONArray;

public class Chatgpt {
    private String endPointUrl;
    private String apiKey;

    public Chatgpt() throws IOException, ParseException {
        Reader reader = new FileReader("application.json");
        JSONParser parser = new JSONParser();
        JSONObject jsonFile = (JSONObject) parser.parse(reader);
        JSONObject chatgpt = (JSONObject) jsonFile.get("chatgpt");
        this.endPointUrl = (String) chatgpt.get("endpoint");
        this.apiKey = (String) chatgpt.get("key");
    }

    public void ChatgptConversation() throws IOException {
        try {
//            The following is a conversation with an AI assistant. The assistant is helpful, creative, clever, and very friendly.
            String requestData = "{\"model\": \"gpt-3.5-turbo\", \"messages\": " +
                        "[" +
                            "{\"role\": \"system\", \"" +
                                "content\": \"너는 앞으로 IT기업에서 신입 개발자를 뽑는 면접관이야. 내가 인사를 하면 너는 너가 면접관이라고 생각하고 내게 컴퓨터 공학 기초에 관한 5가지 질문을 해줘.\"" +
                            "}" +
//                            "," +
//                            "{\"role\": \"user\", \"" +
//                                "content\": \"그러면 내가 지원자가 되어서 답변할게. 그리고 너는 내 답변을 1부터 10까지 숫자 중 평가를 내리고 꼬리질문을 해줘.\"" +
//                            "}" +
                        "]" +
                    "}";

            // API 요청 전송
            URL url = new URL(this.endPointUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("Authorization", "Bearer " + apiKey);
            conn.setDoOutput(true);

            OutputStream os = conn.getOutputStream();
            os.write(requestData.getBytes());
            os.flush();

            // API 응답 수신
            int responseCode = conn.getResponseCode();
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String inputLine;
            String response;

//            JSONObject jsonObject = new JSONObject(br.readLine());
//
//            JSONArray choicesArray = jsonObject.getJSONArray("choices");
//
//            if (choicesArray.length() > 0) {
//                JSONObject choiceObject = choicesArray.getJSONObject(0);
//                JSONObject messageObject = choiceObject.getJSONObject("message");
//                response = messageObject.getString("content");
//                System.out.println(response);
//            }

            br.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
