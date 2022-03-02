package hnsjb.videoRBPmake.config;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import jakarta.servlet.http.HttpServletRequest;

public class apiException {
    public int status = -1;
    public String msg;
    public Object trace;

    @ExceptionHandler
    public apiException handle(HttpServletRequest req, Exception ex){
        this.msg = ex.getMessage();
        this.trace = ex.getStackTrace();
        return this;
    }
}
