package hnsjb.videoRBPmake.controller.upload;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import hnsjb.videoRBPmake.controller.baseController;
import hnsjb.videoRBPmake.dao.upload.upload;
import hnsjb.videoRBPmake.dao.upload.uploadMapper;

@RestController
@RequestMapping("upload")
public class uploadController extends baseController {

    @Autowired
    private final uploadMapper uploadMapper = null;

    @RequestMapping("add")
    public Rtn listArticles(@RequestBody(required = false) upload upload) {
        
        uploadMapper.add(upload);

        return rtn();
    }

    @RequestMapping("delete")
    public Rtn listArticles( @RequestBody(required = false) HashMap<String,Object> req) {


        return rtn();
    }

}
