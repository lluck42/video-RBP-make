package hnsjb.videoRBPmake.dao.admin;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import lombok.Data;

@Data
public class admin {
    public int id;
    @NotNull
    public String name;
    @Pattern(regexp="^[0-9]{11}$", message="不是一个合法的手机号码") @NotNull
    public String mobile;
    public String role;
    @Email @NotNull
    public String email;
    @JsonIgnore
    public String password;
    public String token;
}
