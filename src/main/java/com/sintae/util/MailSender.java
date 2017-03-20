package com.sintae.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service("mailService")
public class MailSender {
	
		//javaMail 주입
		@Autowired
	    private JavaMailSender mailSender;
	     
	    /**
	     * 메일 보내는 메서드 
	     * */
	    public void sendMail(String to, String subject, String body) 
	    {
	    	
	        SimpleMailMessage message = new SimpleMailMessage();
	        message.setTo(to);
	        message.setSubject(subject);
	        message.setText(body);
	        mailSender.send(message);
	    }

	
}
