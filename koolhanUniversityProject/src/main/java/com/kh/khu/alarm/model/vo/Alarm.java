package com.kh.khu.alarm.model.vo;

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


public class Alarm {
	
	private int alarmNo;		// 알림 seq순서
	private int userId;			// 알림받는 유저
	private String alarmCode;	// 알림 정보 (ex.New Post!)
	private String alarmChecked;// 디폴트 X 읽으면 O
	private String alarnCdate;  // 알림생성일자
	private String alarmPrefix; // 알림 발생하는곳 (ex.과제게시판)
	
}
