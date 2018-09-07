package appsystem.domain;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Objects;

public class AccountEntity implements Serializable {
    private static final long serialVersionUID = 6623462074330062039L;
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

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getNormalName() {
        return normalName;
    }

    public void setNormalName(String normalName) {
        this.normalName = normalName;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getIdentityCard() {
        return identityCard;
    }

    public void setIdentityCard(String identityCard) {
        this.identityCard = identityCard;
    }

    public String getIdName() {
        return idName;
    }

    public void setIdName(String idName) {
        this.idName = idName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Timestamp getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(Timestamp birthdate) {
        this.birthdate = birthdate;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getIsManager() {
        return isManager;
    }

    public void setIsManager(String isManager) {
        this.isManager = isManager;
    }

    public Timestamp getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Timestamp createDate) {
        this.createDate = createDate;
    }

    public Timestamp getLastDate() {
        return lastDate;
    }

    public void setLastDate(Timestamp lastDate) {
        this.lastDate = lastDate;
    }

    public Integer getVisitCnt() {
        return visitCnt;
    }

    public void setVisitCnt(Integer visitCnt) {
        this.visitCnt = visitCnt;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

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
