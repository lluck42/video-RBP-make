package hnsjb.videoRBPmake.controller.form;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import hnsjb.videoRBPmake.controller.baseController;
import hnsjb.videoRBPmake.dao.form.form;
import hnsjb.videoRBPmake.dao.form.formMapper;

@RestController
@RequestMapping("form")
public class formController extends baseController {
    @Autowired
    private formMapper formMapper;

    @RequestMapping("info")
    public Rtn info(@RequestBody form form) {

        form one = formMapper.first(form.id);
        return rtn(one);
    }

    @RequestMapping("add")
    public Rtn add(@RequestBody form form) {
        
        form.status = "创建";
        int num = formMapper.add(form);
        if(num == 0)
            throw new RuntimeException("添加记录失败");

        return rtn();
    }

    @RequestMapping("delete")
    public Rtn delete(@RequestBody form form) {
        
        int num = formMapper.delete(form);
        if(num == 0)
            throw new RuntimeException("该记录不存在");

        return rtn();
    }


    @RequestMapping("/list")
    public Rtn list(@RequestBody HashMap<String,Object> req) {
        int page = (int)req.get("page");
        int limit = (int)req.get("limit");
        String name = (String)req.get("name");

        // 计算 offset
        int offset = (page - 1) * limit;
        
        HashMap<String,Object> map = new HashMap<String,Object>();
        map.put("offset", offset);
        map.put("limit", limit);
        map.put("name", name);

        // rtn map
        HashMap<String,Object> data = new HashMap<String,Object>();
        
        data.put("count", formMapper.count(map));
        data.put("list", formMapper.list(map));
        
        return rtn(data);
    }

}
