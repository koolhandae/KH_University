package com.kh.khu.weather.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class WeatherVO {
	
	private String stationName; //측정소명
	private String dataTime;	//측정일시
	private String khaiValue;	//통합대기환경수치
	private String pm10Value;	//미세먼지농도
	
	private String tmp; //1시간 기온
	private String pty; //강수형태 없음(0) 비(1) 비/눈(2) 눈(3) 소나기(4)
	private String sky; //하늘상태 맑음(1) 구름많음(3) 흐림(4)

}
