package post;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;

public class Post {
    private String communityId;
    private String title;
    private String category;
    private String content;
    private String nickname;
    private String createdDate;
    private ArrayList<Post> postList = new ArrayList<>();

    public String getCommunityId() {
        return communityId;
    }

    public void setCommunityId(String communityId) {
        this.communityId = communityId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getCalcDate(){
        LocalDateTime currentDate = LocalDateTime.now();
        LocalDateTime targetDate = LocalDateTime.parse(createdDate, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

        long daysDifference = ChronoUnit.DAYS.between(targetDate, currentDate);

        if (daysDifference < 1) {
            long hoursDifference = ChronoUnit.HOURS.between(targetDate, currentDate);
            return hoursDifference + "시간 전";
        } else {
            return daysDifference + "일 전";
        }
    }

    public ArrayList<Post> getPostList() {
        return postList;
    }

    public void setPostList(Post newPost) {
        this.postList.add(newPost);
    }
}
