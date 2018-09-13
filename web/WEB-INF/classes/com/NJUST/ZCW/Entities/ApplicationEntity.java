package com.NJUST.ZCW.Entities;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "application", schema = "appsystem", catalog = "")
public class ApplicationEntity {
    private int id;
    private String name;
    private String type;
    private String introduction;
    private String version;
    private Integer publisherId;
    private String downloadUrl;
    private String size;
    private String language;
    private Integer limitAge;
    private String compatibility;
    private Integer price;
    private String img;
    private Integer visitCnt;
    private String auriorityNeed;
    private String requireVersion;
    private Integer downloadCnt;
    private String checked;

    @Id
    @Column(name = "ID")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "NAME")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "TYPE")
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Basic
    @Column(name = "INTRODUCTION")
    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    @Basic
    @Column(name = "VERSION")
    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    @Basic
    @Column(name = "PUBLISHER_ID")
    public Integer getPublisherId() {
        return publisherId;
    }

    public void setPublisherId(Integer publisherId) {
        this.publisherId = publisherId;
    }

    @Basic
    @Column(name = "DOWNLOAD_URL")
    public String getDownloadUrl() {
        return downloadUrl;
    }

    public void setDownloadUrl(String downloadUrl) {
        this.downloadUrl = downloadUrl;
    }

    @Basic
    @Column(name = "SIZE")
    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    @Basic
    @Column(name = "LANGUAGE")
    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    @Basic
    @Column(name = "LIMIT_AGE")
    public Integer getLimitAge() {
        return limitAge;
    }

    public void setLimitAge(Integer limitAge) {
        this.limitAge = limitAge;
    }

    @Basic
    @Column(name = "COMPATIBILITY")
    public String getCompatibility() {
        return compatibility;
    }

    public void setCompatibility(String compatibility) {
        this.compatibility = compatibility;
    }

    @Basic
    @Column(name = "PRICE")
    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    @Basic
    @Column(name = "IMG")
    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Basic
    @Column(name = "VISIT_CNT")
    public Integer getVisitCnt() {
        return visitCnt;
    }

    public void setVisitCnt(Integer visitCnt) {
        this.visitCnt = visitCnt;
    }

    @Basic
    @Column(name = "AURIORITY_NEED")
    public String getAuriorityNeed() {
        return auriorityNeed;
    }

    public void setAuriorityNeed(String auriorityNeed) {
        this.auriorityNeed = auriorityNeed;
    }

    @Basic
    @Column(name = "REQUIRE_VERSION")
    public String getRequireVersion() {
        return requireVersion;
    }

    public void setRequireVersion(String requireVersion) {
        this.requireVersion = requireVersion;
    }

    @Basic
    @Column(name = "DOWNLOAD_CNT")
    public Integer getDownloadCnt() {
        return downloadCnt;
    }

    public void setDownloadCnt(Integer downloadCnt) {
        this.downloadCnt = downloadCnt;
    }

    @Basic
    @Column(name = "CHECKED")
    public String getChecked() {
        return checked;
    }

    public void setChecked(String checked) {
        this.checked = checked;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ApplicationEntity that = (ApplicationEntity) o;
        return id == that.id &&
                Objects.equals(name, that.name) &&
                Objects.equals(type, that.type) &&
                Objects.equals(introduction, that.introduction) &&
                Objects.equals(version, that.version) &&
                Objects.equals(publisherId, that.publisherId) &&
                Objects.equals(downloadUrl, that.downloadUrl) &&
                Objects.equals(size, that.size) &&
                Objects.equals(language, that.language) &&
                Objects.equals(limitAge, that.limitAge) &&
                Objects.equals(compatibility, that.compatibility) &&
                Objects.equals(price, that.price) &&
                Objects.equals(img, that.img) &&
                Objects.equals(visitCnt, that.visitCnt) &&
                Objects.equals(auriorityNeed, that.auriorityNeed) &&
                Objects.equals(requireVersion, that.requireVersion) &&
                Objects.equals(downloadCnt, that.downloadCnt) &&
                Objects.equals(checked, that.checked);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, type, introduction, version, publisherId, downloadUrl, size, language, limitAge, compatibility, price, img, visitCnt, auriorityNeed, requireVersion, downloadCnt, checked);
    }
}
