package hnsjb.videoRBPmake.controller.upload;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import hnsjb.videoRBPmake.controller.baseController;
import hnsjb.videoRBPmake.dao.upload.upload;
import hnsjb.videoRBPmake.dao.upload.uploadMapper;

@RestController
@RequestMapping("upload")
public class uploadController extends baseController {

    @Autowired
    private final uploadMapper uploadMapper = null;

    public String uploadPath() {
        try{
            File path = new File(ResourceUtils.getURL("classpath:").getPath());
            if(!path.exists())
                path = new File("");
            
            DateFormat dateFormat = new SimpleDateFormat("yyyy");
            DateFormat dateFormat2 = new SimpleDateFormat("MM");
            String y = dateFormat.format(new Date());
            String m = dateFormat2.format(new Date());
    

            File upload = new File(path.getAbsolutePath(), "upload/" + y + "/" + m + "/");
            if(!upload.exists())
                upload.mkdirs();

            return upload.getAbsolutePath();

        }catch(Exception e){
            throw new RuntimeException("获取uploadPath失败！");
        }
    }

    @RequestMapping("add")
    public Rtn listArticles(@RequestParam("file") MultipartFile file, @RequestParam("form_id") int form_id, @RequestParam("type") String type) {

        if(file.isEmpty()){
            throw new RuntimeException("上传失败，请选择文件！");
        }

        // System.out.println(one.id);

        
        // file.getOriginalFilename().substring(filename.)

        // UUIDUtil.getUuid() + "." + file.get
        String fileName = "ID-"+ form_id + "-" + file.getOriginalFilename();
        String filePath = uploadPath();
        System.out.println(filePath);
        System.out.println(fileName);
        File dest = new File(filePath + fileName);
        
        try{
            file.transferTo(dest);
        }catch(Exception e){
            throw new RuntimeException(e.getMessage());
        }
        
        // uploadMapper.add(upload);
        
        // 创建 upload 对象
        
        upload one = new upload();
        one.name = file.getOriginalFilename();
        one.type = type;
        one.form_id = form_id;
        one.form_name = "form_name";
        one.form_description = "form_description";
        one.src = dest.toPath().toString();
        uploadMapper.add(one);

        System.out.println(one.id);

        return rtn(one);
    }

    @RequestMapping("delete")
    public Rtn listArticles( @RequestBody(required = false) HashMap<String,Object> req) {


        return rtn();
    }

}
