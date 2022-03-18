package hnsjb.videoRBPmake.controller.form;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import hnsjb.videoRBPmake.controller.baseController;
import hnsjb.videoRBPmake.dao.admin.admin;
import hnsjb.videoRBPmake.dao.form.dialog;
import hnsjb.videoRBPmake.dao.form.dialogMapper;
import hnsjb.videoRBPmake.dao.form.form;
import hnsjb.videoRBPmake.dao.form.formMapper;
import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("dialog")
public class dialogController extends baseController {

    @Autowired
    private dialogMapper dialogMapper;
    @Autowired
    private formMapper formMapper;


    @RequestMapping("add")
    public Rtn add(HttpServletRequest request, @RequestBody dialog dialog) {
        
        // dialog.status = "创建";
        // new admin();
        admin one = (admin)request.getAttribute("info");

        if(one.role != "hnsjb"){
            form form = formMapper.first(dialog.form_id);
            if(form == null)
                throw new RuntimeException("该记录不存在！form_id:"+dialog.form_id);
            // one.id != dialog.
            if(form == null || form.admin_id != one.id)
                new RuntimeException("没有该表单权限!form_id:"+dialog.form_id);
        }

        dialog.admin_id = one.id;
        dialog.admin_name = one.name;

        int num = dialogMapper.add(dialog);
        if(num == 0)
            throw new RuntimeException("添加记录失败");

        return rtn();
    }


    @RequestMapping("/oneFormList")
    public Rtn oneFormList(@RequestBody HashMap<String,Object> req) {

        int form_id = (int)req.get("form_id");

        Object rtn = dialogMapper.oneFormList(form_id);
        
        return rtn(rtn);
    }


}
