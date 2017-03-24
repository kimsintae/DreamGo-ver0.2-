package com.dreamgo.util;


import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service("mailService")
public class MailSender {
	
		//javaMail 주입
		@Autowired
	    private JavaMailSender mailSender;
	    
		private int authNumber;
		
	    public int getAuthNumber() {
			return authNumber;
		}

		/**
	     * 메일 보내는 메서드 
	     * */
	    public boolean sendMail(String to) 
	    {
			
			//6자리 인증번호 생성
			double randomVal = Math.random();			
			authNumber = (int)(randomVal*999999)+000000;
	    	System.out.println("===============인증번호: "+authNumber+"==============");
	        MimeMessage message = mailSender.createMimeMessage();
	        try {
	        	String html = ""
	        			+ "<h1>Dreams come true ! - DreamGo -</h1>"
	        			+ "<h2 style='width:200px;'>"
	        			+ "인증번호 : "+authNumber+""
	        			+ "</h2>"
	        			+ "<br/>"
	        			+ "<span>인증번호를 입력하셔야 회원가입이 가능합니다</span>";
	        	
				message.setFrom(new InternetAddress("kimstcool01@gmail.com"));//발신자
				message.addRecipient(RecipientType.TO, new InternetAddress(to));//수신자
				message.setSubject("DreamGo- 인증번호입니다","UTF-8");//제목
				message.setText(html,"UTF-8","html");
				mailSender.send(message);

				return true;
			} catch (MessagingException e) {
				e.printStackTrace();
				return false;
			} catch(MailException e){
				e.printStackTrace();
				return false;
			}

	    }

	
}
