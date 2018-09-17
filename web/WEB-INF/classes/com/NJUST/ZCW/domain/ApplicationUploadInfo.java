package com.NJUST.ZCW.domain;

import java.io.Serializable;

public class ApplicationUploadInfo implements Serializable {
    private static final long serialVersionUID = 7786501899876296280L;

    private int id;
    private String name;
    private String type;
    private String introduction;
    private String version;
    private int publisherId;
    private String size;
    private String language;
    private int limitAge;
    private String compatibility;
    private int price;
    private String img;
    private int visitCnt;
    private String auriorityNeed;
    private String requireVersion;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public int getPublisherId() {
        return publisherId;
    }

    public void setPublisherId(int publisherId) {
        this.publisherId = publisherId;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public int getLimitAge() {
        return limitAge;
    }

    public void setLimitAge(int limitAge) {
        this.limitAge = limitAge;
    }

    public String getCompatibility() {
        return compatibility;
    }

    public void setCompatibility(String compatibility) {
        this.compatibility = compatibility;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getVisitCnt() {
        return visitCnt;
    }

    public void setVisitCnt(int visitCnt) {
        this.visitCnt = visitCnt;
    }

    public String getAuriorityNeed() {
        return auriorityNeed;
    }

    public void setAuriorityNeed(String auriorityNeed) {
        this.auriorityNeed = auriorityNeed;
    }

    public String getRequireVersion() {
        return requireVersion;
    }

    public void setRequireVersion(String requireVersion) {
        this.requireVersion = requireVersion;
    }
}
