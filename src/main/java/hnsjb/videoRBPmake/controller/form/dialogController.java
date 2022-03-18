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
import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("dialog")
public class dialogController extends baseController {

    @Autowired
    private dialogMapper dialogMapper;

    @RequestMapping("add")
    public Rtn add(HttpServletRequest request, @RequestBody dialog dialog) {
        
        // dialog.status = "创建";
        // new admin();
        admin one = (admin)request.getAttribute("info");

        dialog.admin_id = one.id;
        dialog.admin_name = one.name;

        int num = dialogMapper.add(dialog);
        if(num == 0)
            throw new RuntimeException("添加记录失败");

        return rtn();
    }


    @RequestMapping("/oneFormList")
    public Rtn oneFormList(@RequestBody HashMap<String,Object> req) {

        // rtn map
        HashMap<String,Object> data = new HashMap<String,Object>();
        
        data.put("count", dialogMapper.oneFormList(1));
        
        return rtn(data);
    }


}
