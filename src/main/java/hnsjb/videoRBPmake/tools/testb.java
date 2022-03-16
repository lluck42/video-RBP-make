package hnsjb.videoRBPmake.tools;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import hnsjb.videoRBPmake.dao.admin.admin;

@Configuration
public class testb {

    @Bean
    public admin ta() {
        admin one = new admin();
        one.id = 1314;
        return one;
    }
}
