package hnsjb.videoRBPmake.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfig implements WebMvcConfigurer {

    private String dir = System.getProperty("user.dir");

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // registry.addResourceHandler("/**").addResourceLocations("file:" + path2);
        // 上传素材文件
        registry.addResourceHandler("/uploads/**").addResourceLocations("file:" + dir + "/uploads/");

        // // 前端静态文件
        registry.addResourceHandler("/html/**").addResourceLocations("file:" + dir + "/html/");

        // favicon.ico
        // registry.addResourceHandler("/favicon.ico")
        //         .addResourceLocations("file:" + System.getProperty("user.dir") + "/html/");
    }

    // @Override
    // public void configurePathMatch(PathMatchConfigurer configurer) {
    // configurer
    // .addPathPrefix("api",c -> c.isAnnotationPresent(RestController.class));
    // }

}
