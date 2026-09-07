package org.model;


import java.time.LocalDateTime;

public class Promotion {

    private int promotionId;
    private int userId;
    private String designationFrom;
    private String designationTo;
    private LocalDateTime date;

    // No-argument constructor
    public Promotion() {
    }

    // Parameterized constructor
    public Promotion(int promotionId, int userId,
                     String designationFrom, String designationTo,
                     LocalDateTime date) {

        this.promotionId = promotionId;
        this.userId = userId;
        this.designationFrom = designationFrom;
        this.designationTo = designationTo;
        this.date = date;
    }

    // Getters and Setters

    public int getPromotionId() {
        return promotionId;
    }

    public void setPromotionId(int promotionId) {
        this.promotionId = promotionId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getDesignationFrom() {
        return designationFrom;
    }

    public void setDesignationFrom(String designationFrom) {
        this.designationFrom = designationFrom;
    }

    public String getDesignationTo() {
        return designationTo;
    }

    public void setDesignationTo(String designationTo) {
        this.designationTo = designationTo;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }
}


