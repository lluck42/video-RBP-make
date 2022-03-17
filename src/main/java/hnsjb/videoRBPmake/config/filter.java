package hnsjb.videoRBPmake.config;

import java.io.IOException;
import java.io.PrintWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import hnsjb.videoRBPmake.dao.admin.admin;
import hnsjb.videoRBPmake.dao.admin.adminMapper;
import hnsjb.videoRBPmake.dao.admin.permission;
import hnsjb.videoRBPmake.dao.admin.permissionMapper;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Configuration
public class filter implements Filter{

    @Autowired
    private adminMapper adminMapper;

    @Autowired
    private permissionMapper permissionMapper;


    @Override
    public void  doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException{

        // System.out.println("开始进行过滤处理");

        HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Content-type", "text/html;charset=UTF-8");
        
        
        String uri = request.getRequestURI();
        
        if(uri.equals("/login/login") || uri.equals("/login/verifyImage") || uri.equals("/test/test")){
            filterChain.doFilter(request, response);
            return;
        }
        // admin aa = new admin();
        // aa.id = 12;
        
        String token = request.getHeader("Authorization");
        // Bearer 339bb87821d1ffd0147d56e39f45f24c
        if(token == null){
            response.setStatus(401);
            PrintWriter w = response.getWriter();
            w.write("{\"status\":-1,\"msg\":\"token 失效,请重新登陆！！\"}");
            w.close();
            return;
        }

        token = token.substring(7);
        admin one = adminMapper.info(token);

        if(one == null){
            // throw new RuntimeException("登陆失败");token 失效,请重新登陆！
            response.setStatus(401);
            PrintWriter w = response.getWriter();
            w.write("{\"status\":-1,\"msg\":\"token 失效,请重新登陆！\"}");
            w.close();
            return;
        }
        
        request.setAttribute("info", one);

        // permission 验证
        permission permission = permissionMapper.check(one.role, uri);
        if(permission == null){
            response.setStatus(401);
            PrintWriter w = response.getWriter();
            w.write("{\"status\":-1,\"msg\":\"permission 没有该权限！\"}");
            w.close();
            return;
        }
        // uri

        // String uri = request.getRequestURI();
        // System.out.println(uri);

        // // if(true){
        // //     throw new RuntimeException("登陆失败");
        // // }
        // writer.write("{\"status\":-1}");
        // writer.close();

        //调用该方法后，表示过滤器经过原来的url请求处理方法
        filterChain.doFilter(request, response);
    }

}
