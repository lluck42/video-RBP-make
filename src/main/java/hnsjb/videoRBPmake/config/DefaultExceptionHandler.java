package hnsjb.videoRBPmake.config;

import java.util.HashMap;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;

@ControllerAdvice
public class DefaultExceptionHandler {

    @ExceptionHandler(Exception.class)
    @ResponseBody
    public HashMap<String,Object> handle(HttpServletRequest req, Exception ex){

        HashMap<String,Object> m = new HashMap<String,Object>();
        m.put("status", -1);
        m.put("msg", ex.getMessage());
        // ex.getStackTrace();
        return m;
    }
}
