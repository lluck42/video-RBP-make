package hnsjb.videoRBPmake.controller.admin;

import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.session.Session;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import hnsjb.videoRBPmake.controller.base;
import hnsjb.videoRBPmake.dao.admin.admin;
import hnsjb.videoRBPmake.dao.admin.adminMapper;
import hnsjb.videoRBPmake.tools.verifyCode;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.awt.image.BufferedImage;


@RestController
@RequestMapping("/login")
public class login extends base {
    @Autowired
    private final adminMapper adminMapper = null;

    @RequestMapping(value="login")
    public Rtn login2(HttpSession session, @RequestBody(required = false) Map<String,Object> req) {

        // 验证码
        String code = (String)session.getAttribute("code");

        session.removeAttribute("code");

        String code2 = (String)req.get("code");

        if(!code2.equals(code) || code2 == null){
            throw new RuntimeException("验证码不正确");
        }
        
        // name
        String name = (String)req.get("name");
        // password
        String password = (String)req.get("password");
        // md5
        password = DigestUtils.md5DigestAsHex(password.getBytes());

        admin one = adminMapper.login(name, password);

        if(one==null){
            throw new RuntimeException("账号密码错误");
        }
        
        return rtn(one);
    }

    // 验证码
    @RequestMapping(value="verifyImage")
    public void verifyImage(HttpSession session, HttpServletResponse response) {
        response.setHeader("Content-type", "image/png");

        //生成验证码
        String code = verifyCode.getSecurityCode();
        //将验证码放入session
        session.setAttribute("code",code);

        //生成图片
        BufferedImage image = verifyCode.createImage(code);
        try{
            ServletOutputStream outputStream = response.getOutputStream();
            ImageIO.write(image, "png", outputStream);
        }catch(Exception e){
            throw new RuntimeException("生成图片失败");
        }
    }

}
