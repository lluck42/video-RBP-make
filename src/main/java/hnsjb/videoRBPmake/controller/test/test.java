package hnsjb.videoRBPmake.controller.test;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import hnsjb.videoRBPmake.controller.baseController;
import hnsjb.videoRBPmake.dao.testMapper;
import hnsjb.videoRBPmake.dao.admin.admin;
import hnsjb.videoRBPmake.dao.form.dialog;
import hnsjb.videoRBPmake.dao.form.dialogMapper;
import hnsjb.videoRBPmake.dao.form.form;
import hnsjb.videoRBPmake.dao.form.formMapper;

@RestController
@RequestMapping("/test")
public class test extends baseController {

    @Autowired
    private testMapper testMapper;

    @Autowired
    private formMapper formMapper;
    
    @Autowired
    private dialogMapper dialogMapper;


    @RequestMapping("/test")
    @Transactional
    public Rtn listArticles(String title, Integer pageSize, Integer pageNum) {

        // 测试事务注解
        form form = new form();
        form.name = "测试事务";
        formMapper.add(form);

        dialog dialog = new dialog();
        dialog.form_id = form.id;
        dialog.msg = "测试事务";
        dialogMapper.add(dialog);
        
        if(true)
            throw new RuntimeException("测试回滚");

        return rtn("测试事务");
    }

    @Autowired
    admin ta;

    @RequestMapping("/test2")
    public Rtn listArticles2(@RequestParam("file") MultipartFile[] files) {
        String dir = System.getProperty("user.dir");

        ArrayList<String> ss = new ArrayList<String>();

        for(MultipartFile file: files){
            System.out.println(file);
            try{
                String fileName = file.getOriginalFilename();
                File dest = new File(dir + "/" + fileName);
                file.transferTo(dest);
                ss.add(dir + "/" + fileName);
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }

        }


        return rtn(ss);
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
