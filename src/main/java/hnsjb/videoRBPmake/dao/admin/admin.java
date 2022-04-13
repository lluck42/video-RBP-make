package hnsjb.videoRBPmake.dao.admin;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import lombok.Data;

@Data
public class admin {
    public int id;
    @NotNull(message="用户名不能为空")
    public String name;
    @NotNull(message="手机号码不能为空") @Pattern(regexp="^[0-9]{11}$", message="不是一个合法的手机号码")
    public String mobile;
    public String role;
    @NotNull(message="电子邮件不能为空") @Pattern(regexp="^[a-z0-9A-Z]+@chinaunicom\\.cn$", message="请使用chinaunicom.cn邮箱")
    public String email;
    @JsonIgnore
    public String password;
    public String token;
}
