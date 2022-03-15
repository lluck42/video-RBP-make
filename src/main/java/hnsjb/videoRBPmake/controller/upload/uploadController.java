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
import hnsjb.videoRBPmake.tools.MD5;

@RestController
@RequestMapping("upload")
public class uploadController extends baseController {

    @Autowired
    private final uploadMapper uploadMapper = null;

    public String uploadPath(String relativePath) {
        try{
            File path = new File(ResourceUtils.getURL("classpath:").getPath());
            if(!path.exists())
                path = new File("");
            
            
            File upload = new File(path.getAbsolutePath(), relativePath);
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
        
        String fileName = file.getOriginalFilename();

        String suffix = fileName.substring(fileName.lastIndexOf("."));
        
        try{
            String fileMd5 = MD5.calcMD5(file.getInputStream());
            // 新文件名
            fileName = fileMd5 + suffix;
        }catch(Exception e){
            throw new RuntimeException("文件解析失败!");
        }

        // 文件上传相对路径
        DateFormat dateFormat = new SimpleDateFormat("yyyy");
        DateFormat dateFormat2 = new SimpleDateFormat("MM");
        String y = dateFormat.format(new Date());
        String m = dateFormat2.format(new Date());
        
        String relativePath = "upload/" + y + "/" + m;

        // 转为 当前项目的绝对路径
        String filePath = uploadPath(relativePath);
        File dest = new File(filePath + "/" + fileName);
        
        try{
            if(!dest.exists()) // 文件已存在，则不再上传
                file.transferTo(dest); 
        }catch(Exception e){
            throw new RuntimeException(e.getMessage());
        }
                
        // 创建 upload 对象
        upload one = new upload();
        one.name = file.getOriginalFilename();
        one.type = type;
        one.form_id = form_id;
        one.form_name = "form_name";
        one.form_description = "form_description";
        one.src = relativePath + fileName; // 相对路径
        uploadMapper.add(one);

        return rtn(one);
    }

    @RequestMapping("delete")
    public Rtn listArticles( @RequestBody(required = false) HashMap<String,Object> req) {


        return rtn();
    }

}
