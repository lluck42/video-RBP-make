package hnsjb.videoRBPmake.tools;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import lombok.Data;

@Service
public class wx {

    // 微信小程序
    // code 换取 openid
    static class code2SessionRes {
        public String openid; // 用户唯一标识
        public String session_key; // 会话密钥
        public String unionid; // 用户在开放平台的唯一标识符
        public int errcode; // 错误码
        public String errmsg; // 错误信息

        @Override
        public String toString() {
            return "code2SessionRes [errcode=" + errcode + ", errmsg=" + errmsg + ", openid=" + openid
                    + ", session_key=" + session_key + ", unionid=" + unionid + "]";
        }
    }

    @Value("${wx-micro.appid}")
    private String APPID;

    @Value("${wx-micro.secret}")
    private String SECRET;

    // 获取用户的 unionid
    public String code2Session(String JSCODE) {

        RestTemplate restTemplate = new RestTemplate();
        String url = "https://api.weixin.qq.com/sns/jscode2session?appid={APPID}&secret={SECRET}&js_code={JSCODE}&grant_type=authorization_code";

        String str = restTemplate.getForObject(url, String.class, APPID, SECRET, JSCODE);

        code2SessionRes res = JSON.parseObject(str, code2SessionRes.class);

        if (res.errcode != 0)
            throw new RuntimeException("获取openid失败："+res.toString());

        return res.unionid;
    }
}
