package com.kh.khu.classroom.model.vo;

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


public class Course {
	private int courseNo; 
	private int classNo; // 강의고유번호
	private int studentNo; // 학생고유번호
	private String courseYear; 
	private String courseSemester; 
	private String courseStatus; 
	
	private String classGrade;
	private String className;
	private String classRoom;
	private String classTitle;
	private String classScore;
	private String classTime;
	private String classPeople;
	private String classTypeName;
	private int classNum;
	
}
