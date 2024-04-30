package com.kh.khu.weather.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class WeatherController {
	
	private static final String serviceKey = "hEK42uJvBAvvvaAAPHC5%2F99GlJFNRylC2QKebO3cPVaSgwIyewBVDrtQjBEt4WuMkfn%2FyvWdZjq61Ydf43ZoNw%3D%3D";

	//json으로 응답하기 미세먼지 대기환경지수
	@ResponseBody
	@RequestMapping(value="air.do",produces = "application/json; charset=utf-8")
	public String airPollution(String seoul) throws IOException{
		
		String url = "https://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty";
		url += "?serviceKey=" + serviceKey;
		url += "&sidoName=" + URLEncoder.encode(seoul, "UTF-8");
		url += "&returnType=json"; //json타입이 쉬우니깐 json타입으로 ㄱㄱ0
		url += "&numOfRows=50"; //결과개수
		
		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		urlConnection.setRequestMethod("GET");
		
		BufferedReader br = new BufferedReader( new InputStreamReader( urlConnection.getInputStream() ));
		//기반스트림을 주는거.. 
		
		String responseText = "";
		String line;
		
		while((line = br.readLine()) != null) {
			responseText += line;
		}
		
		br.close();
		urlConnection.disconnect();
		
		//System.out.println(responseText);
		return responseText;
		
	}
	
	@ResponseBody
	@RequestMapping(value="ondo.do",produces = "application/json; charset=utf-8")
	public String ondo(String dateString,String baseTime) throws IOException{
		
		String url =  "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
			   url += "?serviceKey=" + serviceKey;
			   url += "&pageNo=1&numOfRows=14&dataType=json";
			   url += "&base_date=" + dateString;
			   url += "&base_time=" + baseTime;
			   url += "&nx=61&ny=126"; //강남구
			   
			   System.out.println(url);
			   
			   URL requestUrl = new URL(url);
				HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
				urlConnection.setRequestMethod("GET");
				
				BufferedReader br = new BufferedReader( new InputStreamReader( urlConnection.getInputStream() ));
				//기반스트림을 주는거.. 
				
				String responseText = "";
				String line;
				
				while((line = br.readLine()) != null) {
					responseText += line;
				}
				
				br.close();
				urlConnection.disconnect();
				
				//System.out.println(responseText);
				return responseText;
		
	}
}
