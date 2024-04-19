package com.kh.khu.tuition.model.vo;

import java.sql.Date;

public class AdminTuitionMake {
	
	private int ttNo; // 고지서 번호
	private Date tbDue; // 납부 마감날짜
	private Date tb_date; // 납부한 날짜
	private int tbPrice; // 등록금
	private int totalPrice; // 최종 납부금 (등록금 - 장학금)
	private String tbStatus; // 납부현황 납부전N 처리중I 납부완료Y
}
