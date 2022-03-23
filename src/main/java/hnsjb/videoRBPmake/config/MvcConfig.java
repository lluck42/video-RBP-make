package hnsjb.videoRBPmake.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.config.annotation.PathMatchConfigurer;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfig implements WebMvcConfigurer {

    private String path = System.getProperty("user.dir") + "/uploads/";
    private String path2 = System.getProperty("user.dir") + "/html/";

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // registry.addResourceHandler("/**").addResourceLocations("file:" + path2);
        // 上传素材文件
        registry.addResourceHandler("/uploads/**").addResourceLocations("file:" + path);
        
        // // 前端静态文件
        registry.addResourceHandler("/html/**").addResourceLocations("file:" + path2);
    }

    // @Override
    // public void configurePathMatch(PathMatchConfigurer configurer) {
    //     configurer
    //         .addPathPrefix("api",c -> c.isAnnotationPresent(RestController.class));
    // }

}
