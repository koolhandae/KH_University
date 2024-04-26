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
public class TuitionPayment {

//	private int preNo; // 복학생 번호
//	private String preId; // 학번
//	private String preYear; // 복학 연도
//	private String preSemester; // 복학 학기
//	private String tbStatus; // 학생 상태
	
	private int tpNo;
	private int ttNo;
	private String tpDate;
	private int TotalPrice;
	
}
