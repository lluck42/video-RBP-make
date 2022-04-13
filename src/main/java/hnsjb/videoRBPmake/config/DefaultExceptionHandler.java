package hnsjb.videoRBPmake.config;

import java.util.HashMap;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;

import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;

@ControllerAdvice
public class DefaultExceptionHandler {
    /**
     * 处理 json 请求体调用接口对象参数校验失败抛出的异常
     */
    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseBody
    public HashMap<String,Object> handle2(MethodArgumentNotValidException e) {
        BindingResult bindingResult = e.getBindingResult();
        
        String msg = "";
        for (FieldError fieldError : bindingResult.getFieldErrors()) {
            msg += "（" + fieldError.getRejectedValue() + "）" + fieldError.getDefaultMessage() + "；";
        }

        HashMap<String,Object> m = new HashMap<String,Object>();
        m.put("status", -1);
        m.put("msg", msg);

        return m;
    }

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
