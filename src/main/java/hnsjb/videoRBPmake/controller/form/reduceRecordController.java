package hnsjb.videoRBPmake.controller.form;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import hnsjb.videoRBPmake.controller.baseController;
import hnsjb.videoRBPmake.dao.form.companyMapper;
import hnsjb.videoRBPmake.dao.form.form;
import hnsjb.videoRBPmake.dao.form.formMapper;
import hnsjb.videoRBPmake.dao.form.reduceRecord;
import hnsjb.videoRBPmake.dao.form.reduceRecordMapper;
import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("reduceRecord")
public class reduceRecordController extends baseController {

    @Autowired
    private reduceRecordMapper reduceRecordMapper;
    @Autowired
    private formMapper formMapper;
    @Autowired
    private companyMapper companyMapper;

    @RequestMapping("add")
    @Transactional
    public Rtn add(HttpServletRequest request, @RequestBody form form) {
        
        form form2 = formMapper.first(form.id);
        if(form2 == null)
            throw new RuntimeException("添加记录失败");

        switch(form.type){
            case "拍摄":
                companyMapper.shootNumReduce1(form2.company_id);
            break;
            case "剪辑":
                companyMapper.clipNumReduce1(form2.company_id);
            break;
            case "专访":
                companyMapper.interviewNumReduce1(form2.company_id);
            break;
        }

        reduceRecord record = new reduceRecord();
        record.company_id = form2.company_id;
        record.company_name = form2.company_name;
        record.form_id = form2.id;
        record.form_name = form2.name;

        record.description = form.description; // 借用 form 模型 description 字段
        
        int num = reduceRecordMapper.add(record);
        if(num == 0)
            throw new RuntimeException("添加记录失败");

        return rtn();
    }

}
