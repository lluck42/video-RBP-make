package hnsjb.videoRBPmake.dao.admin;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
public class admin {
    public int id;
    public String name;
    public String mobile;
    public String role;
    public String email;
    @JsonIgnore
    public String password;
    public String token;
}
