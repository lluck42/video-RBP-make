package hnsjb.videoRBPmake.controller.admin;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import hnsjb.videoRBPmake.controller.base;
import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("admin")
public class admin extends base {

    @RequestMapping("info")
    public Rtn listArticles(HttpServletRequest request, String title, Integer pageSize, Integer pageNum) {
        return rtn(request.getAttribute("info"));
    }

}
