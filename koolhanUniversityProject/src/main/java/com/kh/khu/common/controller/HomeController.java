package com.kh.khu.common.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.khu.common.recaptcha.VerifyRecaptcha;

@Controller
public class HomeController {
	
	@RequestMapping("mainPage.me")
	public String mainPage() {
		return "common/mainPage";
	}
	
	
	
	@RequestMapping("rechapcha.do")
	public int VerifyRecaptcha(HttpServletRequest request) {
		
		VerifyRecaptcha.setSecretKey("6LcIX7opAAAAAAm8IfPI_NKRN-bwIn2zDiOfoHMZ");
	    String gRecaptchaResponse = request.getParameter("recaptcha");
	    try {
	       if(VerifyRecaptcha.verify(gRecaptchaResponse))
	          return 0; // 성공
	       else return 1; // 실패
	    } catch (Exception e) {
	        e.printStackTrace();
	        return -1; //에러
	    }
	}
}
