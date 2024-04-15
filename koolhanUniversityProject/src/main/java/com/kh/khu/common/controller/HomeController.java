package com.kh.khu.common.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.khu.common.recaptcha.VerifyRecaptcha;

@Controller
public class HomeController {
	
	private static final String sjServiceKey = "JIkT3%2BUOMXlT8X3XWzwz5XxB%2FwhH3Z8Z7wKvvM1XSqlMlvY2UGJbQXGF%2F69KXoiOOQ9N7Q%2Fo2aVJHbcB8wNznA%3D%3D";
	
	@RequestMapping("mainPage.me")
	public String mainPage() {
		return "common/mmain";
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
	
	@ResponseBody
	@RequestMapping(value="shuttleBus.do", produces="text/xml; charset=utf-8")
	public String BusRealTime() throws IOException { 
		
		
		String url="http://apis.data.go.kr/1613000/BusLcInfoInqireService/getRouteAcctoBusLcList";
		url += "?serviceKey=" + sjServiceKey;
		url += "&cityCode=25";
		url += "&routeId=DJB30300052";
		url += "&numOfRows=10";
		url += "&pageNo=1";
		url += "&_type=xml";
		
		System.out.println(url);
		
		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		urlConnection.setRequestMethod("GET");
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String responseText = "";
		String line;
		while((line = br.readLine()) != null) {
			responseText += line;
		}
		
		br.close();
		urlConnection.disconnect();
		
		return responseText;

	}
	
}
