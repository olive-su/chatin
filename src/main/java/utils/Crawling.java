package utils;

import java.util.LinkedList;
import news.News;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Crawling {
    LinkedList<News> crawlingData;

    public LinkedList<News> getData() {
        return crawlingData;
    }

    public void createCrawling(){
        try {
            crawlingData = new LinkedList<>();
            String URL = "https://news.hada.io";

            for (int p = 1; p <= 5; p++) {
                Document doc = Jsoup.connect(URL).get();

                Elements elements = doc.select("body > main > article > div > div");

                for (Element element : elements) {
                    String url = element.select(".topictitle > a > h1").text();
                    String title = element.select(".topictitle > a").attr("href");
                    String content = element.select(".topicdesc").text();

                    News news = new News(title, url, content);
                    crawlingData.add(news);
                }
            }

        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
