package hnsjb.videoRBPmake.controller.admin;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import hnsjb.videoRBPmake.controller.baseController;
import hnsjb.videoRBPmake.dao.admin.admin;
import hnsjb.videoRBPmake.dao.admin.adminMapper;
import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("admin")
public class adminController extends baseController {

    @Autowired
    private adminMapper adminMapper;


    @RequestMapping("info")
    public Rtn info(HttpServletRequest request, String title, Integer pageSize, Integer pageNum) {
        return rtn(request.getAttribute("info"));
    }

    @RequestMapping("changePassword")
    public Rtn changePassword(HttpServletRequest request, @RequestBody HashMap<String,Object> req) {
        admin info = (admin)request.getAttribute("info");
        String password = (String)req.get("password");
        String newPassword = (String)req.get("newPassword");

        if(newPassword.equals(""))
            throw new RuntimeException("新密码不能为空！");
        
        String md5Password = DigestUtils.md5DigestAsHex(password.getBytes());
        
        if(!md5Password.equals(info.password))
            throw new RuntimeException("密码不正确，请重新输入！");
        
        // 修改密码
        info.password = DigestUtils.md5DigestAsHex(newPassword.getBytes());
        int sum = adminMapper.changePassword(info);
        if(sum==0)
            throw new RuntimeException("修改密码失败！");
        
        return rtn();
    }
    
    // 刷新token凭证
    @RequestMapping(value="logout")
    public Rtn logout(HttpServletRequest request) {

        admin one = (admin)request.getAttribute("info");

        String str = one.id + "-" + System.currentTimeMillis();

        one.token = DigestUtils.md5DigestAsHex(str.getBytes());

        int sum = adminMapper.setToken(one);
        if(sum == 0)
            throw new RuntimeException("更新token失败");
        // System.out.println(str);
        return rtn();
    }

    // 微信解绑
    @RequestMapping(value="wxUnbind")
    public Rtn wxBind(HttpServletRequest request) {

        admin one = (admin)request.getAttribute("info");

        int sum = adminMapper.wxUnbind(one);

        if(one.wx_unionid == null)
            throw new RuntimeException("该账号未绑定微信");

        if(sum == 0)
            throw new RuntimeException("解绑微信失败");
        
        return rtn();
    }

}
