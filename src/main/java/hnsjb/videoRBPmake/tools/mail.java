package hnsjb.videoRBPmake.tools;

import java.util.Date;
import java.util.concurrent.Future;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service
public class mail {

    @Autowired
    public JavaMailSender javaMailSender;

    @Value("${spring.mail.username}")
    private String sendFrom;
    
    @Async
    public void sendMail(String sendTo, String msg){
        // 构建一个邮件对象
        SimpleMailMessage message = new SimpleMailMessage();
        // 设置邮件主题
        message.setSubject("视频彩铃订单");
        // 设置邮件发送者，这个跟application.yml中设置的要一致
        message.setFrom(sendFrom);
        // 设置邮件接收者，可以有多个接收者，中间用逗号隔开，以下类似
      	// message.setTo("10*****16@qq.com","12****32*qq.com");
        message.setTo(sendTo);
        // 设置邮件抄送人，可以有多个抄送人
        // message.setCc("12****32*qq.com");
        // 设置隐秘抄送人，可以有多个
        // message.setBcc("7******9@qq.com");
        // 设置邮件发送日期 eternal
		
        message.setSentDate(new Date());
        // 设置邮件的正文
        message.setText(msg);
        // 发送邮件
        javaMailSender.send(message);
    }

    @Async
    public void tes(){
        try{
            System.out.println("开始sleep！22");
            Thread.sleep(10000);
        }catch(Exception e){
            throw new RuntimeException("aaabbbccc!!!");
        }

        System.out.println("完毕sleep！22");

    }
}
