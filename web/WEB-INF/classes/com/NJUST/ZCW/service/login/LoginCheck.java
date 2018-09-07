package com.NJUST.ZCW.service.login;

import org.springframework.stereotype.Repository;

@Repository("Login")
public class LoginCheck {

    public boolean CheckAccount(String username, String password) {
        //TODO 数据库对接
        return true;
    }
}
