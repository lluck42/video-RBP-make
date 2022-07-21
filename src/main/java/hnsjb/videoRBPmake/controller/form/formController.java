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
import hnsjb.videoRBPmake.dao.admin.adminMapper;
import hnsjb.videoRBPmake.dao.form.form;
import hnsjb.videoRBPmake.dao.form.formMapper;
import hnsjb.videoRBPmake.tools.mail;
import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("form")
public class formController extends baseController {
    @Autowired
    private formMapper formMapper;

    @Autowired
    private adminMapper adminMapper;

    @Autowired
    mail mail;

    @RequestMapping("info")
    public Rtn info(@RequestBody form form) {

        form one = formMapper.first(form.id);
        return rtn(one);
    }


    @RequestMapping("myInfo")
    public Rtn info(HttpServletRequest request, @RequestBody form form) {
        admin info = (admin)request.getAttribute("info");

        form one = formMapper.first(form.id);
        if(one == null)
            throw new RuntimeException("没有该记录！");
        
        if(one.admin_id != info.id)
            throw new RuntimeException("没有该表单权限！");

        return rtn(one);
    }

    @RequestMapping("setFiles")
    public Rtn setFiles(HttpServletRequest request, @RequestBody form form) {

        form one = formMapper.first(form.id);
        // admin info = (admin)request.getAttribute("info");

        if(one==null)
            throw new RuntimeException("该表单不存在！");

        int sum = formMapper.setFiles(form);

        if(sum == 0)
            throw new RuntimeException("设置失败！");

        return rtn();
    }

    @RequestMapping("setFilesOrigin")
    public Rtn setFilesOrigin(HttpServletRequest request, @RequestBody form form) {

        admin info = (admin)request.getAttribute("info");

        form one = formMapper.first(form.id);

        if(one==null)
            throw new RuntimeException("该表单不存在！");

        if(info.id != one.admin_id)
            throw new RuntimeException("没有该表单权限！");

        int sum = formMapper.setFilesOrigin(form);

        if(sum == 0)
            throw new RuntimeException("设置失败！");

        return rtn();
    }

    @RequestMapping("add")
    public Rtn add(HttpServletRequest request, @RequestBody form form) {
        
        form.status = "创建";
        // new admin();
        admin info = (admin)request.getAttribute("info");
        form.admin_id = info.id;
        form.admin_name = info.name;

        int num = formMapper.add(form);
        if(num == 0)
            throw new RuntimeException("添加记录失败");

        // 提醒 hnsjb 账号
        admin hnsjb = adminMapper.hnsjb();
        mail.sendMail(hnsjb.email, "用户："+form.admin_name+" 的视频彩铃订单："+form.name+" 已创建，请及时确认");

        // 提醒移动
        mail.sendMail("738447125@qq.com", "用户："+form.admin_name+" 的视频彩铃订单："+form.name+" 已创建，请及时确认");
        mail.sendMail("614000424@qq.com", "用户："+form.admin_name+" 的视频彩铃订单："+form.name+" 已创建，请及时确认");
        return rtn(form);
    }

    @RequestMapping("myUpdate")
    public Rtn myUpdate(HttpServletRequest request, @RequestBody form form) {
        admin info = (admin)request.getAttribute("info");

        form one = formMapper.first(form.id);

        if(one==null)
            throw new RuntimeException("该表单不存在！");

        if(info.id != one.admin_id)
            throw new RuntimeException("没有该表单权限！");

        int num = formMapper.myUpdate(form);
        if(num == 0)
            throw new RuntimeException("修改记录失败");

        return rtn();
    }


    @RequestMapping("confirm")
    public Rtn confirm(@RequestBody form form) {
        
        form one = formMapper.first(form.id);
        if(one==null || !one.status.equals("创建"))
            throw new RuntimeException("发生错误，请刷新后尝试！");
    
        one.status = "确认";
        one.visit_date = form.visit_date;
        one.expect_delivery_date = form.expect_delivery_date;

        int num = formMapper.confirm(one); // 设置
        if(num == 0)
            throw new RuntimeException("确认失败！");

        // 提醒 联通 账号
        admin admin = adminMapper.first(one.admin_id);
        mail.sendMail(admin.email, "您的视频彩铃订单："+ one.name +" 平台已开始制作");

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

        // 提醒 联通 账号
        admin admin = adminMapper.first(one.admin_id);
        mail.sendMail(admin.email, "您的视频彩铃订单："+ one.name +" 平台已制作完成，请审核");

        return rtn();
    }

