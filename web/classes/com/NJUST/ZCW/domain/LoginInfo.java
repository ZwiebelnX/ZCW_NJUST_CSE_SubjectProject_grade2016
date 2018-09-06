package com.NJUST.ZCW.domain;

import java.io.Serializable;

public class LoginInfo implements Serializable {


    private static final long serialVersionUID = 613144239757763636L;

    private String username;
    private String password;

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsername() {
        return username;
    }
}
