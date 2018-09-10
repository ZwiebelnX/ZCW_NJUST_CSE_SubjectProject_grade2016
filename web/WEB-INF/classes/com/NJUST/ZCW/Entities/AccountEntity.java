package com.NJUST.ZCW.Entities;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "account", schema = "appsystem", catalog = "")
public class AccountEntity {
    private String userName;
    private String normalName;
    private int userId;
    private String pwd;
    private String identityCard;
    private String idName;
    private String address;
    private String gender;
    private Timestamp birthdate;
    private String tel;
    private String mail;
    private Integer age;
    private String isManager;
    private Timestamp createDate;
    private Timestamp lastDate;
    private Integer visitCnt;
    private String qq;
    private String authority;

    @Basic
    @Column(name = "USER_NAME")
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Basic
    @Column(name = "NORMAL_NAME")
    public String getNormalName() {
        return normalName;
    }

    public void setNormalName(String normalName) {
        this.normalName = normalName;
    }

    @Id
    @Column(name = "USER_ID")
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "PWD")
    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    @Basic
    @Column(name = "IDENTITY_CARD")
    public String getIdentityCard() {
        return identityCard;
    }

    public void setIdentityCard(String identityCard) {
        this.identityCard = identityCard;
    }

    @Basic
    @Column(name = "ID_NAME")
    public String getIdName() {
        return idName;
    }

    public void setIdName(String idName) {
        this.idName = idName;
    }

    @Basic
    @Column(name = "ADDRESS")
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Basic
    @Column(name = "GENDER")
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    @Basic
    @Column(name = "BIRTHDATE")
    public Timestamp getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(Timestamp birthdate) {
        this.birthdate = birthdate;
    }

    @Basic
    @Column(name = "TEL")
    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    @Basic
    @Column(name = "MAIL")
    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    @Basic
    @Column(name = "AGE")
    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    @Basic
    @Column(name = "IS_MANAGER")
    public String getIsManager() {
        return isManager;
    }

    public void setIsManager(String isManager) {
        this.isManager = isManager;
    }

    @Basic
    @Column(name = "CREATE_DATE")
    public Timestamp getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Timestamp createDate) {
        this.createDate = createDate;
    }

    @Basic
    @Column(name = "LAST_DATE")
    public Timestamp getLastDate() {
        return lastDate;
    }

    public void setLastDate(Timestamp lastDate) {
        this.lastDate = lastDate;
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
    @Column(name = "QQ")
    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    @Basic
    @Column(name = "AUTHORITY")
    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        AccountEntity that = (AccountEntity) o;
        return userId == that.userId &&
                Objects.equals(userName, that.userName) &&
                Objects.equals(normalName, that.normalName) &&
                Objects.equals(pwd, that.pwd) &&
                Objects.equals(identityCard, that.identityCard) &&
                Objects.equals(idName, that.idName) &&
                Objects.equals(address, that.address) &&
                Objects.equals(gender, that.gender) &&
                Objects.equals(birthdate, that.birthdate) &&
                Objects.equals(tel, that.tel) &&
                Objects.equals(mail, that.mail) &&
                Objects.equals(age, that.age) &&
                Objects.equals(isManager, that.isManager) &&
                Objects.equals(createDate, that.createDate) &&
                Objects.equals(lastDate, that.lastDate) &&
                Objects.equals(visitCnt, that.visitCnt) &&
                Objects.equals(qq, that.qq) &&
                Objects.equals(authority, that.authority);
    }

    @Override
    public int hashCode() {
        return Objects.hash(userName, normalName, userId, pwd, identityCard, idName, address, gender, birthdate, tel, mail, age, isManager, createDate, lastDate, visitCnt, qq, authority);
    }
}
