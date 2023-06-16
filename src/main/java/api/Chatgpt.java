package api;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONObject;
import org.json.simple.parser.*;
import org.json.simple.JSONArray;

public class Chatgpt {
    static String endPointUrl;
    static String apiKey;

    public Chatgpt() throws IOException, ParseException {

    }

    public String convertToString(BufferedReader reader) throws IOException {
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        return sb.toString();
    }

    public String runningChatgpt(String requestData) throws IOException {
        String response = null;
        try {
            Reader reader = new FileReader("application.json");
            JSONParser parser = new JSONParser();
            JSONObject jsonFile = (JSONObject) parser.parse(reader);
            JSONObject chatgpt = (JSONObject) jsonFile.get("chatgpt");
            endPointUrl = (String) chatgpt.get("endpoint");
            apiKey = (String) chatgpt.get("key");

            // API 요청 전송
            URL url = new URL(endPointUrl);
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

            parser = new JSONParser();
            JSONObject jsonObject = (JSONObject) parser.parse( convertToString(br));

            JSONArray choicesArray = (JSONArray) jsonObject.get("choices");

            if (choicesArray.size() > 0) {
                JSONObject choiceObject = (JSONObject) choicesArray.get(0);
                JSONObject messageObject = (JSONObject) choiceObject.get("message");
                response = (String) messageObject.get("content");
                System.out.println(response);
            }

            br.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return response;
    }
}