    @RequestMapping("setProductionStatus")
    public Rtn setProductionStatus(@RequestBody form form) {
        
        form one = formMapper.first(form.id);
        if(one == null)
            throw new RuntimeException("没有该记录！");

        one.production_status = form.production_status;

        int num = formMapper.setProductionStatus(form);
        if(num == 0)
            throw new RuntimeException("设置失败");

        return rtn();
    }


    @RequestMapping("pass")
    public Rtn pass(HttpServletRequest request, @RequestBody form form) {
        
        form one = formMapper.first(form.id);
        if(one==null || !one.status.equals("审核"))
            throw new RuntimeException("发生错误，请刷新后尝试！");

        admin info = (admin)request.getAttribute("info");
        if(one.admin_id != info.id)
            throw new RuntimeException("发生错误，没有该表单权限！");

        one.status = "通过";
        int num = formMapper.setStatus(one);
        if(num == 0)
            throw new RuntimeException("确认失败！");
        
        // 提醒 hnsjb 账号
        admin hnsjb = adminMapper.hnsjb();
        mail.sendMail(hnsjb.email, "用户："+one.admin_name+" 的视频彩铃订单："+one.name+" 已通过审核");

        // 提醒移动
        mail.sendMail("738447125@qq.com", "用户："+one.admin_name+" 的视频彩铃订单："+one.name+" 已通过审核");
        mail.sendMail("614000424@qq.com", "用户："+one.admin_name+" 的视频彩铃订单："+one.name+" 已通过审核");
        
        return rtn();
    }


    @RequestMapping("reject")
    public Rtn reject(HttpServletRequest request, @RequestBody form form) {
        
        form one = formMapper.first(form.id);
        if(one==null || !one.status.equals("审核"))
            throw new RuntimeException("发生错误，请刷新后尝试！");

        admin info = (admin)request.getAttribute("info");
        if(one.admin_id != info.id)
            throw new RuntimeException("发生错误，没有该表单权限！");
    
        one.status = "驳回";
        int num = formMapper.setStatus(one);
        if(num == 0)
            throw new RuntimeException("确认失败！");
        
        // 提醒 hnsjb 账号
        admin hnsjb = adminMapper.hnsjb();
        mail.sendMail(hnsjb.email, "用户："+one.admin_name+" 的视频彩铃订单："+one.name+" 已被驳回，请重新制作后提交");
        // 提醒移动
        mail.sendMail("738447125@qq.com", "用户："+one.admin_name+" 的视频彩铃订单："+one.name+" 已被驳回，请重新制作后提交");
        mail.sendMail("614000424@qq.com", "用户："+one.admin_name+" 的视频彩铃订单："+one.name+" 已被驳回，请重新制作后提交");

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

        String status = (String)req.get("status");
        String admin_name = (String)req.get("admin_name");
        String search = (String)req.get("search");

        // 计算 offset
        int offset = (page - 1) * limit;
        
        HashMap<String,Object> map = new HashMap<String,Object>();
        map.put("offset", offset);
        map.put("limit", limit);
        map.put("status", status);
        map.put("admin_name", admin_name);
        map.put("search", search);

        // rtn map
        HashMap<String,Object> data = new HashMap<String,Object>();
        
        data.put("count", formMapper.count(map));
        data.put("list", formMapper.listCompany(map));
        
        return rtn(data);
    }

    // 用于 cp 查看和自己相关的 form
    @RequestMapping("/myList")
    public Rtn mylist(HttpServletRequest request, @RequestBody HashMap<String,Object> req) {

        admin info = (admin)request.getAttribute("info");
        
        int page = (int)req.get("page");
        int limit = (int)req.get("limit");

        Integer company_id = (Integer)req.get("company_id"); // 否定形式为0

        String status = (String)req.get("status");
        String search = (String)req.get("search");

        // 计算 offset
        int offset = (page - 1) * limit;
        
        HashMap<String,Object> map = new HashMap<String,Object>();
        map.put("offset", offset);
        map.put("limit", limit);
        map.put("admin_id", info.id);
        map.put("company_id", company_id);
        map.put("status", status);
        map.put("search", search);

        // rtn map
        HashMap<String,Object> data = new HashMap<String,Object>();
        
        data.put("count", formMapper.count(map));
        data.put("list", formMapper.list(map));
        
        return rtn(data);
    }

}
