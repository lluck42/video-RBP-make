package hnsjb.videoRBPmake.controller.test;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import hnsjb.videoRBPmake.controller.base;
import hnsjb.videoRBPmake.dao.testMapper;

@RestController
@RequestMapping("/test")
public class test extends base {

    @Autowired
    private final testMapper testMapper = null;

    @RequestMapping("/test2")
    public Rtn listArticles(String title, Integer pageSize, Integer pageNum) {

        return rtn(this.testMapper.findById(1));
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
