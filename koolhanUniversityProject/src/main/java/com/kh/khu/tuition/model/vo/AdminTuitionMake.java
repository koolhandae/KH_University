package com.kh.khu.tuition.model.vo;

import java.sql.Date;

public class AdminTuitionMake {
	
	private int ttNo; // 고지서 번호
	private Date tbOpen; // 납부 시작날짜
	private Date tbClose; // 납부 마감날짜
	private Date tbInsert; // 생성날짜
	private Date tbUpdate; // 수정날짜
	private int tbPrice;  // 등록금
	private int tbSemester; // 학기
}
