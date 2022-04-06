package hnsjb.videoRBPmake.controller.admin;

import java.awt.image.BufferedImage;
import java.util.Map;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import hnsjb.videoRBPmake.controller.baseController;
import hnsjb.videoRBPmake.dao.admin.admin;
import hnsjb.videoRBPmake.dao.admin.adminMapper;
import hnsjb.videoRBPmake.tools.verifyCode;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@RestController
@RequestMapping("/login")
public class loginController extends baseController {
    @Autowired
    private adminMapper adminMapper;

    @RequestMapping(value="login")
    public Rtn login2(HttpSession session, @RequestBody(required = false) Map<String,Object> req) {

        // 验证码
        String code = (String)session.getAttribute("code");

        session.removeAttribute("code");

        String code2 = (String)req.get("code");

        if(code2 == null || !code2.equals(code)){
            throw new RuntimeException("验证码不正确");
        }
        
        // type name mobile 二选一
        String type = (String)req.get("type");
        // name
        String name = (String)req.get("name");
        // password
        String password = (String)req.get("password");
        // md5
        password = DigestUtils.md5DigestAsHex(password.getBytes());

        // System.out.println(password);
        admin one;
        if(type.equals("name")){
            one = adminMapper.nameLogin(name, password);
        }else if(type.equals("mobile")){
            one = adminMapper.mobileLogin(name, password);
        }else{
            throw new RuntimeException("登陆参数错误：type！");
        }

        if(one==null)
            throw new RuntimeException("账号密码错误");
        
        return rtn(one);
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


    // 验证码
    @RequestMapping(value="verifyImage")
    public void verifyImage(HttpSession session, HttpServletResponse response) {
        response.setDateHeader("Expires", 0);
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");
        response.setHeader("Pragma", "no-cache");
        
        response.setHeader("Content-type", "image/png");

        //生成验证码
        String code = verifyCode.getSecurityCode();
        //将验证码放入session
        session.setAttribute("code",code);
        // System.out.println("code:" + code);
        //生成图片
        BufferedImage image = verifyCode.createImage(code);
        try{
            ServletOutputStream outputStream = response.getOutputStream();
            ImageIO.write(image, "png", outputStream);
            outputStream.flush();
            outputStream.close();
        }catch(Exception e){
            throw new RuntimeException(e);
        }
    }

}
