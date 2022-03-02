package hnsjb.videoRBPmake.config;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class filter implements Filter{


    @Override
    public void  doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException{

        System.out.println("开始进行过滤处理");

        HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;


        // PrintWriter writer = response.getWriter();
        response.setStatus(401);

        // request.getHeader("");
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
