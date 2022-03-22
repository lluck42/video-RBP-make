package hnsjb.videoRBPmake.controller;


import java.io.IOException;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpServletResponse;


@RestController
@RequestMapping("/")
public class root extends baseController {

    @RequestMapping("/")
    public void root2(HttpServletResponse response) throws IOException {
        response.sendRedirect("/html/index.html");
    }

}
