package model;

import java.time.LocalDate;

public class Task {
    private int id;
    private String title;
    private String dueDate;
    private String priority;
    private String category;
    private int userId;
    private String finishDate;
    private int rateById;
    private String rate;
    private String rateDate;
    private String userName;
    private String teamName;
    private String rateByName;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }

    public String getRateByName() {
        return rateByName;
    }

    public void setRateByName(String rateByName) {
        this.rateByName = rateByName;
    }

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFinishDate() {
        return finishDate;
    }

    public void setFinishDate(String finishDate) {
        this.finishDate = finishDate;
    }

    public int getRateById() {
        return rateById;
    }

    public void setRateById(int rateById) {
        this.rateById = rateById;
    }

    public String getRate() {
        return rate;
    }

    public void setRate(String rate) {
        this.rate = rate;
    }

    public String getRateDate() {
        return rateDate;
    }

    public void setRateDate(String rateDate) {
        this.rateDate = rateDate;
    }

    public String getDueDate() {
        return dueDate;
    }

    public void setDueDate(String dueDate) {
        this.dueDate = dueDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
