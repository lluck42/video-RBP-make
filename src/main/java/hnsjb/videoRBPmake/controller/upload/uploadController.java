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
import hnsjb.videoRBPmake.dao.form.form;
import hnsjb.videoRBPmake.dao.form.formMapper;
import hnsjb.videoRBPmake.dao.upload.upload;
import hnsjb.videoRBPmake.dao.upload.uploadMapper;
import hnsjb.videoRBPmake.tools.MD5;

@RestController
@RequestMapping("upload")
public class uploadController extends baseController {

    @Autowired
    private uploadMapper uploadMapper;
    @Autowired
    private formMapper formMapper;

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

        form form = formMapper.first(form_id);
        if(form == null)
            throw new RuntimeException("没有该记录 form_id:"+form_id);
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
            if(!dest.exists()) // 文件已存在，则不再上传，节省磁盘空间
                file.transferTo(dest); 
        }catch(Exception e){
            throw new RuntimeException(e.getMessage());
        }
                
        // 创建 upload 对象
        upload one = new upload();
        one.name = file.getOriginalFilename();
        one.type = type;
        one.form_id = form_id;
        one.form_name = form.name;
        one.form_description = form.description;
        one.src = relativePath + fileName; // 相对路径
        uploadMapper.add(one);

        return rtn(one);
    }

    @RequestMapping("list")
    public Rtn list( @RequestBody(required = false) HashMap<String,Object> req) {

        int page = (int)req.get("page");
        int limit = (int)req.get("limit");
        String search = (String)req.get("search");
        String type = (String)req.get("type");

        // 计算 offset
        int offset = (page - 1) * limit;
        
        HashMap<String,Object> map = new HashMap<String,Object>();
        map.put("offset", offset);
        map.put("limit", limit);
        map.put("search", search);
        map.put("type", type);
        
        // rtn map
        HashMap<String,Object> data = new HashMap<String,Object>();
        
        data.put("count", uploadMapper.count(map));
        data.put("list", uploadMapper.list(map));
        
        return rtn(data);
    }

}
