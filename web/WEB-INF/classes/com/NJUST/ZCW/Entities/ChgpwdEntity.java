package com.NJUST.ZCW.Entities;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "chgpwd", schema = "appsystem", catalog = "")
public class ChgpwdEntity {
    private int userid;
    private String yzm;
    private String pwd;

    @Id
    @Column(name = "userid")
    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    @Basic
    @Column(name = "yzm")
    public String getYzm() {
        return yzm;
    }

    public void setYzm(String yzm) {
        this.yzm = yzm;
    }

    @Basic
    @Column(name = "pwd")
    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ChgpwdEntity that = (ChgpwdEntity) o;
        return userid == that.userid &&
                Objects.equals(yzm, that.yzm) &&
                Objects.equals(pwd, that.pwd);
    }

    @Override
    public int hashCode() {
        return Objects.hash(userid, yzm, pwd);
    }
}
