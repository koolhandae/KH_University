package com.kh.khu.tuition.model.vo;

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

public class Tuition {

	private int tuitiontNo; // 등록금 번호
	private int ttNo; // 고지서 번호
	private int studentNo; // 회원 번호
	private String studentId; // 학번
	private int tuition; // 등록금
	private int scholarship; // 장학금
	private String tsYear; // 연도
	private String tsSemster; // 학기
	private String tsStatuse; // 납부 현황
	private String tpDate;
	
}
