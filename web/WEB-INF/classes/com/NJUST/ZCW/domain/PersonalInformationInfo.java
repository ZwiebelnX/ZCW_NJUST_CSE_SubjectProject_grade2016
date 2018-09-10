package com.NJUST.ZCW.domain;

import java.io.Serializable;

public class PersonalInformationInfo implements Serializable {

    private static final long serialVersionUID = 3820353657932674677L;
    private String username;
    private String nickname;
    private String password;
    private String email;
    private String IDname;
    private String IDnumber;
    private String phoneNumber;
    private String QQ;
    private String address;
    private String gender;
    private int age;
    public  PersonalInformationInfo(){
        username="";
        nickname="";
        password="";
        email="";
        IDname="";
        IDnumber="";
        phoneNumber="";
        QQ="";
        address="";
        gender="M";
        age=1;
    }
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getIDname() {
        return IDname;
    }

    public void setIDname(String IDname) {
        this.IDname = IDname;
    }

    public String getIDnumber() {
        return IDnumber;
    }

    public void setIDnumber(String IDnumber) {
        this.IDnumber = IDnumber;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getQQ() {
        return QQ;
    }

    public void setQQ(String QQ) {
        this.QQ = QQ;
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

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}
