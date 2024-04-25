package com.kh.khu.student.model.vo;

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
public class Absence {

	private int absNo; // 휴학생 번호
	private String absId; // 학번
	private String absStart; // 휴학 시작 학년
	private String absEnd; // 휴학 종료 학년
	private String absSemester; // 휴학 학기
	private String absSort; // 휴학 이유 
	private String absInsert; // 휴학서 생성일
	private String absUpdate; // 휴학서 수정일
	private String tbStatus;
	
}
