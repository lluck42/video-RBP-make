package hnsjb.videoRBPmake.controller.admin;

import java.awt.image.BufferedImage;
import java.util.Map;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.DigestUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import hnsjb.videoRBPmake.controller.baseController;
import hnsjb.videoRBPmake.dao.admin.admin;
import hnsjb.videoRBPmake.dao.admin.adminMapper;
import hnsjb.videoRBPmake.tools.mail;
import hnsjb.videoRBPmake.tools.verifyCode;
import hnsjb.videoRBPmake.tools.wx;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;


@RestController
@RequestMapping("/login")
public class loginController extends baseController {
    @Autowired
    private adminMapper adminMapper;
    
    @Autowired
    mail mail;

    @Autowired
    private wx wx;

    @RequestMapping(value="login")
    public Rtn login2(HttpSession session, @RequestBody(required = false) Map<String,Object> req) {

        // 验证码
        String code = (String)session.getAttribute("code");

        session.removeAttribute("code");

        String code2 = (String)req.get("code");

        // type name mobile 二选一
        String type = (String)req.get("type");
        // name
        String name = (String)req.get("name");
        // password
        String password = (String)req.get("password");
        // md5
        password = DigestUtils.md5DigestAsHex(password.getBytes());
        
        // 微信登陆不支持 cookie，暂时关闭图形验证码
        if(!type.equals("wxMobile")){
            if(code2 == null || !code2.equals(code)){
                throw new RuntimeException("验证码不正确");
            }
        }

        // System.out.println(password);
        admin one;
        if(type.equals("name")){
            one = adminMapper.nameLogin(name, password);
        }else if(type.equals("mobile")){
            one = adminMapper.mobileLogin(name, password);
        }else if(type.equals("wxMobile")){
            one = adminMapper.mobileLogin(name, password);
        }else{
            throw new RuntimeException("登陆参数错误：type！");
        }

        if(one==null)
            throw new RuntimeException("账号密码错误");
        
        return rtn(one);
    }

    // 验证码
    @RequestMapping(value="verifyImage")
    @ResponseBody
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
        }catch(Exception e){
            // java.io.IOException: Broken pipe 
            // 错误的管道 异常不再记录
            // throw new RuntimeException(e);
        }
    }

    // registerReq
    static class registerReq {
        @NotNull(message="用户名不能为空")
        public String name;
        @NotNull(message="手机号码不能为空") @Pattern(regexp="^[0-9]{11}$", message="不是一个合法的手机号码")
        public String mobile;
        @NotNull(message="电子邮件不能为空") @Pattern(regexp="^[a-z0-9A-Z]+@chinaunicom\\.cn$", message="请使用chinaunicom.cn邮箱")
        public String email;
        @NotNull(message="密码不能为空")
        public String password;
    }

    // 注册
    @RequestMapping(value="register")
    public Rtn register(@Validated @RequestBody registerReq registerReq) {

        admin one = new admin();
        one.name = registerReq.name;
        one.mobile = registerReq.mobile;
        one.email = registerReq.email;

        admin exists = adminMapper.addUnique(one);
        if(exists != null){
            if(exists.name.equals(one.name))
                throw new RuntimeException("（"+one.name+"）该名字已被注册");
            if(exists.mobile.equals(one.mobile))
                throw new RuntimeException("（"+one.mobile+"）该手机号码已被注册");
            if(exists.email.equals(one.email))
                throw new RuntimeException("（"+one.email+"）该邮箱已被注册");
        }

        one.role = "CU";
        one.password = DigestUtils.md5DigestAsHex(registerReq.password.getBytes());

        String str =  one.email + System.currentTimeMillis();
        one.token = DigestUtils.md5DigestAsHex(str.getBytes());

        int sum = adminMapper.add(one);
        if(sum == 0)
            throw new RuntimeException("注册失败！");
        
        return rtn();
    }


    // emailLoginReq
    static class emailLoginReq{
        @NotNull(message="电子邮件不能为空") @Email
        public String email;
        @NotNull(message="验证码不能为空")
        public String code;
    }

    // 邮件登陆
    @RequestMapping(value="emailLogin")
    public Rtn emailLogin(HttpSession session, @Validated @RequestBody emailLoginReq emailLoginReq ) {

        // 验证码
        String code = (String)session.getAttribute("code");
        session.removeAttribute("code");

        String code2 = emailLoginReq.code;
        
        if(code2 == null || !code2.equals(code)){
            throw new RuntimeException("验证码不正确");
        }
        
        admin one = adminMapper.emailLogin(emailLoginReq.email);
        if(one == null)
            throw new RuntimeException("("+emailLoginReq.email+") 该邮箱尚未注册！");

        mail.sendMail(one.email, "如忘记密码，请点击登陆后修改密码：http://vidrgt.lvgs.com.cn/html/index.html#/automy?token="+ one.token);

        return rtn();
    }


    static class wxBindReq{
        public String code;
        public String token;
    }

    // 绑定微信
    @RequestMapping(value="wxBind")
    public Rtn wxBind(@RequestBody wxBindReq wxBindReq) {

        // admin info = (admin)request.getAttribute("info");
        // System.out.println(wxBindReq.token);
        admin info = adminMapper.info(wxBindReq.token);
        if(info == null)
            throw new RuntimeException("信息错误");

        if(info.wx_unionid != null)
            throw new RuntimeException("该账号已经绑定过微信，请先解绑");
        
        info.wx_unionid = wx.code2Session(wxBindReq.code);

        admin one = adminMapper.wxLogin(info.wx_unionid);
        if(one != null)
            throw new RuntimeException("该微信号已绑定！请先解绑该账号：" + one.email);

        int sum = adminMapper.wxBind(info);
        if(sum == 0)
            throw new RuntimeException("绑定微信失败");
        
        return rtn();
    }

    // 微信登陆
    @RequestMapping(value="wxLogin")
    public Rtn emailLogin(@NotNull String code ) {
    
        String wx_unionid = wx.code2Session(code);

        admin info = adminMapper.wxLogin(wx_unionid);
        if(info == null)
            throw new RuntimeException("登陆失败");

        return rtn(info);
    }
    
    
}
