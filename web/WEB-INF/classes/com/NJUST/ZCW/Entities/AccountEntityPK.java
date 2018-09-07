package com.NJUST.ZCW.Entities;

import java.io.Serializable;
import java.util.Objects;

public class AccountEntityPK implements Serializable {
    private String userName;
    private int userId;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        AccountEntityPK that = (AccountEntityPK) o;
        return userId == that.userId &&
                Objects.equals(userName, that.userName);
    }

    @Override
    public int hashCode() {
        return Objects.hash(userName, userId);
    }
}
