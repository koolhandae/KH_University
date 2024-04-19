package com.kh.khu.grade.model.vo;

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

public class Grade {

	private int classNo;
	private int studentNo;
	private String grade;
	private String termNo;
	
	private String midPoint; //중간과제 점수
	private String finPoint; //기말과제 점수
	private String projectPoint; // 과제점수
	private String attenPoint; //출석점수
	private String TotalPoint; //총점수
	
	private String studentId; //학생아이디
	private String studentName; //학생이름
	private String studentHak; //학번
	private String className; //과목이름
	
	
}
