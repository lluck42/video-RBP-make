package hnsjb.videoRBPmake.controller.form;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import hnsjb.videoRBPmake.controller.baseController;
import hnsjb.videoRBPmake.dao.admin.admin;
import hnsjb.videoRBPmake.dao.form.company;
import hnsjb.videoRBPmake.dao.form.companyMapper;
import hnsjb.videoRBPmake.dao.form.formMapper;
import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("company")
public class companyController extends baseController {

    @Autowired
    private companyMapper companyMapper;

    @Autowired
    private formMapper formMapper;


    @RequestMapping("myInfo")
    public Rtn info(HttpServletRequest request, @RequestBody company company) {
        admin info = (admin)request.getAttribute("info");
        company one = companyMapper.first(company.id);

        if(one == null)
            throw new RuntimeException("没有该记录！");

        if(one.admin_id != info.id)
            throw new RuntimeException("没有该表单权限！");

        return rtn(one);
    }


    @RequestMapping("add")
    public Rtn add(HttpServletRequest request, @RequestBody company company) {
        
        admin one = (admin)request.getAttribute("info");
        company.admin_id = one.id;

        switch(company.scale){
           case "A":
            company.clip_num = 1;
            company.shoot_num = 1;
            company.interview_num = 1;
              break;
           case "B":
            company.clip_num = 2;
            company.shoot_num = 2;
            company.interview_num = 2;
            break;
           case "C":
            company.clip_num = 3;
            company.shoot_num = 3;
            company.interview_num = 3;
            break;
           case "D":
            company.clip_num = 4;
            company.shoot_num = 4;
            company.interview_num = 4;
            break;
        }

        int num = companyMapper.add(company);
        if(num == 0)
            throw new RuntimeException("添加记录失败");

        return rtn(company);
    }

    @RequestMapping("delete")
    public Rtn delete(@RequestBody company company) {
        
        company one = companyMapper.first(company.id);
        if(one == null)
            throw new RuntimeException("该记录不存在");
        
        int form_num = formMapper.oneCompanyCount(company.id);
        if(form_num>0)
            throw new RuntimeException("该公司下有订单，无法删除！");

        int num = companyMapper.delete(company);
        if(num == 0)
            throw new RuntimeException("该记录不存在");

        return rtn();
    }


    // 用于 cp 查看和自己相关的 company
    @RequestMapping("/myList")
    public Rtn mylist(HttpServletRequest request, @RequestBody HashMap<String,Object> req) {

        admin info = (admin)request.getAttribute("info");
        
        int page = (int)req.get("page");
        int limit = (int)req.get("limit");
        String name = (String)req.get("name");

        // 计算 offset
        int offset = (page - 1) * limit;
        
        HashMap<String,Object> map = new HashMap<String,Object>();
        map.put("offset", offset);
        map.put("limit", limit);
        map.put("admin_id", info.id);
        map.put("name", name);

        // rtn map
        HashMap<String,Object> data = new HashMap<String,Object>();
        
        data.put("count", companyMapper.count(map));
        data.put("list", companyMapper.list(map));
        
        return rtn(data);
    }

}
