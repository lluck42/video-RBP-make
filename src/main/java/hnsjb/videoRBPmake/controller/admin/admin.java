package hnsjb.videoRBPmake.controller.admin;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.cassandra.CassandraProperties.Request;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import hnsjb.videoRBPmake.controller.base;
import hnsjb.videoRBPmake.dao.admin.adminMapper;
import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("admin")
public class admin extends base {

    @Autowired
    private final adminMapper adminMapper = null;

    @RequestMapping("info")
    public Rtn listArticles(HttpServletRequest request, String title, Integer pageSize, Integer pageNum) {
        // Object as = servletRequest.getAttribute("as");
        // System.out.println(as);
        return rtn(request.getAttribute("info"));
    }

    // @RequestMapping("list")
    // public Rtn list(@RequestParam(defaultValue = "") String name, @RequestParam(defaultValue = "2") Integer limit, @RequestParam(defaultValue = "1") Integer page) {
        
    //     // 计算 offset
    //     int offset = (page - 1) * limit;
        
    //     Map<String,Object> map = new HashMap<String,Object>();
    //     map.put("offset", offset);
    //     map.put("limit", limit);
    //     map.put("name", name);

    //     // rtn map
    //     Map<String,Object> data = new HashMap<String,Object>();
    //     data.put("count", this.adminMapper.count(map));
    //     data.put("list", this.adminMapper.list(map));
        
    //     return rtn(data);
    // }

    

}
