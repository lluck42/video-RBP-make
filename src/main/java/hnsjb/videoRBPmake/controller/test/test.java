package hnsjb.videoRBPmake.controller.test;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import hnsjb.videoRBPmake.controller.baseController;
import hnsjb.videoRBPmake.dao.testMapper;
import hnsjb.videoRBPmake.dao.admin.admin;
import hnsjb.videoRBPmake.tools.mail;

@RestController
@RequestMapping("/test")
public class test extends baseController {

    @Autowired
    private testMapper testMapper;

    @Autowired
    private mail mail;

    @RequestMapping("/test")
    public Rtn listArticles(String title, Integer pageSize, Integer pageNum) {

        // mail.tes();
        // mail.sendMail("您的表单已被通过 \n详情请点击 http://hnsjb.cn");
        // mail mail = new mail();
        mail.tes();
        
        // mail.tes();
        // mail.sendMail("您的表单已被通过 \n详情请点击 http://hnsjb.cn");

        String t = "hnsjb123";
        t = DigestUtils.md5DigestAsHex(t.getBytes());

        return rtn(t);
    }

    @Autowired
    admin ta;

    @RequestMapping("/test2")
    public Rtn listArticles2(String title, Integer pageSize, Integer pageNum) {

        // mail.tes();
        // mail.sendMail("您的表单已被通过 \n详情请点击 http://hnsjb.cn");
        System.out.println(ta);
        ta.id = 421;
        System.out.println(System.identityHashCode(ta));
        // mail mail = new mail();
        // mail.tes();
        // mail.tes();
        // mail.sendMail("您的表单已被通过 \n详情请点击 http://hnsjb.cn");

        String t = "hnsjb123";
        t = DigestUtils.md5DigestAsHex(t.getBytes());

        return rtn(t);
    }


    @RequestMapping("/list")
    public Rtn list(@RequestParam(defaultValue = "") String name, @RequestParam(defaultValue = "2") Integer limit, @RequestParam(defaultValue = "1") Integer page) {
        
        // 计算 offset
        int offset = (page - 1) * limit;
        
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("offset", offset);
        map.put("limit", limit);
        map.put("name", name);

        // rtn map
        Map<String,Object> data = new HashMap<String,Object>();
        data.put("count", this.testMapper.count(map));
        data.put("list", this.testMapper.list(map));
        
        return rtn(data);
    }

    

}
