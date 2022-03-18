package hnsjb.videoRBPmake.controller.form;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import hnsjb.videoRBPmake.controller.baseController;
import hnsjb.videoRBPmake.dao.admin.admin;
import hnsjb.videoRBPmake.dao.form.form;
import hnsjb.videoRBPmake.dao.form.formMapper;
import jakarta.servlet.http.HttpServletRequest;

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
    public Rtn add(HttpServletRequest request, @RequestBody form form) {
        
        form.status = "创建";
        // new admin();
        admin one = (admin)request.getAttribute("info");
        form.admin_id = one.id;
        form.admin_name = one.name;

        int num = formMapper.add(form);
        if(num == 0)
            throw new RuntimeException("添加记录失败");

        return rtn();
    }

    @RequestMapping("confirm")
    public Rtn confirm(@RequestBody form form) {
        
        form one = formMapper.first(form.id);
        if(one==null || !one.status.equals("创建"))
            throw new RuntimeException("发生错误，请刷新后尝试！");
    
        one.status = "确认";
        int num = formMapper.setStatus(one);
        if(num == 0)
            throw new RuntimeException("确认失败！");

        return rtn();
    }

    @RequestMapping("submit")
    public Rtn submit(@RequestBody form form) {

        List<String> list = new ArrayList<String>();
        list.add("确认");
        list.add("驳回");
        
        form one = formMapper.first(form.id);
        if(!list.contains(one.status))
            throw new RuntimeException("发生错误，请刷新后尝试！");
    
        one.status = "审核";
        int num = formMapper.setStatus(one);
        if(num == 0)
            throw new RuntimeException("确认失败！");

        return rtn();
    }


    @RequestMapping("pass")
    public Rtn pass(@RequestBody form form) {
        
        form one = formMapper.first(form.id);
        if(one==null || !one.status.equals("审核"))
            throw new RuntimeException("发生错误，请刷新后尝试！");
    
        one.status = "通过";
        int num = formMapper.setStatus(one);
        if(num == 0)
            throw new RuntimeException("确认失败！");

        return rtn();
    }


    @RequestMapping("reject")
    public Rtn reject(@RequestBody form form) {
        
        form one = formMapper.first(form.id);
        if(one==null || !one.status.equals("审核"))
            throw new RuntimeException("发生错误，请刷新后尝试！");
    
        one.status = "驳回";
        int num = formMapper.setStatus(one);
        if(num == 0)
            throw new RuntimeException("确认失败！");

        return rtn();
    }

    @RequestMapping("delete")
    public Rtn delete(@RequestBody form form) {
        
        form one = formMapper.first(form.id);
        if(one == null)
            throw new RuntimeException("该记录不存在");
        
        if(!one.status.equals("创建"))
            throw new RuntimeException("已确认单，不可删除！");
            
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

    // 用于 cp 查看和自己相关的 form
    @RequestMapping("/myList")
    public Rtn mylist(@RequestBody HashMap<String,Object> req) {

        int page = (int)req.get("page");
        int limit = (int)req.get("limit");
        String name = (String)req.get("name");

        // 计算 offset
        int offset = (page - 1) * limit;
        
        HashMap<String,Object> map = new HashMap<String,Object>();
        map.put("offset", offset);
        map.put("limit", limit);
        map.put("admin_id", 1);
        
        // rtn map
        HashMap<String,Object> data = new HashMap<String,Object>();
        
        data.put("count", formMapper.count(map));
        data.put("list", formMapper.list(map));
        
        return rtn(data);
    }

}
