package com.NJUST.ZCW.Entities;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "authorityrequire", schema = "appsystem", catalog = "")
public class AuthorityrequireEntity {
    private int id;
    private int askerId;
    private String wantAuthority;
    private String askerName;
    private String Authorityrealname;


    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "asker_id")
    public int getAskerId() {
        return askerId;
    }

    public void setAskerId(int askerId) {
        this.askerId = askerId;
    }

    @Basic
    @Column(name = "want_authority")
    public String getWantAuthority() {
        return wantAuthority;
    }

    public void setWantAuthority(String wantAuthority) {
        this.wantAuthority = wantAuthority;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        AuthorityrequireEntity that = (AuthorityrequireEntity) o;
        return id == that.id &&
                askerId == that.askerId &&
                Objects.equals(wantAuthority, that.wantAuthority);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, askerId, wantAuthority);
    }

    @Basic
    @Column(name = "asker_name")
    public String getAskerName() {
        return askerName;
    }

    public void setAskerName(String askerName) {
        this.askerName = askerName;
    }

    public String getAuthorityrealname(){
        return this.Authorityrealname;
    }
    public void setAuthorityrealname(String a){
        this.Authorityrealname=a;
    }
}
